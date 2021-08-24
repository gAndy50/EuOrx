--orxEngine Flags
include std/machine.e
include std/math.e

public constant orxVERSION_MAJOR = 1
public constant orxVERSION_MINOR = 12

public constant orxTRUE = 1,
				orxFALSE = 0

public constant orxCHAR_ASCII_NUMBER = 128

public enum orxENUM_NONE = 4294967295

public enum orxSEEK_OFFSET_WHENCE_START = 0,
			orxSEEK_OFFSET_WHENCE_CURRENT,
			orxSEEK_OFFSET_WHENCE_END,
			orxSEEK_OFFSET_WHENCE_NUMBER,
			orxSEEK_OFFSET_WHENCE_NONE = orxENUM_NONE
			
public enum orxSTATUS_FAILURE = 0,
			orxSTATUS_SUCCESS,
			orxSTATUS_NUMBER,
			orxSTATUS_NONE = orxENUM_NONE
			
public enum orxMODULE_ID_ANIM = 0,
			orxMODULE_ID_ANIMPOINTER,
			orxMODULE_ID_ANIMSET,
			orxMODULE_ID_BANK,
			orxMODULE_ID_BODY,
			orxMODULE_ID_CAMERA,
  		orxMODULE_ID_CLOCK,
  		orxMODULE_ID_COMMAND,
  		orxMODULE_ID_CONFIG,
  		orxMODULE_ID_CONSOLE,
  		orxMODULE_ID_DISPLAY,
  		orxMODULE_ID_EVENT,
  		orxMODULE_ID_FILE,
 	 	orxMODULE_ID_FONT,
 	 	orxMODULE_ID_FPS,
 	 	orxMODULE_ID_FRAME,
  		orxMODULE_ID_FX,
  		orxMODULE_ID_FXPOINTER,
  		orxMODULE_ID_GRAPHIC,
  		orxMODULE_ID_INPUT,
  		orxMODULE_ID_JOYSTICK,
 	 	orxMODULE_ID_KEYBOARD,
  		orxMODULE_ID_LOCALE,
  		orxMODULE_ID_MAIN,
  		orxMODULE_ID_MEMORY,
  		orxMODULE_ID_MOUSE,
  		orxMODULE_ID_OBJECT,
  		orxMODULE_ID_PARAM,
  		orxMODULE_ID_PHYSICS,
  		orxMODULE_ID_PLUGIN,
  		orxMODULE_ID_PROFILER,
  		orxMODULE_ID_RENDER,
  		orxMODULE_ID_RESOURCE,
  		orxMODULE_ID_SCREENSHOT,
  		orxMODULE_ID_SHADER,
  		orxMODULE_ID_SHADERPOINTER,
  		orxMODULE_ID_SOUND,
  		orxMODULE_ID_SOUNDPOINTER,
  		orxMODULE_ID_SOUNDSYSTEM,
  		orxMODULE_ID_SPAWNER,
  		orxMODULE_ID_STRING,
  		orxMODULE_ID_STRUCTURE,
  		orxMODULE_ID_SYSTEM,
  		orxMODULE_ID_TEXT,
  		orxMODULE_ID_TEXTURE,
  		orxMODULE_ID_THREAD,
  		orxMODULE_ID_TIMELINE,
  		orxMODULE_ID_VIEWPORT,

  orxMODULE_ID_CORE_NUMBER,

  orxMODULE_ID_USER_DEFINED = orxMODULE_ID_CORE_NUMBER,

  orxMODULE_ID_TOTAL_NUMBER = 64,

  orxMODULE_ID_NONE = orxENUM_NONE
  
--Clock Flags
public enum orxCLOCK_MODIFIER_FIXED = 0,                         
  			orxCLOCK_MODIFIER_MAXED,                                      
  			orxCLOCK_MODIFIER_AVERAGE,                                      
  			orxCLOCK_MODIFIER_NUMBER,
  			orxCLOCK_MODIFIER_NONE = orxENUM_NONE
  	
