#!/bin/bash
# Dynamic create engine
# Kevin(5f) A40503 - 2018.11 

#########################################################################################
#components default version
#########################################################################################
ENGINE=classify
DEFAULT_NUMBER_OF_ENGINE=1
AUTO_GEN_FOLDER=auto_gen
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
            echo            
            break
            ;;
        "Clustering")
            echo -e "Selected ${GREEN}Clustering ${WHITE}Engine"
            echo
            ENGINE=clustering
            break
            ;;
    esac
done

echo
read -p "Enter number of engines (Default: [$DEFAULT_NUMBER_OF_ENGINE] ): " NUMBER_OF_ENGINE
NUMBER_OF_ENGINE=${NUMBER_OF_ENGINE:-$DEFAULT_NUMBER_OF_ENGINE}
echo -e "Will deploy ${GREEN}${NUMBER_OF_ENGINE} ${WHITE}engines"
tput sgr0

echo
mkdir ./engine/${ENGINE}/${AUTO_GEN_FOLDER}
echo -e "Create folder ./engine/${ENGINE}/${ORANGE_PS3}${AUTO_GEN_FOLDER}"
echo
tput sgr0

for ((i=0; i<${NUMBER_OF_ENGINE}; i=i+1))
do
    echo -e "Deploying ${ORANGE}${ENGINE} Engine ${PURPLE}${i}${WHITE}"
    #Duplicate the engine config file and modify CNNName
    cp ./engine/${ENGINE}/config.properties ./engine/${ENGINE}/${AUTO_GEN_FOLDER}/config.properties
    sed -i "s|CNName=${ENGINE}|CNName=${ENGINE}_${i}|g" ./engine/${ENGINE}/${AUTO_GEN_FOLDER}/config.properties

    #Deploy configmap
    kubectl create configmap engine-${ENGINE}-${i} --from-file=./engine/${ENGINE}/${AUTO_GEN_FOLDER}/config.properties
    
    #Rename config.properties
    mv ./engine/${ENGINE}/${AUTO_GEN_FOLDER}/config.properties ./engine/${ENGINE}/${AUTO_GEN_FOLDER}/config_${i}.properties

    #Duplicate the deploy engine yaml and modify arguments
    cp ./engine/${ENGINE}/engine_${ENGINE}.yaml ./engine/${ENGINE}/${AUTO_GEN_FOLDER}/engine_${ENGINE}-${i}.yaml
    sed -i "s|engine-${ENGINE}|engine-${ENGINE}-${i}|g" ./engine/${ENGINE}/${AUTO_GEN_FOLDER}/engine_${ENGINE}-${i}.yaml    

    #Deploy engine
    kubectl create -f ./engine/${ENGINE}/${AUTO_GEN_FOLDER}/engine_${ENGINE}-${i}.yaml
    echo
done