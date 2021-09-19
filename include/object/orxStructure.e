include "orxInclude.e"
include "core/orxClock.e"
include "memory/orxMemory.e"
--include "utils/orxLinkList.e
--include "utils/orxTree.e

public constant orxSTRUCTURE_GUID_MAGIC_TAG_DELETED = 0xDEFACED0DEADC0DEULL

public constant orxSTRUCTURE_GUID_MASK_STRUCTURE_ID = 0x00000000000000FFULL
public constant orxSTRUCTURE_GUID_SHIFT_STRUCTURE_ID = 0

public constant orxSTRUCTURE_GUID_MASK_ITEM_ID = 0x00000000FFFFFF00ULL
public constant orxSTRUCTURE_GUID_SHIFT_ITEM_ID = 8

public constant orxSTRUCTURE_GUID_MASK_INSTANCE_ID = 0xFFFFFFFF00000000ULL
public constant orxSTRUCTURE_GUID_SHIFT_INSTANCE_ID = 32

public enum type orxSTRUCTURE_ID

 orxSTRUCTURE_ID_ANIMPOINTER = 0,
 orxSTRUCTURE_ID_BODY,
 orxSTRUCTURE_ID_CLOCK,
 orxSTRUCTURE_ID_FRAME,
 orxSTRUCTURE_ID_FXPOINTER,
 orxSTRUCTURE_ID_GRAPHIC,
 orxSTRUCTURE_ID_SHADERPOINTER,
 orxSTRUCTURE_ID_SOUNDPOINTER,
 orxSTRUCTURE_ID_SPAWNER,
 orxSTRUCTURE_ID_TIMELINE,
 orxSTRUCTURE_ID_LINKABLE_NUMBER,
 
 orxSTRUCTURE_ID_ANIM = orxSTRUCTURE_ID_LINKABLE_NUMBER,
 orxSTRUCTURE_ID_ANIMSET,
 orxSTRUCTURE_ID_CAMERA,
 orxSTRUCTURE_ID_FONT,
 orxSTRUCTURE_ID_FX,
 orxSTRUCTURE_ID_OBJECT,
 orxSTRUCTURE_ID_SHADER,
 orxSTRUCTURE_ID_SOUND,
 orxSTRUCTURE_ID_TEXT,
 orxSTRUCTURE_ID_TEXTURE,
 orxSTRUCTURE_ID_VIEWPORT,
 orxSTRUCTURE_ID_NUMBER,
 orxSTRUCTURE_ID_NONE = 0xFFFFFFFF
	
end type

public enum type orxSTRUCTURE_STORAGE_TYPE

 orxSTRUCTURE_STORAGE_TYPE_LINKLIST = 0,
 orxSTRUCTURE_STORAGE_TYPE_TREE,
 orxSTRUCTURE_STORAGE_TYPE_NUMBER,
 orxSTRUCTURE_STORAGE_TYPE_NONE = 0xFFFFFFFF
	
end type

--OrxStructure Struct
public constant ORXSTRUCTURE_U64GUID = 8, --orxu64
				ORXSTRUCTURE_U64OWNERGUID = 16, --ORXU64
				ORXSTRUCTURE_U32FLAGS = 20, --ORXU32
				ORXSTRUCTURE_U32REFCOUNT = 24, --ORXU32
				--UNION
				ORXSTRUCTURE_STLINKLISTNODE = 28, --linklist node
				ORXSTRUCTURE_STREEENODE = 28, --tree node
				SIZEOF_ORXSTRUCTURE = 32
				
public constant xorxStructure_Setup = orxDefine("orxStructure_Setup",{}),
				xorxStructure_Init = orxDefine("orxStructure_Init",{},C_INT),
				xorxStructure_Exit = orxDefine("orxStructure_Exit",{})
				
public procedure orxStructure_Setup()

 orxProc(xorxStructure_Setup,{})
	
end procedure

public function orxStructure_Init()

 return orxFunc(xorxStructure_Init,{})
	
end function

public procedure orxStructure_Exit()

 orxProc(xorxStructure_Exit,{})
	
end procedure

public constant xorxStructure_Register = orxDefine("orxStructure_Register",{C_INT,C_INT,C_INT,C_UINT,C_UINT,C_POINTER},C_INT),
				xorxStructure_Unregister = orxDefine("orxStructure_Unregister",{C_INT},C_INT)
				
public function orxStructure_Register(atom _eStructureID,atom _eStorageType,atom _eMemoryType,atom _u32Size,atom _u32BankSize,object _pfnUpdate)

 return orxFunc(xorxStructure_Register,{_eStructureID,_eStorageType,_eMemoryType, _u32Size,_u32BankSize,_pfnUpdate})
	
