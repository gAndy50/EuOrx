
public include "orxInclude.e"
public include "core/orxSystem.e"
public include "utils/orxString.e"

constant
	xorxClock_Setup             = orxDefine( "orxClock_Setup", {} ),
	xorxClock_Init              = orxDefine( "orxClock_Init", {}, C_UINT ),
	xorxClock_Exit              = orxDefine( "orxClock_Exit", {} ),
	xorxClock_Update            = orxDefine( "orxClock_Update", {}, C_UINT ),
	xorxClock_Create            = orxDefine( "orxClock_Create", {C_FLOAT}, C_POINTER ),
	xorxClock_CreateFromConfig  = orxDefine( "orxClock_CreateFromConfig", {C_STRING}, C_POINTER ),
	xorxClock_Delete            = orxDefine( "orxClock_Delete", {C_POINTER}, C_UINT ),
	xorxClock_Resync            = orxDefine( "orxClock_Resync", {C_POINTER}, C_UINT ),
	xorxClock_ResyncAll         = orxDefine( "orxClock_ResyncAll", {}, C_UINT ),
	xorxClock_Restart           = orxDefine( "orxClock_Restart", {C_POINTER}, C_UINT ),
	xorxClock_Pause             = orxDefine( "orxClock_Pause", {C_POINTER}, C_UINT ),
	xorxClock_Unpause           = orxDefine( "orxClock_Unpause", {C_POINTER}, C_UINT ),
	xorxClock_IsPaused          = orxDefine( "orxClock_IsPaused", {C_POINTER}, C_BOOL ),
	xorxClock_GetInfo           = orxDefine( "orxClock_GetInfo", {C_POINTER}, C_POINTER ),
	xorxClock_GetFromInfo       = orxDefine( "orxClock_GetFromInfo", {C_POINTER}, C_POINTER ),
	xorxClock_SetModifier       = orxDefine( "orxClock_SetModifier", {C_POINTER,C_UINT,C_FLOAT}, C_UINT ),
	xorxClock_SetTickSize       = orxDefine( "orxClock_SetTickSize", {C_POINTER,C_FLOAT}, C_UINT ),
	xorxClock_Register          = orxDefine( "orxClock_Register", {C_POINTER,C_POINTER,C_POINTER,C_UINT,C_UINT}, C_UINT ),
	xorxClock_Unregister        = orxDefine( "orxClock_Unregister", {C_POINTER,C_POINTER}, C_UINT ),
	xorxClock_GetContext        = orxDefine( "orxClock_GetContext", {C_POINTER,C_POINTER}, C_POINTER ),
	xorxClock_SetContext        = orxDefine( "orxClock_SetContext", {C_POINTER,C_POINTER,C_POINTER}, C_UINT ),
	xorxClock_GetNext           = orxDefine( "orxClock_GetNext", {C_POINTER}, C_POINTER ),
	xorxClock_Get               = orxDefine( "orxClock_Get", {C_STRING}, C_POINTER ),
	xorxClock_GetName           = orxDefine( "orxClock_GetName", {C_POINTER}, C_STRING ),
	xorxClock_AddTimer          = orxDefine( "orxClock_AddTimer", {C_POINTER,C_POINTER,C_FLOAT,C_INT,C_POINTER}, C_UINT ),
	xorxClock_RemoveTimer       = orxDefine( "orxClock_RemoveTimer", {C_POINTER,C_POINTER,C_FLOAT,C_POINTER}, C_UINT ),
	xorxClock_AddGlobalTimer    = orxDefine( "orxClock_AddGlobalTimer", {C_POINTER,C_FLOAT,C_UINT,C_POINTER}, C_UINT ),
	xorxClock_RemoveGlobalTimer = orxDefine( "orxClock_RemoveGlobalTimer", {C_POINTER,C_FLOAT,C_POINTER}, C_UINT )

public constant orxCLOCK_KU32_CLOCK_BANK_SIZE       = 16
public constant orxCLOCK_KU32_TIMER_BANK_SIZE       = 32
public constant orxCLOCK_KU32_FUNCTION_BANK_SIZE    = 16
public constant orxCLOCK_KZ_CORE                    = "core"

