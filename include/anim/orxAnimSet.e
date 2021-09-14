
include std/math.e

public include "orxInclude.e"

public constant orxANIMSET_KU32_FLAG_NONE = 0x00000000
public constant orxANIMSET_KU32_FLAG_REFERENCE_LOCK = 0x00100000
public constant orxANIMSET_KU32_FLAG_LINK_STATIC = 0x00200000
public constant orxANIMSET_KU32_LINK_FLAG_NONE = 0x00000000
public constant orxANIMSET_KU32_LINK_FLAG_LOOP_COUNT = 0x10000000
public constant orxANIMSET_KU32_LINK_FLAG_PRIORITY = 0x20000000
public constant orxANIMSET_KU32_LINK_FLAG_IMMEDIATE_CUT = 0x40000000 
public constant orxANIMSET_KU32_LINK_FLAG_CLEAR_TARGE = 0x80000000
public constant orxANIMSET_KU32_MAX_ANIM_NUMBER = 128

constant xorxAnimSet_Setup = orxDefine("orxAnimSet_Setup",{}),
		 xorxAnimSet_Init = orxDefine("orxAnimSet_Init",{},C_INT),
		 xorxAnimSet_Exit = orxDefine("orxAnimSet_Exit",{})
		 
public procedure orxAnimSet_Setup()

 orxProc(xorxAnimSet_Setup,{})
	
end procedure

public function orxAnimSet_Init()

 return orxFunc(xorxAnimSet_Init,{})
	
end function

public procedure orxAnimSet_Exit()

 orxProc(xorxAnimSet_Exit,{})
	
end procedure
		 
constant xorxAnimSet_Create = orxDefine("orxAnimSet_Create",{C_UINT},C_POINTER),
		 xorxAnimSet_CreateFromConfig = orxDefine("orxAnimSet_CreateFromConfig",{C_STRING},C_POINTER),
		 xorxAnimSet_Delete = orxDefine("orxAnimSet_Delete",{C_POINTER},C_INT),
		 xorxAnimSet_ClearCache = orxDefine("orxAnimSet_ClearCache",{},C_INT),
		 xorxAnimSet_AddReference = orxDefine("orxAnimSet_AddReference",{C_POINTER}),
		 xorxAnimSet_RemoveReference = orxDefine("orxAnim_RemoveReference",{C_POINTER}),
		 xorxAnimSet_CloneLinkTable = orxDefine("orxAnim_CloneLinkTable",{C_POINTER},C_POINTER),
		 xorxAnimSet_DeleteLinkTable = orxDefine("orxAnim_DeleteLinkTable",{C_POINTER})
		 
public function orxAnimSet_Create(atom _u32Size)

 return orxFunc(xorxAnimSet_Create,{u32Size})
	
end function

public function orxAnimSet_CreateFromConfig(object _zConfigID)

 return orxFunc(xorxAnimSet_CreateFromConfig,{_zConfigID})
	
end function

public function orxAnimSet_Delete(atom _pstAnimSet)

 return orxFunc(xorxAnimSet_Delete,{_pstAnimSet})
	
end function

public function orxAnimSet_ClearCache()

 return orxFunc(xorxAnimSet_ClearCache,{})
	
end function

public procedure orxAnimSet_AddReference(atom _pstAnimSet)

 orxProc(xorxAnimSet_AddReference,{_pstAnimSet})
	
end procedure

public procedure orxAnimSet_RemoveReference(atom _pstAnimSet)

 orxProc(xorxAnimSet_RemoveReference,{_pstAnimSet})
	
end procedure

public function orxAnimSet_CloneLinkTable(atom _pstAnimSet)

 return orxFunc(xorxAnimSet_CloneLinkTable,{_pstAnimSet})
	
end function

public procedure orxAnimSet_DeleteLinkTable(atom _pstLinkTable)

 orxProc(xorxAnimSet_DeleteLinkTable,{_pstLinkTable})
	
end procedure

constant xorxAnimSet_AddAnim = orxDefine("orxAnimSet_AddAnim",{C_POINTER,C_POINTER},C_UINT),
		 xorxAnimSet_RemoveAnim = orxDefine("orxAnimSet_RemoveAnim",{C_POINTER,C_UINT},C_INT),
		 xorxAnimSet_RemoveAllAnims = orxDefine("orxAnimSet_RemoveAllAnims",{C_POINTER},C_INT)
		 
public function orxAnimSet_AddAnim(atom _pstAnimSet,atom _pstAnim)

 return orxFunc(xorxAnimSet_AddAnim,{_pstAnimSet,_pstAnim})
	
end function

public function orxAnimSet_RemoveAnim(atom _pstAnimSet,atom _u32AnimID)

 return orxFunc(xorxAnimSet_RemoveAnim,{_pstAnimSet,_u32AnimID})
	
end function

public function orxAnimSet_RemoveAllAnims(atom _pstAnimSet)

 return orxFunc(xorxAnimSet_RemoveAllAnims,{_pstAnimSet})
	