public enum orxCLOCK_PRIORITY_LOWEST = 0,
  orxCLOCK_PRIORITY_LOWER,
  orxCLOCK_PRIORITY_LOW,
  orxCLOCK_PRIORITY_NORMAL,
  orxCLOCK_PRIORITY_HIGH,
  orxCLOCK_PRIORITY_HIGHER,
  orxCLOCK_PRIORITY_HIGHEST,

  orxCLOCK_PRIORITY_NUMBER,

  orxCLOCK_PRIORITY_NONE = orxENUM_NONE
  
public enum orxCLOCK_EVENT_RESTART = 0,                                    
  orxCLOCK_EVENT_RESYNC,                                         
  orxCLOCK_EVENT_PAUSE,                                           
  orxCLOCK_EVENT_UNPAUSE,                                         

  orxCLOCK_EVENT_NUMBER,

  orxCLOCK_EVENT_NONE = orxENUM_NONE
  
public constant orxCLOCK_KU32_CLOCK_BANK_SIZE = 16
public constant orxCLOCK_KU32_TIMER_BANK_SIZE = 32
public constant orxCLOCK_KU32_FUNCTION_BANK_SIZE = 16

public enum orxCLOCK_TYPE_CORE = 0,
			orxCLOCK_TYPE_USER,
			orxCLOCK_TYPE_NUMBER,
			orxCLOCK_TYPE_NONE = orxENUM_NONE
			
public enum orxCLOCK_MOD_TYPE_FIXED = 0,
			orxCLOCK_MOD_TYPE_MULTIPLY,
			orxCLOCK_MOD_TYPE_MAXED,
			orxCLOCK_MOD_TYPE_NUMBER,
			orxCLOCK_MOD_TYPE_NONE = orxENUM_NONE
			
--Command Flags

public enum orxCOMMAND_VAR_TYPE_STRING = 0,
			orxCOMMAND_VAR_TYPE_FLOAT,
			orxCOMMAND_VAR_TYPE_S32,
			orxCOMMAND_VAR_TYPE_U32,
			orxCOMMAND_VAR_TYPE_S64,
			orxCOMMAND_VAR_TYPE_U64,
			orxCOMMAND_VAR_TYPE_BOOL,
			orxCOMMAND_VAR_TYPE_VECTOR,
			orxCOMMAND_VAR_TYPE_NUMERIC,
			orxCOMMAND_VAR_TYPE_NUMBER,
			orxCOMMAND_VAR_TYPE_NONE = orxENUM_NONE
			
--Config Flags
public enum orxCONFIG_EVENT_RELOAD_START = 0,
			orxCONFIG_EVENT_RELOAD_STOP,
			orxCONFIG_EVENT_NUMBER,
			orxCONFIG_EVENT_NONE = orxENUM_NONE
			
--Event Flags
public enum orxEVENT_TYPE_ANIM = 0,
			orxEVENT_TYPE_CLOCK,
			orxEVENT_TYPE_CONFIG,
			orxEVENT_TYPE_DISPLAY,
			orxEVENT_TYPE_FX,
			orxEVENT_TYPE_INPUT,
			orxEVENT_TYPE_LOCALE,
			orxEVENT_TYPE_OBJECT,
			orxEVENT_TYPE_RENDER,
			orxEVENT_TYPE_PHYSICS,
			orxEVENT_TYPE_RESOURCE,
			orxEVENT_TYPE_SHADER,
			orxEVENT_TYPE_SOUND,
			orxEVENT_TYPE_SPAWNER,
			orxEVENT_TYPE_SYSTEM,
			orxEVENT_TYPE_TEXTURE,
			orxEVENT_TYPE_TIMELINE,
			orxEVENT_TYPE_VIEWPORT,
			orxEVENT_TYPE_CORE_NUMBER,
			orxEVENT_TYPE_FIRST_RESERVED = orxEVENT_TYPE_CORE_NUMBER,
			orxEVENT_TYPE_LAST_RESERVED = 255,
			orxEVENT_TYPE_USER_DEFINED,
			orxEVENT_TYPE_NONE = orxENUM_NONE
			
