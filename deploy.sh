#!/usr/bin/env bash
set -euo pipefail

# ====== CONFIG ======
BUCKET="your-s3-bucket-name"                  # e.g., sr-resume-site
DISTRIBUTION_ID="YOUR_CLOUDFRONT_DIST_ID"     # e.g., E123ABC456XYZ
WEBDIR="./website"
REGION="us-east-1"
# ====================

echo "Syncing website to s3://$BUCKET ..."
aws s3 sync "$WEBDIR" "s3://$BUCKET" \
  --delete \
  --cache-control "public, max-age=31536000, immutable" \
  --exclude "index.html" \
  --region "$REGION"

# Set index.html to no-cache for instant updates
aws s3 cp "$WEBDIR/index.html" "s3://$BUCKET/index.html" \
  --cache-control "no-cache" \
  --content-type "text/html" \
  --region "$REGION"

echo "Creating CloudFront invalidation..."
aws cloudfront create-invalidation \
  --distribution-id "$DISTRIBUTION_ID" \
  --paths "/*" >/dev/null

echo "Done ✅"
