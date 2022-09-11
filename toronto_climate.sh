#!/bin/bash

HOST=$HOSTNAME

SHORT_DATE=`date '+%Y-%m-%d'`

TIME=`date '+%H%M'`

SCRIPT_TYPE=`basename $0 | cut -d '.' -f1` # = (get the first line of the file )

filenametime1=$(date +"%m%d%Y%H%M%S")
filenametime2=$(date +"%Y-%m-%d %H:%M:%S")
# === Set Variables === #                      
export BASE_FOLDER='/home/mlogan/wcd/lab1'
export SCRIPTS_FOLDER='/home/mlogan/wcd/lab1'
export INPUT_FOLDER='/home/mlogan/wcd/lab1'
export OUT_FOLDER='/home/mlogan/wcd/lab1/toronto-climate-data'
export LOGDIR='/home/mlogan/wcd/lab1/toronto-climate-data/logs'
export SHELL_SCRIPT_NAME='toronto_climate'
export LOG_FILE=${LOGDIR}/${SHELL_SCRIPT_NAME}_${filenametime1}.log

# - Go to scripts folder
cd ${SCRIPTS_FOLDER}

# - Log rules
exec > >(tee ${LOG_FILE}) 2>&1

# === Download data from Canadian Climate === #
# - <https://climate.weather.gc.ca/historical_data/search_historic_data_e.html.>

echo "Start data download"

for year in {2020..2022}; 
do wget --content-disposition "https://climate.weather.gc.ca/climate_data/bulk_data_e.html?format=csv&stationID=48549&Year=${year}&Month=2&Day=14&timeframe=1&submit= Download+Data" -O ${INPUT_FOLDER}/${year}.csv;
done;

# - ${ERR} = 0 then sucessful
ERR=$?

if [ ${ERR} != 0 ];
then
    echo "DATA DOWNLOAD FAILED"
    echo "[ERROR:] RETURN CODE:  ${ERR}"
    echo "[ERROR:] REFER TO THE LOG FOR THE REASON FOR THE FAILURE."
    exit 1
fi

echo "DATA DOWNLOAD SUCCEEDED"

# === Call python script to append downloaded .csv files === #
echo "Start Python Script:"

python3 ${SCRIPTS_FOLDER}/toronto_climate.py

ERR=$?
echo ERR is ${ERR}

if [ ${ERR} != 0 ]; then
	echo "PYTHON RUNNING FAILED"
	echo "[ERROR:] RETURN CODE:  ${ERR}"
	echo "[ERROR:] REFER TO THE LOG FOR THE REASON FOR THE FAILURE."
	exit 1
fi

echo "PYTHON PROGRAM SUCCEEDED"

#exit 0 

# --- End of program code --- #