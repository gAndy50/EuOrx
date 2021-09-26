
include std/machine.e
include "orxInclude.e"

public include "debug/orxDebug.e"
public include "memory/orxMemory.e"
public include "math/orxMath.e"

constant
	xorxVector_Bezier     = orxDefine( "orxVector_Bezier", {C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_FLOAT}, C_POINTER ),
	xorxVector_CatmullRom = orxDefine( "orxVector_CatmullRom", {C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_FLOAT}, C_POINTER )

public constant
	-- union {
	orxVECTOR_fX     =  0, -- orxFLOAT (4)
	orxVECTOR_fRho   =  0, -- orxFLOAT (4)
	orxVECTOR_fR     =  0, -- orxFLOAT (4)
	orxVECTOR_fH     =  0, -- orxFLOAT (4)
	-- }
	-- union {
	orxVECTOR_fY     =  4, -- orxFLOAT (4)
	orxVECTOR_fTheta =  4, -- orxFLOAT (4)
	orxVECTOR_fG     =  4, -- orxFLOAT (4)
	orxVECTOR_fS     =  4, -- orxFLOAT (4)
	-- }
	-- union {
	orxVECTOR_fZ     =  8, -- orxFLOAT (4)
	orxVECTOR_fPhi   =  8, -- orxFLOAT (4)
	orxVECTOR_fB     =  8, -- orxFLOAT (4)
	orxVECTOR_fL     =  8, -- orxFLOAT (4)
	orxVECTOR_fV     =  8, -- orxFLOAT (4)
	-- }
	SIZEOF_ORXVECTOR = 12

public function orxVector_Bezier( object _pvRes, object _pvPoint1, object _pvPoint2, object _pvPoint3, object _pvPoint4, atom _fT )

	_pvPoint1 = allocate_data( SIZEOF_ORXVECTOR )
	_pvPoint2 = allocate_data( SIZEOF_ORXVECTOR )
	_pvPoint3 = allocate_data( SIZEOF_ORXVECTOR )
	_pvPoint4 = allocate_data( SIZEOF_ORXVECTOR )
	return orxFunc( xorxVector_Bezier, {_pvRes,_pvPoint1,_pvPoint2,_pvPoint3,_pvPoint4,_fT} )
end function


public function orxVector_CatmullRom( object _pvRes, object _pvPoint1, object _pvPoint2, object _pvPoint3, object _pvPoint4, atom fT )

	_pvPoint1 = allocate_data( SIZEOF_ORXVECTOR )
	_pvPoint2 = allocate_data( SIZEOF_ORXVECTOR )
	_pvPoint3 = allocate_data( SIZEOF_ORXVECTOR )
	_pvPoint4 = allocate_data( SIZEOF_ORXVECTOR )
	return orxFunc( xorxVector_CatmullRom, {_pvRes,_pvPoint1,_pvPoint2,_pvPoint3,_pvPoint4,fT} )
end function

--Vector Constants
public constant
	orxVECTOR_X = SIZEOF_ORXVECTOR,
	orxVECTOR_Y = SIZEOF_ORXVECTOR,
	orxVECTOR_Z = SIZEOF_ORXVECTOR,
	orxVECTOR_0 = SIZEOF_ORXVECTOR,
	orxVECTOR_1 = SIZEOF_ORXVECTOR
­61.34