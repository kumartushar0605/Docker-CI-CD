# Use official Node.js image
FROM node:alpine

# Set working directory in container
WORKDIR /app

# Copy package files
COPY ./package.json ./
COPY ./package-lock.json ./
COPY ./.env ./

# Install dependencies
RUN npm install

# Copy all project files (except ones in .dockerignore or .gitignore)
COPY . .

# Expose port (match the one in app.js)
EXPOSE 5000

# Start the app
CMD ["node", "app.js"]
