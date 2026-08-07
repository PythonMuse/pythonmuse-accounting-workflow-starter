<#
Heuristic guardrail for AGENTS.md section 3 ("Do not copy sensitive fields into
prompts, logs, error messages, or external tools"). Scans the text a tool is
about to write, run, or that the user is about to submit, for common sensitive
data shapes (SSN, EIN, credit card, bank routing/account references). This is
defense-in-depth, not a substitute for masking data before it enters a session
-- narrow, well-defined formats are checked to avoid false-positive-blocking
on ordinary invoice/account numbers.
#>

$ErrorActionPreference = 'Stop'

$stdin = [Console]::In.ReadToEnd()
if ([string]::IsNullOrWhiteSpace($stdin)) { exit 0 }

try {
    $data = $stdin | ConvertFrom-Json
} catch {
    exit 0
}

$eventName = $data.hook_event_name
$toolName = $data.tool_name

$text = switch ($toolName) {
    'Bash'  { $data.tool_input.command }
    'Write' { $data.tool_input.content }
    'Edit'  { $data.tool_input.new_string }
    default { $null }
}
if (-not $text -and $data.prompt) { $text = $data.prompt }
if (-not $text) { exit 0 }

$patterns = @(
    @{ Name = 'Social Security Number'; Regex = '\b\d{3}-\d{2}-\d{4}\b' },
    @{ Name = 'EIN (Employer ID Number)'; Regex = '\b\d{2}-\d{7}\b' },
    @{ Name = 'credit card number'; Regex = '\b\d{4}[ -]\d{4}[ -]\d{4}[ -]\d{4}\b' },
    @{ Name = 'bank routing/account number'; Regex = '(?i)\b(routing|aba|account)\b.{0,20}?\b\d{6,17}\b' }
)

foreach ($p in $patterns) {
    if ($text -match $p.Regex) {
        $reason = "Blocked: possible $($p.Name) detected. Mask or remove sensitive data before proceeding (AGENTS.md section 3)."
        if ($eventName -eq 'UserPromptSubmit') {
            $output = @{
                decision      = 'block'
                reason        = $reason
                systemMessage = $reason
            }
        } else {
            $output = @{
                systemMessage      = $reason
                hookSpecificOutput = @{
                    hookEventName            = 'PreToolUse'
                    permissionDecision       = 'deny'
                    permissionDecisionReason = $reason
                }
            }
        }
        $output | ConvertTo-Json -Compress -Depth 5
        exit 0
    }
}

exit 0
