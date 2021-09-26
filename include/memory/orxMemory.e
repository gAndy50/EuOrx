
include std/machine.e
include "orxInclude.e"

public include "debug/orxDebug.e"

constant
	xorxMemory_Setup            = orxDefine( "orxMemory_Setup", {} ),
	xorxMemory_Init             = orxDefine( "orxMemory_Init", {} , C_UINT ),
	xorxMemory_Exit             = orxDefine( "orxMemory_Exit", {} ),
	xorxMemory_Allocate         = orxDefine( "orxMemory_Allocate", {C_UINT,C_UINT}, C_POINTER ),
	xorxMemory_Reallocate       = orxDefine( "orxMemory_Reallocate", {C_POINTER,C_UINT,C_UINT}, C_POINTER ),
	xorxMemory_Free             = orxDefine( "orxMemory_Free", {C_POINTER} ),
	xorxMemory_GetTypeName      = orxDefine( "orxMemory_GetTypeName", {C_UINT}, C_STRING ),
	xorxMemory_GetCacheLineSize = orxDefine( "orxMemory_GetCacheLineSize", {}, C_UINT )

ifdef __orxDEBUG__ or __orxPROFILER__ then

constant
	xorxMemory_GetUsage = orxDefine( "orxMemory_GetUsage", {C_UINT,C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER}, C_UINT ),
	xorxMemory_Track    = orxDefine( "orxMemory_Track", {C_UINT,C_UINT,C_BOOL}, C_UINT )

end ifdef -- __orxDEBUG__ or __orxPROFILER__

public enum type orxMEMORY_TYPE

	orxMEMORY_TYPE_MAIN = 0,
	orxMEMORY_TYPE_AUDIO,
	orxMEMORY_TYPE_CONFIG,
	orxMEMORY_TYPE_DEBUG,
	orxMEMORY_TYPE_PHYSICS,
	orxMEMORY_TYPE_SYSTEM,
	orxMEMORY_TYPE_TEMP,
	orxMEMORY_TYPE_TEXT,
	orxMEMORY_TYPE_VIDEO,
	orxMEMORY_TYPE_NUMBER,
	orxMEMORY_TYPE_NONE = 0xFFFFFFFF -- orxENUM_NONE

end type -- orxMEMORY_TYPE

ifdef __orxDEBUG__ or __orxPROFILER__ then

public procedure orxMEMORY_TRACK( atom TYPE, atom SIZE, atom ALLOCATE )
	orxMemory_Track( TYPE, SIZE, ALLOCATE )
end procedure

elsedef -- __orxDEBUG__ or __orxPROFILER__

public procedure orxMEMORY_TRACK( atom TYPE, atom SIZE, atom ALLOCATE )
end procedure

end ifdef

public procedure orxMemory_Setup()
	orxProc( xorxMemory_Setup, {} )
end procedure

public function orxMemory_Init()
	return orxFunc( xorxMemory_Init, {} )
end function

public procedure orxMemory_Exit()
	orxProc( xorxMemory_Exit, {} )
end procedure

public function orxMemory_Allocate( atom _u32Size, atom _eMemType )
	return orxFunc( xorxMemory_Allocate, {_u32Size,_eMemType} )
end function

public function orxMemory_Reallocate( atom _pMem, atom _u32Size, atom _eMemType )
	return orxFunc( xorxMemory_Reallocate, {_pMem,_u32Size,_eMemType} )
end function

public function orxMemory_Copy( atom _pDest, atom _pSrc, atom _u32Size )

	orxASSERT( _pDest != orxNULL )
	orxASSERT( _pSrc != orxNULL )

	mem_copy( _pDest, _pSrc, _u32Size )

	return _pDest
end function

public function orxMemory_Move( atom _pDest, atom _pSrc, atom _u32Size )

	orxASSERT( _pDest != orxNULL )
	orxASSERT( _pSrc != orxNULL )

	atom _pBuff = allocate_data( _u32Size )

	mem_copy( _pBuff, _pSrc, _u32Size )
	mem_copy( _pDest, _pBuff, _u32Size )

	free( _pBuff )

	return _pDest
end function

public function orxMemory_Compare( atom _pMem1, atom _pMem2, atom _u32Size )

	orxASSERT( _pMem1 != orxNULL )
	orxASSERT( _pMem2 != orxNULL )

	sequence _azMem1 = peek( { _pMem1, _u32Size } )
	sequence _azMem2 = peek( { _pMem2, _u32Size } )

	return compare( _azMem1, _azMem2 )
end function

public function orxMemory_Set( atom _pDest, atom _u8Data, atom _u32Size )

	orxASSERT( _pDest != orxNULL )

	mem_set( _pDest, _u8Data, _u32Size )

	return _pDest
end function

public function orxMemory_Zero( atom _pDest, atom _u32Size )

	orxASSERT( _pDest != orxNULL )

	mem_set( _pDest, orxNULL, _u32Size )

	return _pDest
end function

public procedure orxMemory_Free( atom _pMem )
	orxProc( xorxMemory_Free, {_pMem} )
end procedure

public function orxMemory_GetTypeName( atom _eMemType )
	return orxFunc( xorxMemory_GetTypeName, {_eMemType} )
end function

public function orxMemory_GetCacheLineSize()
	return orxFunc( xorxMemory_GetCacheLineSize, {} )
end function

ifdef __orxDEBUG__ or __orxPROFILER__ then

public function orxMemory_GetUsage( atom _eMemType )

	atom _pu32Buffer = allocate_data( sizeof( C_UINT )*5 )
	atom _pu32Count          = _pu32Buffer + sizeof( C_UINT )*0
	atom _pu32PeakCount      = _pu32Buffer + sizeof( C_UINT )*1
	atom _pu32Size           = _pu32Buffer + sizeof( C_UINT )*2
	atom _pu32PeakSize       = _pu32Buffer + sizeof( C_UINT )*3
	atom _pu32OperationCount = _pu32Buffer + sizeof( C_UINT )*4

	object eResult = orxFunc( xorxMemory_GetUsage, {_eMemType,_pu32Count,_pu32PeakCount,_pu32Size,_pu32PeakSize,_pu32OperationCount} )

	if eResult = orxSTATUS_SUCCESS then
		eResult = peek4u( { _pu32Buffer, 5 } )
	end if

	free( _pu32Buffer )

	return eResult
end function

public function orxMemory_Track( atom _eMemType, atom _u32Size, atom _bAllocate )
	return orxFunc( xorxMemory_Track, {_eMemType,_u32Size,_bAllocate} )
end function

end ifdef -- __orxDEBUG__ or __orxPROFILER__
