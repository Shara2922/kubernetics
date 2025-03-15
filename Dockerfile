# User Node.js official image as base
FROM node:18-alpine

#Creat app directory
WORKDIR /usr/src/app

# Copy package file filrs first to leverage Docker cache
COPY package*.json ./

# Install app dependencies
RUN npm ci

# Copy app source code
COPY . .

# Expose port and start application
EXPOSE 3000

# Start the app
CMD ["node", "server.js"]