end function

constant xorxAnimSet_AddLink = orxDefine("orxAnimSet_AddLink",{C_POINTER,C_UINT,C_UINT},C_UINT),
		 xorxAnimSet_RemoveLink = orxDefine("orxAnimSet_RemoveLink",{C_POINTER,C_UINT},C_INT),
		 xorxAnimSet_GetLink = orxDefine("orxAnimSet_GetLink",{C_POINTER,C_UINT,C_UINT},C_UINT),
		 xorxAnimSet_SetLinkProperty = orxDefine("orxAnimSet_SetLinkProperty",{C_POINTER,C_UINT,C_UINT,C_UINT},C_INT)
		 
public function orxAnimSet_AddLink(atom _pstAnimSet,atom _u32SrcAnim,atom _u32DstAnim)

 return orxFunc(xorxAnimSet_AddLink,{_pstAnimSet,_u32SrcAnim,_u32DstAnim})
	
end function

public function orxAnimSet_RemoveLink(atom _pstAnimSet,atom _u32LinkID)

 return orxFunc(xorxAnimSet_RemoveLink,{_pstAnimSet,_u32LinkID})
	
end function

public function orxAnimSet_GetLink(atom _pstAnimSet,atom _u32SrcAnim,atom _u32DstAnim)

 return orxFunc(xorxAnimSet_GetLink,{_pstAnimSet,_u32SrcAnim,_u32DstAnim})
	
end function

public function orxAnimSet_SetLinkProperty(atom _pstAnimSet,atom _u32LinkID,atom _u32Property,atom _32Value)

 return orxFunc(xorxAnimSet_SetLinkProperty,{_pstAnimSet,_u32LinkID,_u32Property,_u32Value})
	
end function

constant xorxAnimSet_GetLinkProperty = orxDefine("orxAnimSet_GetLinkProperty",{C_POINTER,C_UINT,C_UINT}),
		 xorxAnimSet_ComputeAnim = orxDefine("orxAnimSet_ComputeAnim",{C_POINTER,C_UINT,C_UINT,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_UINT),
		 xorxAnimSet_FindNextAnim = orxDefine("orxAnimSet_FindNextAnim",{C_POINTER,C_UINT,C_UINT},C_UINT),
		 xorxAnimSet_GetAnim = orxDefine("orxAnimSet_GetAnim",{C_POINTER,C_UINT},C_POINTER),
		 xorxAnimSet_GetAnimStorageSize = orxDefine("orxAnimSet_GetAnimStorageSize",{C_POINTER},C_UINT),
		 xorxAnimSet_GetAnimCount = orxDefine("orxAnimSet_GetAnimCount",{C_POINTER},C_UINT),
		 xorxAnimSet_GetAnimIDFromName = orxDefine("orxAnimSet_GetAnimIDFromName",{C_POINTER,C_STRING},C_UINT),
		 xorxAnimSet_GetName = orxDefine("orxAnimSet_GetName",{C_POINTER},C_STRING)
		 
public function orxAnimSet_GetLinkProperty(atom _pstAnimSet,atom _u32LinkID,atom _u32Property)

 return orxFunc(xorxAnimSet_GetLinkProperty,{_pstAnimSet,_u32LinkID,_u32Property})
	
end function

public function orxAnimSet_ComputeAnim(atom _pstAnimSet,atom _u32SrcAnim,atom _u32DstAnim,atom _pfTime,object _pstLinkTable,atom _pbCut,atom _pbClearTarget)

 return orxFunc(xorxAnimSet_ComputeAnim,{_pstAnimSet,_u32SrcAnim,_u32DstAnim,_pfTime,_pstLinkTable,_pbCut,_pbClearTarget})
	
end function

public function orxAnimSet_FindNextAnim(atom _pstAnimSet,atom _u32SrcAnim,atom _u32DstAnim)

 return orxFunc(xorxAnimSet_FindNextAnim,{_pstAnimSet,_u32SrcAnim,_u32DstAnim})
	
end function

public function orxAnimSet_GetAnim(atom _pstAnimSet,atom _u32AnimID)

 return orxFunc(xorxAnimSet_GetAnim,{_pstAnimSet,_u32AnimID})
	
end function

public function orxAnimSet_GetAnimStorageSize(atom _pstAnimSet)

 return orxFunc(orxAnimSet_GetAnimStorageSize,{_pstAnimSet})
	
end function

public function orxAnimSet_GetAnimCount(atom _pstAnimSet)

 return orxFunc(xorxAnimSet_GetAnimCount,{_pstAnimSet})
	
end function

public function orxAnimSet_GetAnimIDFromName(atom _pstAnimSet,object _zAnimName)

 return orxFunc(xorxAnimSet_GetAnimIDFromName,{_pstAnimSet,_zAnimName})
	
end function

public function orxAnimSet_GetName(atom _pstAnimSet)

 return orxFunc(xorxAnimSet_GetName,{_pstAnimSet})
	
end function
­199.50