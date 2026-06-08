$ProjectRoot = Resolve-Path "$PSScriptRoot\.."

$PgInfo = Get-ItemProperty `
"HKLM:\SOFTWARE\PostgreSQL\Installations\postgresql-x64-16"

$PgBase = $PgInfo."Base Directory"

$Global:Config = @{

    ProjectRoot = $ProjectRoot.Path

    TerraformExe = Join-Path $ProjectRoot.Path "tools\terraform\terraform.exe"

    PostgreSQL = @{
        Host        = "localhost"
        Port        = "5433"
        Database    = "DataManagementDB"
        Username    = "postgres"
        Password    = "Postgres@123"
        ServiceName = "postgresql-x64-16"
        InstallPath = $PgBase
        PsqlPath    = Join-Path $PgBase "bin\psql.exe"
    }

    Logs = @{
        LogFolder = Join-Path $ProjectRoot.Path "logs"
    }
}
