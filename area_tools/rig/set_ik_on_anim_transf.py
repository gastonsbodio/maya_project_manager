import maya.mel as mel
import importlib
import ik_fk_switch_biped as ikfk
importlib.reload(ikfk)


comtrol_ls = [ ['*:FKScapula_L','*:PoleArm_L','*:IKArm_L', '*:FKWrist_L'] ,
               ['*:FKScapula_R','*:PoleArm_R','*:IKArm_R', '*:FKWrist_R'] ,
               ['*:PoleLeg_L','*:RollHeel_L', '*:IKToes_L', '*:RollToes_L', '*:RollToesEnd_L' , '*:IKLeg_L' ,'*:FKAnkle_L'],
               ['*:PoleLeg_R','*:RollHeel_R', '*:IKToes_R', '*:RollToes_R', '*:RollToesEnd_R' , '*:IKLeg_R' ,'*:FKAnkle_R'] ]

def set_limbs_2_ik():
    for control_key in comtrol_ls:
        control = control_key[-1]
        start_value = int( cmds.keyframe( control , query=True, timeChange=True )[0] )
        end_value = int( cmds.keyframe( control  , query=True, timeChange=True )[-1] ) + 1
        print ( start_value )
        print ( end_value )
        for time in range ( start_value, end_value ):
            cmds.currentTime( time, update=True, edit=True )
            print (control)
            print (   cmds.currentTime( q=True )    )
            print ( end_value )
            cmds.select ( control )
            ikfk.limb_fk_2_ik()

            cmds.select( control_key )
            mel.eval('SetKey;')

set_limbs_2_ik()