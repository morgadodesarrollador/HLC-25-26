#partimos de una imagen base de ubuntu donde instalaremos apache, configuraremos y arrancaremos
FROM ubuntu 
RUN apt update && apt install -yq --no-install-recommends \
     apache2 \
     nano \
     curl \
     net-tools iputils-ping

# *** Creacion de usuarios *****
# comandos interactivos (piden datos por terminal)
# compandos por lotes (datos los ponemos como parametrosl del comando)
RUN useradd -rm -d /home/morgado -s /bin/bash morgado
RUN echo "1234:morgado" | chpasswd
RUN echo "Bienvenido Morgado a la empresa" > /home/morgado/hello.txt  
#debemos consultar el docker hub (imagen) para ver variables de entorno
#directorios de trabajo etc etc
#directorio de trabajo dentro del contenedor
WORKDIR /var/www/html
# el directorio . es relativo al contexto del Docker
COPY ./src .
EXPOSE 80
CMD apachectl -DFOREGROUND

