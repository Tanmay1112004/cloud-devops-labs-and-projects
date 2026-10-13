# Testing and troubleshooting

| Test | Expected result | If it fails |
|---|---|---|
| S3 website endpoint | Homepage loads | Check hosting and endpoint |
| CSS/JS | Styling and year display | Check exact object keys and case |
| Anonymous website read | Works | Check policy ARN, Block Public Access, account/org controls |
| Anonymous website upload | Denied | Policy should allow only `s3:GetObject` |
| Anonymous private-file read | Denied | Check documents Block Public Access and policies |
| Presigned URL before expiry | Downloads file | Check object key, region, identity permission, expiry |
| URL after expiry | Fails | Generate a new short-lived URL when authorized |
| Upload same key twice | Multiple versions | Confirm versioning enabled; choose Show versions |
| Restore older file | Old content becomes current in a new version | Verify downloaded version before uploading |

## 403 on website
Confirm `index.html` is at bucket root, hosting is enabled, policy ARN matches the exact bucket, and public-access controls allow the policy. Never make the documents bucket public to fix a website error.

## 404 on website
Use the website endpoint; check index document spelling and case-sensitive object keys.

## Missing CSS
Confirm `css/styles.css` exists and the browser can fetch it. Check browser developer tools for 403/404.

## Presigned URL AccessDenied
Check object key, expiry, signer permissions, region, bucket policy, and encryption-key permissions if applicable.

## Old version missing
Check versioning was enabled before the overwrite, refresh the list, and use Show versions.

## Unexpected cost
Check stored versions, delete markers, requests, and data transfer. Remove all versions and markers during cleanup.
