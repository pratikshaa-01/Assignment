# Dockerfile for Node.js app
FROM node:14

# Set the working directory
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the app on port 80
EXPOSE 80

# Start the Node.js application
CMD ["npm", "start"]
