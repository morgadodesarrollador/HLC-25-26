#!/bin/sh

# touch /root/logs/informe.log
load_ciber(){
    LOG_DIR="/root/logs"
    CONTAINER_NAME="${HOSTNAME}"
    TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
    LOG_FILE="$LOG_DIR/${CONTAINER_NAME}_ports_$TIMESTAMP.log"

    echo "=== PORT AUDIT (SELF) ===" >> "$LOG_FILE"
    echo "Container: $CONTAINER_NAME" >> "$LOG_FILE"
    echo "Timestamp: $TIMESTAMP" >> "$LOG_FILE"
    echo "" >> "$LOG_FILE"

    echo "--- Listening TCP/UDP ports ---" >> "$LOG_FILE"
    ss -tulnp >> "$LOG_FILE" 2>&1

    echo "" >> "$LOG_FILE"
    echo "--- Exposed environment ports ---" >> "$LOG_FILE"
    printenv | grep -i port >> "$LOG_FILE" 2>/dev/null || true

    echo "" >> "$LOG_FILE"
    echo "=== END AUDIT ===" >> "$LOG_FILE"

}

load_entrypoint_base(){
   #ejecutar entrypoint ubbase
   bash /root/admin/base/start.sh
  
}

main() {
    load_entrypoint_base
    load_ciber
}

main