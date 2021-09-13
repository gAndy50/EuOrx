public include "orxInclude.e"

public enum type orxMOUSE_BUTTON

 orxMOUSE_BUTTON_LEFT = 0,
 orxMOUSE_BUTTON_RIGHT,
 orxMOUSE_BUTTON_MIDDLE,
 orxMOUSE_BUTTON_EXTRA_1,
 orxMOUSE_BUTTON_EXTRA_2,
 orxMOUSE_BUTTON_EXTRA_3,
 orxMOUSE_BUTTON_EXTRA_4,
 orxMOUSE_BUTTON_EXTRA_5,
 orxMOUSE_BUTTON_WHEEL_UP,
 orxMOUSE_BUTTON_WHEEL_DOWN,
 orxMOUSE_BUTTON_NUMBER,
 
 orxMOUSE_BUTTON_NONE = orxENUM_NONE
	
end type

public enum type orxMOUSE_AXIS

	orxMOUSE_AXIS_X = 0,
	orxMOUSE_AXIS_Y,
	orxMOUSE_AXIS_NUMBER,
	
	orxMOUSE_AXIS_NONE = orxENUM_NONE
	
end type

public constant orxMOUSE_KZ_CONFIG_SECTION = "Mouse"
public constant orxMOUSE_KZ_CONFIG_SHOW_CURSOR = "ShowCursor"
public constant orxMOUSE_KZ_CONFIG_GRAB = "Grab"

constant xorxMouse_Setup = orxDefine("orxMouse_Setup",{})

public procedure orxMouse_Setup()
  orxProc(xorxMouse_Setup,{})
end procedure