public constant orxEVENT_GET_FLAG = 1,
				orxEVENT_KU32_FLAG_ID_NONE = 0,
				orxEVENT_KU32_MASK_ID_ALL = #FFFFFFFF
				
public constant orxNULL = 0
			
--Locale Flags
public enum orxLOCALE_EVENT_SELECT_LANGUAGE = 0,
			orxLOCALE_EVENT_SET_STRING,
			orxLOCALE_EVENT_NUMBER,
			orxLOCALE_EVENT_NONE = orxENUM_NONE
			
--Resource Flags
public enum orxRESOURCE_EVENT_UPDATE = 0,
			orxRESOURCE_EVENT_ADD,
			orxRESOURCE_EVENT_REMOVE,
			orxRESOURCE_EVENT_NUMBER,
			orxRESOURCE_EVENT_NONE = orxENUM_NONE
		
--System Event Flags	
public enum orxSYSTEM_EVENT_CLOSE = 0,
			orxSYSTEM_EVENT_FOCUS_GAINED,
			orxSYSTEM_EVENT_FOCUS_LOST,
			orxSYSTEM_EVENT_BACKGROUND,
			orxSYSTEM_EVENT_FOREGROUND,
			orxSYSTEM_EVENT_GAME_LOOP_START,
			orxSYSTEM_EVENT_GAME_LOOP_STOP,
			orxSYSTEM_EVENT_TOUCH_BEGIN,
			orxSYSTEM_EVENT_TOUCH_MOVE,
			orxSYSTEM_EVENT_TOUCH_END,
			orxSYSTEM_EVENT_ACCELERATE,
			orxSYSTEM_EVENT_MOTION_SHAKE,
			orxSYSTEM_EVENT_DROP,
			orxSYSTEM_EVENT_CLIPBOARD,
			orxSYSTEM_EVENT_NUMBER,
			orxSYSTEM_EVENT_NONE = orxENUM_NONE
			
--Thread Flags
public constant orxTHREAD_KU32_MAIN_THREAD_ID = 0,
				orxTHREAD_KU32_MAX_THREAD_NUMBER = 16,
				orxTHREAD_KU32_FLAG_NONE = 0
				
public constant orxTHREAD_KU32_MASK_ALL = or_all({1,65536 - 1})
public constant orxTHREAD_GET_FLAG_FROM_ID = 1


--Input Flags			
public enum orxINPUT_TYPE_KEYBOARD_KEY = 0,
			orxINPUT_TYPE_MOUSE_BUTTON,
			orxINPUT_TYPE_MOUSE_AXIS,
			orxINPUT_TYPE_JOYSTICK_BUTTON,
			orxINPUT_TYPE_JOYSTICK_AXIS,
			orxINPUT_TYPE_EXTERNAL,
			orxINPUT_TYPE_NUMBER,
			orxINPUT_TYPE_NONE = orxENUM_NONE
			
public enum orxINPUT_MODE_FULL = 0,
			orxINPUT_MODE_POSITIVE,
			orxINPUT_MODE_NEGATIVE,
			orxINPUT_MODE_NUMBER,
			orxINPUT_MODE_NONE = orxENUM_NONE
			
public enum orxINPUT_EVENT_NO = 0,
			orxINPUT_EVENT_OFF,
			orxINPUT_SELECT_SET,
			orxINPUT_EVENTNUMBER,
			orxINPUT_EVENT_NONE = orxENUM_NONE
			
--Console Flags
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
			
--Animation Flags
public constant orxANIM_KU32_FLAG_NONE = 0,
				orxANIM_KU32_FLAG_2D = 1,
				orxANIM_KU32_MASK_USER_ALL = #0000000F,
				orxANIM_Ku32_MASK_ALL = #FFFFFFFF,
				orxANIM_KU32_KEY_MAX_NUMBER = 65535,
				orxANIM_Ku32_EVENT_MAX_NUMBER = 65535
				
