
include "orxInclude.e"

public include "memory/orxMemory.e"

public constant orxHASHTABLE_KU32_FLAG_NONE = 0x00000000
public constant orxHASHTABLE_KU32_FLAG_NOT_EXPANDABLE = 0x00000001

constant
	xorxHashTable_Create   = orxDefine( "orxHashTable_Create", {C_UINT,C_UINT,C_INT}, C_POINTER ),
	xorxHashTable_Delete   = orxDefine( "orxHashTable_Delete", {C_POINTER}, C_INT ),
	xorxHashTable_Clear    = orxDefine( "orxHashTable_Clear", {C_POINTER}, C_INT ),
	xorxHashTable_GetCount = orxDefine( "orxHashTable_GetCount", {C_POINTER}, C_UINT ),
	xorxHashTable_Get      = orxDefine( "orxHashTable_Get", {C_POINTER,C_LONG}, C_POINTER ),
	xorxHashTable_Retrieve = orxDefine( "orxHashTable_Retrieve", {C_POINTER,C_LONG}, C_POINTER ),
	xorxHashTable_Set      = orxDefine( "orxHashTable_Set", {C_POINTER,C_LONG,C_POINTER}, C_INT ),
	xorxHashTable_Add      = orxDefine( "orxHashTable_Add", {C_POINTER,C_LONG,C_POINTER}, C_INT ),
	xorxHashTable_Remove   = orxDefine( "orxHashTable_Remove", {C_POINTER,C_LONG}, C_INT ),
	xorxHashTable_GetNext  = orxDefine( "orxHashTable_GetNext", {C_POINTER,C_POINTER,C_POINTER,C_POINTER}, C_POINTER ),
	xorxHashTable_Optimize = orxDefine( "orxHashTable_Optimize", {C_POINTER}, C_INT )

public function orxHashTable_Create( atom _u32NbKey, atom _u32Flags, atom _eMemType )
	return orxFunc( xorxHashTable_Create, {_u32NbKey,_u32Flags,_eMemType} )
end function


public function orxHashTable_Delete( object _pstHash )
	return orxFunc( xorxHashTable_Delete, {_pstHash} )
end function


public function orxHashTable_Clear( object _pstHash )
	return orxFunc( xorxHashTable_Clear, {_pstHash} )
end function

public function orxHashTable_GetCount( object _pstHash )
	return orxFunc( xorxHashTable_GetCount, {_pstHash} )
end function


public function orxHashTable_Get( object _pstHash, atom _u64Key )
	return orxFunc( xorxHashTable_Get, {_pstHash,_u64Key} )
end function


public function orxHashTable_Retrieve( object _pstHash, atom _u64Key )
	return orxFunc( xorxHashTable_Retrieve, {_pstHash,_u64Key} )
end function


public function orxHashTable_Set( object _pstHash, atom _u64Key, object _pDat )
	return orxFunc( xorxHashTable_Set, {_pstHash,_u64Key,_pDat} )
end function


public function orxHashTable_Add( object _pstHash, atom _u64Key, object _pDat )
	return orxFunc( xorxHashTable_Add, {_pstHash,_u64Key,_pDat} )
end function


public function orxHashTable_Remove( object _pstHash, atom _u64Key )
	return orxFunc( xorxHashTable_Remove, {_pstHash,_u64Key} )
end function

public function orxHashTable_GetNext( object _pstHash, object _hIt, object _pu64, object _ppDat )
	return orxFunc( xorxHashTable_GetNext, {_pstHash,_hIt,_pu64,_ppDat} )
end function

public function orxHashTable_Optimize( object _pstHash )
	return orxFunc( xorxHashTable_Optimize, {_pstHash} )
end function
­88.50