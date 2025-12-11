#!/bin/bash
set -e


load_entrypoint_nginx(){
   #ejecutar entrypoint ngin. Invoca a EP de base, configura nginx y lanza nginx &
   bash /root/admin/base/start.sh
   bash /root/admin/sweb/nginx/admin/start.sh
}

config_react(){
    echo "*** Imagen de React *******" >> /root/logs/informe.log
    cd /home/${USUARIO}/app/${PROYECTO}
    echo "Dentro de ${PROYECTO}..." >> /root/logs/informe.log
   # Verifica si React con TypeScript ya está inicializado
    if [ ! -d "node_modules" ]; then
      # Ejecutar npm install
      npm install 
      if [ $? -ne 0 ]; then
         echo "Error al instalar dependencias. Abortando." >> /root/logs/informe.log
         exit 1
      fi
      echo "dependencias instaladas..." >> /root/logs/informe.log
      # Ejecutar npm start
      npm start &
      if [ $? -ne 0 ]; then
         echo "Error al iniciar la aplicación. Abortando."
         exit 1
      fi
      echo "Iniciando la aplicación en 3000.." >> /root/logs/informe.log
    fi
}

main(){
   load_entrypoint_nginx 
#    config_git
#    config_react

   tail -f /dev/null
}

main