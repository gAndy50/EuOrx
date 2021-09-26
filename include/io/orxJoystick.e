
include "orxInclude.e"

--public include "plugin/orxPluginCore.e"

constant
	xorxJoystick_Setup           = orxDefine( "orxJoystick_Setup", {} ),
	xorxJoystick_Init            = orxDefine( "orxJoystick_Init", {}, C_INT ),
	xorxJoystick_Exit            = orxDefine( "orxJoystick_Exit", {} ),
	xorxJoystick_GetAxisValue    = orxDefine( "orxJoystick_GetAxisValue", {C_INT}, C_FLOAT ),
	xorxJoystick_IsButtonPressed = orxDefine( "orxJoystick_IsButtonPressed", {C_INT}, C_BOOL ),
	xorxJoystick_GetButtonName   = orxDefine( "orxJoystick_GetButtonName", {C_INT}, C_STRING ),
	xorxJoystick_GetAxisName     = orxDefine( "orxJoystick_GetAxisName", {C_INT}, C_STRING ),
	xorxJoystick_IsConnected     = orxDefine( "orxJoystick_IsConnected", {C_UINT}, C_BOOL )

public enum type orxJOYSTICK_BUTTON

	orxJOYSTICK_BUTTON_A_1 = 0,
	orxJOYSTICK_BUTTON_B_1,
	orxJOYSTICK_BUTTON_X_1,
	orxJOYSTICK_BUTTON_Y_1,
	orxJOYSTICK_BUTTON_LBUMPER_1,
	orxJOYSTICK_BUTTON_RBUMPER_1,
	orxJOYSTICK_BUTTON_BACK_1,
	orxJOYSTICK_BUTTON_START_1,
	orxJOYSTICK_BUTTON_GUIDE_1,
	orxJOYSTICK_BUTTON_LTHUMB_1,
	orxJOYSTICK_BUTTON_RTHUMB_1,
	orxJOYSTICK_BUTTON_UP_1,
	orxJOYSTICK_BUTTON_RIGHT_1,
	orxJOYSTICK_BUTTON_DOWN_1,
	orxJOYSTICK_BUTTON_LEFT_1,
	orxJOYSTICK_BUTTON_1_1,
	orxJOYSTICK_BUTTON_2_1,
	orxJOYSTICK_BUTTON_3_1,
	orxJOYSTICK_BUTTON_4_1,
	orxJOYSTICK_BUTTON_5_1,
	orxJOYSTICK_BUTTON_6_1,
	orxJOYSTICK_BUTTON_7_1,
	orxJOYSTICK_BUTTON_8_1,
	orxJOYSTICK_BUTTON_9_1,
	orxJOYSTICK_BUTTON_10_1,
	orxJOYSTICK_BUTTON_11_1,
	orxJOYSTICK_BUTTON_12_1,
	orxJOYSTICK_BUTTON_13_1,
	orxJOYSTICK_BUTTON_14_1,
	orxJOYSTICK_BUTTON_15_1,
	orxJOYSTICK_BUTTON_16_1,
	orxJOYSTICK_BUTTON_17_1,
	orxJOYSTICK_BUTTON_18_1,
	orxJOYSTICK_BUTTON_19_1,
	orxJOYSTICK_BUTTON_20_1,
	orxJOYSTICK_BUTTON_21_1,
	orxJOYSTICK_BUTTON_22_1,
	orxJOYSTICK_BUTTON_23_1,
	orxJOYSTICK_BUTTON_24_1,
	orxJOYSTICK_BUTTON_25_1,

	orxJOYSTICK_BUTTON_SINGLE_NUMBER,

	orxJOYSTICK_BUTTON_A_2 = orxJOYSTICK_BUTTON_SINGLE_NUMBER,
	orxJOYSTICK_BUTTON_B_2,
	orxJOYSTICK_BUTTON_X_2,
	orxJOYSTICK_BUTTON_Y_2,
	orxJOYSTICK_BUTTON_LBUMPER_2,
	orxJOYSTICK_BUTTON_RBUMPER_2,
	orxJOYSTICK_BUTTON_BACK_2,
	orxJOYSTICK_BUTTON_START_2,
	orxJOYSTICK_BUTTON_GUIDE_2,
	orxJOYSTICK_BUTTON_LTHUMB_2,
	orxJOYSTICK_BUTTON_RTHUMB_2,
	orxJOYSTICK_BUTTON_UP_2,
	orxJOYSTICK_BUTTON_RIGHT_2,
	orxJOYSTICK_BUTTON_DOWN_2,
	orxJOYSTICK_BUTTON_LEFT_2,
	orxJOYSTICK_BUTTON_1_2,
	orxJOYSTICK_BUTTON_2_2,
	orxJOYSTICK_BUTTON_3_2,
	orxJOYSTICK_BUTTON_4_2,
	orxJOYSTICK_BUTTON_5_2,
	orxJOYSTICK_BUTTON_6_2,
	orxJOYSTICK_BUTTON_7_2,
	orxJOYSTICK_BUTTON_8_2,
	orxJOYSTICK_BUTTON_9_2,
	orxJOYSTICK_BUTTON_10_2,
	orxJOYSTICK_BUTTON_11_2,
	orxJOYSTICK_BUTTON_12_2,
	orxJOYSTICK_BUTTON_13_2,
	orxJOYSTICK_BUTTON_14_2,
	orxJOYSTICK_BUTTON_15_2,
	orxJOYSTICK_BUTTON_16_2,
	orxJOYSTICK_BUTTON_17_2,
	orxJOYSTICK_BUTTON_18_2,
	orxJOYSTICK_BUTTON_19_2,
	orxJOYSTICK_BUTTON_20_2,
	orxJOYSTICK_BUTTON_21_2,
	orxJOYSTICK_BUTTON_22_2,
	orxJOYSTICK_BUTTON_23_2,
	orxJOYSTICK_BUTTON_24_2,
	orxJOYSTICK_BUTTON_25_2,
	orxJOYSTICK_BUTTON_NUMBER,

	orxJOYSTICK_BUTTON_NONE = 0xFFFFFFFF -- orxENUM_NONE

