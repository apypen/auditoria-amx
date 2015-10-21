MODULE_NAME='AverVision_PL50_mdl_v001'(dev vdvDOCCAM, dev dvDOCCAM)
(***********************************************************)
(*  FILE CREATED ON: 08/22/2013  AT: 09:28:38              *)
(***********************************************************)
(***********************************************************)
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 08/22/2013  AT: 09:41:20        *)
(***********************************************************)
(* System Type : NetLinx                                   *)
(***********************************************************)
(***********************************************************)
(*               VARIABLE DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_VARIABLE
CHAR acCheckCmds[6][8] = {'ON', 'OFF', '', '', 'MUTE', 'INGANG'}
INTEGER nCount
(***********************************************************)
(*                THE EVENTS GO BELOW                      *)
(***********************************************************)
DEFINE_EVENT
DATA_EVENT[vdvDOCCAM]
{
    COMMAND:
    {
    	CHAR acCommand[30]
	    IF(FIND_STRING(DATA.TEXT, '=',1))
	    {
	      acCommand = REMOVE_STRING(DATA.TEXT,'=',1)
	      SEND_STRING 0,"'command received in mdlCommPortCheck: ', acCommand, DATA.TEXT"
	      SET_LENGTH_STRING(acCommand,LENGTH_STRING(acCommand)-1)
	      SWITCH(acCommand)
	      {
		      CASE 'SETDOCCAM':
		        fnGetAction(DATA.TEXT)
		      BREAK
		      DEFAULT:
		        Error ("'unhandled command in module: ', acCommand")
		      BREAK
	      }
	    }
    }
}
(***********************************************************)
(*                     END OF PROGRAM                      *)
(*        DO NOT PUT ANY CODE BELOW THIS COMMENT           *)
(***********************************************************)
