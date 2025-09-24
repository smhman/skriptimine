#!/bin/bash
# Skript teeb kataloogi test varukoopia ./backup kataloogi

allikas="./test"
siht="./backup"
failinimi="test.backup.tar.gz"

if [ ! -d "$allikas" ]; then
    echo "Kataloogi $allikas ei leitud!"
    exit 1
fi

mkdir -p "$siht"

tar -czf "$siht/$failinimi" "$allikas"

echo "Varukoopia kataloogist '$allikas' on loodud ja salvestatud faili '$siht/$failinimi'."
