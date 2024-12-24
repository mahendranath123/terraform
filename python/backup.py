import shutil
import os
import datetime

def backupfile(source,destination):
    today=datetime.date.today()
    backupfile_name=os.path.join(destination,f"backup {today}")
    shutil.make_archive(backupfile_name.replace ,"gztar",source)
    
source="/home/akash/python"
destination="/home/akash/python/backup"
backupfile(source,destination)