public enum orxANIM_EVENT_START = 0,
			 orxANIM_EVENT_STOP,                         
     orxANIM_EVENT_CUT,                          
      orxANIM_EVENT_LOOP,                         
      orxANIM_EVENT_UPDATE,                       
      orxANIM_EVENT_CUSTOM_EVENT,                 
      orxANIM_EVENT_NUMBER,
    
      orxANIM_EVENT_NONE = orxENUM_NONE
      
public constant orxANIMSET_KU32_FLAG_NONE = 0,
				orxANIMSET_KU32_FLAG_REFERENCE_LOCK = #00100000,
				orxANIMSET_KU32_FLAG_LINK_STATIC = #00200000,
				orxANIMSET_KU32_LINK_FLAG_NONE = 0,
				orxANIMSET_KU32_LINK_FLAG_LOOP_COUNT = #10000000,
				orxANIMSET_KU32_LINK_FLAG_PRIORITY = #20000000,
				orxANIMSET_KU32_LINK_FLAG_IMMEDIATE_CUT = #40000000,
				orxANIMSET_KU32_LINK_FLAG_CLEAR_TARGET = #80000000,
				orxANIMSET_Ku32_MAX_ANIM_NUMBER = 128 
			
--Math Flags
public constant orxMATH_KF_SQRT_2 = 1.414213562,
				orxMATH_KF_EPSILON = 0.0001,
				orxMATH_KF_TINY_EPSILON = 1.0e-037,
				orxMATH_KF_2_PI = 6.283185307,
				orxMATH_KI_PI = 3.141592654,
				orxMATH_KF_PI_BY_2 = 1.570796327,
				orxMATH_KF_PI_BY_4 = 0.785398163,
				orxMATH_KF_DEG_TO_RAD = 3.141592654 / 180.0,
				orxMATH_KF_RAD_TO_DEG = 180.0 / 3.141592654
				
--Param Flags
public constant orxPARAM_KU32_FLAG_NONE = 0,
				orxPARAM_KU32_FLAG_MULTIPLE_ALLOWED = 1,
				orxPARAM_KU32_FLAG_STOP_ON_ERROR = 2
				
--Physics Flags
public constant orxBODY_DEF_KU32_FLAG_NONE = #00000000,
				orxBODY_DEF_KU32_FLAG_2D = #00000001,
				orxBODY_DEF_KU32_FLAG_DYNAMIC = #00000002,
				orxBODY_DEF_KU32_FLAG_HIGH_SPEED = #00000004,
				orxBODY_DEF_KU32_FLAG_FIXED_ROTATION = #00000008,
				orxBODY_DEF_KU32_FLAG_CAN_MOVE = #00000010,
				orxBODY_DEF_KU32_FLAG_ALLOW_SLEEP = #00000020,
				orxBODY_DEF_KU32_FLAG_MASK_ALL = #FFFFFFFF,
				orxBODY_PART_DEF_KU32_FLAG_NONE = 0,
				orxBODY_PART_DEF_KU32_FLAG_SPHERE = 1,
				orxBODY_PART_DEF_KU32_FLAG_BOX = 2,
				orxBODY_PART_DEF_KU32_FLAG_MESH = 4,
				orxBODY_PART_DEF_KU32_FLAG_EDGE = 8,
				orxBODY_PART_DEF_KU32_FLAG_CHAIN = #00000010,
				orxBODY_PART_DEF_KU32_MASK_TYPE = #0000001F,
				orxBODY_PART_DEF_KU32_FLAG_SOLID = #10000000,
				orxBODY_PART_DEF_KU32_MASK_ALL = #FFFFFFFF,
				orxBODY_JOINT_DEF_KU32_FLAG_NONE = 0,
				orxBODY_JOINT_DEF_KU32_FLAG_REVOLUTE = 1,
				orxBODY_JOINT_DEF_KU32_FLAG_PRISMATIC = 2,
				orxBODY_JOINT_DEF_KU32_FLAG_SPRING = 4,
				orxBODY_JOINT_DEF_KU32_FLAG_ROPE = 8,
				orxBODY_JOINT_DEF_KU32_FLAG_PULLEY = #00000010,
				orxBODY_JOINT_DEF_KU32_FLAG_SUSPENSION = #00000020,
				orxBODY_JOINT_DEF_KU32_FLAG_WELD = #00000040,
				orxBODY_JOINT_DEF_KU32_FLAG_FRICTION = #00000080,
				orxBODY_JOINT_DEF_KU32_FLAG_GEAR = #00000100,
				orxBODY_JOINT_DEF_KU32_MASK_TYPE = #00000FFF,
				orxBODY_JOINT_DEF_KU32_FLAG_COLLIDE = #10000000,
				orxBODY_JOINT_DEF_KU32_FLAG_ROTATION_LIMIT = #20000000,
				orxBODY_JOINT_DEF_KU32_FLAG_MOTOR = #40000000,
				orxBODY_JOINT_DEF_KU32_FLAG_TRANSLATION_LIMIT = #80000000,
				orxBODY_JOINT_DEF_KU32_MASK_ALL = #FFFFFFFF,
				orxBODY_PART_DEF_KU32_MESH_VERTEX_NUMBER = 8

