FROM node:9-alpine

# Install Certbot
RUN apk add --no-cache \
    certbot

# Copy container files
COPY app.js .
COPY entrypoint.sh .
COPY package.json package-lock.json ./

# Install NPM packages
RUN npm install --quiet --production && \
    npm cache clean --force

# Configure container to not run as root
RUN addgroup -g 1001 -S appuser && \
    adduser -u 1001 -S appuser -G appuser

# Launch the process
ENTRYPOINT [ "./entrypoint.sh" ]
