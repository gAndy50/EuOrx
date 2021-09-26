
include std/machine.e
include "orxInclude.e"

public include "math/orxVector.e"
public include "object/orxObject.e"

public constant orxFX_SLOT_KU32_FLAG_ABSOLUTE = 0x00000100
public constant orxFX_SLOT_KU32_FLAG_USE_ROTATION = 0x00000200
public constant orxFX_SLOT_KU32_FLAG_USE_SCALE = 0x00000400

public enum type orxFX_CURVE

	orxFX_CURVE_LINEAR = 0,
	orxFX_CURVE_SMOOTH,
	orxFX_CURVE_SMOOTHER,
	orxFX_CURVE_TRIANGLE,
	orxFX_CURVE_SINE,
	orxFX_CURVE_SQUARE,
	orxFX_CURVE_NUMBER,
	orxFX_CURVE_NONE = 0xFFFFFFFF

end type

public enum type orxFX_EVENT

	orxFX_EVENT_START = 0,
	orxFX_EVENT_STOP,
	orxFX_EVENT_ADD,
	orxFX_EVENT_REMOVE,
	orxFX_EVENT_LOOP,
	orxFX_EVENT_NUMBER,
	orxFX_EVENT_NONE = 0xFFFFFFFF

end type

public constant ORXFX_EVENT_PAYLOAD_PSTFX = 0,
				ORXFX_EVENT_PAYLOAD_ZFXNAME = 4,
				SIZEOF_ORXFX_EVENT_PAYLOAD = 8

constant
	xorxFX_Setup             = orxDefine( "orxFX_Setup", {} ),
	xorxFX_Init              = orxDefine( "orxFX_Init", {}, C_INT ),
	xorxFX_Exit              = orxDefine( "orxFX_Exit", {} ),
	xorxFX_Create            = orxDefine( "orxFX_Create", {}, C_POINTER ),
	xorxFX_CreateFromConfig  = orxDefine( "orxFX_CreateFromConfig", {C_STRING}, C_POINTER ),
	xorxFX_Delete            = orxDefine( "orxFX_Delete", {C_POINTER}, C_INT ),
	xorxFX_ClearCache        = orxDefine( "orxFX_ClearCache", {}, C_INT ),
	xorxFX_Apply             = orxDefine( "orxFX_Apply", {C_POINTER,C_POINTER,C_FLOAT,C_FLOAT}, C_INT ),
	xorxFX_Enable            = orxDefine( "orxFX_Enable", {C_POINTER,C_BOOL} ),
	xorxFX_IsEnabled         = orxDefine( "orxFX_IsEnabled", {C_POINTER}, C_BOOL ),
	xorxFX_AddAlpha          = orxDefine( "orxFX_AddAlpha", {C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_INT,C_FLOAT,C_UINT}, C_INT ),
	xorxFX_AddRGB            = orxDefine( "orxFX_AddRGB", {C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER,C_INT,C_FLOAT,C_UINT}, C_INT ),
	xorxFX_AddHSL            = orxDefine( "orxFX_AddHSL", {C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER,C_INT,C_FLOAT,C_UINT}, C_INT ),
	xorxFX_AddHSV            = orxDefine( "orxFX_AddHSV", {C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER,C_INT,C_FLOAT,C_UINT}, C_INT ),
	xorxFX_AddRotation       = orxDefine( "orxFX_AddRotation", {C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_INT,C_FLOAT,C_UINT}, C_INT ),
	xorxFX_AddScale          = orxDefine( "orxFX_AddScale", {C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER,C_INT,C_FLOAT,C_UINT}, C_INT ),
	xorxFX_AddPosition       = orxDefine( "orxFX_AddPosition", {C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER,C_INT,C_FLOAT,C_UINT}, C_INT ),
	xorxFX_AddSpeed          = orxDefine( "orxFX_AddSpeed", {C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER,C_INT,C_FLOAT,C_UINT}, C_INT ),
	xorxFX_AddVolume         = orxDefine( "orxFX_AddVolume", {C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_INT,C_FLOAT,C_UINT}, C_INT ),
	xorxFX_AddPitch          = orxDefine( "orxFX_AddPitch", {C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_INT,C_FLOAT,C_UINT}, C_INT ),
	xorxFX_AddSlotFromConfig = orxDefine( "orxFX_AddSlotFromConfig", {C_POINTER,C_STRING}, C_INT ),
	xorxFX_GetDuration       = orxDefine( "orxFX_GetDuration", {C_POINTER}, C_FLOAT ),
	xorxFX_GetName           = orxDefine( "orxFX_GetName", {C_POINTER}, C_STRING ),
	xorxFX_Loop              = orxDefine( "orxFX_Loop", {C_POINTER,C_BOOL}, C_INT ),
	xorxFX_IsLooping         = orxDefine( "orxFX_IsLooping", {C_POINTER}, C_BOOL ),
	xorxFX_SetStagger        = orxDefine( "orxFX_SetStagger", {C_POINTER,C_BOOL,C_FLOAT}, C_INT ),
	xorxFX_GetStagger        = orxDefine( "orxFX_GetStagger", {C_POINTER,C_POINTER}, C_BOOL )

