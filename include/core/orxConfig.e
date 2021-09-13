
include std/machine.e

public include "orxInclude.e"
public include "math/orxVector.e"

constant
	xorxConfig_Setup            = orxDefine( "orxConfig_Setup", {} ),
	xorxConfig_Init             = orxDefine( "orxConfig_Init", {}, C_UINT ),
	xorxConfig_Exit             = orxDefine( "orxConfig_Exit", {} ),
	xorxConfig_SetEncryptionKey = orxDefine( "orxConfig_SetEncryptionKey", {C_STRING},C_UINT ),
	xorxConfig_GetEncryptionKey = orxDefine( "orxConfig_GetEncryptionKey", {}, C_STRING ),
	xorxConfig_SetBootstrap     = orxDefine( "orxConfig_SetBootstrap", {C_POINTER}, C_UINT ),
	xorxConfig_SetBaseName      = orxDefine( "orxConfig_SetBaseName", {C_STRING}, C_UINT ),
	xorxConfig_GetMainFileName  = orxDefine( "orxConfig_GetMainFileName", {}, C_STRING ),
	xorxConfig_Load             = orxDefine( "orxConfig_Load", {C_STRING}, C_UINT ),
	xorxConfig_LoadFromMemory   = orxDefine( "orxConfig_LoadFromMemory", {C_POINTER,C_UINT}, C_UINT ),
	xorxConfig_ReloadHistory    = orxDefine( "orxConfig_ReloadHistory", {}, C_UINT ),
	xorxConfig_Save             = orxDefine( "orxConfig_Save", {C_STRING,C_BOOL,C_POINTER},  C_UINT )

public constant orxCONFIG_KZ_RESOURCE_GROUP = "Config"

public enum type orxCONFIG_EVENT

	orxCONFIG_EVENT_RELOAD_START = 0,
	orxCONFIG_EVENT_RELOAD_STOP,
	orxCONFIG_EVENT_NUMBER,
	orxCONFIG_EVENT_NONE = 0xFFFFFFFF -- orxENUM_NONE

end type -- orxCONFIG_EVENT

public procedure orxConfig_Setup()
	orxProc( xorxConfig_Setup, {} )
end procedure

public function orxConfig_Init()
	return orxFunc( xorxConfig_Init, {} )
end function

public procedure orxConfig_Exit()
	orxProc( xorxConfig_Exit, {} )
end procedure

public function orxConfig_SetEncryptionKey( object _zEncryptionKey )
	return orxFunc( xorxConfig_SetEncryptionKey, {_zEncryptionKey} )
end function

public function orxConfig_GetEncryptionKey()
	return orxFunc( xorxConfig_GetEncryptionKey, {} )
end function

public function orxConfig_SetBootstrap( object _pfnBootstrap, integer _ridBootstrap=routine_id(_pfnBootstrap) )

	if sequence( _pfnBootstrap ) then
		_pfnBootstrap = orxCallback( _ridBootstrap, _pfnBootstrap )
	end if

	return orxFunc( xorxConfig_SetBootstrap, {_pfnBootstrap} )
end function

public function orxConfig_SetBaseName( object _zBaseName )
	return orxFunc( xorxConfig_SetBaseName, {_zBaseName} )
end function

public function orxConfig_GetMainFileName()
	return orxFunc( xorxConfig_GetMainFileName, {} )
end function

public function orxConfig_Load( object _zFileName )
	return orxFunc( xorxConfig_Load, {_zFileName} )
end function

public function orxConfig_LoadFromMemory( object _acBuffer, atom _u32BufferSize=0 )

	if sequence( _acBuffer ) then

		atom size = length( _acBuffer )
		atom temp = allocate_data( size, orxTRUE )

		poke( temp, _acBuffer )

		_acBuffer = temp
		_u32BufferSize = size

	end if

	return orxFunc( xorxConfig_LoadFromMemory, {_acBuffer,_u32BufferSize} )
end function

public function orxConfig_ReloadHistory()
	return orxFunc( xorxConfig_ReloadHistory, {} )
end function

public function orxConfig_Save( object _zFileName, atom _bUseEncryption, object _pfnSaveCallback, integer _ridSaveCallback=routine_id(_pfnSaveCallback) )

	if sequence( _pfnSaveCallback ) then
		_pfnSaveCallback = orxCallback( _ridSaveCallback, _pfnSaveCallback )
	end if

	return orxFunc( xorxConfig_Save, {_zFileName,_bUseEncryption,_pfnSaveCallback} )
end function
