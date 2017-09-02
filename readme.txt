Lazarus Build VM for Linux x64
==============================
https://hub.docker.com/r/cutec/buildhost-lazarus-x64/

With this Docker image you can build Lazarus Applications without installing Lazarus or Freepascal

Example:
docker run -it --rm -v ~/myApp:/root/app cutec/buildhost-lazarus-x64 lazbuild /root/app/myApp.lpi
     