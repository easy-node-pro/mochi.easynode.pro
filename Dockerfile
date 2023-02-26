# Use Node.js version 16
FROM node:16

# Set the working directory to /app
WORKDIR /app

# Copy package.json and yarn.lock to the working directory
COPY package.json yarn.lock /app/

# Install dependencies
RUN yarn install --frozen-lockfile --production=false

# Copy the rest of the app to the working directory
COPY . /app/

# Build the app
RUN yarn build

# Install the serve package globally
RUN yarn global add serve

# Set the command to start the app using serve
CMD ["serve", "-s", "build"]
