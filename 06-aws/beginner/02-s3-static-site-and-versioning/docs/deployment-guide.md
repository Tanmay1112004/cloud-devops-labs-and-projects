# Deployment guide — AWS Console + Windows PowerShell

## 1. Prepare
Use the correct AWS account and region (`ap-south-1`, Mumbai). Install AWS CLI v2 if using scripts. Never put credentials or presigned URLs in GitHub.

## 2. Create buckets
Create two globally unique buckets in Mumbai, for example `college-website-YOUR-SUFFIX` and `college-documents-YOUR-SUFFIX`. Keep ACLs disabled and default encryption enabled.

## 3. Enable versioning
For each bucket: Properties → Bucket Versioning → Edit → Enable → Save.

## 4. Upload the website
Upload the *contents* of `website/` to the website bucket so `index.html` is at the bucket root. Or run from the repository root:
```powershell
.\scripts\verify-aws-identity.ps1
.\scripts\upload-website.ps1 -BucketName "YOUR-REAL-WEBSITE-BUCKET"
```

## 5. Enable static website hosting
Website bucket → Properties → Static website hosting → Enable → Host a static website → Index document `index.html` → Save. Copy the website endpoint.

## 6. Public-read policy for website bucket only
The website bucket must contain only public content. Adjust its Block Public Access settings only as needed to allow the bucket policy, then apply `policies/website-public-read-policy.template.json` after replacing the bucket-name placeholder. The policy permits `s3:GetObject` only. Account/organization-level controls may still block public access. **Never disable Block Public Access on the documents bucket.**

## 7. Upload a private sample document
Upload a harmless sample PDF to the documents bucket. Do not use real student records or confidential files.
```powershell
aws s3 cp .\sample-files\college-brochure.pdf s3://YOUR-REAL-DOCUMENTS-BUCKET/college-brochure.pdf --region ap-south-1
```
`sample-files/` is intentionally not included in this repository.

## 8. Generate and test a presigned URL
```powershell
aws sts get-caller-identity
aws s3 presign s3://YOUR-REAL-DOCUMENTS-BUCKET/college-brochure.pdf --expires-in 300 --region ap-south-1
```
`300` seconds is five minutes. Test in a private browser window, then after expiry. The signing identity needs `s3:GetObject`. Do not commit or publish the URL.

## 9. Restore an older version
Upload a sample object, modify its contents, and upload again using the same key. In the S3 object list, select **Show versions**. Download the older version and upload that content again under the same key. This creates a new current version while preserving history.

A normal delete in a versioned bucket often creates a delete marker; old versions may remain and incur storage charges.

## 10. Cleanup
Disable website hosting, remove the website public-read policy, delete all object versions and delete markers, delete both buckets, remove temporary permissions, and check AWS Billing. Console labels may change over time.
