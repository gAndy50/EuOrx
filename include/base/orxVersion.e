
include std/math.e
public include "base/orxType.e"

public constant __orxVERSION_MAJOR__ = 1
public constant __orxVERSION_MINOR__ = 12
public constant __orxVERSION_BUILD__ = 5610
public constant __orxVERSION_RELEASE__ = "stable"

public constant __orxVERSION_STRING__ =
	orxSTRINGIFY(__orxVERSION_MAJOR__) & "." &
	orxSTRINGIFY(__orxVERSION_MINOR__) & "-" &
	orxSTRINGIFY(__orxVERSION_RELEASE__)

public constant __orxVERSION_FULL_STRING__ =
	orxSTRINGIFY(__orxVERSION_MAJOR__) & "." &
	orxSTRINGIFY(__orxVERSION_MINOR__) & "." &
	orxSTRINGIFY(__orxVERSION_BUILD__) & "-" &
	orxSTRINGIFY(__orxVERSION_RELEASE__)

public constant __orxVERSION_MASK_MAJOR__  = 0xFF000000
public constant __orxVERSION_SHIFT_MAJOR__ = 24
public constant __orxVERSION_MASK_MINOR__  = 0x00FF0000
public constant __orxVERSION_SHIFT_MINOR__ = 16
public constant __orxVERSION_MASK_BUILD__  = 0x0000FFFF
public constant __orxVERSION_SHIFT_BUILD__ = 0

public constant __orxVERSION__ = or_all({
	and_bits( shift_bits(__orxVERSION_MAJOR__, -__orxVERSION_SHIFT_MAJOR__), __orxVERSION_MASK_MAJOR__ ),
	and_bits( shift_bits(__orxVERSION_MINOR__, -__orxVERSION_SHIFT_MINOR__), __orxVERSION_MASK_MINOR__ ),
	and_bits( shift_bits(__orxVERSION_BUILD__, -__orxVERSION_SHIFT_BUILD__), __orxVERSION_MASK_BUILD__ )
})

ifdef BITS64 then

public constant
	orxVERSION_zRelease =  0, -- orxSTRING (8)
	orxVERSION_u32Major =  8, -- orxU32    (4)
	orxVERSION_u32Minor = 12, -- orxU32    (4)
	orxVERSION_u32Build = 16, -- orxU32    (4)
	SIZEOF_ORXVERSION   = 24 -- N.B. gcc says sizeof(orxVERSION)=24

elsedef -- BITS32

public constant
	orxVERSION_zRelease =  0, -- orxSTRING (4)
	orxVERSION_u32Major =  4, -- orxU32    (4)
	orxVERSION_u32Minor =  8, -- orxU32    (4)
	orxVERSION_u32Build = 12, -- orxU32    (4)
	SIZEOF_ORXVERSION   = 16

end ifdef
