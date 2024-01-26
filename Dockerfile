FROM ubuntu:23.10
ARG UID
ARG GID
LABEL Name='vala-gtk4'
RUN grep -q ":$GID:" /etc/group || groupadd --gid $GID valagroup
RUN useradd --create-home --shell /bin/bash -o --uid $UID --gid $GID valauser
RUN apt -y update
RUN apt -y install software-properties-common \
    build-essential \
    pkg-config \
    git \
    libgtk-4-bin \
    libgtk-4-common \
    libgtk-4-dev \
    libadwaita-1-0 \
    libadwaita-1-dev \
    meson \
    ninja-build \
    cmake \
    gettext \
    desktop-file-utils \
    appstream-util
# RUN add-apt-repository -y ppa:vala-team
RUN apt -y update 
RUN apt -y install valac
# Flatpak installation removed at the moment
# RUN apt -y install flatpak flatpak-builder
# RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# RUN flatpak install -y flathub org.gnome.Platform//45
# RUN flatpak install -y flathub org.gnome.Sdk//45
