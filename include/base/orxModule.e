
public include "base/orxVersion.e"

constant
	xorxModule_Register              = orxDefine( "orxModule_Register", {C_INT,C_STRING,C_POINTER,C_POINTER,C_POINTER} ),
	xorxModule_AddDependency         = orxDefine( "orxModule_AddDependency", {C_INT,C_INT} ),
	xorxModule_AddOptionalDependency = orxDefine( "orxModule_AddOptionalDependency", {C_INT,C_INT} ),
	xorxModule_Init                  = orxDefine( "orxModule_Init", {C_INT}, C_INT ),
	xorxModule_IsInitialized         = orxDefine( "orxModule_IsInitialized", {C_INT}, C_BOOL ),
	xorxModule_Exit                  = orxDefine( "orxModule_Exit", {C_INT} ),
	xorxModule_GetName               = orxDefine( "orxModule_GetName", {C_INT}, C_POINTER )

public enum type orxMODULE_ID

	orxMODULE_ID_ANIM = 0,
	orxMODULE_ID_ANIMPOINTER,
	orxMODULE_ID_ANIMSET,
	orxMODULE_ID_BANK,
	orxMODULE_ID_BODY,
	orxMODULE_ID_CAMERA,
	orxMODULE_ID_CLOCK,
	orxMODULE_ID_COMMAND,
	orxMODULE_ID_CONFIG,
	orxMODULE_ID_CONSOLE,
	orxMODULE_ID_DISPLAY,
	orxMODULE_ID_EVENT,
	orxMODULE_ID_FILE,
	orxMODULE_ID_FONT,
	orxMODULE_ID_FPS,
	orxMODULE_ID_FRAME,
	orxMODULE_ID_FX,
	orxMODULE_ID_FXPOINTER,
	orxMODULE_ID_GRAPHIC,
	orxMODULE_ID_INPUT,
	orxMODULE_ID_JOYSTICK,
	orxMODULE_ID_KEYBOARD,
	orxMODULE_ID_LOCALE,
	orxMODULE_ID_MAIN,
	orxMODULE_ID_MEMORY,
	orxMODULE_ID_MOUSE,
	orxMODULE_ID_OBJECT,
	orxMODULE_ID_PARAM,
	orxMODULE_ID_PHYSICS,
	orxMODULE_ID_PLUGIN,
	orxMODULE_ID_PROFILER,
	orxMODULE_ID_RENDER,
	orxMODULE_ID_RESOURCE,
	orxMODULE_ID_SCREENSHOT,
	orxMODULE_ID_SHADER,
	orxMODULE_ID_SHADERPOINTER,
	orxMODULE_ID_SOUND,
	orxMODULE_ID_SOUNDPOINTER,
	orxMODULE_ID_SOUNDSYSTEM,
	orxMODULE_ID_SPAWNER,
	orxMODULE_ID_STRING,
	orxMODULE_ID_STRUCTURE,
	orxMODULE_ID_SYSTEM,
	orxMODULE_ID_TEXT,
	orxMODULE_ID_TEXTURE,
	orxMODULE_ID_THREAD,
	orxMODULE_ID_TIMELINE,
	orxMODULE_ID_VIEWPORT,
	orxMODULE_ID_CORE_NUMBER,
	orxMODULE_ID_USER_DEFINED = orxMODULE_ID_CORE_NUMBER,
	orxMODULE_ID_TOTAL_NUMBER = 64,
	orxMODULE_ID_NONE = 0xFFFFFFFF --orxENUM_NONE

end type -- orxMODULE_ID

public procedure orxModule_Register( atom _eModuleID, object _zModuleName, object _pfnSetup, object _pfnInit, object _pfnExit, integer _ridSetup=routine_id(_pfnSetup), integer _ridInit=routine_id(_pfnInit), integer _ridExit=routine_id(_pfnExit) )

	if sequence( _pfnSetup ) then
		_pfnSetup = orxCallback( _pfnSetup, _ridSetup )
	end if

	if sequence( _pfnInit ) then
		_pfnInit = orxCallback( _pfnInit, _ridInit )
	end if

	if sequence( _pfnExit ) then
		_pfnExit = orxCallback( _pfnExit, _ridExit )
	end if

	orxProc( xorxModule_Register, {_eModuleID,_zModuleName,_pfnSetup,_pfnInit,_pfnExit} )

end procedure

public procedure orxModule_AddDependency( atom _eModuleID, atom _eDependID )
	orxProc( xorxModule_AddDependency, {_eModuleID,_eDependID} )
end procedure

public procedure orxModule_AddOptionalDependency( atom _eModuleID, atom _eDependID )
	orxProc( xorxModule_AddOptionalDependency, {_eModuleID,_eDependID} )
end procedure

public function orxModule_Init( atom _eModuleID )
	return orxFunc( xorxModule_Init, {_eModuleID} )
end function

public procedure orxModule_Exit( atom _eModuleID )
	orxProc( xorxModule_Exit, {_eModuleID} )
end procedure

public function orxModule_IsInitialized( atom _eModuleID )
	return orxFunc( xorxModule_IsInitialized, {_eModuleID} )
end function

public function orxModule_GetName( atom _eModuleID )
	return peek_string( orxFunc( xorxModule_GetName, {_eModuleID} ) )
end function
