
include "orxInclude.e"

public include "core/orxClock.e"
public include "render/orxCamera.e"
public include "render/orxShaderPointer.e"
public include "display/orxDisplay.e"
public include "display/orxTexture.e"

constant
	xorxViewport_Setup                = orxDefine( "orxViewport_Setup", {} ),
	xorxViewport_Init                 = orxDefine( "orxViewport_Init", {}, C_UINT ),
	xorxViewport_Exit                 = orxDefine( "orxViewport_Exit", {} ),
	xorxViewport_Create               = orxDefine( "orxViewport_Create", {}, C_POINTER ),
	xorxViewport_CreateFromConfig     = orxDefine( "orxViewport_CreateFromConfig", {C_STRING}, C_POINTER ),
	xorxViewport_Delete               = orxDefine( "orxViewport_Delete", {C_POINTER}, C_UINT ),
	xorxViewport_SetTextureList       = orxDefine( "orxViewport_SetTextureList", {C_POINTER,C_UINT,C_POINTER} ),
	xorxViewport_GetTextureList       = orxDefine( "orxViewport_GetTextureList", {C_POINTER,C_UINT,C_POINTER}, C_UINT ),
	xorxViewport_GetTextureCount      = orxDefine( "orxViewport_GetTextureCount", {C_POINTER}, C_UINT ),
	xorxViewport_SetBackgroundColor   = orxDefine( "orxViewport_SetBackgroundColor", {C_POINTER,C_POINTER}, C_UINT ),
	xorxViewport_ClearBackgroundColor = orxDefine( "orxViewport_ClearBackgroundColor", {C_POINTER}, C_UINT ),
	xorxViewport_HasBackgroundColor   = orxDefine( "orxViewport_HasBackgroundColor", {C_POINTER}, C_BOOL ),
	xorxViewport_GetBackgroundColor   = orxDefine( "orxViewport_GetBackgroundColor", {C_POINTER,C_POINTER}, C_POINTER ),
	xorxViewport_Enable               = orxDefine( "orxViewport_Enable", {C_POINTER,C_BOOL} ),
	xorxViewport_IsEnabled            = orxDefine( "orxViewport_IsEnabled", {C_POINTER}, C_BOOL ),
	xorxViewport_SetCamera            = orxDefine( "orxViewport_SetCamera", {C_POINTER,C_POINTER} ),
	xorxViewport_GetCamera            = orxDefine( "orxViewport_GetCamera", {C_POINTER}, C_POINTER ),
	xorxViewport_AddShader            = orxDefine( "orxViewport_AddShader", {C_POINTER,C_STRING}, C_UINT ),
	xorxViewport_RemoveShader         = orxDefine( "orxViewport_RemoveShader", {C_POINTER,C_STRING}, C_UINT ),
	xorxViewport_EnableShader         = orxDefine( "orxViewport_EnableShader", {C_POINTER,C_BOOL} ),
	xorxViewport_IsShaderEnabled      = orxDefine( "orxViewport_IsShaderEnabled", {C_POINTER}, C_BOOL ),
	xorxViewport_GetShaderPointer     = orxDefine( "orxViewport_GetShaderPointer", {C_POINTER}, C_POINTER ),
	xorxViewport_SetBlendMode         = orxDefine( "orxViewport_SetBlendMode", {C_POINTER,C_UINT}, C_UINT ),
	xorxViewport_GetBlendMode         = orxDefine( "orxViewport_GetBlendMode", {C_POINTER}, C_UINT ),
	xorxViewport_SetPosition          = orxDefine( "orxViewport_SetPosition", {C_POINTER,C_FLOAT,C_FLOAT} ),
	xorxViewport_SetRelativePosition  = orxDefine( "orxViewport_SetRelativePosition", {C_POINTER,C_UINT}, C_UINT ),
	xorxViewport_GetPosition          = orxDefine( "orxViewport_GetPosition", {C_POINTER,C_POINTER,C_POINTER} ),
	xorxViewport_SetSize              = orxDefine( "orxViewport_SetSize", {C_POINTER,C_FLOAT,C_FLOAT} ),
	xorxViewport_SetRelativeSize      = orxDefine( "orxViewport_SetRelativeSize", {C_POINTER,C_FLOAT,C_FLOAT}, C_UINT ),
	xorxViewport_GetSize              = orxDefine( "orxViewport_GetSize", {C_POINTER,C_POINTER,C_POINTER} ),
	xorxViewport_GetRelativeSize      = orxDefine( "orxViewport_GetRelativeSize", {C_POINTER,C_POINTER,C_POINTER} ),
	xorxViewport_GetBox               = orxDefine( "orxViewport_GetBox", {C_POINTER,C_POINTER}, C_POINTER ),
	xorxViewport_GetCorrectionRatio   = orxDefine( "orxViewport_GetCorrectionRatio", {C_POINTER}, C_FLOAT ),
	xorxViewport_GetName              = orxDefine( "orxViewport_GetName", {C_POINTER}, C_STRING ),
	xorxViewport_Get                  = orxDefine( "orxViewport_Get", {C_STRING}, C_POINTER )


