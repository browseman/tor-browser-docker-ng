FROM debian:testing

# Labels
#
LABEL VERSION="0.1.0"
LABEL CREATOR="BrowseMan"
LABEL DESCRIPTION="Provides an evironment for interaction with TOR over VNC"


# Environment variables
#
ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:0
ENV RES=1680x1050x32


# Add debian sources
#
ADD conf_files/x86_64/debian.sources /etc/apt/sources.list.d/debian.sources


# Install dependecies
#
RUN apt update && \
    apt upgrade -y && \
    apt dist-upgrade -y && \
    apt -y install tigervnc-standalone-server wget supervisor fluxbox net-tools novnc firefox-esr lxterminal desktop-file-utils torbrowser-launcher && \
    apt autoremove; apt autoclean; apt clean;



# Add custom config files
#
ADD conf_files/x86_64/supervisord.conf /etc/supervisor/conf.d/supervisord.conf


# Create dedicated user for torbrowser
#
RUN useradd -m browseruser


# Set workdir and entrypoint
#
WORKDIR /root/

#EXPOSE 8080
#EXPOSE 5900
CMD ["/usr/bin/supervisord"]
