#!/bin/bash
set -e


load_entrypoint_nginx(){
   #ejecutar entrypoint ngin. Invoca a EP de base, configura nginx y lanza nginx &
   # bash /root/admin/base/start.sh
   bash /root/admin/sweb/nginx/admin/start.sh
   
}


config_react(){
   echo "*** Imagen de React *******" >> /root/logs/informe.log
   #  cd /root/${USUARIO}/app/${PROYECTO}
   cd /app
   echo "* Dentro de ${PROYECTO}..." >> /root/logs/informe.log
    
   npm install -g npm@11.7.0
   echo "* npm@11.7.0 instalado ..." >> /root/logs/informe.log
   # Verifica si React con TypeScript ya está inicializado
   if [ ! -d "node_modules" ]; then
      # Ejecutar npm install
      npm install 
      if [ $? -ne 0 ]; then
         echo "* Error al instalar dependencias. Abortando." >> /root/logs/informe.log
         exit 1
      fi
   fi
   echo "* Dependencias instaladas..." >> /root/logs/informe.log
   # Ejecutar npm start
   npm start 
   if [ $? -ne 0 ]; then
      echo "* Error al iniciar la aplicación. Abortando."
      exit 1
   fi
   echo "* Iniciando la aplicación en 3000.." >> /root/logs/informe.log

   if [ ! -d "build" ]; then
      echo "Construyendo la aplicación React para producción..." >> /root/logs/react.log
      # Ejecutar npm run build
      npm run build 
      # copiamos
      if [ $? -ne 0 ]; then
            echo "Error al construir la aplicación.">> /root/logs/react.log
            exit 1
      fi
   fi
   # Mover al html
   cp -r ./build/* /var/www/html
   chown -R www-data /var/www/html
   chmod -R 755  /var/www/html
   echo "Build movido a /var/www/html... Sirviendo nginx" >> /root/logs/react.log
   echo "Todo completado exitosamente.">> /root/logs/react.log

}

main(){
   # tail -f /dev/null
   load_entrypoint_nginx &
    echo "***** RECT ******" >> /root/logs/informe.log
   

   # install_node
   # config_git
   config_react

   # tail -f /dev/null
}

main