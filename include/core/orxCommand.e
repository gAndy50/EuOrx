include "orxInclude.e"

include "math/orxVector.e"

public constant orxCOMMAND_KC_BLOCK_MARKER = ""
public constant orxCOMMAND_KC_PUSH_MARKER = ">"
public constant orxCOMMAND_KC_POP_MARKER = "<"
public constant orxCOMMAND_KC_GUID_MARKER = "^"
public constant orxCOMMAND_KC_SEPARATOR = ","

public enum type orxCOMMAND_VAR_TYPE

 orxCOMMAND_VAR_TYPE_STRING = 0,
 orxCOMMAND_VAR_TYPE_FLOAT,
 orxCOMMAND_VAR_TYPE_S32,
 orxCOMMAND_VAR_TYPE_U32,
 orxCOMMAND_VAR_TYPE_S64,
 orxCOMMAND_VAR_TYPE_U64,
 orxCOMMAND_VAR_TYPE_BOOL,
 orxCOMMAND_VAR_TYPE_VECTOR,
 orxCOMMNAD_VAR_TYPE_NUMERIC,
 orxCOMMAND_VAR_TYPE_NUMBER,
 orxCOMMAND_VAR_TYPE_NONE = 0xFFFFFFFF
	
end type

public constant orxCOMMAND_VAR_DEF_ZNAME = 0,
				orxCOMMAND_VAR_DEF_ETYPE = 4,
				SIZEOF_ORXCOMMAND_VAR_DEF = 8
				
public constant orxCOMMAND_VAR_TYPE_VVALUE = 0,
				orxCOMMAND_VAR_TYPE_ZVALUE = 0,
				orxCOMMAND_VAR_TYPE_U32VALUE = 0,
				orxCOMMAND_VAR_TYPE_S32VALUE = 0,
				orxCOMMAND_VAR_TYPE_U64VALUE = 0,
				orxCOMMAND_VAR_TYPE_S64VALUE = 0,
				orxCOMMAND_VAR_TYPE_FVALUE = 0,
				orxCOMMAND_VAR_TYPE_BVALUE = 0,
				--END OF UNION
				orxCOMMAND_VAR_TYPE_eType = 4,
				SIZEOF_ORXCOMMAND_VAR_TYPE = 8
				
public constant xorxCommand_Setup = orxDefine("orxCommand_Setup",{}),
				xorxCommand_Init = orxDefine("orxCommand_Init",{},C_INT),
				xorxCommand_Exit = orxDefine("orxCommand_Exit",{})
				
public procedure orxCommand_Setup()

 orxProc(xorxCommand_Setup,{})
	
end procedure

public function orxCommand_Init()

 return orxFunc(xorxCommand_Init,{})
	
end function

public procedure orxCommand_Exit()

 orxProc(xorxCommand_Exit,{})
	
end procedure

public constant xorxCommand_Register = orxDefine("orxCommand_Register",{C_STRING,C_POINTER,C_UINT,C_UINT,C_POINTER,C_POINTER},C_INT),
				xorxCommand_Unregister = orxDefine("orxCommnad_Unregister",{C_STRING},C_INT),
				xorxCommand_IsRegistered = orxDefine("orxCommand_IsRegistered",{C_STRING},C_BOOL)
				
