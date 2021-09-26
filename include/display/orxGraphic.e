
include "orxInclude.e"

public include "object/orxStructure.e"
public include "math/orxAABox.e"
public include "display/orxDisplay.e"

constant
	xorxGraphic_Setup            = orxDefine( "orxGraphic_Setup", {} ),
	xorxGraphic_Init             = orxDefine( "orxGraphic_Init", {}, C_INT ),
	xorxGraphic_Exit             = orxDefine( "orxGraphic_Exit", {} ),
	xorxGraphic_GetAlignFlags    = orxDefine( "orxGraphic_GetAlignFlags", {C_STRING}, C_UINT ),
	xorxGraphic_AlignVector      = orxDefine( "orxGraphic_AlignVector", {C_UINT,C_POINTER,C_POINTER}, C_POINTER ),
	xorxGraphic_Create           = orxDefine( "orxGraphic_Create", {}, C_POINTER ),
	xorxGraphic_CreateFromConfig = orxDefine( "orxGraphic_CreateFromConfig", {C_STRING}, C_POINTER ),
	xorxGraphic_Delete           = orxDefine( "orxGraphic_Delete", {C_POINTER}, C_INT ),
	xorxGraphic_Clone            = orxDefine( "orxGraphic_Clone", {C_POINTER}, C_POINTER ),
	xorxGraphic_GetName          = orxDefine( "orxGraphic_GetName", {C_POINTER}, C_STRING ),
	xorxGraphic_SetData          = orxDefine( "orxGraphic_SetData", {C_POINTER,C_POINTER}, C_INT ),
	xorxGraphic_GetData          = orxDefine( "orxGraphic_GetData", {C_POINTER}, C_POINTER ),
	xorxGraphic_SetFlip          = orxDefine( "orxGraphic_SetFlip", {C_POINTER,C_BOOL,C_BOOL}, C_INT ),
	xorxGraphic_GetFlip          = orxDefine( "orxGraphic_GetFlip", {C_POINTER,C_POINTER,C_POINTER}, C_INT ),
	xorxGraphic_SetPivot         = orxDefine( "orxGraphic_SetPivot", {C_POINTER,C_POINTER}, C_INT ),
	xorxGraphic_SetRelativePivot = orxDefine( "orxGraphic_SetRelativePivot", {C_POINTER,C_UINT}, C_INT ),
	xorxGraphic_GetPivot         = orxDefine( "orxGraphic_GetPivot", {C_POINTER,C_POINTER}, C_POINTER ),
	xorxGraphic_SetSize          = orxDefine( "orxGraphic_SetSize", {C_POINTER,C_POINTER}, C_INT ),
	xorxGraphic_GetSize          = orxDefine( "orxGraphic_GetSize", {C_POINTER,C_POINTER}, C_POINTER ),
	xorxGraphic_SetColor         = orxDefine( "orxGraphic_SetColor", {C_POINTER,C_POINTER}, C_INT ),
	xorxGraphic_SetRepeat        = orxDefine( "orxGraphic_SetRepeat", {C_POINTER,C_FLOAT,C_FLOAT}, C_INT ),
	xorxGraphic_ClearColor       = orxDefine( "orxGraphic_ClearColor", {C_POINTER}, C_INT ),
	xorxGraphic_HasColor         = orxDefine( "orxGraphic_HasColor", {C_POINTER}, C_BOOL ),
	xorxGraphic_GetColor         = orxDefine( "orxGraphic_GetColor", {C_POINTER,C_POINTER}, C_POINTER ),
	xorxGraphic_GetRepeat        = orxDefine( "orxGraphic_GetRepeat", {C_POINTER,C_POINTER,C_POINTER}, C_INT ),
	xorxGraphic_SetOrigin        = orxDefine( "orxGraphic_SetOrigin", {C_POINTER,C_POINTER}, C_INT ),
	xorxGraphic_GetOrigin        = orxDefine( "orxGraphic_GetOrigin", {C_POINTER,C_POINTER}, C_POINTER ),
	xorxGraphic_UpdateSize       = orxDefine( "orxGraphic_UpdateSize", {C_POINTER}, C_INT ),
	xorxGraphic_SetSmoothing     = orxDefine( "orxGraphic_SetSmoothing", {C_POINTER,C_INT}, C_INT ),
	xorxGraphic_GetSmoothing     = orxDefine( "orxGraphic_GetSmoothing", {C_POINTER}, C_INT ),
	xorxGraphic_SetBlendMode     = orxDefine( "orxGraphic_SetBlendMode", {C_POINTER,C_INT}, C_INT ),
	xorxGraphic_ClearBlendMode   = orxDefine( "orxGraphic_ClearBlendMode", {C_POINTER}, C_INT ),
	xorxGraphic_HasBlendMode     = orxDefine( "orxGraphic_HasBlendMode", {C_POINTER}, C_BOOL ),
	xorxGraphic_GetBlendMode     = orxDefine( "orxGraphic_GetBlendMode", {C_POINTER}, C_INT )

