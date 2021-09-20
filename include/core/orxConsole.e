include "orxInclude.e"
include "display/orxFont.e"
include "io/orxInput.e"

public constant orxCONSOLE_KZ_INPUT_SET =  "-=ConsoleSet=-",
				orxCONSOLE_KZ_INPUT_TOGGLE =  "Toggle" ,
				orxCONSOLE_KZ_INPUT_AUTOCOMPLETE  =  "AutoComplete",
				orxCONSOLE_KZ_INPUT_DELETE  =    "Delete",                        
 orxCONSOLE_KZ_INPUT_DELETE_AFTER     =    "DeleteAfter",                   
 orxCONSOLE_KZ_INPUT_TOGGLE_MODE     =      "ToggleMode",                    
orxCONSOLE_KZ_INPUT_ENTER          =      "Enter",                         
 orxCONSOLE_KZ_INPUT_PREVIOUS     =        "Previous",                      
 orxCONSOLE_KZ_INPUT_NEXT          =       "Next",                          
orxCONSOLE_KZ_INPUT_LEFT            =    "Left",                          
    orxCONSOLE_KZ_INPUT_RIGHT       =        "Right",                         
    orxCONSOLE_KZ_INPUT_START      =         "Start",                         
    orxCONSOLE_KZ_INPUT_END          =       "End",                           
    orxCONSOLE_KZ_INPUT_PASTE       =        "Paste",                         
    orxCONSOLE_KZ_INPUT_SCROLL_DOWN     =   "ScrollDown",                    
    orxCONSOLE_KZ_INPUT_SCROLL_UP     =     "ScrollUp"       
    
public constant xorxConsole_Setup = orxDefine("orxConsole_Setup",{}),
				xorxConsole_Init = orxDefine("orxConsole_Init",{},C_INT),
				xorxConsole_Exit = orxDefine("orxConsole_Exit",{})
				
public procedure orxConsole_Setup()

 orxProc(xorxConsole_Setup,{})
	
end procedure

public function orxConsole_Init()

 return orxFunc(xorxConsole_Init,{})
	
end function

public procedure orxConsole_Exit()

 orxProc(xorxConsole_Exit,{})
	
end procedure

public constant xorxConsole_Enable = orxDefine("orxConsole_Enable",{C_BOOL}),
				xorxConsole_IsEnabled = orxDefine("orxConsole_IsEnabled",{},C_BOOL)
				
public procedure orxConsole_Enable(atom _bEnable)

 orxProc(xorxConsole_Enable,{_bEnable})
	
end procedure

public function orxConsole_IsEnabled()

 return orxFunc(xorxConsole_IsEnabled,{})
	
end function

public constant xorxConsole_IsInsertMode = orxDefine("orxConsole_IsInsertMode",{},C_BOOL)

public function orxConsole_IsInsertMode()

 return orxFunc(xorxConsole_IsInsertMode,{})
	
end function

public constant xorxConsole_SetToggle = orxDefine("orxConsole_SetToggle",{C_INT,C_INT,C_INT},C_INT)

public function orxConsole_SetToggle(atom _eInputType,atom _eInputID,atom _eInputMode)

 return orxFunc(xorxConsole_SetToggle,{_eInputType,_eInputID,_eInputMode})
	
end function

public constant xorxConsole_Log = orxDefine("orxConsole_Log",{C_STRING},C_INT)

public function orxConsole_Log(object _zText)

 return orxFunc(xorxConsole_Log,{_zText})
	
end function

public constant xorxConsole_SetFont = orxDefine("orxConsole_SetFont",{C_POINTER},C_INT),
				xorxConsole_GetFont = orxDefine("orxConsole_GetFont",{},C_POINTER)
				
public function orxConsole_SetFont(object _pstFont)

 return orxFunc(xorxConsole_SetFont,{_pstFont})
	
end function

public function orxConsole_GetFont()

 return orxFunc(xorxConsole_GetFont,{})
	
end function

public constant xorxConsole_SetLogLineLength = orxDefine("orxConsole_SetLogLineLength",{C_UINT},C_INT),
				xorxConsole_GetLogLineLength = orxDEfine("orxConsole_GetLogLineLength",{},C_UINT)
				
public function orxConsole_SetLogLineLength(atom _u32Len)

 return orxFunc(xorxConsole_SetLogLineLength,{_u32Len})
	
end function

public function orxConsole_GetLogLineLength()

 return orxFunc(xorxConsole_GetLogLineLength,{})
	
end function

public constant xorxConsole_GetCompletionCount = orxDefine("orxConsole_GetCompletionCount",{C_POINTER},C_UINT),
				xorxConsole_GetCompletion = orxDefine("orxConsole_GetCompletion",{C_UINT,C_POINTER},C_STRING)
				
public function orxConsole_GetCompletionCount(atom _MaxLen)

 return orxFunc(xorxConsole_GetCompletionCount,{_MaxLen})
	
end function

public function orxConsole_GetCompletion(atom _u32Index,atom _pbActive)

 return orxFunc(xorxConsole_GetCompletion,{_u32Index,_pbActive})
	
end function

public constant xorxConsole_GetTrailLogLine = orxDefine("orxConsole_GetTrailLogLine",{C_UINT},C_STRING),
				xorxConsole_GetTrailLogLineOffset = orxDefine("orxConsole_GetTrailLogLineOffset",{},C_UINT),
				xorxConsole_GetInput = orxDefine("orxConsole_GetInput",{C_POINTER},C_STRING)
				
public function orxConsole_GetTrailLogLine(atom _LineIndex)

 return orxFunc(xorxConsole_GetTrailLogLine,{_LineIndex})
	
end function

public function orxConsole_GetTrailLogLineOffset()

 return orxFunc(xorxConsole_GetTrailLogLineOffset,{})
	
end function

public function orxConsole_GetInput(atom _pu32CurIndex)

 return orxFunc(xorxConsole_GetInput,{_pu32CurIndex})
	
end function
­146.53