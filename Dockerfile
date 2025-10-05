# Use the official Kali Linux rolling image
FROM kalilinux/kali-rolling

# Avoid interactive prompts during package installs
ENV DEBIAN_FRONTEND=noninteractive

# Update and install some common tools
RUN apt-get update && apt-get install -y \
    kali-tools-top10 \
    net-tools \
    iproute2 \
    iputils-ping \
    curl \
    wget \
    nano \
    vim \
    git \
    # tshark \
    gobuster \
    masscan \
    wpscan \
    hashcat \
    smbclient \
    tcpdump \
    ruby-full \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /root

# Default shell
CMD ["/bin/bash"]