public procedure orxFX_Setup()
	orxProc( xorxFX_Setup, {} )
end procedure

public function orxFX_Init()
	return orxFunc( xorxFX_Init, {} )
end function

public procedure orxFX_Exit()
	orxProc( xorxFX_Exit, {} )
end procedure

public function orxFX_Create()
	return orxFunc( xorxFX_Create, {} )
end function

public function orxFX_CreateFromConfig( object _ConfigID )
	return orxFunc( xorxFX_CreateFromConfig, {_ConfigID} )
end function

public function orxFX_Delete( object fx )
	return orxFunc( xorxFX_Delete, {fx} )
end function

public function orxFX_ClearCache()
	return orxFunc( xorxFX_ClearCache, {} )
end function

public function orxFX_Apply( object fx, object _pstObject, atom _fStartTime, atom _fEndTime )
	return orxFunc( xorxFX_Apply, {fx,_pstObject,_fStartTime,_fEndTime} )
end function

public procedure orxFX_Enable( object _pstFX, atom _bEnable )
	orxProc( xorxFX_Enable, {_pstFX,_bEnable} )
end procedure

public function orxFX_IsEnabled( object FX )
	return orxFunc( xorxFX_IsEnabled, {FX} )
end function


public function orxFX_AddAlpha( object FX, atom _fStartTime, atom _fEndTime, atom _fCyclePeriod, atom _fCyclePhase, atom _fAmp, atom _fAcc, atom _fStartAlpha, atom _fEndAlpha, atom _eCurve, atom _fPow, atom _u32Flags )
	return orxFunc( xorxFX_AddAlpha, {FX,_fStartTime,_fEndTime,_fCyclePeriod,_fAmp,_fAcc,_fStartAlpha,_fEndAlpha,_eCurve,_fPow,_u32Flags} )
end function


public function orxFX_AddRGB( object FX, atom _fStartTime, atom _fEndTime, atom _fCyclePeriod, atom _fCyclePhase, atom _fAmp, atom _fAcc, object _pvStartColor, object _pvEndColor, atom _eCurve, atom _fPow, atom _u32Flags )

	_pvStartColor = allocate_data( SIZEOF_ORXVECTOR )
	_pvEndColor = allocate_data( SIZEOF_ORXVECTOR )

	return orxFunc( xorxFX_AddRGB, {FX,_fStartTime,_fEndTime,_fCyclePeriod,_fCyclePhase,_fAmp,_fAcc,_pvStartColor,_pvEndColor,_eCurve,_fPow,_u32Flags} )
end function


public function orxFX_AddHSL( object FX, atom _fStartTime, atom _fEndTime, atom _fCyclePeriod, atom _fCyclePhase, atom _fAmp, atom _fAcc, object _pvStartColor, object _pvEndColor, atom _eCurve, atom _fPow, atom _u32Flags )

	_pvStartColor = allocate_data( SIZEOF_ORXVECTOR )
	_pvEndColor = allocate_data( SIZEOF_ORXVECTOR )

	return orxFunc( xorxFX_AddHSL, {FX,_fStartTime,_fEndTime,_fCyclePeriod,_fCyclePhase,_fAmp,_fAcc,_pvStartColor,_pvEndColor,_eCurve,_fPow,_u32Flags} )
end function


public function orxFX_AddHSV( object FX, atom _fStartTime, atom _fEndTime, atom _fCyclePeriod, atom _fCyclePhase, atom _fAmp, atom _fAcc, object _pvStartColor, object _pvEndColor, atom _eCurve, atom _fPow, atom _u32Flags )

	_pvStartColor = allocate_data( SIZEOF_ORXVECTOR )
	_pvEndColor = allocate_data( SIZEOF_ORXVECTOR )

	return orxFunc( xorxFX_AddHSV, {FX,_fStartTime,_fEndTime,_fCyclePeriod,_fCyclePhase,_fAmp,_fAcc,_pvStartColor,_pvEndColor,_eCurve,_fPow,_u32Flags} )
end function


