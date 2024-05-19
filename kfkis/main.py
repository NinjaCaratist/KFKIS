from PyQt5.uic import *
from PyQt5.QtWidgets import *
from PyQt5.QtCore import *
from PyQt5.QtGui import *
from PyQt5 import QtWidgets
from functional import pdf_editor
from functional import folder_creator
from functional import db_conn
import sys
from interface import MainWindow_ui
from interface import event_create_ui
from interface import cal_ui
#import event_list
from interface import dataAdd_ui
from interface import statistic_create_ui
from interface import tables_ui
from interface import pdf_editor_menu_ui


class Main(QtWidgets.QMainWindow,MainWindow_ui.Ui_MainWindow):
    def __init__(self):
        super().__init__()
        self.setupUi(self)

        self.NewEvent_pushButton.clicked.connect(self.on_NewEvent_pushButton_clicked)
        self.dialog_event_create = event_create_ui(self)
        self.cal_pushButton.clicked.connect(self.on_cal_pushButton_clicked)
        self.dialog_calc = cal_ui(self)
        self.AddData_pushButton.clicked.connect(self.on_AddData_pushButton_clicked)
        self.dialog_data_Add = dataAdd_ui(self)
        self.Stat_pushButton.clicked.connect(self.on_Stat_pushButton_clicked)
        self.dialog_statistis = statistic_create_ui(self)
        self.PDF_pushButton.clicked.connect(self.on_PDF_pushButton_clicked)
        self.dialog_pdf = pdf_editor_menu_ui(self)
        self.AllData_pushButton.clicked.connect(self.on_AllData_pushButton_clicked)
        self.dialog_tables = tables_ui(self)
        

    def on_NewEvent_pushButton_clicked(self):
        self.dialog_event_create.show()
        
    def on_cal_pushButton_clicked(self):
        self.dialog_calc.show()

    def on_AddData_pushButton_clicked(self):
        self.dialog_data_Add.show()
    
    def on_Stat_pushButton_clicked(self):
        self.dialog_statistis.show()
    
    def on_PDF_pushButton_clicked(self):
        self.dialog_pdf.show()
    
    def on_AllData_pushButton_clicked(self):
        self.dialog_tables.show()


class event_create_ui(QtWidgets.QMainWindow, event_create_ui.Ui_MainWindow):
    def __init__(self, parent=None):
        super().__init__(parent) #event_create_ui, self
        self.setupUi(self)

class cal_ui(QtWidgets.QMainWindow, cal_ui.Ui_MainWindow):
    def __init__(self, parent=None):
        super().__init__(parent) #cal_ui, self
        self.setupUi(self)

class dataAdd_ui(QtWidgets.QMainWindow, dataAdd_ui.Ui_MainWindow):
    def __init__(self, parent=None):
        super().__init__(parent) #dataAdd_ui, self
        self.setupUi(self)

class statistic_create_ui(QtWidgets.QMainWindow, statistic_create_ui.Ui_MainWindow):
    def __init__(self, parent=None):  
        super().__init__(parent) #dataAdd_ui, self
        self.setupUi(self)
        
class pdf_editor_menu_ui(QtWidgets.QMainWindow, pdf_editor_menu_ui.Ui_MainWindow):
    def __init__(self, parent=None):  
        super().__init__(parent) #dataAdd_ui, self
        self.setupUi(self)

class tables_ui(QtWidgets.QMainWindow, tables_ui.Ui_MainWindow):
    def __init__(self, parent=None):
        super().__init__(parent) #dataAdd_ui, self
        self.setupUi(self)

def main():
    app = QtWidgets.QApplication(sys.argv)  # Новый экземпляр QApplication
    window = Main() # Создаём объект класса 
    window.show()
    app.exec_()
    
    
if __name__ == '__main__': # Если мы запускаем файл напрямую, а не импортируем
    app = QApplication(sys.argv)
    ex = Main()
    ex.show()
    sys.exit(app.exec_())
 
main() 
