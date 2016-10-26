#! /bin/sh

# Check queries.
c=$(cat output/eve.json | jq -c 'select(.dns.type == "query")' | wc -l)
if [ "${c}" != 2 ]; then
    echo "error: expected 2 DNS queries, got ${c}"
    exit 1
fi

# Check answer count.
c=$(cat output/eve.json | jq -c 'select(.dns.type == "answer")' | wc -l)
if [ "${c}" != 9 ]; then
    echo "error: expected 9 DNS answers, got ${c}"
    exit 1
fi
