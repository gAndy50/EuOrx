
include std/machine.e
include std/map.e
include std/math.e
include "orxInclude.e"

constant
	xorxEvent_Setup                    = orxDefine( "orxEvent_Setup", {} ),
	xorxEvent_Init                     = orxDefine( "orxEvent_Init", {}, C_INT ),
	xorxEvent_Exit                     = orxDefine( "orxEvent_Exit", {} ),
	xorxEvent_AddHandler               = orxDefine( "orxEvent_AddHandler", {C_INT,C_POINTER}, C_INT ),
	xorxEvent_AddHandlerWithContext    = orxDefine( "orxEvent_AddHandlerWithContext", {C_INT,C_POINTER,C_POINTER}, C_INT ),
	xorxEvent_RemoveHandler            = orxDefine( "orxEvent_RemoveHandler", {C_INT,C_POINTER}, C_INT ),
	xorxEvent_RemoveHandlerWithContext = orxDefine( "orxEvent_RemoveHandlerWithContext", {C_INT,C_POINTER,C_POINTER}, C_INT ),
	xorxEvent_SetHandlerIDFlags        = orxDefine( "orxEvent_SetHandlerIDFlags", {C_POINTER,C_INT,C_POINTER,C_UINT,C_UINT}, C_INT ),
	xorxEvent_Send                     = orxDefine( "orxEvent_Send", {C_POINTER}, C_INT ),
	xorxEvent_SendShort                = orxDefine( "orxEvent_SendShort", {C_INT,C_INT}, C_INT ),
	xorxEvent_IsSending                = orxDefine( "orxEvent_IsSending", {}, C_BOOL )

public procedure orxEVENT_INIT( atom EVENT, atom TYPE, atom ID, atom SENDER, atom RECIPIENT, atom PAYLOAD )

	       poke4( EVENT + orxEVENT_eType,      TYPE )
	       poke4( EVENT + orxEVENT_eID,        ID )
	poke_pointer( EVENT + orxEVENT_hSender,    SENDER )
	poke_pointer( EVENT + orxEVENT_hRecipient, RECIPIENT )
	poke_pointer( EVENT + orxEVENT_pstPayload, PAYLOAD )

end procedure

public procedure orxEVENT_SEND( atom TYPE, atom ID, atom SENDER, atom RECIPIENT, atom PAYLOAD )

	atom EVENT = allocate_data( SIZEOF_ORXEVENT, orxTRUE )
	orxEVENT_INIT( EVENT, TYPE, ID, SENDER, RECIPIENT, PAYLOAD )
	orxEvent_Send( EVENT )

end procedure

public function orxEVENT_GET_FLAG( atom ID )
	return shift_bits( 1, -ID )
end function

public constant orxEVENT_KU32_FLAG_ID_NONE = 0x00000000
public constant orxEVENT_KU32_MASK_ID_ALL  = 0xFFFFFFFF

public enum type orxEVENT_TYPE

	orxEVENT_TYPE_ANIM = 0,
	orxEVENT_TYPE_CLOCK,
	orxEVENT_TYPE_CONFIG,
	orxEVENT_TYPE_DISPLAY,
	orxEVENT_TYPE_FX,
	orxEVENT_TYPE_INPUT,
	orxEVENT_TYPE_LOCALE,
	orxEVENT_TYPE_OBJECT,
	orxEVENT_TYPE_RENDER,
	orxEVENT_TYPE_PHYSICS,
	orxEVENT_TYPE_RESOURCE,
	orxEVENT_TYPE_SHADER,
	orxEVENT_TYPE_SOUND,
	orxEVENT_TYPE_SPAWNER,
	orxEVENT_TYPE_SYSTEM,
	orxEVENT_TYPE_TEXTURE,
	orxEVENT_TYPE_TIMELINE,
	orxEVENT_TYPE_VIEWPORT,
	orxEVENT_TYPE_CORE_NUMBER,
	orxEVENT_TYPE_FIRST_RESERVED = orxEVENT_TYPE_CORE_NUMBER,
	orxEVENT_TYPE_LAST_RESERVED = 255,
	orxEVENT_TYPE_USER_DEFINED,
	orxEVENT_TYPE_NONE = 0xFFFFFFFF -- orxENUM_NONE

end type -- orxEVENT_TYPE

ifdef BITS64 then

