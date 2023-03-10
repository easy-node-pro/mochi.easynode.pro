# Use Node.js version 16
FROM node:16

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json /app/

# Install dependencies
RUN npm install --frozen-lockfile --production=false

# Copy the rest of the app to the working directory
COPY . /app/

# Build the app
RUN npm run build

# Install the serve package globally
RUN npm add serve --global

# Set the command to start the app using serve
CMD ["serve", "-s", "build"]