public constant
	orxGRAPHIC_KU32_FLAG_NONE           = 0x000000000,

	orxGRAPHIC_KU32_FLAG_2D             = 0x000000001,
	orxGRAPHIC_KU32_FLAG_TEXT           = 0x000000002,

	orxGRAPHIC_KU32_MASK_TYPE           = 0x000000003,

	orxGRAPHIC_KU32_FLAG_FLIP_X         = 0x000000004,
	orxGRAPHIC_KU32_FLAG_FLIP_Y         = 0x000000008,
	orxGRAPHIC_KU32_MASK_FLIP_BOTH      = 0x00000000C,

	orxGRAPHIC_KU32_FLAG_ALIGN_CENTER   = 0x000000000,
	orxGRAPHIC_KU32_FLAG_ALIGN_LEFT     = 0x000000010,
	orxGRAPHIC_KU32_FLAG_ALIGN_RIGHT    = 0x000000020,
	orxGRAPHIC_KU32_FLAG_ALIGN_TOP      = 0x000000040,
	orxGRAPHIC_KU32_FLAG_ALIGN_BOTTOM   = 0x000000080,
	orxGRAPHIC_KU32_FLAG_ALIGN_TRUNCATE = 0x000000100,
	orxGRAPHIC_KU32_FLAG_ALIGN_ROUND    = 0x000000200,

	orxGRAPHIC_KU32_MASK_ALIGN          = 0x0000003F0,

	orxGRAPHIC_KU32_MASK_USER_ALL       = 0x000000FFF

public constant
	orxGRAPHIC_KZ_CONFIG_TEXTURE_NAME   = "Texture",
	orxGRAPHIC_KZ_CONFIG_TEXTURE_ORIGIN = "TextureOrigin",
	orxGRAPHIC_KZ_CONFIG_TEXTURE_SIZE   = "TextureSize",
	orxGRAPHIC_KZ_CONFIG_TEXT_NAME      = "Text",
	orxGRAPHIC_KZ_CONFIG_PIVOT          = "Pivot",
	orxGRAPHIC_KZ_CONFIG_COLOR          = "Color",
	orxGRAPHIC_KZ_CONFIG_ALPHA          = "Alpha",
	orxGRAPHIC_KZ_CONFIG_RGB            = "RGB",
	orxGRAPHIC_KZ_CONFIG_HSL            = "HSL",
	orxGRAPHIC_KZ_CONFIG_HSV            = "HSV",
	orxGRAPHIC_KZ_CONFIG_FLIP           = "Flip",
	orxGRAPHIC_KZ_CONFIG_REPEAT         = "Repeat",
	orxGRAPHIC_KZ_CONFIG_SMOOTHING      = "Smoothing",
	orxGRAPHIC_KZ_CONFIG_BLEND_MODE     = "BlendMode",
	orxGRAPHIC_KZ_CONFIG_KEEP_IN_CACHE  = "KeepInCache"

public procedure orxGraphic_Setup()
	orxProc( xorxGraphic_Setup, {} )
end procedure

public function orxGraphic_Init()
	return orxFunc( xorxGraphic_Init, {} )
end function

public procedure orxGraphic_Exit()
	orxProc( xorxGraphic_Exit, {} )
end procedure


public function orxGraphic_GetAlignFlags( object _zAlign )
	return orxFunc( xorxGraphic_GetAlignFlags, {_zAlign} )
end function

public function orxGraphic_AlignVector( atom _u32AlignFlags, object _pstBox, object _pvValue )
	return orxFunc( xorxGraphic_AlignVector, {_u32AlignFlags,_pstBox,_pvValue} )
end function


public function orxGraphic_Create()
	return orxFunc( xorxGraphic_Create, {} )
end function

public function orxGraphic_CreateFromConfig( object _zConfigID )
	return orxFunc( xorxGraphic_CreateFromConfig, {_zConfigID} )
end function

public function orxGraphic_Delete( object _pstGraphic )
	return orxFunc( xorxGraphic_Delete, {_pstGraphic} )
end function

public function orxGraphic_Clone( object _pstGraphic )
	return orxFunc( xorxGraphic_Clone, {_pstGraphic} )
end function

public function orxGraphic_GetName( object _pstGraphic )
	return orxFunc( xorxGraphic_GetName, {_pstGraphic} )