end function

public function orxStructure_Unregister(atom _eStructureID)

 return orxFunc(xorxStructure_Unregister,{_eStructureID})
	
end function

public constant xorxStructure_Create = orxDefine("orxStructure_Create",{C_INT},C_POINTER),
				xorxStructure_Delete = orxDefine("orxStructure_Delete",{C_POINTER},C_INT)
				
public function orxStructure_Create(atom _eStructureID)

 return orxFunc(xorxStructure_Create,{_eStructureID})
	
end function

public function orxStructure_Delete(object _pStructure)

 return orxFunc(xorxStructure_Delete,{_pStructure})
	
end function

public constant xorxStructure_GetStorageType = orxDefine("orxStructure_GetStorageType",{C_INT},C_INT),
				xorxStructure_GetCount = orxDefine("orxStructure_GetCount",{C_INT},C_UINT),
				xorxStructure_Update = orxDefine("orxStructure_Update",{C_POINTER,C_POINTER,C_POINTER},C_INT)
				
public function orxStructure_GetStorageType(atom _eStructID)

 return orxFunc(xorxStructure_GetStorageType,{_eStructID})
	
end function

public function orxStructure_GetCount(atom _eStructID)

 return orxFunc(xorxStructure_GetCount,{_eStructID})
	
end function

public function orxStructure_Update(object _pStruct,object _phCall,object _pstClockInfo)

 return orxFunc(xorxStructure_Update,{_pStruct,_phCall,_pstClockInfo})
	
end function

public constant xorxStructure_Get = orxDefine("orxStructure_Get",{C_LONG},C_POINTER),
				xorxStructure_GetOwner = orxDefine("orxStructure_GetOwner",{C_POINTER},C_POINTER),
				xorxStructure_SetOwner = orxDefine("orxStructure_SetOwner",{C_POINTER,C_POINTER},C_INT),
				xorxStructure_GetFirst = orxDefine("orxStructure_GetFirst",{C_INT},C_POINTER),
				xorxStructure_GetLast = orxDefine("orxStructure_GetLast",{C_INT},C_POINTER),
				xorxStructure_GetParent = orxDefine("orxStructure_GetParent",{C_POINTER},C_POINTER),
				xorxStructure_GetChild = orxDefine("orxStructure_GetChild",{C_POINTER},C_POINTER),
				xorxStructure_GetSibling = orxDefine("orxStructure_GetSibling",{C_POINTER},C_POINTER),
				xorxStructure_GetPrevious = orxDefine("orxStructure_GetPrevious",{C_POINTER},C_POINTER),
				xorxStructure_GetNext = orxDefine("orxStructure_GetNext",{C_POINTER},C_POINTER),
				xorxStructure_SetParent = orxDefine("orxStructure_SetParent",{C_POINTER,C_POINTER},C_INT)
				
public function orxStructure_Get(atom _u64GUID)

 return orxFunc(xorxStructure_Get,{_u64GUID})
	
end function

public function orxStructure_GetOwner(object _pStruct)

 return orxFunc(xorxStructure_GetOwner,{_pStruct})
	
end function

public function orxStructure_SetOwner(object _pStruct,object _pOwn)

 return orxFunc(xorxStructure_SetOwner,{_pStruct,_pOwn})
	
end function

public function orxStructure_GetFirst(atom _eStructID)

 return orxFunc(xorxStructure_GetFirst,{_eStructID})
	
end function

public function orxStructure_GetLast(atom _eStructID)

 return orxFunc(xorxStructure_GetLast,{_eStructID})
	
end function

public function orxStructure_GetParent(object _pStruct)

 return orxFunc(xorxStructure_GetParent,{_pStruct})
	
end function

public function orxStructure_GetChild(object _pStruct)

 return orxFunc(xorxStructure_GetChild,{_pStruct})
	
end function

public function orxStructure_GetSibling(object _pStruct)

 return orxFunc(xorxStructure_GetSibling,{_pStruct})
	
end function

public function orxStructure_GetPrevious(object _pStruct)

 return orxFunc(xorxStructure_GetPrevious,{_pStruct})
	
end function

public function orxStructure_GetNext(object _pStruct)

 return orxFunc(xorxStructure_GetNext,{_pStruct})
	
end function

public function orxStructure_SetParent(object _pStruct,object _phParent)

 return orxFunc(xorxStructure_SetParent,{_pStruct,_phParent})
	
end function

public constant orxStructure_LogAll = orxDefine("orxStructure_LogAll",{C_BOOL},C_INT)

public function orxStructure_LogAll(atom _bPrivate)

 return orxFunc(xorxStructure_LogAll,{_bPrivate})
	
end function
­223.49