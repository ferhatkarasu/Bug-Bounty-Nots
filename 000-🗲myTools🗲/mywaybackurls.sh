
#Kullanım -> ./mybackurls.sh subdomains.txt
#!/bin/bash
while read -r subdomain;
do
    echo "Simdi sira bu subdomainde $subdomain";
    /root/go/bin/./waybackurls $subdomain | tee -a mywaybackResult.txt
    echo "Bitti";
    sleep 100

done < $1
