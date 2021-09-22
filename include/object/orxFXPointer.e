include "orxInclude.e"
include "object/orxFX.e"
include "object/orxStructure.e"

public constant orxFXPOINTER_KU32_FX_NUMBER = 8

public constant xorxFXPointer_Setup = orxDefine("orxFXPointer_Setup",{}),
				xorxFXPointer_Init = orxDefine("orxFXPointer_Init",{},C_INT),
				xorxFXPointer_Exit = orxDefine("orxFXPointer_Exit",{})
				
public procedure orxFXPointer_Setup()

 orxProc(xorxFXPointer_Setup,{})
	
end procedure

public function orxFXPointer_Init()

 return orxFunc(xorxFXPointer_Init,{})
	
end function

public procedure orxFXPointer_Exit()

 orxProc(xorxFXPointer_Exit,{})
	
end procedure

public constant xorxFXPointer_Create = orxDefine("orxFXPointer_Create",{},C_POINTER),
				xorxFXPointer_Delete = orxDefine("orxFXPointer_Delete",{C_POINTER},C_INT),
				xorxFXPointer_Enable = orxDefine("orxFXPointer_Enable",{C_POINTER,C_BOOL}),
				xorxFXPointer_IsEnabled = orxDefine("orxFXPointer_IsEnabled",{C_POINTER},C_BOOL)
				
public function orxFXPointer_Create()

 return orxFunc(xorxFXPointer_Create,{})
	
end function

public function orxFXPointer_Delete(object FX)

 return orxFunc(xorxFXPointer_Delete,{FX})
	
end function

public procedure orxFXPointer_Enable(object FX,atom _bEn)

 orxProc(xorxFXPointer_Eanble,{FX,_bEn})
	
end procedure

public function orxFXPointer_IsEnabled(object FX)

 return orxFunc(xorxFXPointer_IsEnabled,{FX})
	
end function

public constant xorxFXPointer_AddFX = orxDefine("orxFXPointer_AddFX",{C_POINTER,C_POINTER},C_INT),
				xorxFXPointer_AddDelayedFX = orxDefine("orxFXPointer_AddDelayedFX",{C_POINTER,C_POINTER,C_FLOAT},C_INT),
				xorxFXPointer_RemoveFX = orxDefine("orxFXPointer_RemoveFX",{C_POINTER,C_POINTER},C_INT),
				xorxFXPointer_RemoveAllFXs = orxDefine("orxFXPointer_RemoveAllFXs",{C_POINTER},C_INT),
				xorxFXPointer_AddFXFromConfig = orxDefine("orxFXPointer_AddFXFromConfig",{C_POINTER,C_STRING},C_INT),
				xorxFXPointer_AddUniqueFXFromConfig = orxDefine("orxFXPointer_AddUniqueFXFromConfig",{C_POINTER,C_STRING},C_INT),
				xorxFXPointer_AddDelayedFXFromConfig = orxDefine("orxFXPointer_AddDelayedFXFromConfig",{C_POINTER,C_POINTER,C_FLOAT},C_INT),
				xorxFXPointer_AddUniqueDelayedFXFromConfig = orxDefine("orxFXPointer_AddUniqueDelayedFXFromConfig",{C_POINTER,C_STRING,C_FLOAT},C_INT),
				xorxFXPointer_RemoveFXFromConfig = orxDefine("orxFXPointer_RemoveFXFromConfig",{C_POINTER,C_STRING,C_FLOAT},C_INT)
				
public function orxFXPointer_AddFX(object FXP,object FX)

 return orxFunc(xorxFXPointer_AddFX,{FXP,FX})
	
end function

public function orxFXPointer_AddDelayedFX(object FXP,object FX,atom _fDe)

 return orxFunc(xorxFXPointer_AddDelayedFX,{FXP,FX,_fDe})
	
end function

public function orxFXPointer_RemoveFX(object FXP,object FX)

 return orxFunc(xorxFXPointer_RemoveFX,{FXP,FX})
	
end function

public function orxFXPointer_RemoveAllFXs(object FXP)

 return orxFunc(xorxFXPointer_RemoveAllFXs,{FXP})
	
end function

public function orxFXPointer_AddFXFromConfig(object FXP,object ID)

 return orxFunc(xorxFXPointer_AddFXFromConfig,{FXP,ID})
	
end function

public function orxFXPointer_AddUniqueFXFromConfig(object FXP,object ID)

 return orxFunc(xorxFXPointer_AddUniqueFXFromConfig,{FXP,ID})
	
end function

public function orxFXPointer_AddDelayedFXFromConfig(object FXP,object ID,atom _fDe)

 return orxFunc(xorxFXPointer_AddDelayedFXFromConfig,{FXP,ID,_fDe})
	
end function

public function orxFXPointer_AddUniqueDelayedFXFromConfig(object FXP,object ID,atom _fDe)

 return orxFunc(xorxFXPointer_AddUniqueDelayedFXFromConfig,{FXP,ID,_fDe})
	
end function

public function orxFXPointer_RemoveFXFromConfig(object FXP,object ID)

 return orxFunc(xorxFXPointer_RemoveFXFromConfig,{FXP,ID})
	
end function

public constant xorxFXPointer_Synchronize = orxDefine("orxFXPointer_Synchronize",{C_POINTER,C_POINTER},C_INT)

public function orxFXPointer_Synchronize(object FXP,object Mod)

 return orxFunc(xorxFXPointer_Synchronize,{FXP,Mod})
	
end function

public constant xorxFXPointer_GetTime = orxDefine("orxFXPointer_GetTime",{C_POINTER},C_FLOAT),
				xorxFXPointer_GetCount = orxDefine("orxFXPointer_GetCount",{C_POINTER},C_UINT),
				xorxFXPointer_GetFrequency = orxDefine("orxFXPointer_GetFrequency",{C_POINTER},C_FLOAT),
				xorxFXPointer_SetTime = orxDefine("orxFXPointer_SetTime",{C_POINTER,C_FLOAT},C_INT),
				xorxFXPointer_SetFrequency = orxDefine("orxFXPointer_SetFrequency",{C_POINTER,C_FLOAT},C_INT)
				
public function orxFXPointer_GetTime(object FXP)

 return orxFunc(xorxFXPointer_GetTime,{FXP})
	
end function

public function orxFXPointer_GetCount(object FXP)

 return orxFunc(xorxFXPointer_GetCount,{FXP})
	
end function

public function orxFXPointer_GetFrequency(object FXP)

 return orxFunc(xorxFXPointer_GetFrequency,{FXP})
	
end function

public function orxFXPointer_SetTime(object FXP,atom _fTime)

 return orxFunc(xorxFXPointer_SetTime,{FXP,_fTime})
	
end function

public function orxFXPointer_SetFrequency(object FXP,atom _fFreq)

 return orxFunc(xorxFXPointer_SetFrequency,{FXP,_fFreq})
	
end function
­162.56