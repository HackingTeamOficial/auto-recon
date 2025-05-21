🛠️ auto-recon.sh – Reconocimiento Automático para Pentesters

Reconocimiento ofensivo automatizado a partir de una URL, integrando herramientas en Go ampliamente utilizadas en el mundo del hacking ético, bug bounty y OSINT.
📌 Características principales

    🕵️ Recolección de subdominios (subfinder, assetfinder)

    🌐 Verificación de hosts vivos (httpx, cdncheck, tlsx, dnsx)

    🔎 Extracción de URLs históricas (gau, waybackurls, gospider)

    🔐 Búsqueda de parámetros (gf, paramspider, qsreplace, unfurl)

    🚨 Fuzzing y escaneo de vulnerabilidades (ffuf, dalfox, nuclei)

    🧼 Resultados ordenados automáticamente por dominio

✅ Requisitos

Asegúrate de tener estas herramientas instaladas en tu $PATH:

subfinder, assetfinder, httpx, cdncheck, tlsx, dnsx, gau, waybackurls,
gospider, paramspider, gf, qsreplace, ffuf, dalfox, nuclei, unfurl

    📌 Estas herramientas suelen instalarse con Go:
    go install github.com/project/...@latest

También asegúrate de que el binario de Go esté en tu entorno (ej. /root/go/bin).
🚀 Instalación

git clone https://github.com/HackingTeamOficial/auto-recon
cd auto-recon
chmod +x auto-recon.sh

🧪 Uso

./auto-recon.sh https://example.com

Los resultados se almacenarán en:

output/
└── example.com/
    ├── all_subs.txt
    ├── alive_hosts.txt
    ├── nuclei_scan.txt
    ├── gau.txt
    └── ...

📂 Estructura modular

El script sigue una estructura por fases:

    Enumeración: Subdominios, DNS, resoluciones.

    Extracción: URLs, endpoints, JS, parámetros.

    Análisis: XSS, SQLi, fuzzing, escaneo nuclei.

    Organización: Todo se guarda limpio por dominio.

🎯 Casos de uso

    Bug Bounty y caza de subdominios

    Labs de hacking ético y CTFs

    Automatización de procesos de OSINT

    Recon pasivo de infraestructuras

🤝 Contribuciones

¡Pull requests, forks y sugerencias son bienvenidos!

Si quieres ayudar:

    Añade opciones en flags

    Mejora la gestión de errores

    Integra más herramientas

    O crea una versión en Python

🪪 Licencia

MIT License – libre para uso personal y profesional.
👨‍💻 Autor

Desarrollado por AnonSec777
Puedes encontrarme en Telegram, Twitter o Discord en las Siguientes RRSS

Telegram

https://t.me/+YWhDjkfmSQ9jY2Jk

https://t.me/+74d-97oV7P05OTVk

https://t.me/+llcmNGzz6JIyMmI0

https://t.me/PlantillasNucleiHackingTeam

https://t.me/TermuxHackingTeam

https://t.me/+-RIgaFP12_RhNTk0

(X)

@HackingTeam777

Bluesky

https://bsky.app/profile/hackingteam.bsky.social

Discord

https://discord.gg/V4nPFbQX

Facebook

https://www.facebook.com/groups/hackingteam2022/?ref=share https://www.facebook.com/groups/HackingTeamCyber/?ref=share

Youtube

https://www.youtube.com/@HackingTeamOfficial

Canal de tiktok

https://www.tiktok.com/@hacking.kdea?_t=ZS-8vTtlaQrDTL&_r=1

#hackingteam #cibersecurity #infosec #eticalhacking #pentesting #dns #script #cracking #hack #security #bugbounty #payload #tools #exploit #cors #sqli #ssrf #python #c2 #poc #web #ramsomware #phishing #linux #osint #linux #windows #redteam #blueteam #spyware #digitalforensics #reverseengineeringtools #rat #malwareforensics #exploitdevelopment #sandboxing #apt #zerodayexploit #xss #github #cve #java #tools #termux #troyano #dev #sqlmap #waybackurls #copilot #ai #ia #kalilinux #parrot #dracos #susse #nessus #oswazap #burpsuite #wireguard
