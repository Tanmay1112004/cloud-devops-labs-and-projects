param([Parameter(Mandatory=$true)][string]$BucketName,[Parameter(Mandatory=$true)][string]$ObjectKey,[ValidateRange(60,604800)][int]$ExpiresInSeconds=300,[string]$Region="ap-south-1")
$ErrorActionPreference = "Stop"
if ($BucketName -match "YOUR-|REPLACE") { throw "Replace the example bucket name." }
Write-Warning "This is a bearer link. Anyone with the URL may access the object until it expires. Do not commit or post it."
$url = aws s3 presign "s3://$BucketName/$ObjectKey" --expires-in $ExpiresInSeconds --region $Region
if ($LASTEXITCODE -ne 0) { throw "Failed. Check object key, identity permissions, and region." }
Write-Output $url
