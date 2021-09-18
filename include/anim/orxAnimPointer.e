include "orxInclude.e"
include "anim/orxAnimSet.e"

public constant xorxAnimPointer_Setup = orxDefine("orxAnimPointer_Setup",{}),
				xorxAnimPointer_Init = orxDefine("orxAnimPointer_Init",{},C_INT),
				xorxAnimPointer_Exit = orxDefine("orxAnimPointer_Exit",{})
				
public procedure orxAnimPointer_Setup()

 orxProc(xorxAnimPointer_Setup,{})
	
end procedure

public function orxAnimPointer_Init()

 return orxFunc(xorxAnimPointer_Init,{})
	
end function

public procedure orxAnimPointer_Exit()

 orxProc(xorxAnimPointer_Exit,{})
	
end procedure

public constant xorxAnimPointer_Create = orxDefine("orxAnimPointer_Create",{C_POINTER},C_POINTER),
				xorxAnimPointer_CreateFromConfig = orxDefine("orxAnimPointer_CreateFromConfig",{C_STRING},C_POINTER),
				xorxAnimPointer_Delete = orxDefine("orxAnimPointer_Delete",{C_POINTER},C_INT),
				xorxAnimPointer_GetAnimSet = orxDefine("orxAnimPointer_GetAnimSet",{C_POINTER},C_POINTER)
				
public function orxAnimPointer_Create(object _pstAnimSet)

 return orxFunc(xorxAnimPointer_Create,{_pstAnimSet})
	
end function

public function orxAnimPointer_CreateFromConfig(object _zConfigID)

 return orxFunc(xorxAnimPointer_CreateFromConfig,{_zConfigID})
	
end function

public function orxAnimPointer_Delete(object _pstAnimPointer)

 return orxFunc(xorxAnimPointer_Delete,{_pstAnimPointer})
	
end function

public function orxAnimPointer_GetAnimSet(object _pstAnimPointer)

 return orxFunc(xorxAnimPointer_GetAnimSet,{_pstAnimPointer})
	
end function

public constant xorxAnimPointer_GetCurrentAnim = orxDefine("orxAnimPointer_GetCurrentAnim",{C_POINTER},C_UINT),
				xorxAnimPointer_GetTargetAnim = orxDefine("orxAnimPointer_GetTargetAnim",{C_POINTER},C_UINT),
				xorxAnimPointer_GetCurrentAnimName = orxDefine("orxAnimPointer_GetCurrentAnimName",{C_POINTER},C_STRING),
				xorxAnimPointer_GetTargetAnimName = orxDefine("orxAnimPointer_GetTargetAnimName",{C_POINTER},C_STRING),
				xorxAnimPointer_GetCurrentAnimData = orxDefine("orxAnimPointer_GetCurrentAnimData",{C_POINTER},C_POINTER),
				xorxAnimPointer_GetTime = orxDefine("orxAnimPointer_GetTime",{C_POINTER},C_FLOAT),
				xorxAnimPointer_GetFrequency = orxDefine("orxAnimPointer_GetFrequency",{C_POINTER},C_FLOAT),
				xorxAnimPointer_SetCurrentAnim = orxDefine("orxAnimPointer_SetCurrentAnim",{C_POINTER,C_UINT},C_INT),
				xorxAnimPointer_SetTargetAnim = orxDefine("orxAnimPointer_SetTargetAnim",{C_POINTER,C_UINT},C_INT),
				xorxAnimPointer_SetCurrentAnimFromName = orxDefine("orxAnimPointer_SetCurrentAnimFromName",{C_POINTER,C_STRING},C_INT),
				xorxAnimPointer_SetTargetAnimFromName = orxDefine("orxAnimPointer_SetTargetAnimFromName",{C_POINTER,C_STRING},C_INT),
				xorxAnimPointer_SetTime = orxDefine("orxAnimPointer_SetTime",{C_POINTER,C_FLOAT},C_INT),
				xorxAnimPointer_SetFrequency = orxDefine("orxAnimPointer_SetFrequency",{C_POINTER,C_FLOAT},C_INT),
				xorxAnimPointer_Pause = orxDefine("orxAnimPointer_Pause",{C_POINTER,C_BOOL},C_INT)
				
public function orxAnimPointer_GetCurrentAnim(object _pstAnimPointer)

 return orxFunc(xorxAnimPointer_GetCurrentAnim,{_pstAnimPointer})
	
end function

public function orxAnimPointer_GetTargetAnim(object _pstAnimPointer)

 return orxFunc(xorxAnimPointer_GetTargetAnim,{_pstAnimPointer})
	
end function

public function orxAnimPointer_GetCurrentAnimName(object _pstAnimPointer)

 return orxFunc(xorxAnimPointer_GetCurrentAnimName,{_pstAnimPointer})
	
end function

public function orxAnimPointer_GetTargetAnimName(object _pstAnimPointer)

 return orxFunc(xorxAnimPointer_GetTargetAnimName,{_pstAnimPointer})
	
end function

public function orxAnimPointer_GetCurrentAnimData(object _pstAnimPointer)

 return orxFunc(xorxAnimPointer_GetCurrentAnimData,{_pstAnimPointer})
	
end function

public function orxAnimPointer_GetTime(object _pstAnimPointer)

 return orxFunc(xorxAnimPointer_GetTime,{_pstAnimPointer})
	
end function

public function orxAnimPointer_GetFrequency(object _pstAnimPointer)

 return orxFunc(xorxAnimPointer_GetFrequency,{_pstAnimPointer})
	
end function

public function orxAnimPointer_SetCurrentAnim(object _pstAnimPointer,atom _u32AnimID)

 return orxFunc(xorxAnimPointer_SetCurrentAnim,{_pstAnimPointer,_u32AnimID})
	
end function

public function orxAnimPointer_SetTargetAnim(object _pstAnimPointer,atom _u32AnimID)

 return orxFunc(xorxAnimPointer_SetTargetAnim,{_pstAnimPointer,_u32AnimID})
	
end function

public function orxAnimPointer_SetCurrentAnimFromName(object _pstAnimPointer,object _zAnimName)

 return orxFunc(xorxAnimPointer_SetCurrentAnimFromName,{_pstAnimPointer,_zAnimName})
	
end function

public function orxAnimPointer_SetTargetAnimFromName(object _pstAnimPointer, object _zAnimName)

 return orxFunc(xorxAnimPointer_SetTargetAnimFromName,{_pstAnimPointer,_zAnimName})
	
end function

public function orxAnimPointer_SetTime(object _pstAnimPointer,atom _fTime)

 return orxFunc(xorxAnimPointer_SetTime,{_pstAnimPointer,_fTime})
	
end function

public function orxAnimPointer_SetFrequency(object _pstAnimPointer,atom _fFreq)

 return orxFunc(xorxAnimPointer_SetFrequency,{_pstAnimPointer,_fFreq})
	
end function

public function orxAnimPointer_Pause(object _pstAnimPointer,atom _bPause)

 return orxFunc(xorxAnimPointer_Pause,{_pstAnimPointer,_bPause})
	
end function
­150.64