FROM morgadoberruezo/ubnginx

ARG PROYECTO
ARG USUARIO
# Actualiza los paquetes e instala herramientas necesarias
RUN apt-get update && apt-get install -y curl gnupg software-properties-common

# Añade el repositorio oficial de Node.js (versión 16 LTS o ajusta a tu necesidad)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -

# Instala Node.js (esto incluye npm)
RUN apt-get install -y nodejs

RUN npm install -g npm@latest

RUN mkdir -p /home/${USUARIO}/app
COPY ./proyectos/${PROYECTO}/src /home/{USUARIO}/app/{PROYECTO}

EXPOSE 3000
RUN mkdir -p /root/admin/sweb/nginx
COPY ./dockerfiles/JS/react /root/admin/JS/react
RUN chmod +x /root/admin/JS/react/admin/start.sh
WORKDIR /root/admin/JS/react
ENTRYPOINT ["./admin/start.sh"]