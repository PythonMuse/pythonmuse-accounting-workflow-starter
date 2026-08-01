# 07 — Allow: Controlled Execution

**ONBOARD step:** A — Allow controlled execution.

Never start with the full confidential dataset. Run the design prompt first; only run the execution prompt after you've approved the test design and confirmed no unmasked sensitive data needs to leave your approved environment.

---

### Step 1 — Design the smallest possible test

> Review the approved plan and propose the smallest controlled test that can demonstrate whether the workflow logic works correctly.
>
> The test must:
>
> - Use synthetic, masked, or otherwise approved data
> - Cover one limited portion of the workflow
> - Produce one sample output
> - Include validation evidence
> - Stop if required fields are missing
> - Stop if control totals do not reconcile
>
> Before executing, confirm that the test does not require unmasked sensitive data to be passed to a cloud-based service.
>
> Show me the test design and wait for approval.

### Step 2 — Execute only after approval

> Execute only the approved controlled test.
>
> Save transformed data in `data/processed/`.
>
> Save the sample report in `outputs/`.
>
> Save tie-outs and validation evidence in `evidence/`.
>
> Do not process additional departments, periods, or files.
>
> Summarize all assumptions, exclusions, errors, and unresolved questions.

**Completion check before moving to Review:** only the approved sample was processed, raw files were not changed, no prohibited sensitive data was transmitted, calculations agree with expected results, evidence was created, and AI stopped where instructed.
