set -e

docker service ls -q | xargs docker service ps --filter desired-state=running -q | xargs docker inspect | jq -r '.[] | "\(.Spec.Networks[].Aliases[]) \(.Slot) \(.NetworksAttachments[].Addresses[])"'
