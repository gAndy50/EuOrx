
include std/dll.e
include std/machine.e
include std/error.e

public atom liborx = NULL

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
	error:crash( "Platform not supported" )
end ifdef

liborx = open_dll( orxname )

ifdef __orxDEBUG__ and __orxVERBOSE__ then
	constant STDERR = 2
	printf( STDERR, "0x%08x %s\n", {liborx,orxname} )
end ifdef

if liborx = NULL then
	error:crash( "Library \"%s\" not found!", {orxname} )
end if

public constant 
	C_BOOL    = dll:C_BOOL,
	C_DOUBLE  = dll:C_DOUBLE,
	C_FLOAT   = dll:C_FLOAT,
	C_INT     = dll:C_INT,
	C_LONG    = dll:C_LONG,
	C_UINT    = dll:C_UINT,
	C_POINTER = dll:C_POINTER,
	C_STRING  = #04000004 -- special value, basically C_CHAR+C_POINTER

public function orxDefine( sequence fname, object fargs=0, atom ftype=0 )

	atom result

	if atom( fargs ) then
		-- variable definition

		atom ptr = define_c_var( liborx, fname )

		if ptr = NULL then
			error:crash( "C variable \"%s\" not found in \"%s\"", {fname,orxname} )
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
		-- dname,dargs,dtype are "raw" values sent to define_c_func/proc

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

		integer id = -1

		if dtype = 0 then
			id = define_c_proc( liborx, dname, dargs )
		else
			id = define_c_func( liborx, dname, dargs, dtype )
		end if

		ifdef __orxDEBUG__ and __orxVERBOSE__ then
			printf( STDERR, "%3d orxDefine(\"%s\")\n", {id,fname} )
		end ifdef

		if id = -1 then
			error:crash( "C routine \"%s\" not found in \"%s\"", {fname,orxname} )
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

public function orxCallback( integer func, sequence name="" )

	if length( orxcbid ) < func then
		orxcbid &= repeat( NULL, func-length(orxcbid) )
	end if

	if atom( orxcbid[func] ) then
		orxcbid[func] = {call_back(func),name}
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
		error:crash( "C routine \"%s\" needs %d arguments, not %d", {fname,length(fargs),length(pargs)} )
	end if

	-- allocate strings to memory
	for i = 1 to length( fargs ) do
		if fargs[i] = C_STRING and sequence( pargs[i] ) then
			pargs[i] = allocate_string( pargs[i] )
			flist = append( flist, pargs[i] )
		end if
	end for

	object result

	if ftype = 0 then
		c_proc( id, pargs )
		result = NULL
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
		free( flist[i] )
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

