. "$PSScriptRoot\..\..\config\app-config.ps1"
. "$PSScriptRoot\logger.ps1"

$env:PGPASSWORD = $Config.PostgreSQL.Password

Write-Log "TABLE CREATION STARTED"

& $Config.PostgreSQL.PsqlPath `
-U $Config.PostgreSQL.Username `
-p $Config.PostgreSQL.Port `
-d $Config.PostgreSQL.Database `
-f "$PSScriptRoot\..\..\database\schema\create_tables.sql"

if ($LASTEXITCODE -ne 0)
{
    Write-ErrorLog "Table Creation Failed"
    exit 1
}

Write-Host "Tables Created Successfully"

Write-Log "Tables Created Successfully"
Write-Log "TABLE CREATION COMPLETED"
