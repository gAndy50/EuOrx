
public include "orxInclude.e"

public include "debug/orxDebug.e"
public include "memory/orxMemory.e"
public include "math/orxMath.e"

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