public enum type orxCLOCK_MODIFIER

	orxCLOCK_MODIFIER_FIXED = 0,
	orxCLOCK_MODIFIER_MULTIPLY,
	orxCLOCK_MODIFIER_MAXED,
	orxCLOCK_MODIFIER_AVERAGE,
	orxCLOCK_MODIFIER_NUMBER,
	orxCLOCK_MODIFIER_NONE = 0xFFFFFFFF -- orxENUM_NONE

end type -- orxCLOCK_MODIFIER

public enum type orxCLOCK_PRIORITY

	orxCLOCK_PRIORITY_LOWEST = 0,
	orxCLOCK_PRIORITY_LOWER,
	orxCLOCK_PRIORITY_LOW,
	orxCLOCK_PRIORITY_NORMAL,
	orxCLOCK_PRIORITY_HIGH,
	orxCLOCK_PRIORITY_HIGHER,
	orxCLOCK_PRIORITY_HIGHEST,
	orxCLOCK_PRIORITY_NUMBER,
	orxCLOCK_PRIORITY_NONE = 0xFFFFFFFF --orxENUM_NONE

end type -- orxCLOCK_PRIORITY

public constant
	orxCLOCK_INFO_fTickSize      =  0, -- orxFLOAT (4 )
	orxCLOCK_INFO_fDT            =  4, -- orxFLOAT (4 )
	orxCLOCK_INFO_fTime          =  8, -- orxFLOAT (4 )
	orxCLOCK_INFO_afModifierList = 12, -- orxFLOAT[orxCLOCK_MODIFIER_NUMBER] (12 )
	SIZEOF_ORXCLOCK_INFO         = 24

public enum type orxCLOCK_EVENT

	orxCLOCK_EVENT_RESTART = 0,
	orxCLOCK_EVENT_RESYNC,
	orxCLOCK_EVENT_PAUSE,
	orxCLOCK_EVENT_UNPAUSE,
	orxCLOCK_EVENT_NUMBER,
	orxCLOCK_EVENT_NONE = 0xFFFFFFFF -- orxENUM_NONE

end type -- orxCLOCK_EVENT

public procedure orxClock_Setup()
	orxProc( xorxClock_Setup, {} )
end procedure

public function orxClock_Init()
	return orxFunc( xorxClock_Init, {} )
end function

public procedure orxClock_Exit()
	orxProc( xorxClock_Exit, {} )
end procedure

public function orxClock_Update()
	return orxFunc( xorxClock_Update, {} )
end function

public function orxClock_Create( atom _fTickSize )
	return orxFunc( xorxClock_Create, {_fTickSize} )
end function

public function orxClock_CreateFromConfig( object _zConfigID )
	return orxFunc(xorxClock_CreateFromConfig, {_zConfigID} )
end function

public function orxClock_Delete( atom _pstClock )
	return orxFunc( xorxClock_Delete, {_pstClock} )
end function

public function orxClock_Resync( atom _pstClock )
	return orxFunc( xorxClock_Resync, {_pstClock} )
end function

public function orxClock_ResyncAll()
	return orxFunc( xorxClock_ResyncAll, {} )
end function

public function orxClock_Restart( atom _pstClock )
	return orxFunc( xorxClock_Restart, {_pstClock} )
end function

public function orxClock_Pause( atom _pstClock )
	return orxFunc( xorxClock_Pause, {_pstClock} )
end function

public function orxClock_Unpause( atom _pstClock )
	return orxFunc( xorxClock_Unpause, {_pstClock} )
end function

public function orxClock_IsPaused( atom _pstClock )
	return orxFunc( xorxClock_IsPaused, {_pstClock} )
end function

public function orxClock_GetInfo( atom _pstClock )
	return orxFunc( xorxClock_GetInfo, {_pstClock} )
end function

public function orxClock_GetFromInfo( atom _pstClock )
	return orxFunc( xorxClock_GetFromInfo, {_pstClock} )
end function