end function


public function orxGraphic_SetData( object _pstGraphic, object _pstData )
	return orxFunc( xorxGraphic_SetData, {_pstGraphic,_pstData} )
end function

public function orxGraphic_GetData( object _pstGraphic )
	return orxFunc( xorxGraphic_GetData, {_pstGraphic} )
end function


public function orxGraphic_SetFlip( object _pstGraphic, atom _bFlipX, atom _bFlipY )
	return orxFunc( xorxGraphic_SetFlip, {_pstGraphic,_bFlipX,_bFlipY} )
end function

public function orxGraphic_GetFlip( object _pstGraphic, atom _pbFlipX, atom _pbFlipY )
	return orxFunc( xorxGraphic_GetFlip, {_pstGraphic,_pbFlipX,_pbFlipY} )
end function


public function orxGraphic_SetPivot( object _pstGraphic, object _pvPivot )
	return orxFunc( xorxGraphic_SetPivot, {_pstGraphic,_pvPivot} )
end function

public function orxGraphic_SetRelativePivot( object _pstGraphic, atom _u32AlignFlags )
	return orxFunc( xorxGraphic_SetRelativePivot, {_pstGraphic,_u32AlignFlags} )
end function

public function orxGraphic_GetPivot( object _pstGraphic, object _pvPivot )
	return orxFunc( xorxGraphic_GetPivot, {_pstGraphic,_pvPivot} )
end function


public function orxGraphic_SetSize( object _pstGraphic, object _pvSize )
	return orxFunc( xorxGraphic_SetSize, {_pstGraphic,_pvSize} )
end function

public function orxGraphic_GetSize( object _pstGraphic, object _pvSize )
	return orxFunc( xorxGraphic_GetSize, {_pstGraphic,_pvSize} )
end function

public function orxGraphic_SetColor( object _pstGraphic, object _pstColor )
	return orxFunc( xorxGraphic_SetColor, {_pstGraphic,_pstColor} )
end function

public function orxGraphic_SetRepeat( object _pstGraphic, atom _fRepeatX, atom _fRepeatY )
	return orxFunc( xorxGraphic_SetRepeat, {_pstGraphic,_fRepeatX,_fRepeatY} )
end function

public function orxGraphic_ClearColor( object _pstGraphic )
	return orxFunc( xorxGraphic_ClearColor, {_pstGraphic} )
end function

public function orxGraphic_HasColor( object _pstGraphic )
	return orxFunc( xorxGraphic_HasColor, {_pstGraphic} )
end function

public function orxGraphic_GetColor( object _pstGraphic, object _pstColor )
	return orxFunc( xorxGraphic_GetColor, {_pstGraphic,_pstColor} )
end function

public function orxGraphic_GetRepeat( object _pstGraphic, atom _pfRepeatX, atom _pfRepeatY )
	return orxFunc( xorxGraphic_GetRepeat, {_pstGraphic,_pfRepeatX,_pfRepeatY} )
end function

public function orxGraphic_SetOrigin( object _pstGraphic, object _pvOrigin )
	return orxFunc( xorxGraphic_SetOrigin, {_pstGraphic,_pvOrigin} )
end function

public function orxGraphic_GetOrigin( object _pstGraphic, object _pvOrigin )
	return orxFunc( xorxGraphic_GetOrigin, {_pstGraphic,_pvOrigin} )
end function

public function orxGraphic_UpdateSize( object _pstGraphic )
	return orxFunc( xorxGraphic_UpdateSize, {_pstGraphic} )
end function

public function orxGraphic_SetSmoothing( object _pstGraphic, atom _eSmoothing )
	return orxFunc( xorxGraphic_SetSmoothing, {_pstGraphic,_eSmoothing} )
end function

public function orxGraphic_GetSmoothing( object _pstGraphic )
	return orxFunc( xorxGraphic_GetSmoothing, {_pstGraphic} )
end function


public function orxGraphic_SetBlendMode( object _pstGraphic, atom _eBlendMode )
	return orxFunc( xorxGraphic_SetBlendMode, {_pstGraphic,_eBlendMode} )
end function

public function orxGraphic_ClearBlendMode( object _pstGraphic )
	return orxFunc( xorxGraphic_ClearBlendMode, {_pstGraphic} )
end function

public function orxGraphic_HasBlendMode( object _pstGraphic )
	return orxFunc( xorxGraphic_HasBlendMode, {_pstGraphic} )
end function

public function orxGraphic_GetBlendMode( object _pstGraphic )
	return orxFunc( xorxGraphic_GetBlendMode, {_pstGraphic} )
end function
­286.55