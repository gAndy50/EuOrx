
include std/math.e

public include "orxInclude.e"

public include "io/orxJoystick.e"
public include "io/orxKeyboard.e"
public include "io/orxMouse.e"

constant
	xorxInput_Setup              = orxDefine( "orxInput_Setup", {} ),
	xorxInput_Init               = orxDefine( "orxInput_Init", {}, C_UINT ),
	xorxInput_Exit               = orxDefine( "orxInput_Exit", {} ),
	xorxInput_Load               = orxDefine( "orxInput_Load", {C_STRING}, C_UINT ),
	xorxInput_Save               = orxDefine( "orxInput_Save", {C_STRING}, C_UINT ),
	xorxInput_SelectSet          = orxDefine( "orxInput_SelectSet", {C_STRING}, C_UINT ),
	xorxInput_GetCurrentSet      = orxDefine( "orxInput_GetCurrentSet", {}, C_STRING ),
	xorxInput_EnableSet          = orxDefine( "orxInput_EnableSet", {C_STRING,C_BOOL}, C_UINT ),
	xorxInput_IsSetEnabled       = orxDefine( "orxInput_IsSetEnabled", {C_STRING}, C_BOOL ),
	xorxInput_SetTypeFlags       = orxDefine( "orxInput_SetTypeFlags", {C_UINT,C_UINT}, C_UINT ),
	xorxInput_IsActive           = orxDefine( "orxInput_IsActive", {C_STRING}, C_BOOL ),
	xorxInput_HasBeenActivated   = orxDefine( "orxInput_HasBeenActivated", {C_STRING}, C_BOOL ),
	xorxInput_HasBeenDeactivated = orxDefine( "orxInput_HasBeenDeactivated", {C_STRING}, C_BOOL ),
	xorxInput_HasNewStatus       = orxDefine( "orxInput_HasNewStatus", {C_STRING}, C_BOOL ),
	xorxInput_GetValue           = orxDefine( "orxInput_GetValue", {C_STRING}, C_FLOAT ),
	xorxInput_SetValue           = orxDefine( "orxInput_SetValue", {C_STRING,C_FLOAT}, C_UINT ),
	xorxInput_SetPermanentValue  = orxDefine( "orxInput_SetPermanentValue", {C_STRING,C_FLOAT}, C_UINT ),
	xorxInput_ResetValue         = orxDefine( "orxInput_ResetValue", {C_STRING}, C_UINT ),
	xorxInput_GetThreshold       = orxDefine( "orxInput_GetThreshold", {C_STRING}, C_FLOAT ),
	xorxInput_SetThreshold       = orxDefine( "orxInput_SetThreshold", {C_STRING,C_FLOAT}, C_UINT ),
	xorxInput_GetMultiplier      = orxDefine( "orxInput_GetMultiplier", {C_STRING}, C_FLOAT ),
	xorxInput_SetMultiplier      = orxDefine( "orxInput_SetMultiplier", {C_STRING,C_FLOAT}, C_UINT ),
	xorxInput_SetCombineMode     = orxDefine( "orxInput_SetCombineMode", {C_STRING,C_BOOL}, C_UINT ),
	xorxInput_IsInCombineMode    = orxDefine( "orxInput_IsInCombineMode", {C_STRING}, C_BOOL ),
	xorxInput_Bind               = orxDefine( "orxInput_Bind", {C_STRING,C_UINT,C_UINT,C_UINT}, C_UINT ),
	xorxInput_Unbind             = orxDefine( "orxInput_Unbind", {C_STRING,C_UINT}, C_UINT ),
	xorxInput_GetBoundInputCount = orxDefine( "orxInput_GetBoundInputCount", {C_UINT,C_UINT,C_UINT}, C_UINT ),
	xorxInput_GetBoundInput      = orxDefine( "orxInput_GetBoundInput", {C_UINT,C_UINT,C_UINT,C_UINT,C_POINTER,C_POINTER}, C_UINT ),
	xorxInput_GetBinding         = orxDefine( "orxInput_GetBinding", {C_STRING,C_UINT,C_POINTER,C_POINTER,C_POINTER}, C_UINT ),
	xorxInput_GetBindingList     = orxDefine( "orxInput_GetBindingList", {C_STRING,C_UINT,C_UINT,C_UINT}, C_UINT ),
	xorxInput_GetBindingName     = orxDefine( "orxInput_GetBindingName", {C_UINT,C_UINT,C_UINT}, C_STRING ),
	xorxInput_GetBindingType     = orxDefine( "orxInput_GetBindingType", {C_STRING,C_POINTER,C_POINTER,C_POINTER}, C_UINT ),
	xorxInput_GetActiveBinding   = orxDefine( "orxInput_GetActiveBinding", {C_POINTER,C_POINTER,C_POINTER}, C_UINT )


