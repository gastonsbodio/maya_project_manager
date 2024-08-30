from functools import partial
import traceback
import time
import ast


try:
	from PySide  import QtCore
	from PySide.QtGui import *
except Exception as err: # Nuke > 11
	from PySide2 import QtCore
	from PySide2.QtGui import *
	from PySide2.QtWidgets import *

import os
import sys
user = os.environ['USERNAME']
temp_folder = "C:/Users/" + user + "/AppData/Local/Temp"

import ctypes
from ctypes.wintypes import MAX_PATH

dll = ctypes.windll.shell32
buf = ctypes.create_unicode_buffer(MAX_PATH + 1)
if dll.SHGetSpecialFolderPathW(None, buf, 0x0005, False):
	var_prG1 = buf.value + "\\Pr_G"
	var_prG = var_prG1.replace('\\','/')

if var_prG + '/PACKAGES' not in sys.path:
	sys.path.append( var_prG + '/PACKAGES')
if var_prG not in sys.path:
	sys.path.append(var_prG)


class ThreadSignals(QtCore.QObject):

	"""
	Signals must inherit from QObject, so this is a workaround to signal from a QRunnable object.
	We will use signals to communicate from the Worker class back to the ThreadPool.
	"""
	finished = QtCore.Signal(int)


class Worker(QtCore.QRunnable):
	"""
	Executes code in a seperate thread.
	Communicates with the ThreadPool it spawned from via signals.
	"""
	StatusOk = 0
	StatusError = 1
	def __init__(self, json="None"):
		super(Worker, self).__init__()
		self.signals = ThreadSignals()
		self.json = json

	def run(self):
		status = Worker.StatusOk
		try:
			snip2ffmpeg = os.path.join(  var_prG + "/", self.json )
			while not os.path.isfile( snip2ffmpeg ):
				time.sleep(0.1)
		
		except Exception as e:
			print (traceback.format_exc())
			status = Worker.StatusError
		self.signals.finished.emit(status)


class ThreadPool(QtCore.QObject):
	"""
	Manages all Worker objects.
	This will receive signals from workers then communicate back to the main gui.
	"""
	pool_started = QtCore.Signal(int)
	pool_finished = QtCore.Signal()
	worker_finished = QtCore.Signal(int)

	def __init__(self, max_thread_count=1, json= "None"):
		QtCore.QObject.__init__(self)

		self._count = 0
		self._processed = 0
		self._has_errors = False
		self.json = json

		self.pool = QtCore.QThreadPool()
		self.pool.setMaxThreadCount(max_thread_count)

	def worker_on_finished(self, status):
		self._processed += 1

		# If a worker fails, indicate that an error happened.
		if status == Worker.StatusError:
			self._has_errors = True

		if self._processed == self._count:
			# Signal to gui that all workers are done.
			self.pool_finished.emit()

	def start(self, count):
		# Reset values.
		self._count = count
		self._processed = 0
		self._has_errors = False

		# Signal to gui that workers are about to begin. You can prepare your gui at this point.
		self.pool_started.emit(count)

		# Create workers and connect signals to gui so we can update it as they finish.
		for i in range(count):
			worker = Worker( json = self.json)
			worker.signals.finished.connect(self.worker_finished)
			worker.signals.finished.connect(self.worker_on_finished)
			self.pool.start(worker)
	