public enum orxPHYSICS_EVENT_CONTACT_ADD = 0,
			orxPHYSICS_EVENT_CONTACT_REMOVE,
			orxPHYSICS_EVENT_NUMBER,
			orxPHYSICS_EVENT_NONE = orxENUM_NONE
			
public constant orxPHYSICS_KZ_CONFIG_SECTION = "Physics",
				 orxPHYSICS_KZ_CONFIG_GRAVITY = "Gravity",
				 orxPHYSICS_KZ_CONFIG_ALLOW_SLEEP = "AllowSleep",
				 orxPHYSICS_KZ_CONFIG_ITERATIONS = "IterationsPerStep",
				 orxPHYSICS_KZ_CONFIG_RATIO  = "DimensionRatio",
				 orxPHYSICS_KZ_CONFIG_STEP_FREQUENCY = "StepFrequency",
				 orxPHYSICS_KZ_CONFIG_SHOW_DEBUG  = "ShowDebug",
				 orxPHYSICS_KZ_CONFIG_COLLISION_FLAG_LIST  = "CollisionFlagList",
				 orxPHYSICS_KZ_CONFIG_INTERPOLATE = "Interpolate"
		
--Debug Flags		 
public constant orxDEBUG_KU32_STATIC_FLAG_NONE = 0,
				orxDEBUG_KU32_STATIC_FLAG_TIMESTAMP = 1,
				orxDEBUG_KU32_STATIC_FLAG_FULL_TIMESTAMP = 2,
				orxDEBUG_KU32_STATIC_FLAG_TYPE = 4,
				orxDEBUG_KU32_STATIC_FLAG_TAGGED = 8,
				orxDEBUG_KU32_STATIC_FLAG_FILE = #00000010,
				orxDEBUG_KU32_STATIC_FLAG_TERMINAL = #00000020,
				orxDEBUG_KU32_STATIC_FLAG_CONSOLE = #00000040,
				orxDEBUG_KU32_STATIC_FLAG_CALLBACK = #00000080
				
public constant orxDEBUG_KU32_STATIC_MASK_DEFAULT = #000000F5,
				orxDEBUG_KU32_STATIC_MASK_DEBUG = #000000BD,
				orxDEBUG_KU32_STATIC_MASK_USER_ALL = #0FFFFFFF
				