end type

public enum type orxJOYSTICK_AXIS

	orxJOYSTICK_AXIS_LX_1 = 0,
	orxJOYSTICK_AXIS_LY_1,
	orxJOYSTICK_AXIS_RX_1,
	orxJOYSTICK_AXIS_RY_1,
	orxJOYSTICK_AXIS_LTRIGGER_1,
	orxJOYSTICK_AXIS_RTRIGGER_1,

	orxJOYSTICK_AXIS_SINGLE_NUMBER,

	orxJOYSTICK_AXIS_LX_2 = orxJOYSTICK_AXIS_SINGLE_NUMBER,
	orxJOYSTICK_AXIS_LY_2,
	orxJOYSTICK_AXIS_RX_2,
	orxJOYSTICK_AXIS_RY_2,
	orxJOYSTICK_AXIS_LTRIGGER_2,
	orxJOYSTICK_AXIS_RTRIGGER_2,
	orxJOYSTICK_AXIS_NUMBER,
	orxJOYSTICK_AXIS_NONE = 0xFFFFFFFF -- orxENUM_NONE

end type

public constant orxJOYSTICK_KU32_MIN_ID = 1

public procedure orxJoystick_Setup()
	orxProc( xorxJoystick_Setup, {} )
end procedure


public function orxJoystick_Init()
	return orxFunc( xorxJoystick_Init, {} )
end function

public procedure orxJoystick_Exit()
	orxProc( xorxJoystick_Exit, {} )
end procedure

public function orxJoystick_GetAxisValue( atom _eAxis )
	return orxFunc( xorxJoystick_GetAxisValue, {_eAxis} )
end function

public function orxJoystick_IsButtonPressed( atom _eButton )
	return orxFunc( xorxJoystick_IsButtonPressed, {_eButton} )
end function

public function orxJoystick_GetButtonName( object _eButton )
	return orxFunc( xorxJoystick_GetButtonName, {_eButton} )
end function

public function orxJoystick_GetAxisName( object _eAxis )
	return orxFunc( xorxJoystick_GetAxisName, {_eAxis} )
end function

public function orxJoystick_IsConnected( atom _u32ID )
	return orxFunc( xorxJoystick_IsConnected, {_u32ID} )
end function
­173.50