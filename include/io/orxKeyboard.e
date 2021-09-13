public include "orxInclude.e"

public enum type orxKEYBOARD_KEY
	orxKEYBOARD_KEY_0 = 0,
  orxKEYBOARD_KEY_1,
  orxKEYBOARD_KEY_2,
  orxKEYBOARD_KEY_3,
  orxKEYBOARD_KEY_4,
  orxKEYBOARD_KEY_5,
  orxKEYBOARD_KEY_6,
  orxKEYBOARD_KEY_7,
  orxKEYBOARD_KEY_8,
  orxKEYBOARD_KEY_9,
  orxKEYBOARD_KEY_A,
  orxKEYBOARD_KEY_B,
  orxKEYBOARD_KEY_C,
  orxKEYBOARD_KEY_D,
  orxKEYBOARD_KEY_E,
  orxKEYBOARD_KEY_F,
  orxKEYBOARD_KEY_G,
  orxKEYBOARD_KEY_H,
  orxKEYBOARD_KEY_I,
  orxKEYBOARD_KEY_J,
  orxKEYBOARD_KEY_K,
  orxKEYBOARD_KEY_L,
  orxKEYBOARD_KEY_M,
  orxKEYBOARD_KEY_N,
  orxKEYBOARD_KEY_O,
  orxKEYBOARD_KEY_P,
  orxKEYBOARD_KEY_Q,
  orxKEYBOARD_KEY_R,
  orxKEYBOARD_KEY_S,
  orxKEYBOARD_KEY_T,
  orxKEYBOARD_KEY_U,
  orxKEYBOARD_KEY_V,
  orxKEYBOARD_KEY_W,
  orxKEYBOARD_KEY_X,
  orxKEYBOARD_KEY_Y,
  orxKEYBOARD_KEY_Z,
  orxKEYBOARD_KEY_SPACE,
  orxKEYBOARD_KEY_QUOTE,
  orxKEYBOARD_KEY_COMMA,
  orxKEYBOARD_KEY_DASH,
  orxKEYBOARD_KEY_PERIOD,
  orxKEYBOARD_KEY_SLASH,
  orxKEYBOARD_KEY_SEMICOLON,
  orxKEYBOARD_KEY_EQUAL,
  orxKEYBOARD_KEY_LBRACKET,
  orxKEYBOARD_KEY_BACKSLASH,
  orxKEYBOARD_KEY_RBRACKET,
  orxKEYBOARD_KEY_BACKQUOTE,
  orxKEYBOARD_KEY_WORLD_1,
  orxKEYBOARD_KEY_WORLD_2,
  orxKEYBOARD_KEY_ESCAPE,
  orxKEYBOARD_KEY_ENTER,
  orxKEYBOARD_KEY_TAB,
  orxKEYBOARD_KEY_BACKSPACE,
  orxKEYBOARD_KEY_INSERT,
  orxKEYBOARD_KEY_DELETE,
  orxKEYBOARD_KEY_RIGHT,
  orxKEYBOARD_KEY_LEFT,
  orxKEYBOARD_KEY_DOWN,
  orxKEYBOARD_KEY_UP,
  orxKEYBOARD_KEY_PAGE_UP,
  orxKEYBOARD_KEY_PAGE_DOWN,
  orxKEYBOARD_KEY_HOME,
  orxKEYBOARD_KEY_END,
  orxKEYBOARD_KEY_CAPS_LOCK,
  orxKEYBOARD_KEY_SCROLL_LOCK,
  orxKEYBOARD_KEY_NUM_LOCK,
  orxKEYBOARD_KEY_PRINT_SCREEN,
  orxKEYBOARD_KEY_PAUSE,
  orxKEYBOARD_KEY_VOLUME_DOWN,
  orxKEYBOARD_KEY_VOLUME_UP,
  orxKEYBOARD_KEY_F1,
  orxKEYBOARD_KEY_F2,
  orxKEYBOARD_KEY_F3,
  orxKEYBOARD_KEY_F4,
  orxKEYBOARD_KEY_F5,
  orxKEYBOARD_KEY_F6,
  orxKEYBOARD_KEY_F7,
  orxKEYBOARD_KEY_F8,
  orxKEYBOARD_KEY_F9,
  orxKEYBOARD_KEY_F10,
  orxKEYBOARD_KEY_F11,
  orxKEYBOARD_KEY_F12,
  orxKEYBOARD_KEY_F13,
  orxKEYBOARD_KEY_F14,
  orxKEYBOARD_KEY_F15,
  orxKEYBOARD_KEY_F16,
  orxKEYBOARD_KEY_F17,
  orxKEYBOARD_KEY_F18,
  orxKEYBOARD_KEY_F19,
  orxKEYBOARD_KEY_F20,
  orxKEYBOARD_KEY_F21,
  orxKEYBOARD_KEY_F22,
  orxKEYBOARD_KEY_F23,
  orxKEYBOARD_KEY_F24,
  orxKEYBOARD_KEY_F25,
  orxKEYBOARD_KEY_NUMPAD_0,
  orxKEYBOARD_KEY_NUMPAD_1,
  orxKEYBOARD_KEY_NUMPAD_2,
  orxKEYBOARD_KEY_NUMPAD_3,
  orxKEYBOARD_KEY_NUMPAD_4,
  orxKEYBOARD_KEY_NUMPAD_5,
  orxKEYBOARD_KEY_NUMPAD_6,
  orxKEYBOARD_KEY_NUMPAD_7,
  orxKEYBOARD_KEY_NUMPAD_8,
  orxKEYBOARD_KEY_NUMPAD_9,
  orxKEYBOARD_KEY_NUMPAD_DECIMAL,
  orxKEYBOARD_KEY_NUMPAD_DIVIDE,
  orxKEYBOARD_KEY_NUMPAD_MULTIPLY,
  orxKEYBOARD_KEY_NUMPAD_SUBTRACT,
  orxKEYBOARD_KEY_NUMPAD_ADD,
  orxKEYBOARD_KEY_NUMPAD_ENTER,
  orxKEYBOARD_KEY_NUMPAD_EQUAL,
  orxKEYBOARD_KEY_LSHIFT,
  orxKEYBOARD_KEY_LCTRL,
  orxKEYBOARD_KEY_LALT,
  orxKEYBOARD_KEY_LSYSTEM,
  orxKEYBOARD_KEY_RSHIFT,
  orxKEYBOARD_KEY_RCTRL,
  orxKEYBOARD_KEY_RALT,
  orxKEYBOARD_KEY_RSYSTEM,
  orxKEYBOARD_KEY_MENU,

  orxKEYBOARD_KEY_NUMBER,

  orxKEYBOARD_KEY_NONE = orxENUM_NONE	
