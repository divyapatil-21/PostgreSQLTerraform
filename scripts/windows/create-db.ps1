. "$PSScriptRoot\..\..\config\app-config.ps1"
. "$PSScriptRoot\logger.ps1"

$env:PGPASSWORD = $Config.PostgreSQL.Password

Write-Log "DATABASE CHECK STARTED"

$dbCheck = & $Config.PostgreSQL.PsqlPath `
-U $Config.PostgreSQL.Username `
-p $Config.PostgreSQL.Port `
-d postgres `
-tAc "SELECT 1 FROM pg_database WHERE datname='$($Config.PostgreSQL.Database)'"

if ($LASTEXITCODE -ne 0)
{
    Write-ErrorLog "Database Check Failed"
    exit 1
}

if ($dbCheck -eq "1")
{
    Write-Host "Database Already Exists"
    Write-Log "Database Already Exists"
}
else
{
    & $Config.PostgreSQL.PsqlPath `
    -U $Config.PostgreSQL.Username `
    -p $Config.PostgreSQL.Port `
    -d postgres `
    -c "CREATE DATABASE $($Config.PostgreSQL.Database);"

    if ($LASTEXITCODE -ne 0)
    {
        Write-ErrorLog "Database Creation Failed"
        exit 1
    }

    Write-Host "Database Created"
    Write-Log "Database Created"
}

Write-Log "DATABASE CHECK COMPLETED"
