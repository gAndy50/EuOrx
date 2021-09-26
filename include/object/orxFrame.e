
include std/machine.e
include "orxInclude.e"

public include "math/orxVector.e"

public constant
	orxFRAME_KU32_FLAG_NONE                       = 0x00000000,
	orxFRAME_KU32_FLAG_SCROLL_X                   = 0x00000001,
	rxFRAME_KU32_FLAG_SCROLL_Y                    = 0x00000002,
	orxFRAME_KU32_MASK_SCROLL_BOTH                = 0x00000003,
	orxFRAME_KU32_FLAG_DEPTH_SCALE                = 0x00000004,
	orxFRAME_KU32_FLAG_FLIP_X                     = 0x00000010,
	orxFRAME_KU32_FLAG_FLIP_Y                     = 0x00000020,
	orxFRAME_KU32_MASK_FLIP_BOTH                  = 0x00000030,
	orxFRAME_KU32_FLAG_IGNORE_NONE                = 0x00000000,
	orxFRAME_KU32_FLAG_IGNORE_ROTATION            = 0x00000100,
	orxFRAME_KU32_FLAG_IGNORE_SCALE_X             = 0x00000200,
	orxFRAME_KU32_FLAG_IGNORE_SCALE_Y             = 0x00000400,
	orxFRAME_KU32_FLAG_IGNORE_SCALE_Z             = 0x00000800,
	orxFRAME_KU32_MASK_IGNORE_SCALE               = 0x00000E00,
	orxFRAME_KU32_FLAG_IGNORE_POSITION_ROTATION   = 0x00001000,
	orxFRAME_KU32_FLAG_IGNORE_POSITION_SCALE_X    = 0x00002000,
	orxFRAME_KU32_FLAG_IGNORE_POSITION_SCALE_Y    = 0x00004000,
	orxFRAME_KU32_FLAG_IGNORE_POSITION_SCALE_Z    = 0x00008000,
	orxFRAME_KU32_MASK_IGNORE_POSITION_SCALE      = 0x0000E000,
	orxFRAME_KU32_FLAG_IGNORE_POSITION_POSITION_X = 0x00010000,
	orxFRAME_KU32_FLAG_IGNORE_POSITION_POSITION_Y = 0x00020000,
	orxFRAME_KU32_FLAG_IGNORE_POSITION_POSITION_Z = 0x00040000,
	orxFRAME_KU32_MASK_IGNORE_POSITION_POSITION   = 0x00070000,
	orxFRAME_KU32_MASK_IGNORE_POSITION            = 0x0007F000,
	orxFRAME_KU32_MASK_IGNORE_ALL                 = 0x0007FF00,
	orxFRAME_KU32_MASK_USER_ALL                   = 0x0007FFFF

public enum type orxFRAME_SPACE

	orxFRAME_SPACE_GLOBAL = 0,
	orxFRAME_SPACE_LOCAL,
	orxFRAME_SPACE_NUMBER,
	orxFRAME_SPACE_NONE = 0xFFFFFFFF

end type

constant
	xorxFrame_GetIgnoreFlagValues = orxDefine( "orxFrame_GetIgnoreFlagValues", {C_STRING}, C_UINT ),
	xorxFrame_GetIgnoreFlagNames  = orxDefine( "orxFrame_GetIgnoreFlagNames", {C_UINT}, C_STRING ),
	xorxFrame_Setup               = orxDefine( "orxFrame_Setup", {} ),
	xorxFrame_Init                = orxDefine( "orxFrame_Init", {}, C_INT ),
	xorxFrame_Exit                = orxDefine( "orxFrame_Exit", {} ),
	xorxFrame_Create              = orxDefine( "orxFrame_Create", {C_UINT}, C_POINTER ),
	xorxFrame_Delete              = orxDefine( "orxFrame_Delete", {C_POINTER}, C_INT ),
	xorxFrame_SetParent           = orxDefine( "orxFrame_SetParent", {C_POINTER,C_POINTER} ),
	xorxFrame_GetParent           = orxDefine( "orxFrame_GetParent", {C_POINTER}, C_POINTER ),
	xorxFrame_GetChild            = orxDefine( "orxFrame_GetChild", {C_POINTER}, C_POINTER ),
	xorxFrame_GetSibling          = orxDefine( "orxFrame_GetSibling", {C_POINTER}, C_POINTER ),
	xorxFrame_IsRootChild         = orxDefine( "orxFrame_IsRootChild", {C_POINTER}, C_BOOL ),
	xorxFrame_SetPosition         = orxDefine( "orxFrame_SetPosition", {C_POINTER,C_INT,C_POINTER} ),
	xorxFrame_SetRotation         = orxDefine( "orxFrame_SetRotation", {C_POINTER,C_INT,C_FLOAT} ),
	xorxFrame_SetScale            = orxDefine( "orxFrame_SetScale", {C_POINTER,C_INT,C_POINTER} ),
	xorxFrame_GetPosition         = orxDefine( "orxFrame_GetPosition", {C_POINTER,C_INT,C_POINTER}, C_POINTER ),
	xorxFrame_GetRotation         = orxDefine( "orxFrame_GetRotation", {C_POINTER,C_INT}, C_FLOAT ),
	xorxFrame_GetScale            = orxDefine( "orxFrame_GetScale", {C_POINTER,C_INT,C_POINTER}, C_POINTER ),
	xorxFrame_TransformPosition   = orxDefine( "orxFrame_TransformPosition", {C_POINTER,C_INT,C_POINTER}, C_POINTER ),
	xorxFrame_TransformRotation   = orxDefine( "orxFrame_TRansformRotation", {C_POINTER,C_INT,C_FLOAT}, C_FLOAT ),
	xorxFrame_TransformScale      = orxDefine( "orxFrame_TransformScale", {C_POINTER,C_INT,C_POINTER}, C_POINTER )

