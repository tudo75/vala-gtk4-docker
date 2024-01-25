FROM ubuntu:latest
ARG UID
ARG GID
LABEL Name=valagtk4 Version=0.0.2
RUN grep -q ":$GID:" /etc/group || groupadd --gid $GID valagroup
RUN useradd --create-home --shell /bin/bash --uid $UID --gid $GID valauser
RUN apt -y update
RUN apt -y install software-properties-common
RUN apt -y install build-essential
RUN apt -y install pkg-config cmake
RUN apt -y install git
RUN add-apt-repository -y ppa:vala-team
RUN apt -y update && apt -y install valac
RUN apt -y install libgtk-4-bin libgtk-4-common libgtk-4-dev libgtk-4-doc
RUN apt -y install libadwaita-1-0 libadwaita-1-dev libadwaita-1-doc
RUN apt -y install meson ninja-build cmake gettext desktop-file-utils appstream-util
RUN apt -y install flatpak flatpak-builder
RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
RUN flatpak install -y flathub org.gnome.Platform//45
RUN flatpak install -y flathub org.gnome.Sdk//45
