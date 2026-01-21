#!/bin/bash
set -e



main(){
    echo "*** clonando portfolio *******" >> /root/logs/informe.log
   bash /root/admin/sweb/nginx/admin/start.sh
   cd /var/www/html
   git clone https://github.com/vaibhavtomar04/portfolio.git
}

main

tail -f /dev/null