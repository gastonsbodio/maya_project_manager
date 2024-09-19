"""avoid_auto_read"""

import maya.cmds as cmds
from importlib import reload
import parent_to_tool as p2t
reload( p2t )

def nullOffsetCreator(target,sources):
    addOffsetNull("Null_" + target)
    offset = "Null_" + target + "_offset"
    for source in sources:
        cmds.addAttr(offset, ln = source + "_offset", at = "matrix")

def addOffsetNull(target):
    selection = cmds.ls(sl=True)
    parent = cmds.listRelatives(target,p = True)
    name = str(target)
    grp = name + "_offset"
    cmds.group(n = grp, em = True)
    cmds.matchTransform (grp,name,scl = False)
    if parent != None:
        cmds.parent(grp,parent)
    else:
        None
    cmds.parent(name,grp)

#Create gun_space attr in target Ctrl
def SpaceAttCreation (target,sources):
    if cmds.objExists(target + ".gun_space"):
        cmds.deleteAttr(target + ".gun_space")
    
    sourcesLenght = len(sources)
    enumSources = sources[0].rpartition("_Ctrl")[0]
    for i in range(1,sourcesLenght):
        enumSources = enumSources + ":" + sources[i].rpartition("_Ctrl")[0]

    cmds.addAttr(target, ln = "gun_space", at = "enum", k = True,  en = enumSources)
    return enumSources

def IKSpacesNodeSetup(target, sources):
    #Create choice node
    #Create choice offset node
    choice = cmds.shadingNode('choice', n = target + "_choice", asUtility = True)
    choiceOffset = cmds.shadingNode('choice', n = target + "_choice_offset", asUtility = True)
    
    #conncet gun_space att to choice and choice offset selector
    cmds.connectAttr(target + ".gun_space",choice + ".selector", f = True)
    cmds.connectAttr(target + ".gun_space",choiceOffset + ".selector", f = True)
    
    #Calculate offset between target and sources, store it in Null_Ctrl_offset offset matrices
    
    for i in range(0,len(sources)):
        tempMat = cmds.shadingNode('multMatrix', n = "tempMatrix", asUtility = True)
        cmds.connectAttr(target + ".worldMatrix[0]", tempMat + ".matrixIn[0]")
        cmds.connectAttr(sources[i] + ".worldInverseMatrix[0]", tempMat + ".matrixIn[1]")
        cmds.connectAttr(tempMat + ".matrixSum", "Null_" + target + "_offset." + sources[i] + "_offset")
        cmds.disconnectAttr(tempMat + ".matrixSum", "Null_" + target + "_offset." + sources[i] + "_offset")
        cmds.disconnectAttr(sources[i] + ".worldInverseMatrix[0]", tempMat + ".matrixIn[1]")
        cmds.delete(tempMat)
        
    #Creat multiMatrix
    #conncet choise offset output to matrix in[0] on multMatrix
    #conncet choise output to matrix in[1] on multMatrix
    #conncet Null_Ctrl_Offset World inverse matrix to matrix in[2] on multMatrix    
    multMat = cmds.shadingNode('multMatrix', n = target + "_multMatrix", asUtility = True)
    cmds.connectAttr(choiceOffset + ".output", multMat + ".matrixIn[0]")
    cmds.connectAttr(choice + ".output", multMat + ".matrixIn[1]")
    cmds.connectAttr("Null_" + target + "_offset.worldInverseMatrix[0]", multMat + ".matrixIn[2]")
    
    tempMat = cmds.shadingNode('multMatrix', n = "tempMatrix", asUtility = True)
    cmds.connectAttr(target + ".worldMatrix[0]", tempMat + ".matrixIn[0]")
     
    #Create decompose Matrix
    #conncet multMatrix Sum to InputMatrix in decomposeMatrix
    decompMat = cmds.shadingNode('decomposeMatrix', n = target + "_decomposeMatrix", asUtility = True)
    cmds.connectAttr(multMat + ".matrixSum", decompMat + ".inputMatrix")
    
   
    #Conncet world matrix of sources to choice node
    #connect offset matrix of Null_Ctrl_offset grp to choice offset node
    for i in range(0,len(sources)):
        n = str(i)
        cmds.connectAttr(sources[i] + ".worldMatrix[0]",choice + ".input[" + n + "]")
        cmds.connectAttr("Null_" + target + "_offset." + sources[i] + "_offset", choiceOffset + ".input[" + n + "]")

    #conect decomposeMatrix output Rotate and translate to Null_Ctrl Rotate and Trans
    cmds.connectAttr(decompMat + ".outputTranslate","Null_" + target + ".translate")
    cmds.select( target , sources )
    #print ('  que ondaaaa  ')
    #p2t.do_parenting_thing('gun_space', [], with_scriptjob = False,
    #                                   constrain_offset = True, attribname = "gun_space" )

    
    cmds.connectAttr(decompMat + ".outputRotate","Null_" + target + ".rotate")
    ####   la rotacion esta tirando fruta
    cmds.delete(tempMat)

def IKSpaceCreator (target, sources):
    
    enumSources = SpaceAttCreation(target, sources)
    nullOffsetCreator(target,sources)
    IKSpacesNodeSetup(target,sources)
    




def create_offset( control_ls ):
    for control in control_ls:
        offset = cmds.duplicate( control , n = "Null_" + control)[0]
        all_desc_ls = cmds.listRelatives( offset, ad= True , f = True ) or []
        for desc in all_desc_ls:
            cmds.delete( desc )
        cmds.parent ( control , offset )
        
#control_ls = cmds.ls( sl=True )
#target = control_ls[0] #"Cube_Ctrl"#IKArm_R"
#sources = [ obj for obj in control_ls  if obj != target ]

#create_offset( [ target ] + sources )

#EJEMPLO DE COMO USAR:
#target es un control que debe tener el sufijo _Ctrl que debe tener un grupo de offset que se llame "Null_" + nombreDelControl. 
#sources, es una lista con los objetos a los que queremos que nuestro target tenga un "gun_space". Igual que el target estos deben tener el sufijo _Ctrl y deben tener su propio Null group

#IKSpaceCreator( target, sources )