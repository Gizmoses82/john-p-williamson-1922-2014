#!/usr/bin/env bash
# Usage: ./set_domain.sh https://user.github.io/repo
# Replaces the placeholder https://REPLACE-WITH-YOUR-DOMAIN in index.html, sitemap.xml,
# robots.txt, llms.txt and README.md, and makes sure index.html has canonical, og:url
# and og:image (the portrait) tags. Run it once on a fresh copy; it does not upload anything.
set -euo pipefail
if [ $# -ne 1 ] || [[ ! "$1" =~ ^https?://[^[:space:]]+$ ]]; then
  echo "Usage: $0 https://user.github.io/repo" >&2; exit 1
fi
BASE="${1%/}"
PLACEHOLDER="https://REPLACE-WITH-YOUR-DOMAIN"
cd "$(dirname "$0")"
ESC=$(printf '%s' "$BASE" | sed -e 's/[#&\\]/\\&/g')
for f in index.html sitemap.xml robots.txt llms.txt README.md; do
  [ -f "$f" ] && sed -i "s#${PLACEHOLDER}#${ESC}#g" "$f"
done
# add any of the three head tags that are missing
add() { # $1 = grep pattern, $2 = tag
  grep -q "$1" index.html || python3 - "$2" <<'PY'
import sys
t=sys.argv[1]; s=open('index.html',encoding='utf-8').read()
s=s.replace('</head>',t+'</head>',1); open('index.html','w',encoding='utf-8').write(s)
PY
}
add 'rel="canonical"'      "<link rel=\"canonical\" href=\"${BASE}/\">"
add 'property="og:url"'    "<meta property=\"og:url\" content=\"${BASE}/\">"
add 'property="og:image"'  "<meta property=\"og:image\" content=\"${BASE}/img/john_williamson_portrait_2014.jpg\">"
if grep -rq "REPLACE-WITH-YOUR-DOMAIN" index.html sitemap.xml robots.txt llms.txt; then
  echo "Warning: placeholder still present (already set to another domain?)" >&2
fi
echo "Domain set to ${BASE}"
