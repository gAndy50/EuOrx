
constant NULL = 0

constant
	M_ALLOC      = 16,
	M_FREE       = 17,
	M_OPEN_DLL   = 50,
	M_DEFINE_C   = 51,
	M_CALL_BACK  = 52,
	M_DEFINE_VAR = 56,
	M_CRASH      = 67

enum FNAME,FARGS,FTYPE
enum CBADDR,CBNAME

sequence orxname = "orx" -- name of the Orx library
sequence orxdefs = {} -- list of defined func properties
sequence orxcbid = {} -- list of registered callback IDs

ifdef __orxDEBUG__ then
	orxname &= "d"
elsifdef __orxPROFILER__ then
	orxname &= "p"
end ifdef

ifdef WINDOWS then
	orxname &= ".dll"
elsifdef LINUX or FREEBSD then
	orxname &= ".so"
elsedef
	machine_proc( M_CRASH, "Platform not supported" )
end ifdef

public atom liborx = machine_func( M_OPEN_DLL, orxname )

ifdef __orxDEBUG__ and __orxVERBOSE__ then
	constant STDERR = 2
	printf( STDERR, "0x%08x %s\n", {liborx,orxname} )
end ifdef

if liborx = NULL then
	machine_proc( M_CRASH, sprintf( "Library \"%s\" not found!", {orxname} ) )
end if

public constant
	C_INT     = 0x01000004,
	C_LONG    = 0x01000008,
	C_UINT    = 0x02000004,
	C_POINTER = 0x03000001,
	C_FLOAT   = 0x03000004,
	C_DOUBLE  = 0x03000008,
	C_BOOL    = C_INT

public constant
	C_STRING  = 0x04000004 -- special value, basically C_CHAR+C_POINTER

public function orxDefine( sequence fname, object fargs=0, atom ftype=0 )

	atom result

	if atom( fargs ) then
		-- variable definition

		atom ptr = machine_func( M_DEFINE_VAR, {liborx,fname} )

		if ptr = NULL then
			machine_proc( M_CRASH, sprintf("C variable \"%s\" not found in \"%s\"", {fname,orxname}) )
		end if

		if fargs = C_STRING then
			-- deref string pointer
			ptr = peek_pointer( ptr )
		end if

		ifdef __orxDEBUG__ and __orxVERBOSE__ then
			printf( STDERR, "0x%08x orxDefine(\"%s\")\n", {ptr,fname} )
		end ifdef

		result = ptr

	else
		-- function definition

		-- fname,fargs,ftype are original function name/args/type
		-- dname,dargs,dtype are "raw" values sent to M_DEFINE_C

		sequence dname = fname
		sequence dargs = fargs
		integer  dtype = ftype

		ifdef WINDOWS then
			dname = '+' & dname
		end ifdef

		-- convert string types to pointer
		for i = 1 to length( dargs ) do
			if dargs[i] = C_STRING then
				dargs[i] = C_POINTER
			end if
		end for

		-- convert string type to pointer
		if dtype = C_STRING then
			dtype = C_POINTER
		end if

		integer id = machine_func( M_DEFINE_C, {liborx,dname,dargs,dtype} )

		ifdef __orxDEBUG__ and __orxVERBOSE__ then
			printf( STDERR, "%3d orxDefine(\"%s\")\n", {id,fname} )
		end ifdef

		if id = -1 then
			machine_proc( M_CRASH, sprintf("C routine \"%s\" not found in \"%s\"", {fname,orxname}) )
		end if

		while length( orxdefs ) < id do
			-- pad list in chunks of 100
			orxdefs &= repeat( 0, 100 )
		end while

		-- store function information
		orxdefs[id] = {fname,fargs,ftype}

		result = id

	end if

	return result
end function

public function orxCallback( sequence name, integer func=routine_id(name) )

	if length( orxcbid ) < func then
		orxcbid &= repeat( NULL, func-length(orxcbid) )
	end if

	object param = func

	ifdef WINDOWS then
		param = {'+',func}
	end ifdef

	atom addr = machine_func( M_CALL_BACK, {param} )

	if atom( orxcbid[func] ) then
		orxcbid[func] = {addr,name}
	end if

	ifdef __orxDEBUG__ and __orxVERBOSE__ then
		printf( STDERR, "0x%08x orxCallback(\"%s\")\n", orxcbid[func] )
	end ifdef

	return orxcbid[func][CBADDR]
end function

