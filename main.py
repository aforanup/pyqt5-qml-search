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
import json

from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtSignal, QTimer, pyqtSlot


class Backend(QObject):

    dirPath = pyqtSignal(str, arguments=["dir_path"])
    phraseName = pyqtSignal(str, arguments=["phrase_name"])

    def __init__(self):
        super().__init__()
        # self.file_list = []
        # self.find_phrase()
        # self.path = input("enter folder path")
        # self.phrase = input("enter phrase to search")

    def read_python_file(self, file_path):
        # print(file_path, "here")

        with open(file_path, "r") as f:
            content = f.read()
            # print(content, self.phrase, "popopopo")
            if self.phrase in content:
                print(file_path)
                if "\\" in file_path:
                    file_name = file_path.split("\\")[-1]
                else:
                    file_name = file_path
                # print(file_name)
                # # file_list = []
                # file_list.append(file_name)
                # b = file_list
                # print(file_name, b, "here")
                self.file_list.append(file_name)

    # @pyqtSlot(str)
    def findPhrase(self):
        self.file_list = []
        # print(body)

        for file in os.listdir():
            if file.endswith(".py"):
                if self.file_path:
                    file_path = f"{self.file_path}\\{file}"
                    self.read_python_file(file_path)
                else:
                    self.read_python_file(file)
        # print(self.file_list)
        if self.file_list:
            information = json.dumps(self.file_list)
            self.dirPath.emit(information)
            # self.dirPath.emit(self.file_list)
        # print("helloo world")
        # self.dirPath.emit("hey "+body)

    @pyqtSlot(str, str)
    def path_and_phrase(self, path, phrase):
        self.file_path = path
        self.phrase = phrase
        # print(path, phrase)
        # os.chdir(self.file_path)
        self.findPhrase()


backend = Backend()
# backend.findPhrase("lalala")

app = QGuiApplication(sys.argv)

engine = QQmlApplicationEngine()
engine.quit.connect(app.quit)
engine.load("main.qml")

engine.rootObjects()[0].setProperty("backend", backend)
# backend.findPhrase()

sys.exit(app.exec())
