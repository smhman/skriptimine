#!/bin/bash
# Skript küsib kasutaja nime ja sünniaasta ning arvutab vanuse

echo -n "Sisesta oma nimi: "
read nimi

echo "Tere tulemast, $nimi!"

echo -n "Sisesta oma sünniaasta: "
read aasta

# Kontroll, et sisestatud oleks täisarv
if ! [[ "$aasta" =~ ^[0-9]{4}$ ]]; then
    echo "Palun sisesta sünniaasta (nt 1999)."
    exit 1
fi

praegune=$(date +%Y)
vanus=$((praegune - aasta))

echo "$nimi, sina oled $vanus aastat vana."
