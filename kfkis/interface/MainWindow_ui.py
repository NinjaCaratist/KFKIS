# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'e:\uni\уник\vkr\programm\code\interface\MainWindow.ui'
#
# Created by: PyQt5 UI code generator 5.15.9
#
# WARNING: Any manual changes made to this file will be lost when pyuic5 is
# run again.  Do not edit this file unless you know what you are doing.


from PyQt5 import QtCore, QtGui, QtWidgets


class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(483, 572)
        self.centralwidget = QtWidgets.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.horizontalLayoutWidget = QtWidgets.QWidget(self.centralwidget)
        self.horizontalLayoutWidget.setGeometry(QtCore.QRect(0, 0, 391, 481))
        self.horizontalLayoutWidget.setObjectName("horizontalLayoutWidget")
        self.horizontalLayout_2 = QtWidgets.QHBoxLayout(self.horizontalLayoutWidget)
        self.horizontalLayout_2.setContentsMargins(0, 0, 0, 0)
        self.horizontalLayout_2.setObjectName("horizontalLayout_2")
        self.verticalLayout = QtWidgets.QVBoxLayout()
        self.verticalLayout.setObjectName("verticalLayout")
        self.NewEvent_pushButton = QtWidgets.QPushButton(self.horizontalLayoutWidget)
        font = QtGui.QFont()
        font.setPointSize(12)
        self.NewEvent_pushButton.setFont(font)
        self.NewEvent_pushButton.setObjectName("NewEvent_pushButton")
        self.verticalLayout.addWidget(self.NewEvent_pushButton)
        self.cal_pushButton = QtWidgets.QPushButton(self.horizontalLayoutWidget)
        font = QtGui.QFont()
        font.setPointSize(12)
        self.cal_pushButton.setFont(font)
        self.cal_pushButton.setObjectName("cal_pushButton")
        self.verticalLayout.addWidget(self.cal_pushButton)
        self.ListEvent_pushButton = QtWidgets.QPushButton(self.horizontalLayoutWidget)
        font = QtGui.QFont()
        font.setPointSize(12)
        self.ListEvent_pushButton.setFont(font)
        self.ListEvent_pushButton.setObjectName("ListEvent_pushButton")
        self.verticalLayout.addWidget(self.ListEvent_pushButton)
        self.AddData_pushButton = QtWidgets.QPushButton(self.horizontalLayoutWidget)
        font = QtGui.QFont()
        font.setPointSize(12)
        self.AddData_pushButton.setFont(font)
        self.AddData_pushButton.setObjectName("AddData_pushButton")
        self.verticalLayout.addWidget(self.AddData_pushButton)
        self.Stat_pushButton = QtWidgets.QPushButton(self.horizontalLayoutWidget)
        font = QtGui.QFont()
        font.setPointSize(12)
        self.Stat_pushButton.setFont(font)
        self.Stat_pushButton.setObjectName("Stat_pushButton")
        self.verticalLayout.addWidget(self.Stat_pushButton)
        self.PDF_pushButton = QtWidgets.QPushButton(self.horizontalLayoutWidget)
        font = QtGui.QFont()
        font.setPointSize(12)
        self.PDF_pushButton.setFont(font)
        self.PDF_pushButton.setObjectName("PDF_pushButton")
        self.verticalLayout.addWidget(self.PDF_pushButton)
        self.AllData_pushButton = QtWidgets.QPushButton(self.horizontalLayoutWidget)
        font = QtGui.QFont()
        font.setPointSize(12)
        self.AllData_pushButton.setFont(font)
        self.AllData_pushButton.setObjectName("AllData_pushButton")
        self.verticalLayout.addWidget(self.AllData_pushButton)
        self.horizontalLayout_2.addLayout(self.verticalLayout)
        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QtWidgets.QMenuBar(MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 483, 22))
        self.menubar.setObjectName("menubar")
        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QtWidgets.QStatusBar(MainWindow)
        self.statusbar.setObjectName("statusbar")
        MainWindow.setStatusBar(self.statusbar)

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "MainWindow"))
        self.NewEvent_pushButton.setText(_translate("MainWindow", "Новое мероприятие"))
        self.cal_pushButton.setText(_translate("MainWindow", "Календарь"))
        self.ListEvent_pushButton.setText(_translate("MainWindow", "Список мероприятий"))
        self.AddData_pushButton.setText(_translate("MainWindow", "Добавить записи"))
        self.Stat_pushButton.setText(_translate("MainWindow", "Оформить статистику"))
        self.PDF_pushButton.setText(_translate("MainWindow", "Отредактировать PDF"))
        self.AllData_pushButton.setText(_translate("MainWindow", "Посмотреть все данные"))
# import plus_rc