. "$PSScriptRoot\..\..\config\app-config.ps1"
. "$PSScriptRoot\logger.ps1"

$env:PGPASSWORD = $Config.PostgreSQL.Password

Write-Log "SEED LOAD STARTED"

& $Config.PostgreSQL.PsqlPath `
-U $Config.PostgreSQL.Username `
-p $Config.PostgreSQL.Port `
-d $Config.PostgreSQL.Database `
-f "$PSScriptRoot\..\..\database\seed\seed_data.sql"

if ($LASTEXITCODE -ne 0)
{
    Write-ErrorLog "Seed Load Failed"
    exit 1
}

Write-Host "Seed Data Loaded Successfully"

Write-Log "Seed Data Loaded Successfully"
Write-Log "SEED LOAD COMPLETED"
