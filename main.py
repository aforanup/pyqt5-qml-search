# from PySide2.QtWidgets import QApplication
# from PySide2.QtQuick import QQuickView
# from PySide2.QtCore import QUrl

# app = QApplication([])
# view = QQuickView()
# url = QUrl("main.qml")

# view.setSource(url)
# view.show()
# app.exec_()

import sys
import os

from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject


class Backend(QObject):
    def __init__(self):
        self.path = input("enter folder path")
        self.phrase = input("enter phrase to search")
        os.chdir(self.path)

    def read_python_file(self, file_path):
        with open(file_path, "r") as f:
            content = f.read()
            if self.phrase in content:
                print(file_path)
                file_name = self.filepath.split("\\")[-1]
                self.file_list = []
                self.file_list.append(file_name)

    def find_phrase(self):
        for file in os.listdir():
            if file.endswith(".py"):
                file_path = f"{self.path}\{file}"
                self.read_python_file(file_path)
        print(self.file_list)
        if self.file_list:
            return self.file_list


app = QGuiApplication(sys.argv)

engine = QQmlApplicationEngine()
engine.quit.connect(app.quit)
engine.load("main.qml")


sys.exit(app.exec())
