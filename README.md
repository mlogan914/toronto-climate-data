# Mini Project -- Toronto Climate Data

## 1. Business Scenario
The objective is to process Canadian Climate data.
Usually, if we want to download the weather data manually, we go to the website directly and use the GUI to navigate: https://climate.weather.gc.ca/historical_data/search_historic_data_e.html. 
However, this project was performed via CLI

## 2. Business Requirements
- Download the data from Canadian Climate.
- Concatenate the downloaded files into one final csv file, called all_years.csv.
- All scripts, data and final csv file is pushed to this Github repository using shell commands.

## 3. Deliverable
- Shell script: Use a shell script to control every operation, including data downloading, log setting, python script running.
- Python script: Use a Python script to concatenate all downloaded data into one file.
- all_years.csv: This is the output file of concatenated downloads.

## 4. Program Procedure
1. Download data with shell command(s)
2. Concatenate data into one file using a python script
3. Save output file in the python script
4. Print out 'SUCCESS' with shell command
5. Create a repository in github, and upload the file to a repo with git

The Shell script will call the Python Script to finish the Python work.

## 5. Specification Detail
1. We only need the data of Station ID = 48549.
2. The year range of the data we want is from 2020 to 2022.
3. We only want the data in February.
4. The data will be downloaded in hourly format.
5. The output file will be named as all_years.csv.

## 6. Technical Instruction
### 1. How to download data?
Utilities to download data: 
- wget (GNU / Linux Operating systems)
- Homebrew (OS X - Apple) http://brew.sh/

Download Secifications: 
- year = change values in command line {1998..2008}
- month = 2
- format= [csv|xml]: the format output
- timeframe = 1: for hourly data
- timeframe = 2: for daily data
- timeframe = 3 for monthly data
- Day: the value of the "day" variable is not used and can be an arbitrary value

### 2. How to compose the shell script?
Shell Specifications:
1. Must be run in bash or zsh shell (not sh, not dash)
2. Must define the various directories.
3. Must generate logs.
4. Can print error when there is a programming error.
5. Must have a mechanism to exit the program safely.
