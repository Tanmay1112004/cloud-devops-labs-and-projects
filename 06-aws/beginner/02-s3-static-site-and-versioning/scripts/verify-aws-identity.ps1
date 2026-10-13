$ErrorActionPreference = "Stop"
aws --version
if ($LASTEXITCODE -ne 0) { throw "AWS CLI is missing or not working." }
aws sts get-caller-identity
if ($LASTEXITCODE -ne 0) { throw "Could not identify AWS credentials. Configure your approved AWS profile." }
Write-Host "Configured region:"
aws configure get region
