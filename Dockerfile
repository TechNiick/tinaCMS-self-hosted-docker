# Use the official Node.js 16 image as a base
FROM node:21-alpine

# Set the working directory in the container
WORKDIR /app

# Install Python and build tools for native dependencies
RUN apk add --no-cache python3 make g++ \
    && ln -sf python3 /usr/bin/python

COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install --frozen-lockfile

# Copy the rest of your application code
COPY . .

# Expose the port the app runs on
EXPOSE 3000 4001

# Command to run the development server
CMD ["yarn", "dev"]
