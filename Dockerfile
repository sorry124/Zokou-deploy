FROM node:20-bullseye-slim

# Installer les dépendances système
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    libwebp \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Cloner ton repo Zokou-MD-english
RUN git clone https://github.com/hamoudi223/Zokou-MD-english.git /zokou

# Aller dans le dossier cloné
WORKDIR /zokou

# Installer les dépendances Node.js
RUN npm install --omit=dev

# Exposer un port (facultatif)
EXPOSE 8000

# Lancer le bot
CMD ["node", "."]
