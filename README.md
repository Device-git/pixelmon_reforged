# pixelmon_reforged
Pixelmon Docker Server - fast config for my kids. 

Created a Dockerfile for to build Pixelmon server for keeping the kids entertained during covid.
Minecraft and Pokemon !!
Enjoy.

**********************************************************************

This is a Pixelmon Server that Auto Deploys.

Please acknowledge the eula... It will auto accept on your behalf.

Deployment help:

docker run -d -it -p 25565:25565
--name container_name shaunbriggs/pixelmon_reforged_1.12.2-7.2.2

If you want to edit the memory resources for the container, enter the command line mode in the container ... and edit the start.sh file. eg. nano start.sh

Please note that the kids that have been having trouble launching and joining the server. First check that they are running 64 bit java on their machine: https://www.java.com/en/download/manual.jsp / install reboot and then in the top right corner of your technic launcher - edit the launcher options. Under java settings select at least 2 Gig.
