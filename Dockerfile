# Utiliser une image Node.js
FROM node:16-alpine

# Définir le répertoire de travail
WORKDIR /app

# Copier uniquement les fichiers nécessaires pour installer les dépendances
COPY package.json package-lock.json ./

# Installer les dépendances
RUN npm install

# Copier le reste de l'application
COPY . .

# Créer une version optimisée pour la production
RUN npm run build

# Exposer le port
EXPOSE 3000

# Lancer le serveur dans le conteneur
CMD ["npm", "start"]
