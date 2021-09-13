
include std/filesys.e
include std/sequence.e

public include "orxInclude.e"

constant
	x_orxDebug_Init           = orxDefine( "_orxDebug_Init", {}, C_UINT ),
	x_orxDebug_Exit           = orxDefine( "_orxDebug_Exit", {} ),
	x_orxDebug_Log            = orxDefine( "_orxDebug_Log", {C_UINT,C_STRING,C_STRING,C_UINT,C_STRING} ),
	x_orxDebug_EnableLevel    = orxDefine( "_orxDebug_EnableLevel", {C_UINT,C_BOOL} ),
	x_orxDebug_IsLevelEnabled = orxDefine( "_orxDebug_IsLevelEnabled", {C_UINT}, C_BOOL ),
	x_orxDebug_SetFlags       = orxDefine( "_orxDebug_SetFlags", {C_UINT,C_UINT} ),
	x_orxDebug_GetFlags       = orxDefine( "_orxDebug_GetFlags", {}, C_UINT ),
	x_orxDebug_Break          = orxDefine( "_orxDebug_Break", {} ),
	x_orxDebug_SetDebugFile   = orxDefine( "_orxDebug_SetDebugFile", {C_STRING} ),
	x_orxDebug_SetLogFile     = orxDefine( "_orxDebug_SetLogFile", {C_STRING} ),
	x_orxDebug_SetLogCallback = orxDefine( "_orxDebug_SetLogCallback", {C_POINTER} )

public constant orxDEBUG_KU32_STATIC_FLAG_NONE              = 0x00000000
public constant orxDEBUG_KU32_STATIC_FLAG_TIMESTAMP         = 0x00000001
public constant orxDEBUG_KU32_STATIC_FLAG_FULL_TIMESTAMP    = 0x00000002
public constant orxDEBUG_KU32_STATIC_FLAG_TYPE              = 0x00000004
public constant orxDEBUG_KU32_STATIC_FLAG_TAGGED            = 0x00000008
public constant orxDEBUG_KU32_STATIC_FLAG_FILE              = 0x00000010
public constant orxDEBUG_KU32_STATIC_FLAG_TERMINAL          = 0x00000020
public constant orxDEBUG_KU32_STATIC_FLAG_CONSOLE           = 0x00000040
public constant orxDEBUG_KU32_STATIC_FLAG_CALLBACK          = 0x00000080
public constant orxDEBUG_KU32_STATIC_MASK_DEFAULT           = 0x000000F5
public constant orxDEBUG_KU32_STATIC_MASK_DEBUG             = 0x000000BD
public constant orxDEBUG_KU32_STATIC_MASK_USER_ALL          = 0x0FFFFFFF

public constant orxDEBUG_KZ_DEFAULT_DEBUG_FILE              = "orx-debug.log"
public constant orxDEBUG_KZ_DEFAULT_LOG_FILE                = "orx.log"
public constant orxDEBUG_KZ_DEFAULT_LOG_SUFFIX              = ".log"
public constant orxDEBUG_KZ_DEFAULT_DEBUG_SUFFIX            = "-debug.log"

