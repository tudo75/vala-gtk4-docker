FROM ubuntu:latest
ARG UID
ARG GID
LABEL Name=valagtk4 Version=0.0.1
RUN grep -q ":$GID:" /etc/group || groupadd --gid $GID valagroup
RUN useradd --create-home --shell /sbin/nologin --uid $UID --gid $GID valauser
RUN apt-get -y update
RUN apt-get -y install software-properties-common
RUN apt-get -y install build-essential
RUN add-apt-repository -y ppa:vala-team
RUN apt-get -y update && apt-get -y install valac
RUN apt-get -y install libgtk-4-bin libgtk-4-common libgtk-4-dev libgtk-4-doc
RUN apt-get -y install meson ninja-build
