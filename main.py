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
from PyQt5.QtCore import QObject, pyqtSignal, QTimer, pyqtSlot


class Backend(QObject):

    dirPath = pyqtSignal(str, arguments=["dir_path"])
    phraseName = pyqtSignal(str, arguments=["phrase_name"])

    def __init__(self):
        super().__init__()
        # self.find_phrase()
        # self.path = input("enter folder path")
        # self.phrase = input("enter phrase to search")
        # os.chdir(self.path)

    def read_python_file(self, file_path):
        with open(file_path, "r") as f:
            content = f.read()
            if self.phrase in content:
                print(file_path)
                file_name = self.filepath.split("\\")[-1]
                self.file_list = []
                self.file_list.append(file_name)

    @pyqtSlot(str)
    def findPhrase(self, body="abc"):
        print(body)
        # for file in os.listdir():
        #     if file.endswith(".py"):
        #         file_path = f"{self.path}\{file}"
        #         self.read_python_file(file_path)
        # print(self.file_list)
        # if self.file_list:
        #     self.dirPath.emit(self.file_list)
        # print("helloo world")
        self.dirPath.emit("hey "+body)


backend = Backend()
backend.findPhrase("lalala")

app = QGuiApplication(sys.argv)

engine = QQmlApplicationEngine()
engine.quit.connect(app.quit)
engine.load("main.qml")

engine.rootObjects()[0].setProperty("backend", backend)
# backend.findPhrase()

sys.exit(app.exec())
