#!/bin/bash


# Renkli yazı renk kodları
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color


dosya1="$1"
dosya2="$2"

#eğer araç yanlış kullanıldıysa bir uyarı ver 
#exit 1 ifadesi, bir bash betiğinde kullanılan bir çıkış kodunu belirtir. aracın çalışmasını sonlandırır
#-z ifadesi, bir dizedeki uzunluğun sıfır (zero) olup olmadığını kontrol etmek için kullanılır.Dize boşsa (uzunluğu sıfırsa), -z ifadesi (true) olur.
if [ -z "$dosya1" ] || [ -z "$dosya2" ]; then
	echo -e "\n"
    echo -e "${RED}Kullanım: ${GREEN}$0 dosya1 dosya2"
    exit  1
fi

# SHA-256 hash hesaplamak için sha256sum komutunu kullanır 
#awk ilk komutun çıktısının sadece ilk satırını okumak için kullanılır
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

