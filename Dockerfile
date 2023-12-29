FROM node:14.17.5

WORKDIR /app
COPY package.json ./
RUN npm install
RUN npm install express
RUN npm install ejs 
COPY . .
CMD ["node","app.js"]
EXPOSE 7000