public enum type orxDEBUG_LEVEL

	orxDEBUG_LEVEL_ANIM = 0,
	orxDEBUG_LEVEL_CONFIG,
	orxDEBUG_LEVEL_CLOCK,
	orxDEBUG_LEVEL_DISPLAY,
	orxDEBUG_LEVEL_FILE,
	orxDEBUG_LEVEL_INPUT,
	orxDEBUG_LEVEL_JOYSTICK,
	orxDEBUG_LEVEL_KEYBOARD,
	orxDEBUG_LEVEL_MEMORY,
	orxDEBUG_LEVEL_MOUSE,
	orxDEBUG_LEVEL_OBJECT,
	orxDEBUG_LEVEL_PARAM,
	orxDEBUG_LEVEL_PHYSICS,
	orxDEBUG_LEVEL_PLUGIN,
	orxDEBUG_LEVEL_PROFILER,
	orxDEBUG_LEVEL_RENDER,
	orxDEBUG_LEVEL_SCREENSHOT,
	orxDEBUG_LEVEL_SOUND,
	orxDEBUG_LEVEL_SYSTEM,
	orxDEBUG_LEVEL_TIMER,
	orxDEBUG_LEVEL_LOG,
	orxDEBUG_LEVEL_ASSERT,
	orxDEBUG_LEVEL_USER,
	orxDEBUG_LEVEL_NUMBER,
	orxDEBUG_LEVEL_MAX_NUMBER = 32,
	orxDEBUG_LEVEL_ALL = 0xFFFFFFFE,
	orxDEBUG_LEVEL_NONE = 0xFFFFFFFF -- orxENUM_NONE

end type -- orxDEBUG_LEVEL

ifdef EUI then
include euphoria/debug/debug.e
end ifdef

object __FUNCTION__ = 0
object __FILE__     = 0
object __LINE__     = 0

public procedure orxLOG( sequence STRING, object ARGS={}, integer st=3 )

ifdef EUI then
	sequence cs = call_stack()
	{__FUNCTION__,__FILE__,__LINE__} = cs[st]
end ifdef

	_orxDebug_Log( orxDEBUG_LEVEL_LOG, __FUNCTION__, __FILE__, __LINE__, STRING, ARGS )

end procedure

public procedure orxLOG_TERMINAL( sequence STRING, object ARGS={}, integer st=3 )

ifdef EUI then
	sequence cs = call_stack()
	{__FUNCTION__,__FILE__,__LINE__} = cs[st]
end ifdef

	atom u32DebugFlags = _orxDebug_GetFlags()
	_orxDebug_SetFlags( orxDEBUG_KU32_STATIC_FLAG_TERMINAL, or_bits(
		orxDEBUG_KU32_STATIC_FLAG_FILE,
		orxDEBUG_KU32_STATIC_FLAG_CONSOLE
	))
	_orxDebug_Log( orxDEBUG_LEVEL_LOG, __FUNCTION__, __FILE__, __LINE__, STRING, ARGS )
	_orxDebug_SetFlags( u32DebugFlags, orxDEBUG_KU32_STATIC_MASK_USER_ALL )

end procedure

public procedure orxLOG_FILE( sequence STRING, object ARGS={}, integer st=3 )

ifdef EUI then
	sequence cs = call_stack()
	{__FUNCTION__,__FILE__,__LINE__} = cs[st]
end ifdef

	atom u32DebugFlags = _orxDebug_GetFlags()
	_orxDebug_SetFlags( orxDEBUG_KU32_STATIC_FLAG_FILE, or_bits(
		orxDEBUG_KU32_STATIC_FLAG_CONSOLE,
		orxDEBUG_KU32_STATIC_FLAG_TERMINAL
	))
	_orxDebug_Log( orxDEBUG_LEVEL_LOG, __FUNCTION__, __FILE__, __LINE__, STRING, ARGS )
	_orxDebug_SetFlags( u32DebugFlags, orxDEBUG_KU32_STATIC_MASK_USER_ALL )

end procedure

public procedure orxLOG_CONSOLE( sequence STRING, object ARGS={}, integer st=3 )

ifdef EUI then
	sequence cs = call_stack()
	{__FUNCTION__,__FILE__,__LINE__} = cs[st]
end ifdef

	atom u32DebugFlags = _orxDebug_GetFlags()
	_orxDebug_SetFlags( orxDEBUG_KU32_STATIC_FLAG_CONSOLE, or_bits(
		orxDEBUG_KU32_STATIC_FLAG_FILE,
		orxDEBUG_KU32_STATIC_FLAG_TERMINAL
	))
	_orxDebug_Log( orxDEBUG_LEVEL_LOG, __FUNCTION__, __FILE__, __LINE__, STRING, ARGS )
	_orxDebug_SetFlags( u32DebugFlags, orxDEBUG_KU32_STATIC_MASK_USER_ALL )

