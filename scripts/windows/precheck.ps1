. "$PSScriptRoot\..\..\config\app-config.ps1"
. "$PSScriptRoot\logger.ps1"

Write-Host ""
Write-Host "================================="
Write-Host "PRECHECK STARTED"
Write-Host "================================="

Write-Log "PRECHECK STARTED"

$IsAdmin = ([Security.Principal.WindowsPrincipal] `
[Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
[Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $IsAdmin)
{
    Write-Host "ERROR: Run PowerShell as Administrator"
    Write-Log "ERROR: Administrator Rights Missing"
    exit 1
}

Write-Host "Admin Check Passed"
Write-Log "Admin Check Passed"

if (!(Test-Path $Config.TerraformExe))
{
    Write-Host "ERROR: Terraform not found"
    Write-Log "ERROR: Terraform Not Found"
    exit 1
}

Write-Host "Terraform Found"
Write-Log "Terraform Found"

$svc = Get-Service -Name $Config.PostgreSQL.ServiceName -ErrorAction SilentlyContinue

if (!$svc)
{
    Write-Host "ERROR: PostgreSQL Service Not Found"
    Write-Log "ERROR: PostgreSQL Service Not Found"
    exit 1
}

Write-Host "PostgreSQL Service Found"
Write-Log "PostgreSQL Service Found"

if ($svc.Status -ne 'Running')
{
    Start-Service $Config.PostgreSQL.ServiceName
    Start-Sleep 5
    Write-Log "PostgreSQL Service Started"
}

Write-Host "PostgreSQL Running"
Write-Log "PostgreSQL Running"

Write-Host ""
Write-Host "PRECHECK PASSED"

Write-Log "PRECHECK PASSED"
