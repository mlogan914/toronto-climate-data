#!/usr/bin python3
__name__        = 'toronto_climate.py'
__location__    = '/pgm/location/here/toronto_climate.py'
__purpose__     = '''Download Historical Toronto Climate Data from: https://climate.weather.gc.ca/historical_data/search_historic_data_e.html'''
__developer__   = 'Melanie Logan'
__version__     = '1.0'
__notes__       = ' '

#=========================================================================
# {modules}
#=========================================================================
import pandas as pd
import glob, os, shutil, logging

#=========================================================================
# {directories/vars}
#=========================================================================
inpath = '/in/path/here'
outpath = '/out/path/here/toronto-climate-data'
filename = 'all_years.csv'
csvs = glob.glob(os.path.join(inpath, "*.csv"))

li = []
for f in csvs:
    df = pd.read_csv(f, index_col=None, header=0)
    li.append(df)

df_concat = pd.concat(li,axis=0, ignore_index=True)

df_concat.to_csv(outpath+"/"+filename)


## -- End of Program Code -- ##