end procedure

constant M_DEFINE_C = 51

public procedure orxDEBUG_INIT()

	_orxDebug_Init()

	atom u32DebugFlags = _orxDebug_GetFlags()
	_orxDebug_SetFlags( orxDEBUG_KU32_STATIC_MASK_DEBUG, orxDEBUG_KU32_STATIC_MASK_USER_ALL )

	integer _orxSystem_GetVersionNumeric = machine_func( M_DEFINE_C, {liborx,"+orxSystem_GetVersionNumeric",{},C_UINT} )
	atom versionNumeric = c_func( _orxSystem_GetVersionNumeric, {} )

	integer _orxSystem_GetVersionFullString = machine_func( M_DEFINE_C, {liborx,"+orxSystem_GetVersionFullString",{},C_POINTER} )
	atom versionString = c_func( _orxSystem_GetVersionFullString,{} )

	if versionNumeric < __orxVERSION__ then

		orxLOG( "The version of the runtime library [" & orxANSI_KZ_COLOR_FG_GREEN & "%s" &
		orxANSI_KZ_COLOR_FG_DEFAULT & "] is " & orxANSI_KZ_COLOR_FG_RED & orxANSI_KZ_COLOR_BLINK_ON & "older" &
		orxANSI_KZ_COLOR_FG_DEFAULT & orxANSI_KZ_COLOR_BLINK_OFF & " than the version used when wrapping the library [" &
		orxANSI_KZ_COLOR_FG_GREEN & "%s" & orxANSI_KZ_COLOR_FG_DEFAULT & "]." &
		orxANSI_KZ_COLOR_FG_RED & orxANSI_KZ_COLOR_BLINK_ON & " Problems will likely ensue!",
		{peek_string(versionString),__orxVERSION_FULL_STRING__} )

	elsif c_func( _orxSystem_GetVersionNumeric, {} ) > __orxVERSION__ then

		orxLOG( "The version of the runtime library [" & orxANSI_KZ_COLOR_FG_GREEN & "%s" &
		orxANSI_KZ_COLOR_FG_DEFAULT & "] is " & orxANSI_KZ_COLOR_FG_YELLOW &  orxANSI_KZ_COLOR_BLINK_ON & "more recent" &
		orxANSI_KZ_COLOR_FG_DEFAULT & orxANSI_KZ_COLOR_BLINK_OFF & " than the version used when wrapping the library [" &
		orxANSI_KZ_COLOR_FG_GREEN & "%s" & orxANSI_KZ_COLOR_FG_DEFAULT & "]." &
		orxANSI_KZ_COLOR_FG_YELLOW & orxANSI_KZ_COLOR_BLINK_ON & " Problems may arise due to possible incompatibilities!",
		{peek_string(versionString),__orxVERSION_FULL_STRING__} )

	end if

	_orxDebug_SetFlags( u32DebugFlags, orxDEBUG_KU32_STATIC_MASK_USER_ALL )

end procedure

public procedure orxDEBUG_EXIT()
	_orxDebug_Exit()
end procedure

public procedure orxDEBUG_ENABLE_LEVEL( atom LEVEL, atom ENABLE=orxTRUE )
	_orxDebug_EnableLevel( LEVEL, ENABLE )
end procedure

public function orxDEBUG_IS_LEVEL_ENABLED( atom LEVEL )
	return _orxDebug_IsLevelEnabled( LEVEL )
end function

public procedure orxDEBUG_SET_FLAGS( atom SET, atom UNSET )
	_orxDebug_SetFlags( SET, UNSET )
end procedure

public function orxDEBUG_GET_FLAGS()
	return _orxDebug_GetFlags()
end function

