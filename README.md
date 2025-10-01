# AWSWebsite
# Personal Resume Website (AWS S3 + CloudFront + IAM + ACM)

A fully static resume website (HTML/CSS/JS) deployed securely on **Amazon S3** and **CloudFront** with HTTPS. Demonstrates **AWS security best practices**: private S3 bucket, CloudFront **Origin Access Control (OAC)**, IAM least-privilege, and security headers.

🔗 **Live Site**: https://d1dgaei96qums9.cloudfront.net  
📄 **Resume PDF**: `website/assets/resume.pdf` (add your file)

---

## Features
- Clean, responsive **static website** showcasing Experience, Projects, Certifications, and Contact.
- Deployed to **S3 (private)** with **CloudFront CDN** for fast, global HTTPS delivery.
- **Security**: IAM least-privilege, SSE-S3 encryption, security headers (HSTS, CSP, X-Frame-Options, Referrer-Policy).

---

## Architecture

