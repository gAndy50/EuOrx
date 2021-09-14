public include "orxInclude.e"
public include "math/orxVector.e"

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

constant xorxMouse_Setup = orxDefine("orxMouse_Setup",{}),
	 xorxMouse_Init = orxDefine("orxMouse_Init",{},C_INT),
	 xorxMouse_Exit = orxDefine("orxMouse_Exit",{}),
	 xorxMouse_SetPosition = orxDefine("orxMouse_SetPosition",{C_POINTER},C_INT),
	 xorxMouse_GetPosition = orxDefine("orxMouse_GetPosition",{C_POINTER},C_POINTER),
	 xorxMouse_IsButtonPressed = orxDefine("orxMouse_IsButtonPressed",{C_INT},C_BOOL),
	 xorxMouse_GetMoveDelta = orxDefine("orxMouse_GetMoveDelta",{C_POINTER},C_POINTER),
	 xorxMouse_GetWheelData = orxDefine("orxMouse_GetWheelData",{},C_FLOAT),
	 xorxMouse_ShowCursor = orxDefine("orxMouse_ShowCursor",{C_BOOL},C_INT),
	 xorxMouse_Grab = orxDefine("orxMouse_Grab",{C_BOOL},C_INT),
	 xorxMouse_SetCursor = orxDefine("orxMouse_SetCursor",{C_STRING,C_POINTER},C_INT),
	 xorxMouse_GetButtonName = orxDefine("orxMouse_GetButtonName",{C_INT},C_STRING),
	 xorxMouse_GetAxisName = orxDefine("orxMouse_GetAxisName",{C_INT},C_STRING)

public procedure orxMouse_Setup()
  orxProc(xorxMouse_Setup,{})
end procedure

public function orxMouse_Init()
  return orxFunc(xorxMouse_Init,{})
end function

public procedure orxMouse_Exit()
   orxProc(xorxMouse_Exit,{})
end procedure

public function orxMouse_SetPosition(object _pvPosition)
  pvPosition = allocate_data(SIZEOF_ORXVECTOR)
  return orxFunc(xorxMouse_SetPosition,{pvPosition})
end function

public function orxMouse_GetPosition(object _pvPosition)
 pvPosition = allocate_data(SIZEOF_ORXVECTOR)
 return orxFunc(xorxMouse_GetPosition,{pvPosition})
end function

public function orxMouse_IsButtonPressed(orxMOUSE_BUTTON _eButton)
  return orxFunc(xorxMouse_IsButtonPressed,{eButton})
end function

public function orxMouse_GetMoveDelta(object _pvPosition)
  pvPosition = allocate_data(SIZEOF_ORXVECTOR)
  return orxFunc(xorxMouse_GetMoveDelta,{pvPosition})
end function

public function orxMouse_GetWheelDelta()
 return orxFunc(xorxMouse_GetWheelDelta,{})
end function

public function orxMouse_ShowCursor(atom _bShow)
 return orxFunc(xorxMouse_ShowCursor,{_bShow})
end function

public function orxMouse_Grab(atom _bGrab)
 return orxFunc(xorxMouse_Grab,{_bGrab})
end function

public function orxMouse_SetCursor(object _zName, object _pvPosition)
 pvPosition = allocate_data(SIZEOF_ORXVECTOR)
 return orxFunc(xorxMouse_SetCursor,{zName,pvPosition})
end function

public function orxMouse_GetButtonName(orxMOUSE_BUTTON _eButton)
 return orxFunc(xorxMouse_GetButtonName,{_eButton})
end function

public function orxMouse_GetAxisName(orxMOUSE_AXIS _eAxis)
 return orxFunc(xorxMouse_GetAxisName,{_eAxis})
end function
