# FROM node:alpine

# WORKDIR /usr/app

# COPY package.json .
# RUN npm install

# RUN mkdir node_modules/.cache && chmod -R 777 node_modules/.cache

# COPY . .

# CMD ["npm", "run", "start"]


FROM node:14-alpine AS development
ENV NODE_ENV development
# Add a work directory
WORKDIR /app
# Cache and Install dependencies
COPY package.json .
COPY package-lock.json .
RUN npm install
# Copy app files
COPY . .
# Expose port
EXPOSE 3000
# Start the app
CMD [ "npm", "start" ]