public constant orxINPUT_KZ_CONFIG_SECTION            = "Input"
public constant orxINPUT_KZ_CONFIG_DEFAULT_THRESHOLD  = "DefaultThreshold"
public constant orxINPUT_KZ_CONFIG_DEFAULT_MULTIPLIER = "DefaultMltiplier"
public constant orxINPUT_KZ_CONFIG_COMBINE_LIST       = "CombineList"
public constant orxINPUT_KZ_CONFIG_JOYSTICK_ID_LIST   = "JoyIDList"
public constant orxINPUT_KU32_BINDING_NUMBER          = 16

public constant orxINPUT_KZ_INTERNAL_SET_PREFIX       = "-="

public constant orxINPUT_KC_MODE_PREFIX_POSITIVE      = "+"
public constant orxINPUT_KC_MODE_PREFIX_NEGATIVE      = "-"

public function orxINPUT_GET_FLAG( atom TYPE )
	return shift_bits( 1, -TYPE )
end function

public constant orxINPUT_KU32_FLAG_TYPE_NONE          = 0
public constant orxINPUT_KU32_MASK_TYPE_ALL           = #0000FFFF


public enum type orxINPUT_TYPE

	orxINPUT_TYPE_KEYBOARD_KEY = 0,
	orxINPUT_TYPE_MOUSE_BUTTON,
	orxINPUT_TYPE_MOUSE_AXIS,
	orxINPUT_TYPE_JOYSTICK_BUTTON,
	orxINPUT_TYPE_JOYSTICK_AXIS,
	orxINPUT_TYPE_EXTERNAL,
	orxINPUT_TYPE_NUMBER,
	orxINPUT_TYPE_NONE = 0xFFFFFFFF -- orxENUM_NONE

end type -- orxINPUT_TYPE

public enum type orxINPUT_MODE

	orxINPUT_MODE_FULL = 0,
	orxINPUT_MODE_POSITIVE,
	orxINPUT_MODE_NEGATIVE,
	orxINPUT_MODE_NUMBER,
	orxINPUT_MODE_NONE = 0xFFFFFFFF -- orxENUM_NONE

end type -- orxINPUT_MODE

public enum type orxINPUT_EVENT

	orxINPUT_EVENT_ON = 0,
	orxINPUT_EVENT_OFF,
	orxINPUT_EVENT_SELECT_SET,
	orxINPUT_EVENT_NUMBER,
	orxINPUT_EVENT_NONE = 0xFFFFFFFF -- orxENUM_NONE

end type -- orxINPUT_EVENT


public procedure orxInput_Setup()
	orxProc( xorxInput_Setup, {} )
end procedure

public function orxInput_Init()
	return orxFunc( xorxInput_Init, {} )
end function

public procedure orxInput_Exit()
	orxProc( xorxInput_Exit, {} )
end procedure

public function orxInput_Load( object _zFileName )
	return orxFunc( xorxInput_Load, {_zFileName} )
end function

public function orxInput_Save( object _zFileName )
	return orxFunc( xorxInput_Save, {_zFileName} )
end function

public function orxInput_SelectSet( object _zSetName )
	return orxFunc( xorxInput_SelectSet, {_zSetName} )
end function

public function orxInput_GetCurrentSet()
	return orxFunc( xorxInput_GetCurrentSet, {} )
end function

public function orxInput_EnableSet( object _zSetName, atom _bEnable )
	return orxFunc( xorxInput_EnableSet, {_zSetName,_bEnable} )
end function

public function orxInput_IsSetEnabled( object _zSetName )
	return orxFunc( xorxInput_IsSetEnabled, {_zSetName} )
end function

public function orxInput_SetTypeFlags( atom _u32AddTypeFlags, atom _u32RemoveTypeFlags )
	return orxFunc( xorxInput_SetTypeFlags, {_u32AddTypeFlags,_u32RemoveTypeFlags} )
