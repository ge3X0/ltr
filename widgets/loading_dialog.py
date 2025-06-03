from PySide6 import QtWidgets, QtCore, QtGui


class LoadingDialog(QtWidgets.QDialog):
    def __init__(self, parent = None, *args, **kwargs):
        super().__init__(parent, *args, **kwargs)

        layout = QtWidgets.QHBoxLayout(self)
        img = QtWidgets.QLabel()
        layout.addWidget(img)

        loader = QtGui.QMovie("res/loader.gif")
        img.setMovie(loader)
        loader.start()
