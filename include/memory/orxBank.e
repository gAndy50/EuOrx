include "orxInclude.e"
include "memory/orxMemory.e"

public constant orxBANK_KU32_FLAG_NONE = 0x00000000 
public constant orxBANK_KU32_FLAG_NOT_EXPANDABLE = 0x00000001

public constant xorxBank_Setup = orxDefine("orxBank_Setup",{}),
				xorxBank_Init = orxDefine("orxBank_Init",{},C_INT),
				xorxBank_Exit = orxDefine("orxBank_Exit",{}),
				xorxBank_Create = orxDefine("orxBank_Create",{C_UINT,C_UINT,C_UINT,C_INT},C_POINTER),
				xorxBank_Delete = orxDefine("orxBank_Delete",{C_POINTER}),
				xorxBank_Allocate = orxDefine("orxBank_Allocate",{C_POINTER}),
				xorxBank_AllocateIndexed = orxDefine("orxBank_AllocateIndexed",{C_POINTER,C_POINTER,C_POINTER}),
				xorxBank_Free = orxDefine("orxBank_Free",{C_POINTER,C_POINTER}),
				xorxBank_FreeAtIndex = orxDefine("orxBank_FreeAtIndex",{C_POINTER,C_UINT}),
				xorxBank_Clear = orxDefine("orxBank_Clear",{C_POINTER}),
				xorxBank_Compact = orxDefine("orxBank_Compact",{C_POINTER}),
				xorxBank_CompactAll = orxDefine("orxBank_CompactAll",{}),
				xorxBank_GetNext = orxDefine("orxBank_GetNext",{C_POINTER,C_POINTER},C_UINT),
				xorxBank_GetIndex = orxDefine("orxBank_GetIndex",{C_POINTER,C_POINTER}),
				xorxBank_GetAtIndex = orxDefine("orxBank_GetAtIndex",{C_POINTER,C_UINT}),
				xorxBank_GetCount = orxDefine("orxBank_GetCount",{C_POINTER},C_UINT)
				
public procedure orxBank_Setup()

 orxProc(xorxBank_Setup,{})
	
end procedure

public function orxBank_Init()

 return orxFunc(xorxBank_Init,{})
	
end function

public procedure orxBank_Exit()

 orxProc(xorxBank_Exit,{})
	
end procedure

public function orxBank_Create(atom _u32Count,atom _u32Size,atom _u32Flags,atom _eMemtype)

 return orxFunc(xorxBank_Create,{_u32Count,_u32Size,_u32Flags,_eMemType})
	
end function

public procedure orxBank_Delete(object _pstBank)

 orxProc(xorxBank_Delete,{_pstBank})
	
end procedure

public procedure orxBank_Allocate(object _pstBank)

 orxProc(xorxBank_Allocate,{_pstBank})
	
end procedure

public procedure orxBank_AllocateIndexed(object _pstBank,atom _pu32ItemIndex,object _ppPrev)

 orxProc(xorxBank_AllocateIndexed,{_pstBank,_pu32ItemIndex,_ppPrev})
	
end procedure

public procedure orxBank_Free(object _pstBank,object _pCell)

 orxProc(xorxBank_Free,{_pstBank,_pCell})
	
end procedure

public procedure orxBank_FreeAtIndex(object _pstBank,atom _u32Index)

 orxProc(xorxBank_FreeAtIndex,{_pstBank,_u32Index})
	
end procedure

public procedure orxBank_Clear(object _pstBank)

 orxProc(xorxBank_Clear,{_pstBank})
	
end procedure

public procedure orxBank_Compact(object _pstBank)

 orxProc(xorxBank_Compact,{_pstBank})
	
end procedure

public procedure orxBank_CompactAll()

 orxProc(xorxBank_CompactAll,{})
	
end procedure

public procedure orxBank_GetNext(object _pstBank,object _pCell)

 orxProc(xorxBank_GetNext,{_pstBank,_pCell})
	
end procedure

public function orxBank_GetIndex(object _pstBank,object _pCell)

 return orxFunc(xorxBank_GetIndex,{_pstBank,_pCell})
	
end function

public procedure orxBank_GetAtIndex(object _pstBank,atom _u32Index)

 orxProc(xorxBank_GetAtIndex,{_pstBank,_u32Index})
	
end procedure

public function orxBank_GetCount(object _pstBank)

 return orxFunc(xorxBank_GetCount,{_pstBank})
	
end function
­116.45