public constant
	orxEVENT_eType      =  0, -- orxEVENT_TYPE (4)
	orxEVENT_eID        =  4, -- orxENUM       (4)
	orxEVENT_hSender    =  8, -- orxHANDLE     (8)
	orxEVENT_hRecipient = 16, -- orxHANDLE     (8)
	orxEVENT_pstPayload = 24, -- void*         (8)
	orxEVENT_pContext   = 32, -- void*         (8)
	SIZEOF_ORXEVENT     = 40

elsedef -- BITS32

public constant
	orxEVENT_eType      =  0, -- orxEVENT_TYPE (4)
	orxEVENT_eID        =  4, -- orxENUM       (4)
	orxEVENT_hSender    =  8, -- orxHANDLE     (4)
	orxEVENT_hRecipient = 12, -- orxHANDLE     (4)
	orxEVENT_pstPayload = 16, -- void*         (4)
	orxEVENT_pContext   = 20, -- void*         (4)
	SIZEOF_ORXEVENT     = 24

end ifdef

public function orxEvent_GetType( atom _pstEvent )
	return peek4s( _pstEvent + orxEVENT_eType )
end function

public function orxEvent_GetID( atom _pstEvent )
	return peek4s( _pstEvent + orxEVENT_eID )
end function

public procedure orxEvent_Setup()
	orxProc( xorxEvent_Setup, {} )
end procedure

public function orxEvent_Init()
	return orxFunc( xorxEvent_Init, {} )
end function

public procedure orxEvent_Exit()
	orxProc( xorxEvent_Exit, {} )
end procedure

public function orxEvent_AddHandler( atom _eEventType, object _pfnEventHandler, integer _ridEventHandler=routine_id(_pfnEventHandler) )

	if sequence( _pfnEventHandler ) then
		_pfnEventHandler = orxCallback( _pfnEventHandler, _ridEventHandler )
	end if

	return orxFunc( xorxEvent_AddHandler, {_eEventType,_pfnEventHandler} )
end function

public function orxEvent_AddHandlerWithContext( atom _eEventType, object _pfnEventHandler, atom _pContext, integer _ridEventHandler=routine_id(_pfnEventHandler) )

	if sequence( _pfnEventHandler ) then
		_pfnEventHandler = orxCallback( _pfnEventHandler, _ridEventHandler )
	end if

	return orxFunc( xorxEvent_AddHandlerWithContext, {_eEventType,_pfnEventHandler,_pContext} )
end function

public function orxEvent_RemoveHandler( atom _eEventType, object _pfnEventHandler, integer _ridEventHandler=routine_id(_pfnEventHandler) )

	if sequence( _pfnEventHandler ) then
		_pfnEventHandler = orxCallback( _pfnEventHandler, _ridEventHandler )
	end if

	return orxFunc( xorxEvent_RemoveHandler, {_eEventType,_pfnEventHandler} )
end function

public function orxEvent_RemoveHandlerWithContext( atom _eEventType, object _pfnEventHandler, atom _pContext, integer _ridEventHandler=routine_id(_pfnEventHandler) )

	if sequence( _pfnEventHandler ) then
		_pfnEventHandler = orxCallback( _pfnEventHandler, _ridEventHandler )
	end if

	return orxFunc( xorxEvent_RemoveHandlerWithContext, {_eEventType,_pfnEventHandler,_pContext} )
end function

public function orxEvent_SetHandlerIDFlags( object _pfnEventHandler, atom _eEventType, atom _pContext, atom _u32AddIDFlags, atom _u32RemoveIDFlags, integer _ridEventHandler=routine_id(_pfnEventHandler) )

	if sequence( _pfnEventHandler ) then
		_pfnEventHandler = orxCallback( _pfnEventHandler, _ridEventHandler )
	end if

	return orxFunc( xorxEvent_SetHandlerIDFlags, {_pfnEventHandler,_eEventType,_pContext,_u32AddIDFlags,_u32RemoveIDFlags} )
end function

public function orxEvent_Send( atom _pstEvent )
	return orxFunc( xorxEvent_Send, {_pstEvent} )
end function

public function orxEvent_SendShort( atom _eEventType, atom _eEventID )
	return orxFunc( xorxEvent_SendShort, {_eEventType,_eEventID} )
end function

public function orxEvent_IsSending()
	return orxFunc( xorxEvent_IsSending, {} )
end function

