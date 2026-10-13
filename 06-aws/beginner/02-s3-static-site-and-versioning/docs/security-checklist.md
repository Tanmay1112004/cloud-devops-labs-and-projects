# Security checklist

- [ ] Website bucket contains only content intended for public access.
- [ ] Website policy grants only `s3:GetObject` to `*`.
- [ ] Website bucket has no public write/delete permissions.
- [ ] Documents bucket keeps every Block Public Access setting enabled.
- [ ] Documents bucket has no public-read policy.
- [ ] IAM permissions follow least privilege.
- [ ] No AWS credentials, confidential files, or live presigned URLs are committed.
- [ ] Presigned URLs have short expirations and are shared privately.
- [ ] Versioning is enabled on both buckets.
- [ ] Billing and cleanup are checked after the lab.
- [ ] Production design considers HTTPS, logging, and CloudFront.
