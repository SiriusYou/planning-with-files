# Check if all phases in task_plan.md are complete
# Exit 0 if complete, exit 1 if incomplete
# Used by Stop hook to verify task completion

param (
    [string]$PlanFile = "task_plan.md"
)

if (-not (Test-Path $PlanFile)) {
    Write-Host "ERROR: $PlanFile not found"
    Write-Host "Cannot verify completion without a task plan."
    exit 1
}

Write-Host "=== Task Completion Check ==="
Write-Host ""

# Read plan file content
$Content = Get-Content $PlanFile -Raw

# Count phases by status
$Total = ([regex]::Matches($Content, "### Phase")).Count
$Complete = ([regex]::Matches($Content, "\*\*Status:\*\* complete")).Count
$InProgress = ([regex]::Matches($Content, "\*\*Status:\*\* in_progress")).Count
$Pending = ([regex]::Matches($Content, "\*\*Status:\*\* pending")).Count

Write-Host "Total phases:   $Total"
Write-Host "Complete:       $Complete"
Write-Host "In progress:    $InProgress"
Write-Host "Pending:        $Pending"
Write-Host ""

# Check completion
if ($Complete -eq $Total -and $Total -gt 0) {
    Write-Host "ALL PHASES COMPLETE"
    exit 0
} else {
    Write-Host "TASK NOT COMPLETE"
    Write-Host ""
    Write-Host "Do not stop until all phases are complete."
    exit 1
}
