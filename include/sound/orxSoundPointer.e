include "orxInclude.e"
include "sound/orxSound.e"
include "object/orxStructure.e"

public constant orxSOUNDPOINTER_KU32_SOUND_NUMBER = 4

public constant xorxSoundPointer_Setup = orxDefine("orxSoundPointer_Setup",{}),
				xorxSoundPointer_Init = orxDefine("orxSoundPointer_Init",{},C_INT),
				xorxSoundPointer_Exit = orxDefine("orxSoundPointer_Exit",{})
				
public procedure orxSoundPointer_Setup()

 orxProc(xorxSoundPointer_Setup,{})
	
end procedure

public function orxSoundPointer_Init()

 return orxFunc(xorxSoundPointer_Init,{})
	
end function

public procedure orxSoundPointer_Exit()

 orxProc(xorxSoundPointer_Exit,{})
	
end procedure

public constant xorxSoundPointer_Create = orxDefine("orxSoundPointer_Create",{},C_POINTER),
				xorxSoundPointer_Delete = orxDefine("orxSoundPointer_Delete",{C_POINTER},C_INT),
				xorxSoundPointer_Enable = orxDefine("orxSoundPointer_Enable",{C_POINTER,C_BOOL}),
				xorxSoundPointer_IsEnabled = orxDefine("orxSoundPointer_IsEnabled",{C_POINTER},C_BOOL)
				
public function orxSoundPointer_Create()

 return orxFunc(xorxSoundPointer_Create,{})
	
end function

public function orxSoundPointer_Delete(object _pstSP)

 return orxFunc(xorxSoundPointer_Delete,{_pstSP})
	
end function

public procedure orxSoundPointer_Enable(object _pstSP,atom _bEn)

 orxProc(xorxSoundPointer_Enable,{_pstSP,_bEn})
	
end procedure

public function orxSoundPointer_IsEnabled(object _pstSP)

 return orxFunc(xorxSoundPointer_IsEnabled,{_pstSP})
	
end function

public constant xorxSoundPointer_SetVolume = orxDefine("orxSoundPointer_SetVolume",{C_POINTER,C_FLOAT},C_INT),
				xorxSoundPointer_SetPitch = orxDefine("orxSoundPointer_SetPitch",{C_POINTER,C_FLOAT},C_INT)
				
public function orxSoundPointer_SetVolume(object _pstSP,atom _fVol)

 return orxFunc(xorxSoundPointer_SetVolume,{_pstSP,_fVol})
	
end function

public function orxSoundPointer_SetPitch(object _pstSP,atom _fPit)

 return orxFunc(xorxSoundPointer_SetPitch,{_pstSP,_fPit})
	
end function

public constant xorxSoundPointer_Play = orxDefine("orxSoundPointer_Play",{C_POINTER},C_INT),
				xorxSoundPointer_Pause = orxDefine("orxSoundPointer_Pause",{C_POINTER},C_INT),
				xorxSoundPointer_Stop = orxDefine("orxSoundPointer_Stop",{C_POINTER},C_INT)
				
public function orxSoundPointer_Play(object _pstSP)

 return orxFunc(xorxSoundPointer_Play,{_pstSP})
	
end function

public function orxSoundPointer_Pause(object _pstSP)

 return orxFunc(xorxSoundPointer_Pause,{_pstSP})
	
end function

public function orxSoundPointer_Stop(object _pstSP)

 return orxFunc(xorxSoundPointer_Stop,{_pstSP})
	
end function

public constant xorxSoundPointer_AddSound = orxDefine("orxSoundPointer_AddSound",{C_POINTER,C_POINTER},C_INT),
				xorxSoundPointer_RemoveSound = orxDefine("orxSoundPointer_RemoveSound",{C_POINTER,C_POINTER},C_INT),
				xorxSoundPointer_RemoveAllSounds = orxDefine("orxSoundPointer_RemoveAllSounds",{C_POINTER},C_INT),
				xorxSoundPointer_AddSoundFromConfig = orxDefine("orxSoundPointer_AddSoundFromConfig",{C_POINTER,C_STRING},C_INT),
				xorxSoundPointer_RemoveSoundFromConfig = orxDefine("orxSoundPointer_RemoveSoundFromConfig",{C_POINTER,C_STRING},C_INT),
				xorxSoundPointer_GetLastAddedSound = orxDefine("orxSoundPointer_GetLastAddedSound",{C_POINTER},C_POINTER),
				xorxSoundPointer_GetCount = orxDefine("orxSoundPointer_GetCount",{C_POINTER},C_UINT)
				
public function orxSoundPointer_AddSound(object _pstSP,object _pstS)

 return orxFunc(xorxSoundPointer_AddSound,{_pstSP,_pstS})
	
end function

public function orxSoundPointer_RemoveSound(object _pstSP,object _pstS)

 return orxFunc(xorxSoundPointer_RemoveSound,{_pstSP,_pstS})
	
end function

public function orxSoundPointer_RemoveAllSounds(object _pstSP)

 return orxFunc(xorxSoundPointer_RemoveAllSounds,{_pstSP})
	
end function

public function orxSoundPointer_AddSoundFromConfig(object _pstSP,object _ID)

 return orxFunc(xorxSoundPointer_AddSoundFromConfig,{_pstSP,_ID})
	
end function

public function orxSoundPointer_RemoveSoundFromConfig(object _pstSP,object _ID)

 return orxFunc(xorxSoundPointer_RemoveSoundFromConfig,{_pstSP,_ID})
	
end function

public function orxSoundPointer_GetLastAddedSound(object _pstSP)

 return orxFunc(xorxSoundPointer_GetLastAddedSound,{_pstSP})
	
end function

public function orxSoundPointer_GetCount(object _pstSP)

 return orxFunc(xorxSoundPointer_GetCount,{_pstSP})
	
end function
­141.51