public constant orxVIEWPORT_KU32_FLAG_ALIGN_CENTER  = 0x00000000
public constant orxVIEWPORT_KU32_FLAG_ALIGN_LEFT    = 0x10000000
public constant orxVIEWPORT_KU32_FLAG_ALIGN_RIGHT   = 0x20000000
public constant orxVIEWPORT_KU32_FLAG_ALIGN_TOP     = 0x40000000
public constant orxVIEWPORT_KU32_FLAG_ALIGN_BOTTOM  = 0x80000000
public constant orxVIEWPORT_KU32_FLAG_NO_DEBUG      = 0x01000000

public constant orxVIEWPORT_KU32_MAX_TEXTURE_NUMBER = 8

public enum type orxVIEWPORT_EVENT

	orxVIEWPORT_EVENT_RESIZE = 0,
	orxVIEWPORT_EVENT_NUMBER,
	orxVIEWPORT_EVENT_NONE = 0xFFFFFFFF -- orxENUM_NONE

end type -- orxVIEWPORT_EVENT

public procedure orxViewport_Setup()
	orxProc( xorxViewport_Setup, {} )
end procedure

public function orxViewport_Init()
	return orxFunc( xorxViewport_Init, {} )
end function

public procedure orxViewport_Exit()
	orxProc( xorxViewport_Exit, {} )
end procedure

public function orxViewport_Create()
	return orxFunc( xorxViewport_Create, {} )
end function

public function orxViewport_CreateFromConfig( object _zConfigID )
	return orxFunc( xorxViewport_CreateFromConfig, {_zConfigID} )
end function

public function orxViewport_Delete( atom _pstViewport )
	return orxFunc( xorxViewport_Delete, {_pstViewport} )
end function

public procedure orxViewport_SetTextureList( atom _pstViewport, atom _u32TextureNumber, atom _apstTextureList )
	orxProc( xorxViewport_SetTextureList, {_pstViewport,_u32TextureNumber,_apstTextureList} )
end procedure

public function orxViewport_GetTextureList( atom _pstViewport, atom _u32TextureNumber, atom _apstTextureList )
	return orxFunc( xorxViewport_GetTextureList, {_pstViewport,_u32TextureNumber,_apstTextureList} )
end function

public function orxViewPort_GetTextureCount( atom _pstViewport )
	return orxFunc( xorxViewport_GetTextureCount, {_pstViewport} )
end function

public function orxViewport_SetBackgroundColor( atom _pstViewport, atom _pstColor )
	return orxFunc( xorxViewport_SetBackgroundColor, {_pstViewport,_pstColor} )
end function

public function orxViewport_ClearBackgroundColor( atom _pstViewport )
	return orxFunc( xorxViewport_ClearBackgroundColor, {_pstViewport} )
end function

public function orxViewport_HasBackgroundColor( atom _pstViewport )
	return orxFunc( xorxViewport_HasBackgroundColor, {_pstViewport} )
end function

public function orxViewport_GetBackgroundColor( atom _pstViewport, atom _pstColor )
	return orxFunc( xorxViewport_GetBackgroundColor, {_pstViewport,_pstColor} )