public enum orxDEBUG_LEVEL_ANIM = 0,
			orxDEBUG_LEVEL_CONFIG,
			orxDEBUG_LEVEL_CLOCK,
			orxDEBUG_LEVEL_COMMAND,
			orxDEBUG_LEVEL_DISPLAY,
			orxDEBUG_LEVEL_FILE,
			orxDEBUG_LEVEL_INPUT,
			orxDEBUG_LEVEL_JOYSTICK,
			orxDEBUG_LEVEL_KEYBOARD,
			orxDEBUG_LEVEL_MEMORY,
			orxDEBUG_LEVEL_MOUSE,
			orxDEBUG_LEVEL_OBJECT,
			orxDEBUG_LEVEL_PARAM,
			orxDEBUG_LEVEL_PHYSICS,
			orxDEBUG_LEVEL_PLUGIN,
			orxDEBUG_LEVEL_PROFILER,
			orxDEBUG_LEVEL_RENDER,
			orxDEBUG_LEVEL_SCREENSHOT,
			orxDEBUG_LEVEL_SOUND,
			orxDEBUG_LEVEL_SYSTEM,
			orxDEBUG_LEVEL_TIMER,
			orxDEBUG_LEVEL_LOG,
			orxDEBUG_LEVEL_ASSERT,
			orxDEBUG_LEVEL_USER,
			orxDEBUG_LEVEL_NUMBER,
			orxDEBUG_LEVEL_MAX_NUMBER = 32,
			orxDEBUG_LEVEL_ALL = #FFFFFFFE,
			orxDEBUG_LEVEL_NONE = orxENUM_NONE
			
--FPS Flags
public constant orxFPS_KZ_CLOCK_NAME = "fps"


--Profiler Flags
public constant orxPROFILER_KU32_HISTORY_LENGTH = 3 * 60

--public constant orxPROFILER_KU32_HISTORY_LENGTH = 2

public constant orxPROFILER_KS32_MARKER_ID_NONE = -1

--Display Flags

public enum orxDISPLAY_PRIMITIVE_POINTS = 0,
			orxDISPLAY_PRIMITIVE_LINES,
			orxDISPLAY_PRIMITIVE_LINE_LOOP,
			orxDISPLAY_PRIMITIVE_LINE_STRIP,
			orxDISPLAY_PRIMITIVE_TRIANGLES,
			orxDISPLAY_PRIMITIVE_TRIANGLE_STRIP,
			orxDISPLAY_PRIMITIVE_TRIANGLE_FAN,
			orxDISPLAY_PRIMITIVE_NUMBER,
			orxDISPLAY_PRIMITIVE_NONE = orxENUM_NONE
			
public enum orxDISPLAY_SMOOTHING_DEFAULT = 0,
			orxDISPLAY_SMOOTHING_ON,
			orxDISPLAY_SMOOTING_OFF,
			orxDISPLAY_SMOOTHING_NUMBER,
			orxDISPLAY_SMOOTHING_NONE = orxENUM_NONE
			
public enum orxDISPLAY_BLEND_MODE_ALPHA = 0,
			orxDISPLAY_BLEND_MODE_MULTIPLY,
			orxDISPLAY_BLEND_MODE_ADD,
			orxDISPLAY_BLEND_MODE_PREMUL,
			orxDISPLAY_BLEND_MODE_NUMBER,
			orxDISPLAY_BLEND_MODE_NONE = orxENUM_NONE
			
public constant orxDISPLAY_KZ_CONFIG_SECTION = "Display",
orxDISPLAY_KZ_CONFIG_WIDTH =                         "ScreenWidth",
 orxDISPLAY_KZ_CONFIG_HEIGHT =                        "ScreenHeight",
