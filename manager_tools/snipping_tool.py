import sys, os

from importlib import reload
import importing_modules as  im
reload(im )
de = im.importing_modules( 'definitions' )

if de.SCRIPT_MANAG_FOL not in sys.path:
    sys.path.append( de.SCRIPT_MANAG_FOL )
if de.PY3_PACKAGES not in sys.path:
    sys.path.append(de.PY3_PACKAGES)

from PySide6 import QtCore
from PySide6.QtGui import *
from PySide6.QtWidgets import *

import tkinter as tk

from PIL import ImageGrab
import numpy as np, cv2

class MyWidget(QWidget):
    def __init__(self, capturePath):
        super(MyWidget, self).__init__()
        root = tk.Tk()
        self.capturePath = capturePath
        screen_width = root.winfo_screenwidth()
        screen_height = root.winfo_screenheight()
        self.setGeometry(0, 0, screen_width, screen_height)
        self.setWindowTitle(' ')
        self.begin = QtCore.QPoint()
        self.end = QtCore.QPoint()
        self.setWindowOpacity(0.3)
        QApplication.setOverrideCursor(QCursor(QtCore.Qt.CrossCursor))
        self.setWindowFlags(QtCore.Qt.FramelessWindowHint)
        print ('Capture the screen...')
        self.show()

    def paintEvent(self, event):
        qp = QPainter(self)
        qp.setPen(QPen(QColor('black'), 3))
        qp.setBrush(QColor(128, 128, 255, 128))
        qp.drawRect(QtCore.QRect(self.begin, self.end))

    def mousePressEvent(self, event):
        self.begin = event.pos()
        self.end = self.begin
        self.update()

    def mouseMoveEvent(self, event):
        self.end = event.pos()
        self.update()

    def mouseReleaseEvent(self, event):
        self.close()
        x1 = min(self.begin.x(), self.end.x())
        y1 = min(self.begin.y(), self.end.y())
        x2 = max(self.begin.x(), self.end.x())
        y2 = max(self.begin.y(), self.end.y())
        img = ImageGrab.grab(bbox=(x1, y1, x2, y2))
        img.save(self.capturePath)
        with open( de.SCRIPT_MANAG_FOL  + '/snip2ffmpeg.json', 'w') as fi:
            fi.write('empty')
            fi.close()
        QApplication.setOverrideCursor(QCursor(QtCore.Qt.ArrowCursor))
        img = cv2.cvtColor(np.array(img), cv2.COLOR_BGR2RGB)

