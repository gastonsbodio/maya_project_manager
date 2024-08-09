import sys
import webbrowser

try:
    from PySide  import QtCore
    from PySide.QtGui import *
    from PySide.QtUiTools import QUiLoader
except Exception as err:
    from PySide2.QtUiTools import QUiLoader
    from PySide2 import QtCore
    from PySide2.QtGui import *
    from PySide2.QtWidgets import *

try:
	import importlib
except Exception:
    pass

ENVIROMENT = 'nuke'

class AnimCheckerApp( QMainWindow ):
    def __init__(self):
        super(AnimCheckerApp, self).__init__( )
        loader = QUiLoader()
        uifile = QtCore.QFile( 'C:/Users/gasco/Documents/maya/2023/scripts/test_checkBox.ui' )
        uifile.open(QtCore.QFile.ReadOnly)
        self.ui = loader.load( uifile, None )
        self.initialize_widget_conn()
        self.ui.push_butt_execute.clicked.connect(self.deletebuttonaction)
        self.ui.pushButtSelectAll.clicked.connect(self.testing)
    def initialize_widget_conn(self):
        """Initializing functions, var and features.
        """

        self.animated_knob_names = [ "translate", "rotate" ]
        #self.animeted_nodes = self.listnodeknobs()
        self.checkboxdic = self.creat_knob_checkbox (self.animated_knob_names) 
        print (self.checkboxdic)
        print ("hola 1")
        #self.ui.actionfirst_steps.triggered.connect(self.instruction_menu_action)
        #self.ui.push_butt_start_check.clicked.connect( lambda: self.check_trigged_action() )

    #def listnodeknobs (self):

    
    def creat_knob_checkbox (self , animated_knob_names):
        offset = 0
        offset2=0
        checkboxdic = {}
        for name in animated_knob_names:
            print ("hola 3")
            checkboxdic [name] = QCheckBox (self.ui)
            checkboxdic [name].setGeometry( QtCore.QRect( 100+offset2 , 100 + offset, 200, 20 ) )
            checkboxdic [name].setText(name)
            checkboxdic [name].setEnabled(False)
            checkboxdic [name].setDisabled(False)
            checkboxdic [name].setObjectName("CB"+str(offset))
            checkboxdic [name].setCheckable(True)
            checkboxdic [name].setChecked(True)
            #checkboxdic [name] = checkBoxTest
            offset = offset + 70
            offset2 = offset2 + 50
        return checkboxdic

    def deletebuttonaction (self):
        checked_ls = []
        for index, key in enumerate ( self.animated_knob_names ) : 
            print ("hola 4")
            checkboxvalue = self.checkboxdic [key].isChecked()
            print ("Holis")    
            if checkboxvalue : 
                node = nuke.selectedNode() 
                self.clear_animation (node , key  )


    def clear_animation(self, node, knob_name):
        knob = node.knob(knob_name)
        if knob is not None and knob.isAnimated():
            knob.clearAnimated()

    def testing (self):
        for checkbox in self.checkboxdic : 
            self.checkboxdic [checkbox].setChecked(False)
            print (self.checkboxdic [checkbox] .isEnabled() )
            print (self.checkboxdic [checkbox] .objectName() )

if ENVIROMENT == 'Windows':
    if __name__ == '__main__':
        app = QApplication(sys.argv)
        widget = AnimCheckerApp()
        widget.ui.show()
        sys.exit(app.exec_())
