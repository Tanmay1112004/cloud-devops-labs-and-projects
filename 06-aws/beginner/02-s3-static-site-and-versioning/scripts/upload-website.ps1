param([Parameter(Mandatory=$true)][string]$BucketName,[string]$Region="ap-south-1")
$ErrorActionPreference = "Stop"
if ($BucketName -match "YOUR-|REPLACE") { throw "Replace the example bucket name." }
if (-not (Test-Path ".\website\index.html")) { throw "Run this script from the repository root." }
Write-Host "Target: $BucketName | Region: $Region"
if ((Read-Host "Type UPLOAD to continue") -ne "UPLOAD") { Write-Host "Cancelled."; exit 0 }
aws s3 sync .\website\ "s3://$BucketName/" --region $Region
if ($LASTEXITCODE -ne 0) { throw "Upload failed. Check bucket, region, and IAM permissions." }
Write-Host "Upload command completed. Test the S3 website endpoint."
