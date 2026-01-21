#!/bin/bash
set -e



main(){
   bash /root/admin/sweb/nginx/admin/start.sh
   
}

main

tail -f /dev/null