# /bin/bash
# Autor: Barckcode
# Description: Script to sync private Sauron data

####### Global Variables
DATE=$(date)

# Directories
WORK_DIR="/home/barckcode/ring"
ANSIBLE="ansible"
LOGS="logs"

# Files
ANSIBLE_HOSTS="hosts"

# Users
USER="barckcode"

# Hosts
DEBIAN_PRO="arangon"


if [[ -d $WORK_DIR ]]
then
    # Sync Ansible hosts
    rsync -zavh $WORK_DIR/$ANSIBLE/$ANSIBLE_HOSTS $USER@$DEBIAN_PRO:$WORK_DIR/$ANSIBLE/$ANSIBLE_HOSTS 2>>$WORK_DIR/$LOGS/sincro_data_err.log
    COMPROBACION=`echo $?`

    if [[ $COMPROBACION -eq 0 ]]
    then
        echo "$DATE : Sincronización del fichero $ANSIBLE_HOSTS hecha correctamente" >> $WORK_DIR/$LOGS/sincro_data.log
    else
        echo "$DATE : Sincronización del fichero $ANSIBLE_HOSTS ha fallado" >> $WORK_DIR/$LOGS/sincro_data_err.log
    fi
else
    mkdir -p $WORK_DIR

    # Sync Ansible hosts
    rsync -zavh $WORK_DIR/ansible/hosts $USER@$DEBIAN_PRO:$WORK_DIR/ansible/hosts
    COMPROBACION=`echo $?`

    if [[ $COMPROBACION -eq 0 ]]
    then
        echo "$DATE : Sincronización del fichero $ANSIBLE_HOSTS hecha correctamente" >> $WORK_DIR/$ANSIBLE/$LOGS/sincro_data.log
    else
        echo "$DATE : Sincronización del fichero $ANSIBLE_HOSTS ha fallado" >> $WORK_DIR/$ANSIBLE/$LOGS/sincro_data_err.log
    fi
fi