public function orxFrame_GetIgnoreFlagValues( object _zFlags )
	return orxFunc( xorxFrame_GetIgnoreFlagValues, {_zFlags} )
end function

public function orxFrame_GetIgnoreFlagNames( atom _u32Flags )
	return orxFunc( xorxFrame_GetIgnoreFlagNames, {_u32Flags} )
end function


public procedure orxFrame_Setup()
	orxProc( xorxFrame_Setup, {} )
end procedure

public function orxFrame_Init()
	return orxFunc( xorxFrame_Init, {} )
end function

public procedure orxFrame_Exit()
	orxProc( xorxFrame_Exit, {} )
end procedure


public function orxFrame_Create( atom _u32Flags )
	return orxFunc( xorxFrame_Create, {_u32Flags} )
end function

public function orxFrame_Delete( object _pstFrame )
	return orxFunc( xorxFrame_Delete, {_pstFrame} )
end function


public function orxFrame_SetParent( object _pstFrame, object _pstParent )
	return orxFunc( xorxFrame_SetParent, {_pstFrame,_pstParent} )
end function

public function orxFrame_GetParent( object _pstFrame )
	return orxFunc( xorxFrame_GetParent, {_pstFrame} )
end function

public function orxFrame_GetChild( object _pstFrame )
	return orxFunc( xorxFrame_GetChild, {_pstFrame} )
end function

public function orxFrame_GetSibling( object _pstFrame )
	return orxFunc( xorxFrame_GetSibling, {_pstFrame} )
end function

public function orxFrame_IsRootChild( object _pstFrame )
	return orxFunc( xorxFrame_IsRootChild, {_pstFrame} )
end function


public procedure orxFrame_SetPosition( object _pstFrame, atom _eSpace, object _pvPos )

	_pvPos = allocate_data( SIZEOF_ORXVECTOR )

	orxProc( xorxFrame_SetPosition, {_pstFrame,_eSpace,_pvPos} )
end procedure

public procedure orxFrame_SetRotation( object _pstFrame, atom _eSpace, atom _fRot )
	orxProc( xorxFrame_SetRotation, {_pstFrame,_eSpace,_fRot} )
end procedure

public procedure orxFrame_SetScale( object _pstFrame, atom _eSpace, object _pvScale )

	_pvScale = allocate_data( SIZEOF_ORXVECTOR )

	orxProc( xorxFrame_SetScale, {_pstFrame,_eSpace,_pvScale} )
end procedure


public function orxFrame_GetPosition( object _pstFrame, atom _eSpace, object _pvPos )

	_pvPos = allocate_data( SIZEOF_ORXVECTOR )

	return orxFunc( xorxFrame_GetPosition, {_pstFrame,_eSpace,_pvPos} )
end function

public function orxFrame_GetRotation( object _pstFrame, atom _eSpace )
	return orxFunc( xorxFrame_GetRotation, {_pstFrame,_eSpace} )
end function

public function orxFrame_GetScale( object _pstFrame, atom _eSpace, object _pvScale )

	_pvScale = allocate_data( SIZEOF_ORXVECTOR )

	return orxFunc( xorxFrame_GetScale, {_pstFrame,_eSpace,_pvScale} )
end function


public function orxFrame_TransformPosition( object _pstFrame, atom _eSpace, object _pvPos )

	_pvPos = allocate_data( SIZEOF_ORXVECTOR )

	return orxFunc( xorxFrame_TransformPosition, {_pstFrame,_eSpace,_pvPos} )
end function

public function orxFrame_TransformRotation( object _pstFrame, atom _eSpace, atom _fRot )
	return orxFunc( xorxFrame_TransformRotation, {_pstFrame,_eSpace,_fRot} )
end function

public function orxFrame_TransformScale( object _pstFrame, atom _eSpace, object _pvScale )

	_pvScale = allocate_data( SIZEOF_ORXVECTOR )

	return orxFunc( xorxFrame_TransformScale, {_pstFrame,_eSpace,_pvScale} )
end function
­203.70