end function

public procedure orxViewport_Enable( atom _pstViewport, atom _bEnable )
	orxProc( xorxViewport_Enable, {_pstViewport,_bEnable} )
end procedure

public function orxViewport_IsEnabled( atom _pstViewport )
	return orxFunc( xorxViewport_IsEnabled, {_pstViewport} )
end function

public procedure orxViewport_SetCamera( atom _pstViewport, atom _pstCamera )
	orxProc( xorxViewport_SetCamera, {_pstViewport,_pstCamera} )
end procedure

public function orxViewport_GetCamera( atom _pstViewport )
	return orxFunc( xorxViewport_GetCamera, {_pstViewport} )
end function

public function orxViewport_AddShader( atom _pstViewport, object _zShaderConfigID )
	return orxFunc( xorxViewport_AddShader, {_pstViewport,_zShaderConfigID} )
end function

public function orxViewport_RemoveShader( atom _pstViewport, object _zShaderConfigID )
	return orxFunc( xorxViewport_RemoveShader, {_pstViewport,_zShaderConfigID} )
end function

public procedure orxViewport_EnableShader( atom _pstViewport, atom _bEnable )
	orxProc( xorxViewport_EnableShader, {_pstViewport,_bEnable} )
end procedure

public function orxViewport_IsShaderEnabled( atom _pstViewport )
	return orxFunc( xorxViewport_IsShaderEnabled, {_pstViewport} )
end function

public function orxViewport_GetShaderPointer( atom _pstViewport )
	return orxFunc( xorxViewport_GetShaderPointer, {_pstViewport} )
end function

public function orxViewport_SetBlendMode( atom _pstViewport, atom _eBlendMode )
	return orxFunc( xorxViewport_SetBlendMode, {_pstViewport,_eBlendMode} )
end function

public function orxViewport_GetBlendMode( atom _pstViewport )
	return orxFunc( xorxViewport_GetBlendMode, {_pstViewport} )
end function

public procedure orxViewport_SetPosition( atom _pstViewport, atom _fX, atom _fY )
	orxProc( xorxViewport_SetPosition, {_pstViewport,_fX,_fY} )
end procedure

public function orxViewport_SetRelativePosition( atom _pstViewport, atom _u32AlignFlags )
	return orxFunc( xorxViewport_SetRelativePosition, {_pstViewport,_u32AlignFlags} )
end function

public procedure orxViewport_GetPosition( atom _pstViewport, atom _pfX, atom _pfY )
	orxProc( xorxViewport_GetPosition, {_pstViewport,_pfX,_pfY} )
end procedure

public procedure orxViewport_SetSize( atom _pstViewport, atom _fWidth, atom _fHeight )
	orxProc( xorxViewport_SetSize, {_pstViewport,_fWidth,_fHeight} )
end procedure

public function orxViewport_SetRelativeSize( atom _pstViewport, atom _fWidth, atom _fHeight )
	return orxFunc( xorxViewport_SetRelativeSize, {_pstViewport,_fWidth,_fHeight} )
end function

public procedure orxViewport_GetSize( atom _pstViewport, atom _pfWidth, atom _pfHeight )
	orxProc( xorxViewport_GetSize, {_pstViewport,_pfWidth,_pfHeight} )
end procedure

public procedure orxViewport_GetRelativeSize( atom _pstViewport, atom _pfWidth, atom _pfHeight )
	orxProc( xorxViewport_GetRelativeSize, {_pstViewport,_pfWidth,_pfHeight} )
end procedure

public function orxViewport_GetBox( atom _pstViewport, atom _pstBox )
	return orxFunc( xorxViewport_GetBox, {_pstViewport,_pstBox} )
end function

public function orxViewport_GetCorrectionRatio( atom _pstViewport )
	return orxFunc( xorxViewport_GetCorrectionRatio, {_pstViewport} )
end function

public function orxViewport_GetName( atom _pstViewport )
	return orxFunc( xorxViewport_GetName, {_pstViewport} )
end function

public function orxViewport_Get( object _zName )
	return orxFunc( xorxViewport_Get, {_zName} )
end function
