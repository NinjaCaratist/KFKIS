# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'e:\uni\уник\vkr\programm\code\interface\tables.ui'
#
# Created by: PyQt5 UI code generator 5.15.9
#
# WARNING: Any manual changes made to this file will be lost when pyuic5 is
# run again.  Do not edit this file unless you know what you are doing.


from PyQt5 import QtCore, QtGui, QtWidgets


class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(802, 591)
        self.centralwidget = QtWidgets.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.horizontalLayout = QtWidgets.QHBoxLayout(self.centralwidget)
        self.horizontalLayout.setObjectName("horizontalLayout")
        self.tables_list_widget = QtWidgets.QListWidget(self.centralwidget)
        font = QtGui.QFont()
        font.setFamily("Times New Roman")
        font.setPointSize(12)
        self.tables_list_widget.setFont(font)
        self.tables_list_widget.setEditTriggers(QtWidgets.QAbstractItemView.NoEditTriggers)
        self.tables_list_widget.setObjectName("tables_list_widget")
        item = QtWidgets.QListWidgetItem()
        self.tables_list_widget.addItem(item)
        item = QtWidgets.QListWidgetItem()
        self.tables_list_widget.addItem(item)
        item = QtWidgets.QListWidgetItem()
        self.tables_list_widget.addItem(item)
        item = QtWidgets.QListWidgetItem()
        self.tables_list_widget.addItem(item)
        item = QtWidgets.QListWidgetItem()
        self.tables_list_widget.addItem(item)
        item = QtWidgets.QListWidgetItem()
        self.tables_list_widget.addItem(item)
        item = QtWidgets.QListWidgetItem()
        self.tables_list_widget.addItem(item)
        item = QtWidgets.QListWidgetItem()
        self.tables_list_widget.addItem(item)
        item = QtWidgets.QListWidgetItem()
        self.tables_list_widget.addItem(item)
        item = QtWidgets.QListWidgetItem()
        self.tables_list_widget.addItem(item)
        item = QtWidgets.QListWidgetItem()
        self.tables_list_widget.addItem(item)
        self.horizontalLayout.addWidget(self.tables_list_widget)
        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QtWidgets.QMenuBar(MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 802, 22))
        self.menubar.setObjectName("menubar")
        self.menu = QtWidgets.QMenu(self.menubar)
        self.menu.setObjectName("menu")
        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QtWidgets.QStatusBar(MainWindow)
        self.statusbar.setObjectName("statusbar")
        MainWindow.setStatusBar(self.statusbar)
        self.date_format_action = QtWidgets.QAction(MainWindow)
        self.date_format_action.setCheckable(False)
        self.date_format_action.setObjectName("date_format_action")
        self.menu.addAction(self.date_format_action)
        self.menu.addSeparator()
        self.menubar.addAction(self.menu.menuAction())

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "Основное меню"))
        __sortingEnabled = self.tables_list_widget.isSortingEnabled()
        self.tables_list_widget.setSortingEnabled(False)
        item = self.tables_list_widget.item(0)
        item.setText(_translate("MainWindow", "Таблица работников"))
        item = self.tables_list_widget.item(1)
        item.setText(_translate("MainWindow", "Таблица должностей"))
        item = self.tables_list_widget.item(2)
        item.setText(_translate("MainWindow", "Таблица спортсменов"))
        item = self.tables_list_widget.item(3)
        item.setText(_translate("MainWindow", "Таблица тренеров"))
        item = self.tables_list_widget.item(4)
        item.setText(_translate("MainWindow", "Таблица видов спорта"))
        item = self.tables_list_widget.item(5)
        item.setText(_translate("MainWindow", "Таблица мест для проведения"))
        item = self.tables_list_widget.item(6)
        item.setText(_translate("MainWindow", "Таблица организаторов"))
        item = self.tables_list_widget.item(7)
        item.setText(_translate("MainWindow", "Таблица мероприятий"))
        item = self.tables_list_widget.item(8)
        item.setText(_translate("MainWindow", "Таблица городов"))
        item = self.tables_list_widget.item(9)
        item.setText(_translate("MainWindow", "Таблица стран"))
        item = self.tables_list_widget.item(10)
        item.setText(_translate("MainWindow", "Таблица званий"))
        self.tables_list_widget.setSortingEnabled(__sortingEnabled)
        self.menu.setTitle(_translate("MainWindow", "Пояснения"))
        self.date_format_action.setText(_translate("MainWindow", "Формат ввода дат в ячейки таблицы"))