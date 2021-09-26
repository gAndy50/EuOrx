
include std/machine.e
include "orxInclude.e"

constant
	xorxParam_Setup       = orxDefine( "orxParam_Setup", {} ),
	xorxParam_Init        = orxDefine( "orxParam_Init", {}, C_UINT ),
	xorxParam_Exit        = orxDefine( "orxParam_Exit", {} ),
	xorxParam_Register    = orxDefine( "orxParam_Register", {C_POINTER} ,C_UINT ),
	xorxParam_DisplayHelp = orxDefine( "orxParam_DisplayHelp", {} ,C_UINT ),
	xorxParam_SetArgs     = orxDefine( "orxParam_SetArgs", {C_UINT,C_STRING}, C_UINT )

public constant orxPARAM_KU32_FLAG_NONE             = 0x00000000
public constant orxPARAM_KU32_FLAG_MULTIPLE_ALLOWED = 0x00000001
public constant orxPARAM_KU32_FLAG_STOP_ON_ERROR    = 0x00000002

ifdef BITS64 then

public constant
	orxPARAM_u32Flags   =  0, -- orxU32    (4)
	orxPARAM_zShortName =  4, -- orxSTRING (8)
	orxPARAM_zLongName  = 12, -- orxSTRING (8)
	orxPARAM_zShortDesc = 20, -- orxSTRING (8)
	orxPARAM_zLongDesc  = 28, -- orxSTRING (8)
	orxPARAM_pfnParser  = 36, -- orxPARAM_INIT_FUNCTION (8)
	SIZEOF_ORXPARAM     = 44

elsedef -- BITS32

public constant
	orxPARAM_u32Flags   =  0, -- orxU32    (4)
	orxPARAM_zShortName =  4, -- orxSTRING (4)
	orxPARAM_zLongName  =  8, -- orxSTRING (4)
	orxPARAM_zShortDesc = 12, -- orxSTRING (4)
	orxPARAM_zLongDesc  = 16, -- orxSTRING (4)
	orxPARAM_pfnParser  = 20, -- orxPARAM_INIT_FUNCTION (4)
	SIZEOF_ORXPARAM     = 24

end ifdef

public function orxParam_Create( atom _u32Flags, object _zShortName, object _zLongName, object _zShortDesc, object _zLongDesc, object _pfnParser, integer _ridParser=routine_id(_pfnParser) )

	if sequence( _zShortName ) then
		_zShortName = allocate_string( _zShortName )
	end if

	if sequence( _zLongName ) then
		_zShortName = allocate_string( _zLongName )
	end if

	if sequence( _zShortDesc ) then
		_zShortName = allocate_string( _zShortDesc )
	end if

	if sequence( _zLongDesc ) then
		_zShortName = allocate_string( _zLongDesc )
	end if

	if sequence( _pfnParser ) then
		_pfnParser = orxCallback( _pfnParser, _ridParser )
	end if

	atom _pstParam = allocate_data( SIZEOF_ORXPARAM )

	poke4( _pstParam + orxPARAM_u32Flags, _u32Flags )
	poke_pointer( _pstParam + orxPARAM_zShortName, _zShortName )
	poke_pointer( _pstParam + orxPARAM_zLongName,  _zLongName )
	poke_pointer( _pstParam + orxPARAM_zShortDesc, _zShortDesc )
	poke_pointer( _pstParam + orxPARAM_zLongDesc,  _zLongDesc )
	poke_pointer( _pstParam + orxPARAM_pfnParser,  _pfnParser )

	return _pstParam
end function

public procedure orxParam_Setup()
	orxProc( xorxParam_Setup, {} )
end procedure

public function orxParam_Init()
	return orxFunc( xorxParam_Init, {} )
end function

public procedure orxParam_Exit()
	orxFunc( xorxParam_Exit, {} )
end procedure

public function orxParam_Register( atom _pstParam )
	return orxFunc( xorxParam_Register, {_pstParam} )
end function

public function orxParam_DisplayHelp()
	return orxFunc( xorxParam_DisplayHelp, {} )
end function

public function orxParam_SetArgs( atom _u32NbParams, object _azParams )

	if sequence( _azParams ) then
		_u32NbParams = length( _azParams )
		_azParams = allocate_string_pointer_array( _azParams )
	end if

	return orxFunc( xorxParam_SetArgs, {_u32NbParams,_azParams} )
end function
