FROM ubuntu:20.04

# Update the package list and install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    ca-certificates \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libgconf-2-4 \
    libnspr4 \
    libnss3 \
    libxss1 \
    libxtst6 \
    xdg-utils

# Add Google's public key and set up the repository
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

# Update the package list again and install Google Chrome
RUN apt-get update && apt-get install -y google-chrome-stable

# Set the default command to launch Chrome
CMD ["google-chrome", "--no-sandbox"]

# Expose port 9222 for remote debugging
EXPOSE 9222
