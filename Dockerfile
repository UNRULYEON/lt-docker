# Define base image
FROM node:14

# Set working directory in image
WORKDIR /app

# Copy package.json from build context to working directory in image
COPY package.json .
# Install packages with yarn in image
RUN yarn
# Add global serve package to run CMD
RUN yarn global add serve

# Copy src directory from build context to working directory in image
COPY src src
# Copy public directory from build context to working directory in image
COPY public public
# Build production bundle in image
RUN yarn build

# Expose port 5000 so the container can interact with the outside
EXPOSE 5000

# Command to execute when you'd like to run a container
CMD ["serve", "-s", "build"]