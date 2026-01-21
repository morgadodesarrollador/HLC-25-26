#!/bin/bash
set -e



main(){
    echo "*** clonando portfolio *******" >> /root/logs/informe.log
   
   cd /var/www/html
   git clone https://github.com/vaibhavtomar04/portfolio.git
   chown -R www-data:www-data /var/www/html/portfolio
   echo "propiedad del www-data /var/www/html/portfolio..." >> /root/logs/informe.log
   bash /root/admin/sweb/nginx/admin/start.sh &
}


main

tail -f /dev/null