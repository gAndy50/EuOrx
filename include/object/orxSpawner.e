include "orxInclude.e"

include "object/orxStructure.e"
include "object/orxFrame.e"

public constant orxSPAWNER_KU32_FLAG_NONE = 0x00000000
public constant orxSPAWNER_KU32_FLAG_AUTO_DELETE = 0x00000001
public constant orxSPAWNER_KU32_FLAG_AUTO_RESET = 0x00000002
public constant orxSPAWNER_KU32_FLAG_USE_ALPHA = 0x00000004
public constant orxSPAWNER_KU32_FLAG_USE_COLOR = 0x00000008
public constant orxSPAWNER_KU32_FLAG_USE_ROTATION = 0x00000010
public constant orxSPAWNER_KU32_FLAG_USE_SCALE = 0x00000020
public constant orxSPAWNER_KU32_FLAG_USE_RELATIVE_SPEED_OBJECT = 0x00000040
public constant orxSPAWNER_KU32_FLAG_USE_RELATIVE_SPEED_SPAWNER = 0x00000080
public constant orxSPAWNER_KU32_FLAG_USE_RELATIVE_SPEED = 0x000000C0
public constant orxSPAWNER_KU32_FLAG_USE_SELF_AS_PARENT = 0x00000100
public constant orxSPAWNER_KU32_FLAG_CLEAN_ON_DELETE = 0x00000200
public constant orxSPAWNER_KU32_FLAG_INTERPOLATE = 0x00000400
public constant orxSPAWNER_KU32_MASK_USER_ALL = 0x000004FF

public enum type orxSPAWNER_EVENT

 orxSPAWNER_EVENT_SPAWN = 0,
 orxSPAWNER_EVENT_CREATE,
 orxSPAWNER_EVENT_DELETE,
 orxSPAWNER_EVENT_RESET,
 orxSPAWNER_EVENT_EMPTY,
 orxSPAWNER_EVENT_WAVE_START,
 orxSPAWNER_EVENT_WAVE_STOP,
 orxSPAWNER_EVENT_NUMBER,
 orxPSAWNWE_EVENT_NONE = 0xFFFFFFFF
	
end type

public constant xorxSpawner_Setup = orxDefine("orxSpawner_Setup",{}),
				xorxSpawner_Init = orxDefine("orxSpawner_Init",{},C_INT),
				xorxSpawner_Exit = orxDefine("orxSpawner_Exit",{}),
				xorxSpawner_Create = orxDefine("orxSpawner_Create",{},C_POINTER),
				xorxSpawner_CreateFromConfig = orxDefine("orxSpawner_CreateFromConfig",{C_STRING},C_POINTER),
				xorxSpawner_Delete = orxDefine("orxSpawner_Delete",{C_POINTER},C_INT),
				xorxSpawner_Enable = orxDefine("orxSpawner_Enable",{C_POINTER,C_BOOL}),
				xorxSpanwer_IsEnabled = orxDefine("orxSpawner_IsEnabled",{C_POINTER},C_BOOL)
				
public function orxSpawner_Setup()

 orxProc(xorxSpawner_Setup,{})
	
end function

public function orxSpanwer_Init()

 return orxFunc(xorxSpawner_Init,{})
	
end function

public procedure orxSpawner_Exit()

 orxProc(xorxSpawner_Exit,{})
	
end procedure

public function orxSpawner_Create()

 return orxFunc(xorxSpawner_Create,{})
	
end function

public function orxSpawner_CreateFromConfig(object ID)

 return orxFunc(xorxSpawner_CreateFromConfig,{ID})
	
end function

public function orxSpawner_Delete(object Sp)

 return orxFunc(xorxSpawner_Delete,{Sp})
	
end function

public procedure orxSpawner_Enable(object Sp,atom _bEn)

 orxProc(xorxSpawner_Enable,{Sp,_bEn})
	
end procedure

public function orxSpawner_IsEnabled(object Sp)

 return orxFunc(xorxSpawner_IsEnabled,{Sp})
	
end function

