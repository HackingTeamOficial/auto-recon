#!/bin/bash

#==================================
# Auto-Recon: Pentesting Automation
# Herramientas en Go desde Kali Linux
# Autor: AnonSec777 😉
#==================================

#========== CONFIG ==========
if [ -z "$1" ]; then
    echo -e "Uso: $0 <url>\nEjemplo: $0 https://example.com"
    exit 1
fi

TARGET=$1
DOMAIN=$(echo $TARGET | awk -F/ '{print $3}')
OUT_DIR="output/$DOMAIN"
mkdir -p "$OUT_DIR"

echo "[+] Objetivo: $TARGET"
echo "[+] Dominio: $DOMAIN"
echo "[+] Guardando resultados en: $OUT_DIR"
echo "===================================="

#========== FASE 1: ENUMERACIÓN ==========
echo "[*] Subdominios con subfinder y assetfinder..."
subfinder -d "$DOMAIN" -silent -o "$OUT_DIR/subs_subfinder.txt"
assetfinder --subs-only "$DOMAIN" | tee "$OUT_DIR/subs_assetfinder.txt"

cat "$OUT_DIR"/subs_*.txt | sort -u > "$OUT_DIR/all_subs.txt"

#========== FASE 2: RESOLUCIÓN & ESCANEO ==========
echo "[*] Resolviendo subdominios con httpx..."
cat "$OUT_DIR/all_subs.txt" | httpx -silent -o "$OUT_DIR/alive_hosts.txt"

echo "[*] Detectando puertos con tlsx..."
tlsx -l "$OUT_DIR/alive_hosts.txt" -o "$OUT_DIR/tls_scan.txt" -silent

#========== FASE 3: EXTRACCIÓN DE URLs ==========
echo "[*] Extrayendo URLs de fuentes públicas (gau, wayback)..."
gau "$DOMAIN" > "$OUT_DIR/gau.txt"
waybackurls "$DOMAIN" > "$OUT_DIR/wayback.txt"
cat "$OUT_DIR"/gau.txt "$OUT_DIR"/wayback.txt | sort -u > "$OUT_DIR/all_urls.txt"

echo "[*] Corriendo gospider..."
gospider -s "$TARGET" -o "$OUT_DIR/gospider" -t 10 --js --subs

#========== FASE 4: PARÁMETROS Y ENDPOINTS ==========
echo "[*] Buscando endpoints y parámetros..."
paramspider -d "$DOMAIN" -o "$OUT_DIR/paramspider"
gf xss < "$OUT_DIR/all_urls.txt" > "$OUT_DIR/gf_xss.txt"
gf sqli < "$OUT_DIR/all_urls.txt" > "$OUT_DIR/gf_sqli.txt"

#========== FASE 5: FUZZING / VULNS ==========
echo "[*] Fuzzing con ffuf y escaneo con nuclei..."
ffuf -u "$TARGET/FUZZ" -w /usr/share/wordlists/dirb/common.txt -o "$OUT_DIR/ffuf.json" -of json

nuclei -l "$OUT_DIR/alive_hosts.txt" -o "$OUT_DIR/nuclei_scan.txt"

#========== FASE 6: HERRAMIENTAS AVANZADAS ==========
echo "[*] Ejecutando herramientas adicionales..."
dalfox file "$OUT_DIR/gf_xss.txt" -o "$OUT_DIR/dalfox_xss.txt"
qsreplace "test" < "$OUT_DIR/all_urls.txt" > "$OUT_DIR/qsreplaced.txt"
unfurl --unique keys < "$OUT_DIR/all_urls.txt" > "$OUT_DIR/param_keys.txt"

#========== FASE 7: DNS, CDN, ETC. ==========
echo "[*] Analizando DNS y CDN..."
dnsx -l "$OUT_DIR/all_subs.txt" -o "$OUT_DIR/dnsx.txt"
cdncheck -i "$OUT_DIR/alive_hosts.txt" -o "$OUT_DIR/cdncheck.txt"

#========== FINAL ==========
echo "===================================="
echo "[✔] Recon completado para $DOMAIN"
echo "[✔] Revisa: $OUT_DIR"
echo "===================================="
