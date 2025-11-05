#!/bin/bash

newUser(){
    useradd -rm -d /home/morgado -s /bin/bash morgado
    echo "morgado:1234" | chpasswd
    echo "Bienvenido Morgado ..." > /home/morgado/bienvenida.txt
}

main() {
    newUser
    # encargada de dejar este contendor vivo en BGround
    tail -f /dev/null
    ## script's que se encargar de configurar el imagen/contenedor
}

main