public constant xorxSpawner_Reset = orxDefine("orxSpawner_Reset",{C_POINTER}),
				xorxSpawner_SetTotalObjectLimit = orxDefine("orxSpawner_SetTotalObjectLimit",{C_POINTER,C_UINT},C_INT),
				xorxSpawner_SetActiveObjectLimit = orxDefine("orxSpawner_SetActiveObjectLimit",{C_POINTER,C_UINT},C_INT),
				xorxSpawner_GetTotalObjectLimit = orxDefine("orxSpawner_GetTotalObjectLimit",{C_POINTER},C_UINT),
				xorxSpawner_GetActiveObjectLimit = orxDefine("orxSpawner_GetActiveObjectLimit",{C_POINTER},C_UINT),
				xorxSpawner_GetTotalObjectCount = orxDefine("orxSpawner_GetTotalObjectCount",{C_POINTER},C_UINT),
				xorxSpawner_GetActiveObjectCount = orxDefine("orxSpawner_GetActiveObjectCount",{C_POINTER},C_UINT)
				
public procedure orxSpawner_Reset(object Sp)

 orxProc(xorxSpawner_Reset,{Sp})
	
end procedure

public function orxSpawner_SetTotalObjectLimit(object Sp,atom _Lim)

 return orxFunc(xorxSpawner_SetTotalObjectLimit,{Sp_Lim})
	
end function

public function orxSpawner_SetActiveObjectLimit(object Sp,atom _Lim)

 return orxFunc(xorxSpawner_SetActiveObjectLimit,{Sp,_Lim})
	
end function

public function orxSpawner_GetTotalObjectLimit(object Sp)

 return orxFunc(xorxSpawner_GetTotalObjectLimit,{Sp})
	
end function

public function orxSpawner_GetActiveObjectLimit(object Sp)

 return orxFunc(xorxSpawner_GetActiveObjectLimit,{Sp})
	
end function

public function orxSpawner_GetTotalObjectCount(object Sp)

 return orxFunc(xorxSpawner_GetTotalObjectCount,{Sp})
	
end function

public function orxSpawner_GetActiveObjectCount(object Sp)

 return orxFunc(xorxSpawner_GetActiveObjectCount,{Sp})
	
end function

public constant xorxSpawner_SetWaveSize = orxDefine("orxSpawner_SetWaveSize",{C_POINTER,C_UINT},C_INT),
				xorxSpawner_SetWaveDelay = orxDefine("orxSpawner_SetWaveDelay",{C_POINTER,C_FLOAT},C_INT),
				xorxSpawner_SetNextWaveDelay = orxDefine("orxSpawner_SetNextWaveDelay",{C_POINTER,C_FLOAT},C_INT),
				xorxSpawner_GetWaveSize = orxDefine("orxSpawner_GetWaveSize",{C_POINTER},C_UINT),
				xorxSpawner_GetWaveDelay = orxDefine("orxSpawner_GetWaveDelay",{C_POINTER},C_FLOAT),
				xorxSpawner_GetNextWaveDelay = orxDefine("orxSpawner_GetNextWaveDelay",{C_POINTER},C_FLOAT)
				
public function orxSpawner_SetWaveSize(object Sp,atom WZ)

 return orxFunc(xorxSpawner_SetWaveSize,{Sp,WZ})
	
end function

public function orxSpawner_SetWaveDelay(object Sp,atom _De)

 return orxFunc(xorxSpawner_SetWaveDelay,{Sp,_De})
	
end function

public function orxSpawner_SetNextWaveDelay(object Sp,atom _De)

 return orxFunc(xorxSpawner_SetNextWaveDelay,{Sp,_De})
	
end function

public function orxSpawner_GetWaveSize(object Sp)

 return orxFunc(xorxSpawner_GetWaveSize,{Sp})
	
end function

public function orxSpawner_GetWaveDelay(object Sp)

 return orxFunc(xorxSpawner_GetWaveDelay,{Sp})
	
end function

public function orxSpawner_GetNextWaveDelay(object Sp)

 return orxFunc(xorxSpawner_GetNextWaveDelay,{Sp})
	
end function

public constant xorxSpawner_SetObjectSpeed = orxDefine("orxSpawner_SetObjectSpeed",{C_POINTER,C_POINTER},C_INT),
				xorxSpawner_GetObjectSpeed = orxDefine("orxSpawner_GetObjectSpeed",{C_POINTER,C_POINTER},C_POINTER)
				
