#Kullanım -> ./subdomainFİnder.sh results.txt target(tiktok)
#!/bin/bash

# Metin dosyasının adı
dosya=$1

# Dosya satırını oku ve subdomain'leri bul
while IFS= read -r satir; do
  # Regex ile subdomain'i bul
  if [[ $satir =~ (https?://)?([a-zA-Z0-9.-]+\.$2\.com) ]]; then
    subdomain="${BASH_REMATCH[2]}"
    echo "$subdomain"
  fi
done < "$dosya"