public procedure orxDEBUG_SET_LOG_CALLBACK( object CALLBACK, integer ROUTINE=routine_id(CALLBACK) )
	_orxDebug_SetLogCallback( CALLBACK, ROUTINE )
end procedure

ifdef __orxDEBUG__ then

public procedure orxDEBUG_PRINT( atom LEVEL, sequence STRING, object ARGS={}, integer st=3 )

ifdef EUI then
	sequence cs = call_stack()
	{__FUNCTION__,__FILE__,__LINE__} = cs[st]
end ifdef

	atom u32DebugFlags = _orxDebug_GetFlags()
	_orxDebug_SetFlags( orxDEBUG_KU32_STATIC_MASK_DEBUG, orxDEBUG_KU32_STATIC_MASK_USER_ALL )
	_orxDebug_Log( LEVEL, __FUNCTION__, __FILE__, __LINE__, STRING, ARGS )
	_orxDebug_SetFlags( u32DebugFlags, orxDEBUG_KU32_STATIC_MASK_USER_ALL )

end procedure

public procedure orxBREAK()
	_orxDebug_Break()
end procedure

public procedure orxDEBUG_SETDEBUGFILE( object FILE )
	_orxDebug_SetDebugFile( FILE )
end procedure

public procedure orxDEBUG_SETLOGFILE( object FILE )
	_orxDebug_SetLogFile( FILE )
end procedure

public procedure orxDEBUG_SETBASEFILENAME( object FILE )

	if not equal( FILE, orxNULL ) and not equal( FILE, orxSTRING_EMPTY ) then
		_orxDebug_SetDebugFile( FILE & orxDEBUG_KZ_DEFAULT_DEBUG_SUFFIX )
		_orxDebug_SetLogFile( FILE & orxDEBUG_KZ_DEFAULT_LOG_SUFFIX )
	else
		_orxDebug_SetDebugFile( FILE )
		_orxDebug_SetLogFile( FILE )
	end if

end procedure

ifdef EUI then

function orxASSERT_READ_TEST( sequence file_name, integer line_no )

	-- read the contents of a line in
	-- a file between "orxASSERT(...)"

	integer fn = open( file_name, "r" )

	if fn = -1 then
		return ""
	end if

	integer i = 0
	object line = ""

	while sequence( line ) and i < line_no do
		line = gets( fn )
		i += 1
	end while

	close( fn )

	if i < line_no then
		return ""
	end if

	integer start = match( "orxASSERT(", line )
	integer stop = 0

	for j = length( line ) to 1 by -1 do
		if line[j] = ')' then
			stop = j
			exit
		end if
	end for

	if start and stop then
		-- length("orxASSERT(") = 10
		return line[start+10..stop-1]
	end if

	return ""
end function

end ifdef -- EUI

public procedure orxASSERT( atom TEST, object ARGS={} )

	sequence STRING = ""

ifdef EUI then
	sequence cs = call_stack()
	STRING = orxASSERT_READ_TEST( cs[3][CS_FILE_NAME], cs[3][CS_LINE_NO] )
end ifdef

	if not TEST then
		orxDEBUG_PRINT( orxDEBUG_LEVEL_ASSERT, orxANSI_KZ_COLOR_BG_RED &
			orxANSI_KZ_COLOR_FG_WHITE & orxANSI_KZ_COLOR_BLINK_ON &
			"FAILED ASSERTION [" & STRING & "]", ARGS, /* st= */ 4 )
		orxBREAK()
	end if

end procedure

elsedef -- __orxDEBUG__

public procedure orxDEBUG_PRINT( atom LEVEL, sequence STRING, object ARGS={}, integer st=3 )
end procedure

public procedure orxBREAK()
end procedure

public procedure orxDEBUG_SETDEBUGFILE( object FILE )
end procedure

public procedure orxDEBUG_SETBASEFILENAME( object FILE )

	if not equal( FILE, orxNULL ) and not equal( FILE, orxSTRING_EMPTY ) then
		_orxDebug_SetLogFile( FILE & orxDEBUG_KZ_DEFAULT_LOG_SUFFIX )
	else
		_orxDebug_SetLogFile( FILE )
	end if

