# Interview questions — simple fresher answers

### 1. What is Amazon S3?
Amazon S3 is object storage. It stores objects inside buckets and is used for files, backups, logs, media, and static assets.

### 2. What is a bucket versus an object?
A bucket is a container. An object is the stored file, identified by an object key, with associated metadata.

### 3. How does S3 static website hosting work?
S3 serves static HTML, CSS, JavaScript, and images. It does not execute server-side application code.

### 4. Why use two buckets?
I separated public website assets from private documents to reduce the risk of exposing confidential files.

### 5. What is a bucket policy?
A resource-based JSON policy that defines which principals can perform which actions on a bucket or its objects.

### 6. What is Block Public Access?
S3 controls designed to prevent public bucket policies or ACLs from exposing data. I kept it enabled for the private documents bucket.

### 7. What is S3 Versioning?
It preserves multiple versions of an object when it is overwritten or deleted, helping recover accidental changes.

### 8. What is a presigned URL?
A time-limited URL signed by an AWS identity that grants access to a specific S3 object without sharing AWS credentials.

### 9. Is a presigned URL safe to post publicly?
No. Anyone who gets the link may use it while valid. I keep expiry short and share it privately.

### 10. Does the S3 website endpoint support HTTPS?
The S3 website endpoint is HTTP-only. For HTTPS, I would consider CloudFront with a properly secured S3 origin.

### 11. The website returns 403. What do you check?
I check the object key, static website hosting, bucket policy ARN, Block Public Access, and account/organization restrictions. I do not make the documents bucket public.

### 12. How do you recover an overwritten file?
I inspect versions, download the correct older version, then upload its content under the same key. This creates a new current version and keeps the history.

### Scenario: private brochure gives AccessDenied
I check object key, URL expiry, signer `s3:GetObject` permission, bucket policy, and encryption permissions. I never make the bucket public as a shortcut.

### Scenario: a file was overwritten by mistake
I confirm versioning was enabled, identify and verify the old version, restore it as a new current version, and investigate the process that caused the overwrite.
