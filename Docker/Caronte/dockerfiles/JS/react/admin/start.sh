#!/bin/bash
set -e


load_entrypoint_nginx(){
   #ejecutar entrypoint ngin. Invoca a EP de base, configura nginx y lanza nginx &
   /root/admin/nginx/admin/start.sh
}

config_react(){
    cd /home/${USUARIO}/app/${PROYECTO}
    echo "Dentro de ${PROYECTO}..." >> /root/logs/react.log
   # Verifica si React con TypeScript ya está inicializado
    if [ ! -d "node_modules" ]; then
      # Ejecutar npm install
      npm install 
      if [ $? -ne 0 ]; then
         echo "Error al instalar dependencias. Abortando." >> /root/logs/react.log
         exit 1
      fi
      echo "dependencias instaladas..." >> /root/logs/react.log
      # Ejecutar npm start
      npm start &
      if [ $? -ne 0 ]; then
         echo "Error al iniciar la aplicación. Abortando."
         exit 1
      fi
      echo "Iniciando la aplicación en 3000.." >> /root/logs/react.log
    fi
}

main(){
   touch /root/logs/react.log
   load_entrypoint_nginx 
#    config_git
   config_react

   tail -f /dev/null
}

main