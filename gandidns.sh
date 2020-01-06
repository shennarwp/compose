#!/bin/sh
#
# WHY?
# Because most commercial / residential ISP network is almost always assigned dynamic IP
# This is problematic when pointing domain name to server hosted at my own home,
# as the IP can change anytime, for example when router is restarted.
#
# HOW?
# This script gets the external IP of your systems then connects to the Gandi
# LiveDNS API and updates your dns record with the IP.
# References: https://doc.livedns.gandi.net/
#             https://nextnet.top/content/using-gandi-livedns-dynamic-dns-server
#             https://virtuallytd.com/post/dynamic-dns-using-gandi/

# PREREQUISITES:
# create zone file for this subdomain, see https://doc.livedns.gandi.net/#id6
# change APIKEY, and domain
# curl -D- -X POST -H "Content-Type: application/json" \
#             -H "X-Api-Key: $APIKEY" \
#             -d '{"name": "example.com Zone"}' \
#             https://dns.api.gandi.net/api/v5/zones

# Gandi LiveDNS API KEY
API="https://dns.api.gandi.net/api/v5/"
APIKEY="changeme"

# Domain hosted with Gandi
DOMAIN="yourdomain.com"

# Subdomain to update DNS (optional)
SUBDOMAIN="subdomain"

# Get external IP address
EXT_IP=$(curl -s ifconfig.me)
if [ -z "$EXT_IP" ]; then
    echo "Something went wrong. Can not get your IP from ifconfig.me"
    exit 1
fi

#Get the current Zone for the provided domain
CURRENT_ZONE_HREF=$(curl -s -H "X-Api-Key: $APIKEY" $API/domains/$DOMAIN | jq -r '.zone_records_href')
if [ -z "$CURRENT_ZONE_HREF" ]; then
    echo "Something went wrong. Can not get current Zone for the provided domain"
    exit 1
fi

# Update the A Record of the subdomain using PUT
curl -D- -X PUT -H "Content-Type: application/json" \
        -H "X-Api-Key: $APIKEY" \
        -d "{\"rrset_name\": \"$SUBDOMAIN\",
             \"rrset_type\": \"A\",
             \"rrset_ttl\": 1200,
             \"rrset_values\": [\"$EXT_IP\"]}" \
        "$CURRENT_ZONE_HREF"/$SUBDOMAIN/A

# Then add this script to cronjob so that it will be run every 20 mins (match the rrset_ttl of gandi DNS record above)
# */20 * * * * /path/to/gandidns.sh >/dev/null 2>&1