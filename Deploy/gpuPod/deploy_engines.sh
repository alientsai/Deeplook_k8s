#!/bin/bash

#########################################################################################
#components default version
#########################################################################################
ENGINE=classify
DEFAULT_NUMBER_OF_ENGINE=1
WITHOUT_SAMBA=.noSamba
#########################################################################################
#environment configuration
#########################################################################################
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
GREEN_PS3=$'\e[0;32m'
ORANGE_PS3=$'\e[0;33m'
WHITE='\033[0;37m'

#engine
echo -e "${BLUE}What kind of engine you want deploy ?:${WHITE}"

options=("Classify" "Clustering")
select opt in "${options[@]}"
do
    tput sgr0
    case $opt in
        "Classify")
            echo -e "Selected ${GREEN}Classify ${WHITE}Engine"            
            break
            ;;
        "Clustering")
            echo -e "Selected ${GREEN}Clustering ${WHITE}Engine"
            ENGINE=clustering
            break
            ;;
    esac
done

echo -e "${BLUE}Are you deploying with Samba?"
tput sgr0
read -p "Y/N [N]: " use_aks
if [[ $use_aks =~ ^([yY][eE][sS]|[yY])$ ]]; then
  WITHOUT_SAMBA=''
  echo -e "The engine deploy ${GREEN}with samba"
  echo
fi

read -p "Enter number of engines (Default: [$DEFAULT_NUMBER_OF_ENGINE] ): " NUMBER_OF_ENGINE
NUMBER_OF_ENGINE=${NUMBER_OF_ENGINE:-$DEFAULT_NUMBER_OF_ENGINE}
echo -e "Will deploy ${GREEN}${NUMBER_OF_ENGINE} ${WHITE}engines"
tput sgr0

for ((i=0; i<${NUMBER_OF_ENGINE}; i=i+1))
do
    echo ${i}    
    #Duplicate the deploy engine yaml and modify arguments
    cp ./engine/${ENGINE}/engine_${ENGINE}${WITHOUT_SAMBA}.yaml ./engine/${ENGINE}/engine_${ENGINE}${WITHOUT_SAMBA}${i}.yaml
    sed -i "s|engine-${ENGINE}|engine-${ENGINE}${i}|g" ./engine/${ENGINE}/engine_${ENGINE}${WITHOUT_SAMBA}${i}.yaml
    sed -i "s|tmp_config\/config.properties|tmp_config\/config${i}.properties|g" ./engine/${ENGINE}/engine_${ENGINE}${WITHOUT_SAMBA}${i}.yaml

    #Deploy engine
    #kubectl create -f ./engine/${ENGINE}/engine_${ENGINE}${WITHOUT_SAMBA}${i}.yaml

    #Duplicate the engine config file and modify CNNName
    cp ./engine/${ENGINE}/config.properties ./engine/${ENGINE}/config${i}.properties
    sed -i "s|CNName=${ENGINE}|CNName=${ENGINE}${i}|g" ./engine/${ENGINE}/config${i}.properties

    #Deploy configmap
    kubectl create configmap engine-${ENGINE}${i} --from-file=./engine/${ENGINE}/config${i}.properties
done

