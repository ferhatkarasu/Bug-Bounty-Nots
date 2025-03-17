
## FIND SUBDOMAINS

### Subfinder (https://github.com/projectdiscovery/subfinder)
```sh
subfinder -d target.com
subfinder -d target.com -o subs.txt
subfinder -d target.com -silent -o subs.txt | httpx -title -content-length -status-code -silent
```

    
### Knockpy (https://github.com/guelfoweb/knock)
 ```sh
python3 knockpy.py target.com
python3 knockpy.py target.com | tee subs.txt
```
  
### Crtsh (https://github.com/YashGoti/crtsh)
```sh
python3 crtsh.py -d target.com
```    
  
### Amass (https://github.com/owasp-amass/amass)
```sh
amass enum -passive -d target.com
amass enum -brute -d target.com
amass enum -o amass.txt -d target.com
amass enum -brute -active -d target.com -o amass.txt
```

### CurL
```sh
curl --silent https://crt.sh/\?q\=%.target.com | sed 's/<\/\?[^>]\+>//g' | grep -i target.com | tail -n +9 | cut -d ">" -f2 | cut -d "<" -f1
```

### Shadon
```sh
domain taraması -> org:"Google"
ip prefix taraması -> net:64.233.160.0/19
```


## DISCOVERING IP SPACE
```sh
Autonomous sytem number -> http://bgp.he.net
find ip address -> https://reverse.report/
```



## PORT SCANNING

### Nmap
```sh
nmap -sC -sV <IP> -v #Basic scan
nmap -sS -sV -p - --open <IP> -Pn -n #complete scan
nmap -T4 -Pn -vv -n target.com
nmap -sV -iL subdomains.txt -oN scaned-port.txt --script=vuln
```
  
### Masscan
```sh
masscan -iL ips.txt -8443,8888,8081,3000,9443 --rate=10000 --open
masscan -p1 -65535 -iL $TARGET_List --max-rate 100000 -oG $TARGET_OUTPUT
```




### Check Subdomain Takeover
```sh
nuclei -l hosts.txt -t subdomain-takeover_detect-all-takeovers.yaml
```


### Httpx (https://github.com/projectdiscovery/httpx)
```sh
cat subdomains.txt | httpx -title -content-length -status-code -silent
httpx -l subdomains.txt -ports 80,8080,8000,8888 -threads 200 > subdomains_alive.txt
httpx -l subs.txt -sc -td -title -probe -ip
```

### Httprobe (https://github.com/tomnomnom/httprobe)
```sh
cat subdomains.txt | httprobe | tee -a subdomains_alive.txt
cat subdomains.txt | httprobe -p http:81 -p http:3000 -p https:3000 -p http:3001 -p https:3001 -p http:8000 -p http:8080 -p https:8443 -c 50 | tee subdomains_alive.txt
cat sub.txt | httprobe -p http:81 -p http:3000 -p https:3000 -p http:3001 -p https:3001 -p http:8000 -p http:8080 -p https:8443 -p https:10000 -p http:9000 -p https:9443 -c 50 | tee live-subs2.txt
```

### Dirsearch (https://github.com/maurosoria/dirsearch)
```sh
dirsearch -u target.com
dirsearch -L allsubdomains.txt
dirsearch -L allsubdomains.txt -e json,html -r -x 500,400 -t 100
dirsearch -L allsubdomains.txt -e json,html -r -x 500,400 -t 100 -w /home/wordlists/common.txt
```

### Ffuf (https://github.com/ffuf/ffuf)
```sh
çıktıların renklenmesi için sonuna -c koy.
ffuf -w /home/wordlists/common.txt -u https://target.com/FUZZ -e .php,.php.bak,.js,.json,.txt,.sql,.tar.gz,.bkp,.html,.htm,.zip -mc 200,301 -ac
ffuf -u https://targett.com/FUZZ -w /usr/share/wordlists/dirb/common.txt/
ffuf -u https://target.com/admin/FUZZ -w /home/wordlists/common.txt -mc 200
ffuf -w /home/wordlists/common.txt -u https://target.com/FUZZ -fs 1111 => does not show sizes 1111
ffuf -w <(seq 0 110) -u https://target.com/FUZZ
ffuf -w wordlists.txt -u https://target.com:8080/api/FUZZ/6 -o output.txt
```

