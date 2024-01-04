#!/bin/bash


# Renkli yazı renk kodları
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color


dosya1="$1"
dosya2="$2"

if [ -z "$dosya1" ] || [ -z "$dosya2" ]; then
	echo -e "\n"
    echo -e "${RED}Kullanım: ${GREEN}$0 dosya1 dosya2"
    exit  1
fi

# SHA-256 hash hesaplamak için sha256sum komutunu kullanır 
hash1=$(sha256sum "$dosya1" | awk '{print $1}')
hash2=$(sha256sum "$dosya2" | awk '{print $1}')

echo -e "\n\n"
echo -e  "${YELLOW}Dosya1 SHA-256 Hash: ${GREEN}$hash1${NC}"
echo -e "${YELLOW}Dosya2 SHA-256 Hash: ${GREEN}$hash2${NC}\n"

if [ "$hash1" == "$hash2" ]; then
    echo -e "${GREEN}Hash'ler eşleşiyor, dosyalar aynı${NC}"
else
    echo -e "${RED}Hash'ler eşleşmiyor, dosyalar farklı${NC}"
fi

