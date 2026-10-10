# AWS EC2 Website Hosting

## Project Overview

This project demonstrates how to deploy a static website on an AWS EC2 Linux instance using Apache HTTP Server.

The goal was to simulate a small business hosting its first website and to practise Linux administration, AWS networking, web server configuration, and troubleshooting.

## Architecture

**User's Browser → Internet → EC2 Security Group → Amazon EC2 → Apache HTTP Server → HTML Website**

## AWS Services and Technologies

- **Amazon EC2:** Runs the Linux web server.
- **Amazon Linux 2023:** Operating system for the instance.
- **Apache HTTP Server:** Serves the static HTML website.
- **Amazon EBS:** Provides persistent block storage for the EC2 instance.
- **Security Groups:** Control inbound network traffic.
- **SSH:** Provides secure remote administration.
- **HTTP:** Allows visitors to access the website.

## Implementation Steps

1. Launched an EC2 instance in the Mumbai Region (`ap-south-1`).
2. Configured an SSH key pair for secure access.
3. Created Security Group rules for SSH and HTTP.
4. Connected to the instance using SSH.
5. Installed Apache using the Linux package manager.
6. Started Apache and enabled it at system boot.
7. Created a custom HTML website under `/var/www/html/`.
8. Verified the Apache service and local HTTP response.
9. Opened the website using the instance's public IPv4 address.
10. Practised troubleshooting by stopping and restarting Apache.

## Verification Commands

Check Apache service status:

```bash
sudo systemctl status httpd
```

Check whether Apache starts automatically:

```bash
sudo systemctl is-enabled httpd
```

Test the local website:

```bash
curl -I http://localhost/
```

Check the listening port:

```bash
sudo ss -lntp | grep ':80'
```

Inspect Apache error logs:

```bash
sudo tail -n 50 /var/log/httpd/error_log
```

Check Linux disk usage:

```bash
df -h
```

## Troubleshooting Scenarios

### Scenario 1: Website is unavailable

- Check Apache using `systemctl status httpd`.
- Review Apache error logs.
- Test the website locally with `curl`.
- Verify Security Group rules, public IP, and network routing.

### Scenario 2: Apache is stopped

Start Apache:

```bash
sudo systemctl start httpd
```

Verify recovery:

```bash
sudo systemctl is-active httpd
curl -I http://localhost/
```

### Scenario 3: Website works locally but not publicly

- Verify the Security Group allows inbound TCP port 80.
- Check that the instance has a reachable public IPv4 address.
- Verify the subnet's route table and Internet Gateway.
- Check network ACLs if necessary.

### Scenario 4: Permission problems

Inspect file permissions:

```bash
ls -l /var/www/html/index.html
```

For a static HTML file, read permissions such as mode `644` are normally sufficient.

## Security Considerations

- Restrict SSH access to a trusted IP address.
- Allow public HTTP traffic only when the website needs to be publicly accessible.
- Never publish private SSH keys or AWS credentials.
- Avoid unnecessarily broad write permissions.
- Consider HTTPS, monitoring, and stronger access management for a production deployment.

## Learning Outcomes

- EC2 instance provisioning and basic management.
- SSH-based Linux administration.
- Apache installation and service management.
- Security Group and HTTP port configuration.
- Linux file permissions.
- HTTP response verification.
- Basic web server troubleshooting and recovery.

## Future Improvements

- Configure HTTPS using a domain name and TLS certificate.
- Add monitoring and alerts using Amazon CloudWatch.
- Automate deployment with a shell script.
- Use GitHub for version control.
- Explore an Application Load Balancer and multiple EC2 instances.

## Cleanup

When the project is no longer needed, terminate the EC2 instance and check for remaining billable resources, including unattached EBS volumes, Elastic IP addresses, and other resources created during practice.

**Note:** This is a beginner hands-on project intended to demonstrate fundamental AWS and Linux skills. It is not a hardened production architecture.