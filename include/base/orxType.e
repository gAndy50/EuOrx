
include std/convert.e
include std/text.e
include std/types.e

public include "base/orxDecl.e"

constant xorxSTRING_EMPTY  = orxDefine( "orxSTRING_EMPTY", C_STRING )
constant xorxSTRING_TRUE   = orxDefine( "orxSTRING_TRUE", C_STRING )
constant xorxSTRING_FALSE  = orxDefine( "orxSTRING_FALSE", C_STRING )
constant xorxSTRING_EOL    = orxDefine( "orxSTRING_EOL", C_STRING )
constant xorxSTRING_DIRSEP = orxDefine( "orxSTRING_DIRECTORY_SEPARATOR", C_STRING )

public function orx2F( atom V )
	-- convert value to bytes and back again
	-- to ensure 32-bit aligned floating point
	return float32_to_atom( atom_to_float32(V) )
end function

public function orx2D( atom V )
	-- convert value to bytes and back again
	-- to ensure 64-bit aligned floating point
	return float64_to_atom( atom_to_float64(V) )
end function

public constant orxENUM_NONE = 0xFFFFFFFF

public enum type orxSEEK_OFFSET_WHENCE

	orxSEEK_OFFSET_WHENCE_START = 0,
	orxSEEK_OFFSET_WHENCE_CURRENT,
	orxSEEK_OFFSET_WHENCE_END,
	orxSEEK_OFFSET_WHENCE_NUMBER,
	orxSEEK_OFFSET_WHENCE_NONE = orxENUM_NONE

end type -- orxSEEK_OFFSET_WHENCE

public constant orxFALSE = 0
public constant orxTRUE  = 1

public constant orxFLOAT_0   = orx2F( 0.0 )
public constant orxFLOAT_1   = orx2F( 1.0 )
public constant orxFLOAT_MAX = orx2F( 3.402823466e+38 )

public constant orxDOUBLE_0   = orx2D( 0.0 )
public constant orxDOUBLE_1   = orx2D( 1.0 )
public constant orxDOUBLE_MAX = orx2D( 1.7976931348623158e+308 )

public constant orxU64_UNDEFINED      = (-1)
public constant orxU32_UNDEFINED      = (-1)
public constant orxU16_UNDEFINED      = (-1)
public constant orxU8_UNDEFINED       = (-1)
public constant orxHANDLE_UNDEFINED   = (-1)
public constant orxSTRINGID_UNDEFINED = (-1)

public constant orxSTRING_EMPTY = peek_string( xorxSTRING_EMPTY )
public constant orxSTRING_TRUE  = peek_string( xorxSTRING_TRUE )
public constant orxSTRING_FALSE = peek_string( xorxSTRING_FALSE )
public constant orxSTRING_EOL   = peek_string( xorxSTRING_EOL )

public constant orxCHAR_NULL         = '\0'
public constant orxCHAR_CR           = '\r'
public constant orxCHAR_LF           = '\n'
public constant orxCHAR_EOL          = '\n'
public constant orxCHAR_ASCII_NUMBER = 128

public function orxSTRINGIFY( object X )

	if not string( X ) then
		X = sprint( X )
	end if

	return X
end function

public constant orxSTRING_DIRECTORY_SEPARATOR = peek_string( xorxSTRING_DIRSEP )

public constant orxCHAR_DIRECTORY_SEPARATOR_WINDOWS = '\\'
public constant orxCHAR_DIRECTORY_SEPARATOR_LINUX   = '/'

ifdef WINDOWS then

public constant orxCHAR_DIRECTORY_SEPARATOR = '\\'

elsedef

public constant orxCHAR_DIRECTORY_SEPARATOR = '/'

end ifdef

public enum type orxSTATUS

	orxSTATUS_FAILURE = 0,
	orxSTATUS_SUCCESS,

	orxSTATUS_NUMBER,

	orxSTATUS_NONE = orxENUM_NONE

end type -- orxSTATUS
