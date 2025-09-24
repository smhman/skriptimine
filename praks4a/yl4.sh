#!/bin/bash
# Skript teeb varukoopia kasutaja määratud kataloogist (ainult kodukaustas või jooksvas kaustas)

echo -n "Sisesta kataloogi nimi, mida varundada: "
read allikas

# Kontroll, kas kataloog on olemas
if [ ! -d "$allikas" ]; then
    echo "Kataloogi '$allikas' ei leitud!"
    exit 1
fi

# Muudame absoluutseks teeks
allikas=$(realpath "$allikas")

# Kontrollime, et see jääks kas $HOME või jooksva kataloogi sisse
if [[ "$allikas" != "$HOME"* && "$allikas" != "$(pwd)"* ]]; then
    echo "Lubatud on varundada ainult oma kodukaustast või jooksva kausta alt!"
    exit 1
fi

siht="./backup"
katalooginimi=$(basename "$allikas")
failinimi="$katalooginimi.backup.tar.gz"

mkdir -p "$siht"

tar -czf "$siht/$failinimi" -C "$(dirname "$allikas")" "$katalooginimi"

echo "Varukoopia kataloogist '$allikas' on loodud ja salvestatud faili '$siht/$failinimi'."
