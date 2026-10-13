# Architecture

## Two-bucket design
- **Website bucket:** HTML, CSS, JS, and public images. Static website hosting enabled. Public policy allows anonymous `s3:GetObject` only.
- **Documents bucket:** private files. Block Public Access remains enabled. Access through authenticated AWS permissions or a presigned URL.

## Request flows
- Website: visitor browser → S3 website endpoint → static files.
- Download: authorized admin → AWS CLI signs a short-lived URL → recipient downloads the object before expiry.
- Recovery: same key uploaded again → S3 retains versions → admin downloads an older version and uploads it as the current version.

S3 website endpoints are HTTP-only. For production HTTPS, consider CloudFront and a private S3 origin with Origin Access Control.
