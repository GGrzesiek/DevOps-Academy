webpage endpoint: https://mystaticpageendpoint-fwengbdddudxb0er.z01.azurefd.net/

I would use those tutorials:
 -https://learn.microsoft.com/en-us/azure/dns/dns-delegate-domain-azure-dns#delegate-the-domain

 -https://learn.microsoft.com/en-us/azure/dns/dns-web-sites-custom-domain?tabs=azure-portal

1. Azure DNS

I need custom domain (full control) and created DNS zone resource. After that i can delegate a domain to Azure DNS (four name servers).

2. Acquire SSL/TLS cerificate:

I can add a certifiacate by adding domain in my front door resource

3. CNAME Record

I have to navigate to Azure DNS zone (example.com) and add a record set. Here are values:
| Setting | Value |
|:-------- |:--------:|
| Name     | www   |
| Type     | CNAME   |
| TTL     | 600   |
| TTL unit   | Seconds   |
| Alias     | (default domain name) mystaticpageendpoint-fwengbdddudxb0er.z01.azurefd.net |

I can validate records correctly by querying www.example.com using nslookup

4. Azure resources/modules

-Resource Group
-Storage Account
-Front Door
-Endpoint
-DNS Zone
