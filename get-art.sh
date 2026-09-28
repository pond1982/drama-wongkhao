#!/bin/sh
# Optional: copy the illustrations from your Higgsfield account into ./assets
# and switch index.html to use those local copies instead of the Higgsfield links.
set -e
cd "$(dirname "$0")"
CDN="https://d2ol7oe51mr4n9.cloudfront.net/user_35UyNiodbDjs2LQECkdwLEbyzdI"
mkdir -p assets
curl -fsSL -o assets/hero.webp    "$CDN/618c8a8e-43ea-4e77-a597-8e141f8fe59d.webp"
curl -fsSL -o assets/tier-1.webp  "$CDN/1cb6c970-dc09-4b7d-864c-9b7284ea8c07.webp"
curl -fsSL -o assets/tier-2.webp  "$CDN/e0c3ff58-01ee-487d-ac8f-471861db3d78.webp"
curl -fsSL -o assets/tier-3.webp  "$CDN/8dbe2426-bcfd-4b00-bb69-49a9feeda3cb.webp"
curl -fsSL -o assets/tier-4.webp  "$CDN/d245e5f0-52e8-4c12-b034-bafec9e156dd.webp"
curl -fsSL -o assets/tier-5.webp  "$CDN/bfda335e-2e2e-4619-81ca-41727e789444.webp"
curl -fsSL -o assets/og-image.png "$CDN/278d85a8-c9ce-4867-9650-b571bf3933d3.png"
SITE=$(sed -n 's/.*<link rel="canonical" href="\([^"]*\)".*/\1/p' index.html | head -n 1)
sed -i.bak \
  -e 's/const SELF_HOSTED = false;/const SELF_HOSTED = true;/' \
  -e "s#$CDN/278d85a8-c9ce-4867-9650-b571bf3933d3.png#${SITE}assets/og-image.png#" \
  index.html
rm -f index.html.bak
echo "Done. The art is in ./assets and index.html now uses it. Upload the assets folder with index.html."
