include "orxInclude.e"
--include "object/orxStructure.e"

public constant orxANIM_KU32_FLAG_NONE = 0x00000000
public constant orxANIM_KU32_FLAG_2D = 0x00000001
public constant orxANIM_KU32_MASK_USER_ALL = 0x0000000F
public constant orxANIM_KU32_MASK_ALL = 0xFFFFFFFF
public constant orxANIM_KU32_KEY_MAX_NUMBER = 65535
public constant orxANIM_KU32_EVENT_MAX_NUMBER = 65535

public enum type orxANIM_EVENT

 orxANIM_EVENT_START = 0,
 orxANIM_EVENT_STOP,
 orxANIM_EVENT_CUT,
 orxANIM_EVENT_LOOP,
 orxANIM_EVENT_UPDATE,
 orxANIM_EVENT_CUSTOM_EVENT,
 orxANIM_EVENT_NUMBER,
 orxANIM_EVENT_NONE = 0xFFFFFFFF
	
end type

public constant pstAnim = 8, --orxANIM
				zAnimName = 16, --orxSTRING
				u32Count = 20, --orxU32
				fTime = 24, --orxFloat
				zName = 28, --orxstring
				fValue = 28, --float
				fTimes = 28, --float
				SIZEOF_orxANIM_EVENT_PAYLOAD = 32
				
public constant _zName = 8, --orxstring
				fValue = 16, --float
				_fTimeStamp = 20, --float
				SIZEOF_orxANIM_CUSTOM_EVENT = 24
				
public constant xorxAnim_Setup = orxDefine("orxAnim_Setup",{}),
				xorxAnim_Init = orxDefine("orxAnim_Init",{},C_INT),
				xorxAnim_Exit = orxDefine("orxAnim_Exit",{})
				
public procedure orxAnim_Setup()

 orxProc(xorxAnim_Setup,{})
	
end procedure

public function orxAnim_Init()

 return orxFunc(xorxAnim_Init,{})
	
end function

public procedure orxAnim_Exit()

 orxProc(xorxAnim_Exit,{})
	
end procedure

public constant xorxAnim_Create = orxDefine("orxAnim_Create",{C_UINT,C_UINT,C_UINT},C_POINTER),
				xorxAnim_Delete = orxDefine("orxAnim_Delete",{C_POINTER},C_INT)
				
public function orxAnim_Create(atom _u32Flags,atom _u32KeyNumber,atom _u32EventNumber)

 return orxFunc(xorxAnim_Create,{_u32Flags,_u32KeyNumber,_u32EventNumber})
	
end function

public function orxAnim_Delete(object _pstAnim)

 return orxFunc(xorxAnim_Delete,{_pstAnim})
	
end function

public constant xorxAnim_AddKey = orxDefine("orxAnim_AddKey",{C_POINTER,C_POINTER,C_FLOAT},C_INT),
				xorxAnim_RemoveLastKey = orxDefine("orxAnim_RemoveLastKey",{C_POINTER},C_INT),
				xorxAnim_RemoveAllKeys = orxDefine("orxAnim_RemoveAllKeys",{C_POINTER})
				
public function orxAnim_AddKey(object _pstAnim,object _pstData,atom _fTimeStamp)

 return orxFunc(xorxAnim_AddKey,{_pstAnim,_pstData,_fTimeStamp})
	
end function

public function orxAnim_RemoveLastKey(object _pstAnim)

 return orxFunc(xorxAnim_RemoveLastKey,{_pstAnim})
	
end function

public procedure orxAnim_RemoveAllKeys(object _pstAnim)

 orxProc(xorxAnim_RemoveAllKeys,{_pstAnim})
	
end procedure

public constant xorxAnim_AddEvent = orxDefine("orxAnim_AddEvent",{C_POINTER,C_STRING,C_FLOAT,C_FLOAT},C_INT),
				xorxAnim_RemoveLastEvent = orxDefine("orxAnim_RemoveLastEvent",{C_POINTER},C_INT),
				xorxAnim_RemoveAllEvents = orxDefine("orxAnim_RemoveAllEvents",{C_POINTER}),
				xorxAnim_GetNextEvent = orxDefine("orxAnim_GetNextEvent",{C_POINTER,C_FLOAT},C_POINTER)
				
public function orxAnim_AddEvent(object _pstAnim,object _zEventName,atom _fTimeStamp,atom _fValue)

 return orxFunc(xorxAnim_AddEvent,{_pstAnim,_zEventName,_fTimeStamp,_fValue})
	
end function

public function orxAnim_RemoveLastEvent(object _pstAnim)

 return orxFunc(xorxAnim_RemoveLastEvent,{_pstAnim})
	
end function

public procedure orxAnim_RemoveAllEvents(object _pstAnim)

 orxProc(xorxAnim_RemoveAllEvents,{_pstAnim})
	
end procedure

public function orxAnim_GetNextEvent(object _pstAnim,atom _fTimeStamp)

 return orxFunc(xorxAnim_GetNextEvent,{_pstAnim,_fTimeStamp})
	
end function

public constant xorxAnim_GetKey = orxDefine("orxAnim_GetKey",{C_POINTER,C_FLOAT},C_UINT),
				xorxAnim_GetKeyData = orxDefine("orxAnim_GetKeyData",{C_POINTER,C_UINT},C_POINTER)
				
public function orxAnim_GetKey(object _pstAnim,atom _fTimeStamp)

 return orxFunc(xorxAnim_GetKey,{_pstAnim,_fTimeStamp})
	
end function

public function orxAnim_GetKeyData(object _pstAnim,atom _u32Index)

 return orxFunc(xorxAnim_GetKeyData,{_pstAnim,_u32Index})
	
end function

public constant xorxAnim_GetKeyStorageSize = orxDefine("orxAnim_GetKeyStorageSize",{C_POINTER},C_UINT),
				xorxAnim_GetKeyCount = orxDefine("orxAnim_GetKeyCount",{C_POINTER},C_UINT)
				
public function orxAnim_GetKeyStorageSize(object _pstAnim)

 return orxFunc(xorxAnim_GetKeyStorageSize,{_pstAnim})
	
end function

public function orxAnim_GetKeyCount(object _pstAnim)

 return orxFunc(xorxAnim_GetKeyCount,{_pstAnim})
	
end function

public constant xorxAnim_GetEventStorageSize = orxDefine("orxAnim_GetEventStorageSize",{C_POINTER},C_UINT),
				xorxAnim_GetEventCount = orxDefine("orxAnim_GetEventCount",{C_POINTER},C_UINT)
				
public function orxAnim_GetEventStorageSize(object _pstAnim)

 return orxFunc(xorxAnim_GetEventStorageSize,{_pstAnim})
	
end function

public function orxAnim_GetEventCount(object _pstAnim)

 return orxFunc(xorxAnim_GetEventCount,{_pstAnim})
	
end function

public constant xorxAnim_GetLength = orxDefine("orxAnim_GetLength",{C_POINTER},C_FLOAT),
				xorxAnim_GetName = orxDefine("orxAnim_GetName",{C_POINTER},C_STRING)
				
public function orxAnim_GetLength(object _pstAnim)

 return orxFunc(xorxAnim_GetLength,{_pstAnim})
	
end function

public function orxAnim_GetName(object _pstAnim)

 return orxFunc(xorxAnim_GetName,{_pstAnim})
	
end function
­182.44