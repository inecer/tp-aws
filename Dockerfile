# Étape de build pour React
FROM node:18 AS build

WORKDIR /app

# Copier package.json et package-lock.json
COPY package*.json ./

# Installer les dépendances
RUN npm install

# Copier le code source
COPY . .

# Générer la build de production
RUN npm run build

# Étape pour servir l'app avec Nginx
FROM nginx:alpine

# Copier la build de React dans Nginx
COPY --from=build /app/build /usr/share/nginx/html

# Exposer le port 80
EXPOSE 80

# Lancer Nginx
CMD ["nginx", "-g", "daemon off;"]