public function orxCommand_Register(object _zCommand,object _pfnFunc,atom _u32ReqParmNum,atom _u32OptionalParmNum,object _astParmList,object _pstRes)

 _astParmList = allocate_data(SIZEOF_ORXCOMMAND_VAR_DEF)
 _pstRes = allocate_data(SIZEOF_ORXCOMMAND_VAR_DEF)
 
 return orxFunc(xorxCommand_Register,{_zCommand,_pfnFunc,_u32ReqParmNum,_u32OptionalParmNum,_astParmList,_pstRes)
	
end function

public function orxCommannd_Unregister(object _zCommand)

 return orxFunc(xorxCommand_Unregister,{_zCommand})
	
end function

public function orxCommand_IsRegistered(object _zCommand)

 return orxFunc(xorxCommand_IsRegistered,{_zCommand})
	
end function

public constant xorxCommand_AddAlias = orxDefine("orxCommand_AddAlias",{C_STRING,C_STRING,C_STRING},C_INT),
				xorxCommand_RemoveAlias = orxDefine("orxCommand_RemoveAlias",{C_STRING},C_INT),
				xorxCommand_IsAlias = orxDefine("orxCommand_IsAlias",{C_STRING},C_BOOL)
				
public function orxCommand_AddAlias(object _zAlias,object _zCommand,object _zArgs)

 return orxFunc(xorxCommand_AddAlias,{_zAlais,_zCommand,_zArgs})
	
end function

public function orxCommand_RemoveAlias(object _zAlias)

 return orxFunc(xorxCommand_RemoveAlias,{_zAlias})
	
end function

public function orxCommand_IsAlias(object _zAlias)

 return orxFunc(xorxCommand_IsAlias,{_zAlias})
	
end function

public constant xorxCommand_GetPrototype = orxDefine("orxCommand_GetPrototype",{C_STRING},C_STRING),
				xorxCommand_GetNext = orxDefine("orxCommand_GetNext",{C_STRING,C_STRING,C_POINTER},C_STRING)
				
public function orxCommand_GetPrototype(object _zCommand)

 return orxFunc(xorxCommand_GetPrototype,{_zCommand})
	
end function

public function orxCommand_GetNext(object _zBase,object _zPrev,atom _pu32CommonLen)

 return orxFunc(xorxCommand_GetNext,{_zBase,_zPrev,_pu32CommonLen})
	
end function

public constant xorxCommand_Evaluate = orxDefine("orxCommand_Evalute",{C_STRING,C_POINTER},C_POINTER),
				xorxCommand_EvaluteWithGUID = orxDefine("orxCommand_EvaluateWithGUID",{C_STRING,C_LONG,C_POINTER},C_POINTER),
				xorxCommand_Execute = orxDefine("orxCommand_Execute",{C_STRING,C_UINT,C_POINTER,C_POINTER},C_POINTER)
				
public function orxCommand_Evaluate(object _zCmdLine,object _pstRes)

 _pstRes = allocate_data(SIZEOF_ORXCOMMAND_VAR_TYPE)
 
 return orxFunc(xorxCommand_Evaluate,{_zCmdLine,_pstRes})
	
end function

public function orxCommand_EvaluteWithGUID(object _zCmdLine,atom _u64ID,object _pstRes)

 _pstRes = allocate_data(SIZEOF_ORXCOMMAND_VAR_TYPE)
 
 return orxFunc(xorxCommand_EvaluateWithGUID,{_zCmdLine,_u64ID,_pstRes})
	
end function

public function orxCommand_Execute(object _zCmd,atom _u32ArgNum,object _ArgList,object _pstRes)

 _ArgList = allocate_data(SIZEOF_ORXCOMMAND_VAR_TYPE)
 _pstRes = allocate_data(SIZEOF_ORXCOMMAND_VAR_TYPE)
 
 return orxFunc(xorxCommand_Execute,{_zCmd,_u32ArgNum,_ArgList,_pstRes})
	
end function

public constant xorxCommand_ParseNumericalArguments = orxDefine("orxCommand_ParseNumericalArguments",{C_UINT,C_POINTER,C_POINTER}),
				xorxCommand_PrintVar = orxDefine("orxCommand_PrintVar",{C_STRING,C_UINT,C_POINTER},C_UINT)
				
public function orxCommand_ParseNumericalArguments(atom _u32ArgNum,object _ArgList,object _OpList)

 _ArgList = allocate_data(SIZEOF_ORXCOMMAND_VAR_TYPE)
 _OpList = allocate_data(SIZEOF_ORXCOMMAND_VAR_TYPE)
 
 return orxFunc(xorxCommand_ParseNumericalArguments,{_u32ArgNum,_ArgList,_OpList})
	
end function

public function orxCommand_PrintVar(object _DstSt,atom _uSize, object _pstVar)

 _pstVar = allocate_data(SIZEOF_ORXCOMMAND_VAR_TYPE)
 
 return orxFunc(xorxCommand_PrintVar,{_DstSt,_uSize,_pstVar})
	
end function
­172.61