public function orxFX_AddRotation( object FX, atom _fStartTime, atom _fEndTime, atom _fCyclePeriod, atom _fCyclePhase, atom _fAmp, atom _fAcc, atom _fStartPos, atom _fEndPos, atom _eCurve, atom _fPow, atom _u32Flags )
	return orxFunc( xorxFX_AddRotation, {FX,_fStartTime,_fEndTime,_fCyclePeriod,_fCyclePhase,_fAmp,_fAcc,_fStartPos,_fEndPos,_eCurve,_fPow,_u32Flags} )
end function


public function orxFX_AddScale( object FX, atom _fStartTime, atom _fEndTime, atom _fCyclePeriod, atom _fCyclePhase, atom _fAmp, atom _fAcc, object _pvStartScale, object _pvEndScale, atom _eCurve, atom _fPow, atom _u32Flags )

	_pvStartScale = allocate_data( SIZEOF_ORXVECTOR )
	_pvEndScale = allocate_data( SIZEOF_ORXVECTOR )

	return orxFunc( xorxFX_AddScale, {FX,_fStartTime,_fEndTime,_fCyclePeriod,_fCyclePhase,_fAmp,_fAcc,_pvStartScale,_pvEndScale,_eCurve,_fPow,_u32Flags} )
end function


public function orxFX_AddPosition( object FX, atom _fStartTime, atom _fEndTime, atom _fCyclePeriod, atom _fCyclePhase, atom _fAmp, atom _fAcc, object _pvStartTrans, object _pvEndTrans, atom _eCurve, atom _fPow, atom _u32Flags )

	_pvStartTrans = allocate_data( SIZEOF_ORXVECTOR )
	_pvEndTrans = allocate_data( SIZEOF_ORXVECTOR )

	return orxFunc( xorxFX_AddPosition, {FX,_fStartTime,_fEndTime,_fCyclePeriod,_fCyclePhase,_fAmp,_fAcc,_pvStartTrans,_pvEndTrans,_eCurve,_fPow,_u32Flags} )
end function


public function orxFX_AddSpeed( object FX, atom _fStartTime, atom _fEndTime, atom _fCyclePeriod, atom _fCyclePhase, atom _fAmp, atom _fAcc, object _pvStartSpeed, object _pvEndSpeed, atom _eCurve, atom _fPow, atom _u32Flags )

	_pvStartSpeed = allocate_data( SIZEOF_ORXVECTOR )
	_pvEndSpeed = allocate_data( SIZEOF_ORXVECTOR )

	return orxFunc( xorxFX_AddSpeed, {FX,_fStartTime,_fEndTime,_fCyclePeriod,_fCyclePhase,_fAmp,_fAcc,_pvStartSpeed,_pvEndSpeed,_eCurve,_fPow,_u32Flags} )
end function


public function orxFX_AddVolume( object FX, atom _fStartTime, atom _fEndTime, atom _fCyclePeriod, atom _fCyclePhase, atom _fAmp, atom _fAcc, atom _fStartVol, atom _fEndVol, atom _eCurve, atom _fPow, atom _u32Flags )
	return orxFunc( xorxFX_AddVolume, {FX,_fStartTime,_fEndTime,_fCyclePeriod,_fCyclePhase,_fAmp,_fAcc,_fStartVol,_fEndVol,_eCurve,_fPow,_u32Flags} )
end function


public function orxFX_AddPitch( object FX, atom _fStartTime, atom _fEndTime, atom _fCyclePeriod, atom _fCyclePhase, atom _fAmp, atom _fAcc, atom _fStartPit, atom _fEndPit, atom _eCurve, atom _fPow, atom _u32Flags )
	return orxFunc( xorxFX_AddPitch, {FX,_fStartTime,_fEndTime,_fCyclePeriod,_fCyclePhase,_fAmp,_fAcc,_fStartPit,_fEndPit,_eCurve,_fPow,_u32Flags} )
end function


public function orxFX_AddSlotFromConfig( object FX, object _zID )
	return orxFunc( xorxFX_AddSlotFromConfig, {FX,_zID} )
end function

public function orxFX_GetDuration( object FX )
	return orxFunc( xorxFX_GetDuration, {FX} )
end function

public function orxFX_GetName( object FX )
	return orxFunc( xorxFX_GetName, {FX} )
end function

public function orxFX_Loop( object FX, atom _blop )
	return orxFunc( xorxFX_Loop, {FX,_blop} )
end function

public function orxFX_IsLooping( object FX )
	return orxFunc( xorxFX_IsLooping, {FX} )
end function

public function orxFX_SetStagger( object FX, atom Stag, atom _off )
	return orxFunc( xorxFX_SetStagger, {FX,Stag,_off} )
end function

public function orxFX_GetStagger( object FX, atom _off )
	return orxFunc( xorxFX_GetStagger, {FX,_off} )
end function
­253.44