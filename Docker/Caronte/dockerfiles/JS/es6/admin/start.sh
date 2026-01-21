#!/bin/bash
set -e



main(){
   bash /root/admin/sweb/nginx/admin/start.sh
   cd /var/www/html
   git clone https://github.com/vaibhavtomar04/portfolio.git
}

main

tail -f /dev/null