public function orxClock_SetModifier( atom _pstClock, atom _eModifier, atom _fValue )
	return orxFunc( xorxClock_SetModifier, {_pstClock,_eModifier,_fValue} )
end function

public function orxClock_SetTickSize( atom _pstClock, atom _eModifier )
	return orxFunc( xorxClock_SetTickSize, {_pstClock,_eModifier} )
end function

public function orxClock_Register( atom _pstClock, object _pfnCallback, atom _pContext, atom _eModuleID, atom _ePriority, integer _ridCallback=routine_id(_pfnCallback) )

	if sequence( _pfnCallback ) then
		_pfnCallback = orxCallback( _ridCallback, _pfnCallback )
	end if

	return orxFunc( xorxClock_Register, {_pstClock,_pfnCallback,_pContext,_eModuleID,_ePriority} )
end function

public function orxClock_Unregister( atom _pstClock, object _pfnCallback, integer _ridCallback=routine_id(_pfnCallback) )

	if sequence( _pfnCallback ) then
		_pfnCallback = orxCallback( _ridCallback, _pfnCallback )
	end if

	return orxFunc( xorxClock_Unregister, {_pstClock,_pfnCallback} )
end function

public function orxClock_GetContext( atom _pstClock, object _pfnCallback, integer _ridCallback=routine_id(_pfnCallback) )

	if sequence( _pfnCallback ) then
		_pfnCallback = orxCallback( _ridCallback, _pfnCallback )
	end if

	return orxFunc( xorxClock_GetContext, {_pstClock,_pfnCallback} )
end function

public function orxClock_SetContext( atom _pstClock, object _pfnCallback, atom _pContext, integer _ridCallback=routine_id(_pfnCallback) )

	if sequence( _pfnCallback ) then
		_pfnCallback = orxCallback( _ridCallback, _pfnCallback )
	end if

	return orxFunc( xorxClock_SetContext, {_pstClock,_pfnCallback,_pContext} )
end function

public function orxClock_GetNext( atom _pstClock )
	return orxFunc( xorxClock_GetNext, {_pstClock} )
end function

public function orxClock_Get( object _zName )
	return orxFunc( xorxClock_Get, {_zName} )
end function

public function orxClock_GetName( atom _pstClock )
	return orxFunc( xorxClock_GetName, {_pstClock} )
end function

public function orxClock_AddTimer( atom _pstClock, object _pfnCallback, atom _fDelay, atom _s32Repetition, atom _pContext, integer _ridCallback=routine_id(_pfnCallback) )

	if sequence( _pfnCallback ) then
		_pfnCallback = orxCallback( _ridCallback, _pfnCallback )
	end if

	return orxFunc( xorxClock_AddTimer, {_pstClock,_pfnCallback,_fDelay,_s32Repetition,_pContext} )
end function

public function orxClock_RemoveTimer( atom _pstClock, object _pfnCallback, atom _fDelay, atom _pContext, integer _ridCallback=routine_id(_pfnCallback) )

	if sequence( _pfnCallback ) then
		_pfnCallback = orxCallback( _ridCallback, _pfnCallback )
	end if

	return orxFunc( xorxClock_RemoveTimer, {_pstClock,_pfnCallback,_fDelay,_pContext} )
end function

public function orxClock_AddGlobalTimer( object _pfnCallback, atom _fDelay, atom _s32Repetition, atom _pContext, integer _ridCallback=routine_id(_pfnCallback) )

	if sequence( _pfnCallback ) then
		_pfnCallback = orxCallback( _ridCallback, _pfnCallback )
	end if

	return orxFunc( xorxClock_AddGlobalTimer, {_pfnCallback,_fDelay,_s32Repetition,_pContext} )
end function

public function orxClock_RemoveGlobalTimer( atom _pfnCallback, atom _fDelay, atom _pContext, integer _ridCallback=routine_id(_pfnCallback) )

	if sequence( _pfnCallback ) then
		_pfnCallback = orxCallback( _ridCallback, _pfnCallback )
	end if

	return orxFunc( xorxClock_RemoveGlobalTimer, {_pfnCallback,_fDelay,_pContext} )
end function
