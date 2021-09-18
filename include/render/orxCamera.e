include "orxInclude.e"

--include "object/orxFrame.e"
include "object/orxStructure.e"
include "math/orxAABox.e"

public constant orxCAMERA_KU32_FLAG_NONE = 0x00000000
public constant orxCAMERA_KU32_FLAG_2D = 0x00000001
public constant orxCAMERA_KU32_MASK_USER_ALL = 0x000000FF
public constant orxCAMERA_KU32_GROUP_ID_NUMBER = 16

public constant xorxCamera_Setup = orxDefine("orxCamera_Setup",{}),
				xorxCamera_Init = orxDefine("orxCamera_Init",{},C_INT),
				xorxCamera_Exit = orxDefine("orxCamera_Exit",{})
				
public procedure orxCamera_Setup()

 orxProc(xorxCamera_Setup,{})
	
end procedure

public function orxCamera_Init()

 return orxFunc(xorxCamera_Init,{})
	
end function

public procedure orxCamera_Exit()

 orxProc(xorxCamera_Exit,{})
	
end procedure

public constant xorxCamera_Create = orxDefine("orxCamera_Create",{C_UINT},C_POINTER),
				xorxCamera_CreateFromConfig = orxDefine("orxCamera_CreateFromConfig",{C_STRING},C_POINTER),
				xorxCamera_Delete = orxDefine("orxCamera_Delete",{C_POINTER},C_INT)
				
public function orxCamera_Create(atom _u32Flags)

 return orxFunc(xorxCamera_Create,{_u32Flags})
	
end function

public function orxCamera_CreateFromConfig(object _zConfigID)

 return orxFunc(xorxCamera_CreateFromConfig,{_zConfigID})
	
end function

public function orxCamera_Delete(object _pstCamera)

 return orxFunc(xorxCamera_Delete,{_pstCamera})
	
end function

public constant xorxCamera_AddGroupID = orxDefine("orxCamera_AddGropuID",{C_POINTER,C_STRING,C_BOOL},C_INT),
				xorxCamera_RemoveGroupID = orxDefine("orxCamera_RemoveGroupID",{C_POINTER,C_STRING},C_INT),
				xorxCamera_GetGroupIDCount = orxDefine("orxCamera_GetGroupIDCount",{C_POINTER},C_UINT),
				xorxCamera_GetGroupID = orxDefine("orxCamera_GetGroupID",{C_POINTER,C_UINT},C_STRING)
				
public function orxCamera_AddGroupID(object _pstCamera,object _stGroupID,atom _bAddFirst)

 return orxFunc(xorxCamera_AddGroupID,{_pstCamera,_stGroupID,_bAddFirst})
	
end function

public function orxCamera_RemoveGroupID(object _pstCamera,object _stGroupID)

 return orxFunc(xorxCamera_RemoveGroupID,{_pstCamera,_stGroupID})
	
end function

public function orxCamera_GetGroupIDCount(object _pstCamera)

 return orxFunc(xorxCamera_GetGroupIDCount,{_pstCamera})
	
end function

public function orxCamera_GetGroupID(object _pstCamera,atom _u32Index)

 return orxFunc(xorxCamera_GetGroupID,{_pstCamera,_u32Index})
	
end function

public constant xorxCamera_SetFrustum = orxDefine("orxCamera_SetFrustum",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT},C_INT),
				xorxCamera_SetPosition = orxDefine("orxCamera_SetPosition",{C_POINTER,C_POINTER},C_INT),
				xorxCamera_SetRotation = orxDefine("orxCamera_SetRotation",{C_POINTER,C_FLOAT},C_INT),
				xorxCamera_SetZoom = orxDefine("orxCamera_SetZoom",{C_POINTER,C_FLOAT},C_INT),
				xorxCamera_GetFrustum = orxDefine("orxCamera_GetFrustum",{C_POINTER,C_POINTER},C_POINTER),
				xorxCamera_GetPosition = orxDefine("orxCamera_GetPosition",{C_POINTER,C_POINTER},C_POINTER),
				xorxCamera_GetRotation = orxDefine("orxCamera_GetRotation",{C_POINTER},C_FLOAT),
				xorxCamera_GetZoom = orxDefine("orxCamera_GetZoom",{C_POINTER},C_FLOAT),
				xorxCamera_GetName = orxDefine("orxCamera_GetName",{C_POINTER},C_STRING),
				xorxCamera_Get = orxDefine("orxCamera_Get",{C_STRING},C_POINTER)
				
public function orxCamera_SetFrustum(object _pstCamera,atom _fWidth,atom _fHeight,atom _fNear,atom _fFar)

 return orxFunc(xorxCamera_SetFrustum,{_pstCamera,_fWidth,_fHeight,_fNear,_fFar})
	
end function

public function orxCamera_SetPosition(object _pstCamera,object _pvPosition)

 _pvPosition = allocate_data(SIZEOF_ORXVECTOR)

 return orxFunc(xorxCamera_SetPosition,{_pstCamera,_pvPosition)
	
end function

public function orxCamera_SetRotation(object _pstCamera,atom _fRotation)

 return orxFunc(xorxCamera_SetRotation,{_pstCamera,_fRotation})
	
end function

public function orxCamera_SetZoom(object _pstCamera,atom _fZoom)

 return orxFunc(xorxCamera_SetZoom,{_pstCamera,_fZoom})
	
end function

public function orxCamera_GetFrustum(object _pstCamera, object _pstFrustum)

 _pstFrustum = allocate_data(SIZEOF_ORXAABOX)

 return orxFunc(xorxCamera_GetFrustum,{_pstCamera, _pstFrustum})
	
end function

public function orxCamera_GetPosition(object _pstCamera, object _pvPosition)

 _pvPosition = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxCamera_GetPosition,{_pstCamera, _pvPosition})
	
end function 

public function orxCamera_GetRotation(object _pstCamera)

 return orxFunc(xorxCamera_GetRotation,{_pstCamera})
	
end function

public function orxCamera_GetZoom(object _pstCamera)

 return orxFunc(xorxCamera_GetZoom,{_pstCamera})
	
end function

public function orxCamera_GetName(object _pstCamera)

 return orxFunc(xorxCamera_GetName,{_pstCamera})
	
end function

public function orxCamera_Get(object _zName)

 return orxFunc(xorxCamera_Get,{_zName})
	
end function

public constant xorxCamera_GetFrame = orxDefine("orxCamera_GetFrame",{C_POINTER},C_POINTER)

public function orxCamera_GetFrame(object _pstCamera)

 return orxFunc(xorxCamera_GetFrame,{_pstCamera})
	
end function

public constant xorxCamera_SetParent = orxDefine("orxCamera_SetParent",{C_POINTER,C_POINTER},C_INT),
				xorxCamera_GetParent = orxDefine("orxCamera_GetParent",{C_POINTER},C_POINTER)
				
public function orxCamera_SetParent(object _pstCamera,object _pParent)

 return orxFunc(xorxCamera_SetParent,{_pstCamera,_pParent})
	
end function

public function orxCamera_GetParent(object _pstCamera)

 return orxFunc(xorxCamera_GetParent,{_pstCamera})
	
end function
­181.50