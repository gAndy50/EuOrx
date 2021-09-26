
include std/machine.e
include "orxInclude.e"

public include "math/orxVector.e"

constant
	xorxSystem_Setup                = orxDefine( "orxSystem_Setup", {} ),
	xorxSystem_Init                 = orxDefine( "orxSystem_Init", {}, C_UINT ),
	xorxSystem_Exit                 = orxDefine( "orxSystem_Exit", {} ),
	xorxSystem_GetTime              = orxDefine( "orxSystem_GetTime", {}, C_DOUBLE ),
	xorxSystem_GetRealTime          = orxDefine( "orxSystem_GetRealTime", {}, C_LONG ),
	xorxSystem_Delay                = orxDefine( "orxSystem_Delay", {C_FLOAT} ),
	xorxSystem_GetVersion           = orxDefine( "orxSystem_GetVersion", {C_POINTER}, C_POINTER ),
	xorxSystem_GetVersionString     = orxDefine( "orxSystem_GetVersionString", {}, C_STRING ),
	xorxSystem_GetVersionFullString = orxDefine( "orxSystem_GetVersionFullString", {}, C_STRING ),
	xorxSystem_GetVersionNumeric    = orxDefine( "orxSystem_GetVersionNumeric", {}, C_UINT ),
	xorxSystem_GetClipboard         = orxDefine( "orxSystem_GetClipboard", {}, C_STRING ),
	xorxSystem_SetClipboard         = orxDefine( "orxSystem_SetClipboard", {C_STRING}, C_UINT )

public enum type orxSYSTEM_EVENT

	orxSYSTEM_EVENT_CLOSE = 0,
	orxSYSTEM_EVENT_FOCUS_GAINED,
	orxSYSTEM_EVENT_FOCUS_LOST,
	orxSYSTEM_EVENT_BACKGROUND,
	orxSYSTEM_EVENT_FOREGROUND,
	orxSYSTEM_EVENT_GAME_LOOP_START,
	orxSYSTEM_EVENT_GAME_LOOP_STOP,
	orxSYSTEM_EVENT_TOUCH_BEGIN,
	orxSYSTEM_EVENT_TOUCH_MOVE,
	orxSYSTEM_EVENT_TOUCH_END,
	orxSYSTEM_EVENT_ACCELERATE,
	orxSYSTEM_EVENT_MOTION_SHAKE,
	orxSYSTEM_EVENT_DROP,
	orxSYSTEM_EVENT_CLIPBOARD,
	orxSYSTEM_EVENT_NUMBER,
	orxSYSTEM_EVENT_NONE = 0xFFFFFFFF --orxENUM_NONE

end type -- orxSYSTEM_EVENT

public constant
	orxSYSTEM_EVENT_PAYLOAD_stTouch_dTime         =  0, -- orxDOUBLE (8)
	orxSYSTEM_EVENT_PAYLOAD_stTouch_u32ID         =  8, -- orxU32    (4)
	orxSYSTEM_EVENT_PAYLOAD_stTouch_fX            = 12, -- orxFLOAT  (4)
	orxSYSTEM_EVENT_PAYLOAD_stTouch_fY            = 16, -- orxFLOAT  (4)
	orxSYSTEM_EVENT_PAYLOAD_stTouch_fPressure     = 20, -- orxFLOAT  (4)
	SIZEOF_ORXSYSTEM_EVENT_PAYLOAD_STTOUCH        = 24

public constant
	orxSYSTEM_EVENT_PAYLOAD_stAccel_dTime         =  0, -- orxDOUBLE  (8)
	orxSYSTEM_EVENT_PAYLOAD_stAccel_vAcceleration =  8, -- orxVECTOR (12)
	SIZEOF_ORXSYSTEM_EVENT_PAYLOAD_STACCEL        = 20

ifdef BITS64 then

public constant
	orxSYSTEM_EVENT_PAYLOAD_stDrop_azValueList    =  0, -- orxSTRING* (8)
	orxSYSTEM_EVENT_PAYLOAD_stDrop_u32Number      =  8, -- orxU32     (4)
	SIZEOF_ORXSYSTEM_EVENT_PAYLOAD_STDROP         = 12

public constant
	orxSYSTEM_EVENT_PAYLOAD_stClipboard_zValue    =  0, -- orxSTRING  (8)
	SIZEOF_ORXSYSTEM_EVENT_PAYLOAD_STCLIPBOARD    =  8

elsedef -- BITS32

public constant
	orxSYSTEM_EVENT_PAYLOAD_stDrop_azValueList    =  0, -- orxSTRING* (4)
	orxSYSTEM_EVENT_PAYLOAD_stDrop_u32Number      =  4, -- orxU32     (4)
	SIZEOF_ORXSYSTEM_EVENT_PAYLOAD_STDROP         =  8

public constant
	orxSYSTEM_EVENT_PAYLOAD_stClipboard_zValue    =  0, -- orxSTRING  (4)
	SIZEOF_ORXSYSTEM_EVENT_PAYLOAD_STCLIPBOARD    =  4

end ifdef

public constant
	orxSYSTEM_EVENT_PAYLOAD_u32FrameCount   =  0,
	orxSYSTEM_EVENT_PAYLOAD_stTouch         =  0,
	orxSYSTEM_EVENT_PAYLOAD_stAccel         =  0,
	orxSYSTEM_EVENT_PAYLOAD_stDrop          =  0,
	orxSYSTEM_EVENT_PAYLOAD_stClipboard     =  0,
	SIZEOF_ORXSYSTEM_EVENT_PAYLOAD          = 24

public procedure orxSystem_Setup()
	orxProc( xorxSystem_Setup, {} )
end procedure

public function orxSystem_Init()
	return orxFunc( xorxSystem_Init, {} )
end function

public procedure orxSystem_Exit()
	orxProc( xorxSystem_Exit, {} )
end procedure

public function orxSystem_GetTime()
	return orxFunc( xorxSystem_GetTime, {} )
end function

public function orxSystem_GetRealTime()
	return orxFunc( xorxSystem_GetRealTime, {} )
end function

public procedure orxSystem_Delay( atom _fSeconds )
	orxProc( xorxSystem_Delay, {_fSeconds} )
end procedure

public function orxSystem_GetVersion( atom _pstVersion=orxNULL )

	if _pstVersion = orxNULL then
		_pstVersion = allocate_data( SIZEOF_ORXVERSION, orxTRUE )
	end if

	if orxFunc( xorxSystem_GetVersion, {_pstVersion} ) != orxNULL then

		atom zRelease = peek_pointer( _pstVersion + orxVERSION_zRelease )
		atom u32Major =       peek4u( _pstVersion + orxVERSION_u32Major )
		atom u32Minor =       peek4u( _pstVersion + orxVERSION_u32Minor )
		atom u32Build =       peek4u( _pstVersion + orxVERSION_u32Build )

		return {u32Major,u32Minor,u32Build,peek_string( zRelease )}

	end if

	return orxNULL
end function

public function orxSystem_GetVersionString()
	return orxFunc( xorxSystem_GetVersionString, {} )
end function

public function orxSystem_GetVersionFullString()
	return orxFunc( xorxSystem_GetVersionFullString, {} )
end function

public function orxSystem_GetVersionNumeric()
	return orxFunc( xorxSystem_GetVersionNumeric, {} )
end function

public function orxSystem_GetClipboard()
	return orxFunc( xorxSystem_GetClipboard, {} )
end function

public function orxSystem_SetClipboard( object _zValue )
	return orxFunc( xorxSystem_SetClipboard, {_zValue} )
end function
