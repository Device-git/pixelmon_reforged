# This Dockerfile is used to build an image containing Minecraft Tekkit
FROM ubuntu:latest

# Make sure the package repository is up to date.
RUN apt update

#Install Java, unzip, nano, and wget
RUN apt install nano unzip wget  -y
RUN apt install openjdk-8-jre-headless -y
RUN apt update

# Add user minecraft
RUN adduser --quiet minecraft
RUN mkdir /opt/tekkit
RUN chown -R minecraft /opt/tekkit

#Download Tekkit Pixelmon
RUN wget -O /tmp/serverpack.zip   http://servers.technicpack.net/Technic/servers/tekkitmain/Tekkit_Server_v1.2.9g-2.zip
RUN unzip /tmp/serverpack.zip -d /opt/tekkit
WORKDIR /opt/tekkit/

RUN wget -O /opt/tekkit/forge-install.jar https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2854/forge-1.12.2-14.23.5.2854-installer.jar
RUN java  -jar /opt/tekkit/forge-install.jar --install

#Create start file
RUN touch /opt/tekkit/start.sh
#using 6 GB ram 
RUN echo "java -Xmx6G -Xms6G -jar /opt/tekkit/forge-1.12.2-14.23.5.2854.jar nogui" > /opt/tekkit/start.sh
RUN chmod +x /opt/tekkit/start.sh
RUN chown -R minecraft /opt/tekkit
#RUN java -jar forge-1.15.2-31.1.0-installer.jar --install - to instal reforge files
RUN java -jar /opt/tekkit/forge-install.jar --install
#start reforge to setup files
RUN ./start.sh
#accept EULA
RUN echo eula=true > /opt/tekkit/eula.txt

VOLUME ["/opt/tekkit/"]
EXPOSE 25565

WORKDIR /opt/tekkit/
USER minecraft

ENTRYPOINT ["/bin/sh", "start.sh"]

