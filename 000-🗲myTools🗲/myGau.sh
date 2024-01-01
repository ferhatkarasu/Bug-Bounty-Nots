#Kullanım -> ./myGau.sh subs.txt
#!/bin/bash
while read -r subdomain;
do
    echo "Simdi sira bu subdomainde $subdomain";
    /root/go/bin/./gau $subdomain | tee -a mygauResult.txt
    echo "Bitti";
    sleep 100

done < $1