orxDISPLAY_KZ_CONFIG_DEPTH  =                        "ScreenDepth",
orxDISPLAY_KZ_CONFIG_POSITION =                      "ScreenPosition",
orxDISPLAY_KZ_CONFIG_REFRESH_RATE =                  "RefreshRate",
orxDISPLAY_KZ_CONFIG_FULLSCREEN   =                  "FullScreen",
 orxDISPLAY_KZ_CONFIG_ALLOW_RESIZE=                   "AllowResize",
 orxDISPLAY_KZ_CONFIG_DECORATION =                    "Decoration",
 orxDISPLAY_KZ_CONFIG_TITLE     =                     "Title",
 orxDISPLAY_KZ_CONFIG_SMOOTH   =                      "Smoothing",
 orxDISPLAY_KZ_CONFIG_VSYNC     =                     "VSync",
 orxDISPLAY_KZ_CONFIG_DEPTHBUFFER  =                  "DepthBuffer",
 orxDISPLAY_KZ_CONFIG_SHADER_VERSION =                "ShaderVersion",
orxDISPLAY_KZ_CONFIG_SHADER_EXTENSION_LIST =         "ShaderExtensionList",
 orxDISPLAY_KZ_CONFIG_MONITOR   =                     "Monitor",
 orxDISPLAY_KZ_CONFIG_CURSOR   =                      "Cursor",
 orxDISPLAY_KZ_CONFIG_ICON_LIST   =                   "IconList",
 orxDISPLAY_KZ_CONFIG_FRAMEBUFFER_SIZE  =             "FramebufferSize",
 orxDISPLAY_KZ_CONFIG_TEXTURE_UNIT_NUMBER=            "TextureUnitNumber",
orxDISPLAY_KZ_CONFIG_DRAW_BUFFER_NUMBER=             "DrawBufferNumber",

 orxCOLOR_KZ_CONFIG_SECTION=                          "Color"
 
public constant orxDISPLAY_KZ_SHADER_SUFFIX_TOP =      "_top",
 orxDISPLAY_KZ_SHADER_SUFFIX_LEFT =                   "_left",
 orxDISPLAY_KZ_SHADER_SUFFIX_BOTTOM =                 "_bottom",
 orxDISPLAY_KZ_SHADER_SUFFIX_RIGHT  =                 "_right"
 
public constant orxDISPLAY_KC_SHADER_EXTENSION_ADD =  "+",
				orxDISPLAY_KC_SHADER_EXTENSION_REMOVE = "-"
				
public enum orxDISPLAY_EVENT_SET_VIDEO_MODE = 0,
			orxDISPLAY_EVENT_LOAD_BITMAP,
			orxDISPLAY_EVENT_NUMBER,
			orxDISPLAY_EVENT_NONE = orxENUM_NONE
			
public constant orxFONT_KZ_DEFAULT_FONT_NAME = "default"

--Graphic Flags
public constant orxGRAPHIC_KU32_FLAG_NONE = #000000000, 

 orxGRAPHIC_KU32_FLAG_2D  =            #000000001,  
 orxGRAPHIC_KU32_FLAG_TEXT =           #000000002,  

 orxGRAPHIC_KU32_MASK_TYPE  =           #000000003,  

 orxGRAPHIC_KU32_FLAG_FLIP_X =          #000000004, 
 orxGRAPHIC_KU32_FLAG_FLIP_Y  =         #000000008, 
 orxGRAPHIC_KU32_MASK_FLIP_BOTH=        #00000000C,  

 orxGRAPHIC_KU32_FLAG_ALIGN_CENTER=     #000000000,  
 orxGRAPHIC_KU32_FLAG_ALIGN_LEFT   =    #000000010, 
 orxGRAPHIC_KU32_FLAG_ALIGN_RIGHT   =   #000000020, 
 orxGRAPHIC_KU32_FLAG_ALIGN_TOP    =    #000000040,  
 orxGRAPHIC_KU32_FLAG_ALIGN_BOTTOM  =   #000000080,  
 orxGRAPHIC_KU32_FLAG_ALIGN_TRUNCATE =  #000000100,  
 orxGRAPHIC_KU32_FLAG_ALIGN_ROUND  =    #000000200,  

 orxGRAPHIC_KU32_MASK_ALIGN      =      #0000003F0,  

 orxGRAPHIC_KU32_MASK_USER_ALL    =     #000000FFF  
 
