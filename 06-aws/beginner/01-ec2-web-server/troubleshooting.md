# Troubleshooting Log — EC2 Website Hosting

## Issue 1: Apache service stopped

**Symptom:** The website stopped responding during a planned outage simulation.

**Diagnosis:** Checked Apache service status and tested the local HTTP endpoint.

**Resolution:**

```bash
sudo systemctl start httpd
sudo systemctl is-active httpd
curl -I http://localhost/
```

**Verification:** Apache returned to the active state and the local HTTP request succeeded.

## Troubleshooting workflow

1. Identify the symptom and scope of impact.
2. Check the Apache service.
3. Inspect logs and configuration.
4. Test the application locally.
5. Check network access and Security Group rules.
6. Apply the smallest appropriate fix.
7. Verify recovery from both the server and the browser.
8. Document the root cause and preventive action.

**Important:** Record only errors and root causes actually observed during your project. Do not claim that a simulated issue occurred in production.