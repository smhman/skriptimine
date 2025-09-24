#!/bin/bash
# Skript teeb varukoopia kasutaja määratud kataloogist ja lisab faili nimele kuupäeva
# Lubatud on ainult kodukaustast või jooksva kausta kataloogid

echo -n "Sisesta kataloogi nimi, mida varundada: "
read allikas

if [ ! -d "$allikas" ]; then
    echo "Kataloogi '$allikas' ei leitud!"
    exit 1
fi

allikas=$(realpath "$allikas")

if [[ "$allikas" != "$HOME"* && "$allikas" != "$(pwd)"* ]]; then
    echo "Lubatud on varundada ainult oma kodukaustast või jooksva kausta alt!"
    exit 1
fi

siht="./backup"
katalooginimi=$(basename "$allikas")
kuup=$(date +%d%b%Y | tr '[:upper:]' '[:lower:]')
failinimi="$katalooginimi.backup.$kuup.tar.gz"

mkdir -p "$siht"

tar -czf "$siht/$failinimi" -C "$(dirname "$allikas")" "$katalooginimi"

echo "Varukoopia kataloogist '$allikas' on loodud ja salvestatud faili '$siht/$failinimi'."
