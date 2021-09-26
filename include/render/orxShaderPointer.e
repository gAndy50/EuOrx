
include "orxInclude.e"

public include "render/orxShader.e"
public include "object/orxStructure.e"

public constant orxSHADERPOINTER_KU32_SHADER_NUMBER = 4

constant
	xorxShaderPointer_Setup                  = orxDefine( "orxShaderPointer_Setup", {} ),
	xorxShaderPointer_Init                   = orxDefine( "orxShaderPointer_Init", {}, C_INT ),
	xorxShaderPointer_Exit                   = orxDefine( "orxShaderPointer_Exit", {} ),
	xorxShaderPointer_Create                 = orxDefine( "orxShaderPointer_Create", {}, C_POINTER ),
	xorxShaderPointer_Delete                 = orxDefine( "orxShaderPointer_Delete", {C_POINTER}, C_INT ),
	xorxShaderPointer_Start                  = orxDefine( "orxShaderPointer_Start", {C_POINTER}, C_INT ),
	xorxShaderPointer_Stop                   = orxDefine( "orxShaderPointer_Stop", {C_POINTER}, C_INT ),
	xorxShaderPointer_Enable                 = orxDefine( "orxShaderPointer_Enable", {C_POINTER,C_BOOL} ),
	xorxShaderPointer_IsEnabled              = orxDefine( "orxShaderPointer_IsEnabled", {C_POINTER}, C_BOOL ),
	xorxShaderPointer_AddShader              = orxDefine( "orxShaderPointer_AddShader", {C_POINTER,C_POINTER}, C_INT ),
	xorxShaderPointer_RemoveShader           = orxDefine( "orxShaderPointer_RemoveShader", {C_POINTER,C_POINTER}, C_INT ),
	xorxShaderPointer_GetShader              = orxDefine( "orxShaderPointer_GetShader", {C_POINTER,C_UINT}, C_POINTER ),
	xorxShaderPointer_AddShaderFromConfig    = orxDefine( "orxShaderPointer_AddShaderFromConfig", {C_POINTER,C_STRING}, C_INT ),
	xorxShaderPointer_RemoveShaderFromConfig = orxDefine( "orxShaderPointer_RemoveShaderFromConfig", {C_POINTER,C_STRING}, C_INT )

public procedure orxShaderPointer_Setup()
	orxProc( xorxShaderPointer_Setup, {} )
end procedure

public function orxShaderPointer_Init()
	return orxFunc( xorxShaderPointer_Init, {} )
end function

public procedure orxShaderPointer_Exit()
	orxProc( xorxShaderPointer_Exit, {} )
end procedure


public function orxShaderPointer_Create()
	return orxFunc( xorxShaderPointer_Create, {} )
end function

public function orxShaderPointer_Delete( object _pstShaderPointer )
	return orxFunc( xorxShaderPointer_Delete, {_pstShaderPointer} )
end function

public function orxShaderPointer_Start( object _pstShaderPointer )
	return orxFunc( xorxShaderPointer_Start, {_pstShaderPointer} )
end function

public function orxShaderPointer_Stop( object _pstShaderPointer )
	return orxFunc( xorxShaderPointer_Stop, {_pstShaderPointer} )
end function

public procedure orxShaderPointer_Enable( object _pstShaderPointer, atom _bEnable )
	orxProc( xorxShaderPointer_Enable, {_pstShaderPointer,_bEnable} )
end procedure

public function orxShaderPointer_IsEnabled( object _pstShaderPointer )
	return orxFunc( xorxShaderPointer_IsEnabled, {_pstShaderPointer} )
end function


public function orxShaderPointer_AddShader( object _pstShaderPointer, object _pstShader )
	return orxFunc( xorxShaderPointer_AddShader, {_pstShaderPointer,_pstShader} )
end function

public function orxShaderPointer_RemoveShader( object _pstShaderPointer, object _pstShader )
	return orxFunc( xorxShaderPointer_RemoveShader, {_pstShaderPointer,_pstShader} )
end function

public function orxShaderPointer_GetShader( object _pstShaderPointer, atom _u32Index )
	return orxFunc( xorxShaderPointer_GetShader, {_pstShaderPointer,_u32Index} )
end function

public function orxShaderPointer_AddShaderFromConfig( object _pstShaderPointer, object _zShaderConfigID )
	return orxFunc( xorxShaderPointer_AddShaderFromConfig, {_pstShaderPointer,_zShaderConfigID} )
end function

public function orxShaderPointer_RemoveShaderFromConfig( object _pstShaderPointer, object _zShaderConfigID )
	return orxFunc( xorxShaderPointer_RemoveShaderFromConfig, {_pstShaderPointer,_zShaderConfigID} )
end function
­105.94