### Wfuzz -> https://www.hackingarticles.in/a-detailed-guide-on-wfuzz/

### Gobuster (https://github.com/OJ/gobuster)
```sh
gobuster dir -u http://internal.thm/ -w /usr/share/wordlists/dirb/common.txt
gobuster dir -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -u 10.10.10.56/cgi-bin/ -x sh,cgi,pl -t 200
gobuster dir --url target.com --wordlist /home/wordlist/common.txt --threads 10 --delay 1s --useragent 'ferhatkrs0-hackerone' --headres 'X-Hackerone: ferhatkrs0'
```

### Paramspider (https://github.com/devanshbatham/ParamSpider)
//Discover directories for a single domain:
```sh
paramspider -d example.com
```
//Discover URLs for multiple domains from a file:
```sh
paramspider -l domains.txt
paramspider -d target.com --exclude png,jpg,gif,jpeg,swf,woff,gif,svg --level high --quiet -o result.txt
```

### Parameth (https://github.com/maK-/parameth)
```sh
python3 parameth.py -u http://example.com/
```

### Feroxbuster (https://github.com/epi052/feroxbuster)
```sh
./feroxbuster --url http://target.com --wordlist /home/wordlist/big.txt
```
### Katana (https://github.com/projectdiscovery/katana)
```sh
katana -u https://target.com
katana -list domain_list.txt
cat domains | httpx | katana
```

### Waybackurls (https://github.com/tomnomnom/waybackurls)
```sh
waybackurls example.com > urls.txt | grep -oP ‘(?<=\?|&)\w+(?==|&)’ urls.txt | sort -u
echo 'target.com' | waybackurls -dates
https://web.archive.org/cdx/search/cdx?url=*.target.com&fl=original&collapse=urlkey
```

### Waymore (https://github.com/xnl-h4ck3r/waymore)
```sh
python3 waymore.py -i tesla.com -mode U
```

### xnLinkFinder (https://github.com/xnl-h4ck3r/xnLinkFinder)
```sh
python3 xnLinkFinder.py -i target.com
```

### Gau (https://github.com/lc/gau)
```sh
gau --subs --threads 3 --mc 200 --o urls.txt target.com
echo “example.com” | gau | grep .js | httpx -mc 200
cat domains.txt | gau --threads 5
```

### Nuclei (https://github.com/projectdiscovery/nuclei)
```sh
nuclei -u https://example.com
nuclei -list urls.txt
```

### Domain Analyzer (https://github.com/eldraco/domain_analyzer)
```sh
python3 domain_analyzer.py -d DOMAIN
python3 domain_analyzer.py -d DOMAIN -w -j -n -a
```
  
### Hakrevdns (https://github.com/hakluke/hakrevdns)
```sh
//Find domains among our target's IPs.
prips 173.0.84.0/24 | hakrevdns
cat ips.txt | hakrevdns
```

### Hakip2host (https://github.com/hakluke/hakip2host)
```sh
//Find domains among our target's IPs.
prips 173.0.84.0/24 | hakip2host
cat ips.txt | hakip2host
```

### CloakQuest3r (https://github.com/spyboy-productions/CloakQuest3r)
```sh
python3 cloakquest3r.py example.com
```

### BurpSuite
```sh
advencing-burp suite scope settings : ^.+google\.com$   port: ^443$  file: ^/.*
```

# URL Bypass(Directory Traversal | Path Normalization | 403 Bypass)

### nowafpls (https://github.com/assetnote/nowafpls/blob/main/README.md)
```sh
Use with burpsuite
```





