#!/usr/bin/env bash
# Tell IndexNow engines (Bing, Yandex, Seznam, Naver...) that pages changed.
# Usage: scripts/indexnow.sh                 # submit every URL in the live sitemap
#        scripts/indexnow.sh /rides/tok-9/   # submit only these paths
# Run it after a push has deployed. The key file docs/0e4d82b72820072fda81b256b4e8bb93.txt must stay published.
set -euo pipefail
HOST=rajeshgheware.github.io
KEY=0e4d82b72820072fda81b256b4e8bb93
if [ $# -gt 0 ]; then
  URLS=$(printf 'https://%s%s\n' "$HOST" "$@")
else
  URLS=$(curl -fsS "https://$HOST/sitemap.xml" | grep -o '<loc>[^<]*' | sed 's/<loc>//')
fi
BODY=$(printf '%s\n' "$URLS" | python3 -c "import sys,json; print(json.dumps({'host':'$HOST','key':'$KEY','keyLocation':'https://$HOST/$KEY.txt','urlList':[l.strip() for l in sys.stdin if l.strip()]}))")
curl -sS -o /dev/null -w 'IndexNow HTTP %{http_code} (200/202 = accepted)\n' -X POST https://api.indexnow.org/indexnow \
  -H 'Content-Type: application/json; charset=utf-8' -d "$BODY"