end procedure

public procedure orxASSERT( atom TEST, object ARGS={} )
end procedure

end ifdef -- __orxDEBUG__

public constant orxDEBUG_KS32_BUFFER_OUTPUT_SIZE    = 2048
public constant orxDEBUG_KZ_DATE_FORMAT             = orxANSI_KZ_COLOR_FG_CYAN & "[%H:%M:%S]" & orxANSI_KZ_COLOR_RESET
public constant orxDEBUG_KZ_DATE_FULL_FORMAT        = orxANSI_KZ_COLOR_FG_CYAN & "[%Y-%m-%d %H:%M:%S]" & orxANSI_KZ_COLOR_RESET
public constant orxDEBUG_KZ_TYPE_LOG_FORMAT         = orxANSI_KZ_COLOR_FG_GREEN & "[%s]" & orxANSI_KZ_COLOR_RESET
public constant orxDEBUG_KZ_TYPE_WARNING_FORMAT     = orxANSI_KZ_COLOR_FG_YELLOW & "[%s]"  & orxANSI_KZ_COLOR_RESET
public constant orxDEBUG_KZ_TYPE_ERROR_FORMAT       = orxANSI_KZ_COLOR_FG_RED & "[%s]" & orxANSI_KZ_COLOR_RESET
public constant orxDEBUG_KZ_FILE_FORMAT             = orxANSI_KZ_COLOR_FG_MAGENTA & "[%s:%s(%u)]" & orxANSI_KZ_COLOR_RESET

public function _orxDebug_Init()
	return orxFunc( x_orxDebug_Init, {} )
end function

public procedure _orxDebug_Exit()
	orxProc( x_orxDebug_Exit, {} )
end procedure

public procedure _orxDebug_Log( atom _eLevel, object _zFunction, object _zFile, atom _u32Line, object _zFormat, object _azData={} )

	if not equal( _azData, {} ) then
		_zFormat = sprintf( _zFormat, _azData )
	end if

	_zFormat = stdseq:split( _zFormat, EOL, orxTRUE )

	for i = 1 to length( _zFormat ) do
		orxProc( x_orxDebug_Log, {_eLevel,_zFunction,_zFile,_u32Line,_zFormat[i]} )
	end for

end procedure

public procedure _orxDebug_EnableLevel( atom _eLevel, atom _bEnable )
	orxProc( x_orxDebug_EnableLevel, {_eLevel,_bEnable} )
end procedure

public function _orxDebug_IsLevelEnabled( atom _eLevel )
	return orxFunc( x_orxDebug_IsLevelEnabled, {_eLevel} )
end function

public procedure _orxDebug_SetFlags( atom _u32Add, atom _u32Remove )
	orxProc( x_orxDebug_SetFlags, {_u32Add,_u32Remove} )
end procedure

public function _orxDebug_GetFlags()
	return orxFunc( x_orxDebug_GetFlags, {} )
end function

public procedure _orxDebug_Break()
	orxProc( x_orxDebug_Break, {} )
end procedure

public procedure _orxDebug_SetDebugFile( object _zFileName )
	orxProc( x_orxDebug_SetDebugFile, {_zFileName} )
end procedure

public procedure _orxDebug_SetLogFile( object _zFileName )
	orxProc( x_orxDebug_SetLogFile, {_zFileName} )
end procedure

public procedure _orxDebug_SetLogCallback( object _pfnLogCallback, integer _ridLogCallback=routine_id(_pfnLogCallback) )

	if sequence( _pfnLogCallback ) then
		_pfnLogCallback = orxCallback( _ridLogCallback, _pfnLogCallback )
	end if

	orxProc( x_orxDebug_SetLogCallback, {_pfnLogCallback} )

end procedure