end function

public function orxInput_IsActive( object _zInputName )
	return orxFunc( xorxInput_IsActive, {_zInputName} )
end function

public function orxInput_HasBeenActivated( object _zInputName )
	return orxFunc( xorxInput_HasBeenActivated, {_zInputName} )
end function

public function orxInput_HasBeenDeactivated( object _zInputName )
	return orxFunc( xorxInput_HasBeenDeactivated, {_zInputName} )
end function

public function orxInput_HasNewStatus( object _zInputName )
	return orxFunc( xorxInput_HasNewStatus, {_zInputName} )
end function

public function orxInput_GetValue( object _zInputName )
	return orxFunc( xorxInput_GetValue, {_zInputName} )
end function

public function orxInput_SetValue( object _zInputName, atom _fValue )
	return orxFunc( xorxInput_SetValue, {_zInputName,_fValue} )
end function

public function orxInput_SetPermnanentValue( object _zInputName, atom _fValue )
	return orxFunc( xorxInput_SetPermanentValue, {_zInputName,_fValue} )
end function

public function orxInput_ResetValue( object _zInputName )
	return orxFunc( xorxInput_ResetValue, {_zInputName} )
end function

public function orxInput_GetThreshold( object _zInputName )
	return orxFunc( xorxInput_GetThreshold, {_zInputName} )
end function

public function orxInput_SetThreshold( object _zInputName, atom _fThreshold )
	return orxFunc( xorxInput_SetThreshold, {_zInputName,_fThreshold} )
end function

public function orxInput_GetMultiplier( object _zInputName )
	return orxFunc( xorxInput_GetMultiplier, {_zInputName} )
end function

public function orxInput_SetMultiplier( object _zInputName, atom _fMultiplier )
	return orxFunc( xorxInput_SetMultiplier, {_zInputName,_fMultiplier} )
end function

public function orxInput_SetCombineMode( object _zName, atom _bCombine )
	return orxFunc( xorxInput_SetCombineMode, {_zName,_bCombine} )
end function

public function orxInput_IsInCombineMode( object _zName )
	return orxFunc( xorxInput_IsInCombineMode, {_zName} )
end function

public function orxInput_Bind( object _zName, atom _eType, atom _eID, atom _eMode, atom _s32BindingIndex )
	return orxFunc( xorxInput_Bind, {_zName,_eType,_eID,_eMode,_s32BindingIndex} )
end function

public function orxInput_Unbind( object _zName, atom _s32BindingIndex )
	return orxFunc( xorxInput_Unbind, {_zName,_s32BindingIndex} )
end function

public function orxInput_GetBoundInputCount( atom _eType, atom _eID, atom _eMode )
	return orxFunc( xorxInput_GetBoundInputCount, {_eType,_eID,_eMode} )
end function

public function orxInput_GetBoundInput( atom _eType, atom _eID, atom _eMode, atom _u32InputIndex, atom _pzName, atom _pu32BindingIndex )
	return orxFunc( xorxInput_GetBoundInput, {_eType,_eID,_eMode,_u32InputIndex,_pzName,_pu32BindingIndex} )
end function

public function orxInput_GetBinding( object _zName, atom _u32BindingIndex, atom _peType, atom _peID, atom _peMode )
	return orxFunc( xorxInput_GetBinding, {_zName,_u32BindingIndex,_peType,_peID,_peMode} )
end function

public function orxInput_GetBindingList( object _zName, atom _aeTypeList, atom _aeIDList, atom _aeModeList )
	return orxFunc( xorxInput_GetBindingList, {_zName,_aeTypeList,_aeIDList,_aeModeList} )
end function

public function orxInput_GetBindingName( atom _eType, atom _eID, atom _eMode )
	return orxFunc( xorxInput_GetBindingName, {_eType,_eID,_eMode} )
end function

public function orxInput_GetBindingType( object _zName, atom _peType, atom _peID, atom _peMode )
	return orxFunc( xorxInput_GetBindingType, {_zName,_peType,_peID,_peMode} )
end function

public function orxInput_GetActiveBinding( atom _peType, atom _peID, atom _pfValue )
	return orxFunc( xorxInput_GetActiveBinding, {_peType,_peID,_pfValue} )
end function
