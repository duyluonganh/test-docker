# Use the latest Ubuntu image from Docker Hub
FROM ubuntu:latest

# Update the package list and install necessary packages
RUN apt-get update && apt-get install -y wget gnupg

# Add the Google Chrome repository key
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -

# Add the Google Chrome repository
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

# Install Google Chrome
RUN apt-get update && apt-get install -y google-chrome-stable

# Set entry point to start Chrome
ENTRYPOINT [ "google-chrome" ]

# Default command to run Chrome in headless mode
CMD ["--headless", "--no-sandbox", "--disable-gpu", "--screenshot" , "https://www.chromestatus.com/", 