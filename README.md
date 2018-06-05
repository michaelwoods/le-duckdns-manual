=Duck DNS and manual DNS certbot config

Using an external script hook, this will auto-renew a DuckDNS domain with a wildcard from Let's Encrypt. It will then run certbot again in manual mode to renew another wildcard domain.

My use case is a dynamic dns hostname with a Google Domains DNS record that's CNAME'ed to DuckDNS.

==Example usage:

`docker build .`
`docker run -it -e TOKEN=DUCK_DNS_TOKEN -e DYNDNSDOMAIN=foo -e "DUCKDOMAIN=*.foo.duckdns.org" -e "MANUALDOMAIN=*.foo.example.com" -e EMAIL=YOUR_EMAIL -v ~/docker/data/letsencrypt:/etc/letsencrypt IMAGE_ID`