public function orxSpawner_SetObjectSpeed(object Sp,object _Spd)

 _Spd = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxSpawner_SetObjectSpeed,{Sp,_Spd})
	
end function

public function orxSpawner_GetObjectSpeed(object Sp,object _Spd)

 _Spd = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxSpawner_GetObjectSpeed,{Sp,_Spd})
	
end function

public constant xorxSpawner_Spawn = orxDefine("orxSpawner_Spawn",{C_POINTER,C_UINT},C_UINT)

public function orxSpawner_Spawn(object Sp,atom _Num)

 return orxFunc(xorxSpawner_Spawn,{Sp,_Num})
	
end function

public constant xorxSpawner_GetFrame = orxDefine("orxSpawner_GetFrame",{C_POINTER},C_POINTER)

public function orxSpawner_GetFrame(object Sp)

 return orxFunc(xorxSpawner_GetFrame,{Sp})
	
end function

public constant xorxSpawner_SetPosition = orxDefine("orxSpawner_SetPosition",{C_POINTER,C_POINTER},C_INT),
				xorxSpawner_SetRotation = orxDefine("orxSpawner_SetRotation",{C_POINTER,C_FLOAT},C_INT),
				xorxSpawner_SetScale = orxDefine("orxSpawner_SetScale",{C_POINTER,C_POINTER},C_INT),
				xorxSpawner_GetPosition = orxDefine("orxSpawner_GetPosition",{C_POINTER,C_POINTER},C_POINTER),
				xorxSpawner_GetWorldPosition = orxDefine("orxSpawner_GetWorldPosition",{C_POINTER,C_POINTER},C_POINTER),
				xorxSpawner_GetRotation = orxDefine("orxSpawner_GetRotation",{C_POINTER},C_FLOAT),
				xorxSpawner_GetWorldRotation = orxDefine("orxSpawner_GetWorldRotation",{C_POINTER},C_FLOAT),
				xorxSpawner_GetScale = orxDefine("orxSpawner_GetScale",{C_POINTER,C_POINTER},C_POINTER),
				xorxSpawner_GetWorldScale = orxDefine("orxSpawner_GetWorldScale",{C_POINTER,C_POINTER},C_POINTER)
				
public function orxSpawner_SetPosition(object Sp,object Pos)

 Pos = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxSpawner_SetPosition,{Sp,Pos})
	
end function

public function orxSpawner_SetRotation(object Sp,atom Rot)

 return orxFunc(xorxSpawner_SetRotation,{Sp,Rot})
	
end function

public function orxSpawner_SetScale(object Sp,object Scale)

 Scale = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxSpawner_SetScale,{Sp,Scale})
	
end function

public function orxSpawner_GetPosition(object Sp,object Pos)

 Pos = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxSpawner_GetPosition,{Sp,Pos})
	
end function

public function orxSpawner_GetWorldPosition(object Sp,object Pos)

 Pos = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxSpawner_GetWorldPosition,{Sp,Pos})
	
end function

public function orxSpawner_GetRotation(object Sp)

 return orxFunc(xorxSpawner_GetRotation,{Sp})
	
end function

public function orxSpawner_GetWorldRotation(object Sp)

 return orxFunc(xorxSpawner_GetWorldRotation,{Sp})
	
end function

public function orxSpawner_GetScale(object Sp,object Scale)

 Scale = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxSpawner_GetScale,{Sp,Scale})
	
end function

public function orxSpawner_GetWorldScale(object Sp,object Scale)

 Scale = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxSpawner_GetWorldScale,{Sp,Scale})
	
end function

public constant xorxSpawner_SetParent = orxDefine("orxSpawner_SetParent",{C_POINTER,C_POINTER},C_INT),
				xorxSpawner_GetParent = orxDefine("orxSpawner_GetParent",{C_POINTER},C_POINTER)
				
public function orxSpawner_SetParent(object Sp,object P)

 return orxFunc(xorxSpawner_SetParent,{Sp,P})
	
end function

public function orxSpawner_GetParent(object Sp)

 return orxFunc(xorxSpawner_GetParent,{Sp})
	
end function

public constant xorxSpawner_GetName = orxDefine("orxSpawner_GetName",{C_POINTER},C_STRING)

public function orxSpawner_GetName(object Sp)

 return orxFunc(xorxSpawner_GetName,{Sp})
	
end function
­315.41