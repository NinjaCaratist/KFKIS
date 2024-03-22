import os
import shutil

# root -> events -> year -> sport -> month -> event name ->   
#E:\interface       
def folder_new_creation(year:int, sport:str, month:str, name: str):
    
    dirpath = str("E://inter/" + str(year))
    sport_direct_path = str(dirpath + "/" + str(sport))
    month_direct_path = str(dirpath + "/" + str(sport) + "/" + str(month))
    name_direct_path = str(dirpath + "/" + str(sport) + "/" + str(month) + "/" + name)
    doc_direct_path = str(dirpath + "/" + str(sport) + "/" + str(month) + "/" + name + "/Документы")
    
    #create folders if they dont exist
    if not os.path.exists(dirpath):
        os.mkdir(dirpath)
    if not os.path.exists(sport_direct_path):
        os.mkdir(sport_direct_path)
    if not os.path.exists(month_direct_path):
        os.mkdir(month_direct_path)
    
    if not os.path.exists(name_direct_path):  
        os.mkdir(name_direct_path) #root folder + year + sport + month + name
        os.mkdir(doc_direct_path) #second creation with template folders
    else:
        return 1
    
    filespath = str("E://inter")
    shutil.copy(str(filespath + "/template.docx"),doc_direct_path)
    
folder_new_creation(2023,"this","Январь","kfkis")