public function orxFunc( integer id, sequence pargs )

	-- fetch function information
	sequence fname = orxdefs[id][FNAME]
	sequence fargs = orxdefs[id][FARGS]
	integer  ftype = orxdefs[id][FTYPE]

	-- list of allocated strings to free
	sequence flist = {}

	-- check argument lengths (c_func/proc does this)
	if length( fargs ) != length( pargs ) then
		machine_proc( M_CRASH, sprintf("C routine \"%s\" needs %d arguments, not %d", {fname,length(fargs),length(pargs)}) )
	end if

	-- allocate strings to memory
	for i = 1 to length( fargs ) do
		if fargs[i] = C_STRING and sequence( pargs[i] ) then
			sequence str = pargs[i]
			pargs[i] = machine_func( M_ALLOC, length(str) )
			poke( pargs[i], str )
			poke( pargs[i]+length(str), NULL )
			flist = append( flist, pargs[i] )
		end if
	end for

	object result = NULL

	if ftype = 0 then
		c_proc( id, pargs )
	else
		result = c_func( id, pargs )
	end if

	-- peek returned string
	if ftype = C_STRING then

		sequence str = ""

		if result != NULL then
			result = peek_string( result )
		end if

		result = str

	end if

	-- free allocated strings
	for i = 1 to length( flist ) do
		machine_proc( M_FREE, flist[i] )
	end for

	return result
end function

public procedure orxProc( integer id, sequence pargs )
	orxFunc( id, pargs )
end procedure


public constant orxNULL = (0)

public function orxFLAG_TEST_ALL( atom X, atom F )
	return and_bits( X, F ) = F
end function

public function orxFLAG_TEST( atom X, atom F )
	return and_bits( X, F ) != 0
end function

public function orxFLAG_GET( atom X, atom M )
	return and_bits( X, M )
end function

public function orxFLAG_SET( atom X, atom A, atom R )
	X = and_bits( X, not_bits(R) )
	X = or_bits( X, A )
	return X
end function

public function orxFLAG_SWAP( atom X, atom S )
	return xor_bits( X, S )
end function

public constant orxANSI_KC_MARKER                   = '\x1b'

public constant orxANSI_KZ_COLOR_RESET              = "\x1b[0m"

public constant orxANSI_KZ_COLOR_BOLD_ON            = "\x1b[1m"
public constant orxANSI_KZ_COLOR_ITALICS_ON         = "\x1b[3m"
public constant orxANSI_KZ_COLOR_UNDERLINE_ON       = "\x1b[4m"
public constant orxANSI_KZ_COLOR_BLINK_ON           = "\x1b[5m"
public constant orxANSI_KZ_COLOR_INVERSE_ON         = "\x1b[7m"
public constant orxANSI_KZ_COLOR_STRIKETHROUGH_ON   = "\x1b[9m"

public constant orxANSI_KZ_COLOR_BOLD_OFF           = "\x1b[22m"
public constant orxANSI_KZ_COLOR_ITALICS_OFF        = "\x1b[23m"
public constant orxANSI_KZ_COLOR_UNDERLINE_OFF      = "\x1b[24m"
public constant orxANSI_KZ_COLOR_BLINK_OFF          = "\x1b[25m"
public constant orxANSI_KZ_COLOR_INVERSE_OFF        = "\x1b[27m"
public constant orxANSI_KZ_COLOR_STRIKETHROUGH_OFF  = "\x1b[29m"

public constant orxANSI_KZ_COLOR_FG_BLACK           = "\x1b[30m"
public constant orxANSI_KZ_COLOR_FG_RED             = "\x1b[31m"
public constant orxANSI_KZ_COLOR_FG_GREEN           = "\x1b[32m"
public constant orxANSI_KZ_COLOR_FG_YELLOW          = "\x1b[33m"
public constant orxANSI_KZ_COLOR_FG_BLUE            = "\x1b[34m"
public constant orxANSI_KZ_COLOR_FG_MAGENTA         = "\x1b[35m"
public constant orxANSI_KZ_COLOR_FG_CYAN            = "\x1b[36m"
public constant orxANSI_KZ_COLOR_FG_WHITE           = "\x1b[37m"
public constant orxANSI_KZ_COLOR_FG_DEFAULT         = "\x1b[39m"

public constant orxANSI_KZ_COLOR_BG_BLACK           = "\x1b[40m"
public constant orxANSI_KZ_COLOR_BG_RED             = "\x1b[41m"
public constant orxANSI_KZ_COLOR_BG_GREEN           = "\x1b[42m"
public constant orxANSI_KZ_COLOR_BG_YELLOW          = "\x1b[43m"
public constant orxANSI_KZ_COLOR_BG_BLUE            = "\x1b[44m"
public constant orxANSI_KZ_COLOR_BG_MAGENTA         = "\x1b[45m"
public constant orxANSI_KZ_COLOR_BG_CYAN            = "\x1b[46m"
public constant orxANSI_KZ_COLOR_BG_WHITE           = "\x1b[47m"
public constant orxANSI_KZ_COLOR_BG_DEFAULT         = "\x1b[49m"

