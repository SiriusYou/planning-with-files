# Initialize planning files for a new session
# Usage: ./init-session.ps1

$ErrorActionPreference = "Stop"
$CurrentDate = Get-Date -Format "yyyy-MM-dd"

Write-Host "Initializing planning files for session: $CurrentDate"

# Create task_plan.md if it does not exist
if (-not (Test-Path "task_plan.md")) {
    $TaskPlanContent = @"
# Task Plan: [Brief Description]

## Goal
[One sentence describing the end state]

## Current Phase
Phase 1

## Phases

### Phase 1: Requirements & Discovery
- [ ] Understand user intent
- [ ] Identify constraints
- [ ] Document in findings.md
- **Status:** in_progress

### Phase 2: Planning & Structure
- [ ] Define approach
- [ ] Create project structure
- **Status:** pending

### Phase 3: Implementation
- [ ] Execute the plan
- [ ] Write to files before executing
- **Status:** pending

### Phase 4: Testing & Verification
- [ ] Verify requirements met
- [ ] Document test results
- **Status:** pending

### Phase 5: Delivery
- [ ] Review outputs
- [ ] Deliver to user
- **Status:** pending

## Decisions Made
| Decision | Rationale |
|----------|-----------|

## Errors Encountered
| Error | Resolution |
|-------|------------|
"@
    Set-Content -Path "task_plan.md" -Value $TaskPlanContent -Encoding UTF8
    Write-Host "Created task_plan.md"
} else {
    Write-Host "task_plan.md already exists, skipping"
}

# Create findings.md if it does not exist
if (-not (Test-Path "findings.md")) {
    $FindingsContent = @"
# Findings & Decisions

## Requirements
-

## Research Findings
-

## Technical Decisions
| Decision | Rationale |
|----------|-----------|

## Issues Encountered
| Issue | Resolution |
|-------|------------|

## Resources
-
"@
    Set-Content -Path "findings.md" -Value $FindingsContent -Encoding UTF8
    Write-Host "Created findings.md"
} else {
    Write-Host "findings.md already exists, skipping"
}

# Create progress.md if it does not exist
if (-not (Test-Path "progress.md")) {
    $ProgressContent = @"
# Progress Log

## Session: $CurrentDate

### Current Status
- **Phase:** 1 - Requirements & Discovery
- **Started:** $CurrentDate

### Actions Taken
-

### Test Results
| Test | Expected | Actual | Status |
|------|----------|--------|--------|

### Errors
| Error | Resolution |
|-------|------------|
"@
    Set-Content -Path "progress.md" -Value $ProgressContent -Encoding UTF8
    Write-Host "Created progress.md"
} else {
    Write-Host "progress.md already exists, skipping"
}

Write-Host ""
Write-Host "Planning files initialized!"
Write-Host "Files: task_plan.md, findings.md, progress.md"
