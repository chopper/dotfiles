# Displays SSL certificate information for the URL passed in as first parameter
# Make sure to start the URL with https://
curl --insecure -v $1 2>&1 | awk 'BEGIN { cert=0 } /^\* SSL connection/ { cert=1 } /^\*/ { if (cert) print }'