public constant orxGRAPHIC_KZ_CONFIG_TEXTURE_NAME = "Texture",
				orxGRAPHIC_KZ_CONFIG_TEXTURE_ORIGIN=   "TextureOrigin",
 orxGRAPHIC_KZ_CONFIG_TEXTURE_SIZE =    "TextureSize",
 orxGRAPHIC_KZ_CONFIG_TEXT_NAME =       "Text",
orxGRAPHIC_KZ_CONFIG_PIVOT       =     "Pivot",
 orxGRAPHIC_KZ_CONFIG_COLOR     =       "Color",
 orxGRAPHIC_KZ_CONFIG_ALPHA     =       "Alpha",
 orxGRAPHIC_KZ_CONFIG_RGB       =       "RGB",
 orxGRAPHIC_KZ_CONFIG_HSL       =       "HSL",
 orxGRAPHIC_KZ_CONFIG_HSV       =       "HSV",
 orxGRAPHIC_KZ_CONFIG_FLIP      =       "Flip",
 orxGRAPHIC_KZ_CONFIG_REPEAT    =       "Repeat",
 orxGRAPHIC_KZ_CONFIG_SMOOTHING  =      "Smoothing",
 orxGRAPHIC_KZ_CONFIG_BLEND_MODE  =     "BlendMode",
 orxGRAPHIC_KZ_CONFIG_KEEP_IN_CACHE =   "KeepInCache"
 
--Screenshot Flags
public constant orxSCREENSHOT_KZ_DEFAULT_DIRECTORY_NAME = "../Documents",
			    orxSCREENSHOT_KZ_DEFAULT_BASE_NAME = "screenshot-",
			    orxSCREENSHOT_KZ_DEFAULT_EXTENSION = "png",
			    orxSCREENSHOT_KU32_DEFAULT_DIGITS = 4
			    
--Memory Flags
public enum orxMEMORY_TYPE_MAIN = 0,
			orxMEMORY_TYPE_AUDIO,
			orxMEMORY_TYPE_CONFIG,
			orxMEMORY_TYPE_DEBUG,
			orxMEMORY_TYPE_PHYSICS,
			orxMEMORY_TYPE_SYSTEM,
			orxMEMORY_TYPE_TEMP,
			orxMEMORY_TYPE_TEXT,
			orxMEMORY_TYPE_VIDEO,
			orxMEMORY_TYPE_NUMBER,
			orxMEMORY_TYPE_NONE = orxENUM_NONE
			
--Bank Flags
public constant orxBANK_KU32_FLAG_NONE = 0,
	   orxBANK_KU32_FLAG_NOT_EXPANDABLE = 1
			
--public object orxEVENT_SEND = {1,2,3,4,5,6}

--Texture Flags
public constant orxTEXTURE_KZ_RESOURCE_GROUP = "Texture",
				orxTEXTURE_KZ_SCREEN = "screen",
				orxTEXTURE_KZ_PIXEL = "pixel"
				
public enum orxTEXTURE_EVENT_CREATE = 0,
			orxTEXTURE_EVENT_DELETE,
			orxTEXTURE_EVENT_LOAD,
			orxTEXTURE_EVENT_NUMBER,
			orxTEXTURE_EVENT_NONE = orxENUM_NONE
			
--File Flags
public constant orxFILE_KU32_FLAG_INFO_NORMAL = 1,
				orxFILE_KU32_FLAG_INFO_READONLY = 2,
				orxFILE_KU32_FLAG_INFO_HIDDEN = 4,
				orxFILE_KU32_FLAG_INFO_DIRECTORY = 8,
				orxFILE_KU32_FLAG_OPEN_READ = #10000000,
				orxFILE_KU32_FLAG_OPEN_WRITE = #20000000,
				orxFILE_KU32_FLAG_OPEN_APPEND = #40000000,
				orxFILE_KU32_FLAG_OPEN_BINARY = #80000000
­555.45