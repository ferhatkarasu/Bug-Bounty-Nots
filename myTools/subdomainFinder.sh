#!/bin/bash

# Metin dosyasının adı
dosya="test.txt" #dosya adını değiştir

# Dosya satırını oku ve subdomain'leri bul
while IFS= read -r satir; do
  # Regex ile subdomain'i bul
  if [[ $satir =~ (https?://)?([a-zA-Z0-9.-]+\.tiktok\.com) ]]; then #hedefi değiştir
    subdomain="${BASH_REMATCH[2]}"
    echo "$subdomain"
  fi
done < "$dosya"
