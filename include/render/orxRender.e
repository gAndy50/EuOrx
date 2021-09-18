include "orxInclude.e"

--include "plugin/orxPluginCore.e"
include "display/orxDisplay.e"
--include "object/orxFrame.e"
--include "object/orxObject.e"
include "render/orxViewport.e"

public constant orxRENDER_KZ_CONFIG_SECTION  =                 "Render",
 orxRENDER_KZ_CONFIG_SHOW_FPS           =       "ShowFPS",
 orxRENDER_KZ_CONFIG_SHOW_PROFILER       =      "ShowProfiler",
 orxRENDER_KZ_CONFIG_MIN_FREQUENCY        =     "MinFrequency",
 orxRENDER_KZ_CONFIG_PROFILER_ORIENTATION  =    "ProfilerOrientation",
 orxRENDER_KZ_CONFIG_CONSOLE_COLOR        =     "ConsoleColor",
 orxRENDER_KZ_CONFIG_CONSOLE_ALPHA        =     "ConsoleAlpha",

 orxRENDER_KZ_CONFIG_CONSOLE_BACKGROUND_COLOR = "ConsoleBackgroundColor",
 orxRENDER_KZ_CONFIG_CONSOLE_BACKGROUND_ALPHA = "ConsoleBackgroundAlpha",
 orxRENDER_KZ_CONFIG_CONSOLE_SEPARATOR_COLOR  = "ConsoleSeparatorColor",
 orxRENDER_KZ_CONFIG_CONSOLE_SEPARATOR_ALPHA  = "ConsoleSeparatorAlpha",
 orxRENDER_KZ_CONFIG_CONSOLE_INPUT_COLOR     =  "ConsoleInputColor",
orxRENDER_KZ_CONFIG_CONSOLE_INPUT_ALPHA     =  "ConsoleInputAlpha",
 orxRENDER_KZ_CONFIG_CONSOLE_COMPLETION_COLOR = "ConsoleCompletionColor",
 orxRENDER_KZ_CONFIG_CONSOLE_COMPLETION_ALPHA = "ConsoleCompletionAlpha",
 orxRENDER_KZ_CONFIG_CONSOLE_LOG_COLOR        = "ConsoleLogColor",
 orxRENDER_KZ_CONFIG_CONSOLE_LOG_ALPHA       =  "ConsoleLogAlpha",

orxRENDER_KZ_INPUT_SET                    =    "-=RenderSet=-",

 orxRENDER_KZ_INPUT_PROFILER_TOGGLE_HISTORY  =  "ProfilerToggleHistory",
 orxRENDER_KZ_INPUT_PROFILER_PAUSE            = "ProfilerPause",
 orxRENDER_KZ_INPUT_PROFILER_PREVIOUS_FRAME  =  "ProfilerPreviousFrame",
 orxRENDER_KZ_INPUT_PROFILER_NEXT_FRAME      =  "ProfilerNextFrame",
orxRENDER_KZ_INPUT_PROFILER_PREVIOUS_DEPTH   = "ProfilerPreviousDepth",
 orxRENDER_KZ_INPUT_PROFILER_NEXT_DEPTH      =  "ProfilerNextDepth",
 orxRENDER_KZ_INPUT_PROFILER_PREVIOUS_THREAD  = "ProfilerPreviousThread",
 orxRENDER_KZ_INPUT_PROFILER_NEXT_THREAD     =  "ProfilerNextThread"
 
public enum type orxRENDER_EVENT

 orxRENDER_EVENT_START = 0,
 orxRENDER_EVENT_VIEWPORT_START,
	orxRENDER_EVENT_VIEWPORT_STOP,
	orxRENDER_EVENT_OBJECT_START,
	orxRENDER_EVENT_OBJECT_STOP,
	orxRENDER_EVENT_CONSOLE_START,
	orxRENDER_EVENT_CONSOLE_STOP,
	orxRENDER_EVENT_PROFILER_START,
	orxRENDER_EVENT_PROFILER_STOP,
	orxRENDER_EVENT_NUMBER,
	orxRENDER_EVENT_NONE = 0xFFFFFFFF
	
end type

public constant ORXRENDER_EVENT_PAYLOAD_pstTransform = 8, --orxDisplay Transform
				SIZEOF_ORXRENDER_EVENT_PAYLOAD = 16
				
public constant xorxRender_Setup = orxDefine("orxRender_Setup",{})

public procedure orxRender_Setup()

 orxProc(xorxRender_Setup,{})
	
end procedure

public constant xorxRender_Init = orxDefine("orxRender_Init",{},C_INT),
				xorxRender_Exit = orxDefine("orxRender_Exit",{}),
				xorxRender_GetWorldPosition = orxDefine("orxRender_GetWorldPosition",{C_POINTER,C_POINTER,C_POINTER},C_POINTER),
				xorxRender_GetScreenPosition = orxDefine("orxRender_GetScreenPosition",{C_POINTER,C_POINTER,C_POINTER},C_POINTER)
				
public function orxRender_Init()

 return orxFunc(xorxRender_Init,{})
	
end function

public procedure orxRender_Exit()

 orxProc(xorxRender_Exit,{})
	
end procedure

public function orxRender_GetWorldPosition(object _pvScreenPosition,object _pstViewport, object _pvWorldPosition)

 _pvScreenPosition = allocate_data(SIZEOF_ORXVECTOR)
 _pstViewport = allocate_data(SIZEOF_ORXVECTOR)
 _pvWorldPosition = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxRender_GetWorldPosition,{_pvScreenPosition,_pstViewport,_pvWorldPosition})
	
end function

public function orxRender_GetScreenPosition(object _pvWorldPosition,object _pstViewport,object _pvScreenPosition)

 _pvWorldPosition = allocate_data(SIZEOF_ORXVECTOR)
 _pstViewport = allocate_data(SIZEOF_ORXVECTOR)
 _pvScreenPosition = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxRender_GetScreenPosition,{_pvWorldPosition,_pstViewport,_pvScreenPosition})
	
end function
­99.95