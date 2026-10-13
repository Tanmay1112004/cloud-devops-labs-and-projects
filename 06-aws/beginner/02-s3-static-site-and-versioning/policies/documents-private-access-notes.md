# Private documents bucket — access notes

This is documentation, not a policy to paste into AWS.

- Keep all S3 Block Public Access settings enabled.
- Do not add a public-read bucket policy.
- Enable versioning.
- Use an IAM identity with only the permissions required.
- Share individual files with short-lived presigned URLs when appropriate.

A presigned URL uses the permissions of the identity that created it. Treat it like a temporary bearer credential.