end type

constant xorxKeyboard_Setup = orxDefine("orxKeyboard_Setup",{}),
	 xorxKeyboard_Init = orxDefine("orxKeyboard_Init",{},C_UINT),
	 xorxKeyboard_Exit = orxDefine("orxKeyboard_Exit",{}),
	 xorxKeyboard_IsKeyPressed = orxDefine("orxKeyboard_IsKeyPressed",{C_INT}, C_BOOL),
	 xorxKeyboard_GetKeyDisplayName = orxDefine("orxKeyboard_GetKeyDisplayName",{C_INT}, C_STRING),
	 xorxKeyboard_ReadKey = orxDefine("orxKeyboard_ReadKey",{},C_INT),
	 xorxKeyboard_ReadString = orxDefine("orxKeyboard_ReadString",{},C_STRING),
	 xorxKeyboard_ClearBuffer = orxDefine("orxKeyboard_ClearBuffer",{}),
	 xorxKeyboard_GetKeyName = orxDefine("orxKeyboard_GetKeyName",{C_INT},C_STRING),
	 xorxKeyboard_Show = orxDefine("orxKeyboard_Show",{C_BOOL},C_INT)

public procedure orxKeyboard_Setup()
    orxProc(xorxKeyboard_Setup,{})
end procedure

public function orxKeyboard_Init()
  return orxFunc(xorxKeyboard_Init,{})
end function

public procedure orxKeyboard_Exit()
   orxProc(xorxKeyboard_Exit,{})
end procedure

public function orxKeyboard_IsKeyPressed(orxKEYBOARD_KEY key)
  return orxFunc(xorxKeyboard_IsKeyPressed,{key})
end function

public function orxKeyboard_GetKeyDisplayName(orxKEYBOARD_KEY key)
  return orxFunc(xorxKeyboard_GetKeyDisplayName,{key})
end function

public function orxKeyboard_ReadKey()
  return orxFunc(xorxKeyboard_ReadKey,{})
end function

public function orxKeyboard_ReadString()
  return orxFunc(xorxKeyboard_ReadString,{})
end function

public procedure orxKeyboard_ClearBuffer()
   orxProc(xorxKeyboard_ClearBuffer,{})
end procedure

public function orxKeyboard_GetKeyName(orxKEYBOARD_KEY key)
  return orxFunc(xorxKeyboard_GetKeyName,{key})
end function

public function orxKeyboard_Show(integer bShow)
  return orxFunc(xorxKeyboard_Show,{bShow})
end function
