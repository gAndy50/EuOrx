include "orxInclude.e"

--public include "math/orxVector.e"
--public include "math/orxOBox.e"
--public include "memory/orxBank.e"
--public include "utils/orxHashTable.e"
--public include "utils/orxString.e"
--public include "utils/orxLinkList.e"

public constant orxU8 = 0, --U8 
 			    u8R = 0, --U8
 			    u8G = 0, --U8
 			    u8B = 0, --U8
 			    u8A = 0, --U8
 			    u32RGBA = 0, --all in declared in C union
 			    SIZEOF_orxRGBA = 1
 			    
public constant fX = 0, --float
				fY = 4, --float
				fU = 8, --float
				fV = 12, --float
				stRGBA = 16, --orxRGBA
				SIZEOF_orxDISPLAY_VERTEX = 20

public constant fSrcX = 0, --float
				fSrcY = 4, --float
				fDstX = 8, --float
				fDstY = 12, --float
				fRepeatX = 16, --float
				fRepeatY = 20, --float
				fScaleX = 24, --float
				fScaleY = 28, --float
				fRotation = 32, --float
				SIZEOF_orxDISPLAY_TRANSFORM = 36
				
public enum type orxDISPLAY_PRIMITIVE

 orxDISPLAY_PRIMITIVE_POINTS = 0,
 orxDISPLAY_PRIMITIVE_LINES,
 orxDISPLAY_PRIMITIVE_LINE_LOOP,
 orxDISPLAY_PRIMITIVE_LINE_STRIP,
 orxDISPLAY_PRIMITIVE_TRIANGLES,
 orxDISPLAY_PRIMITIVE_TRIANGLE_STRIP,
 orxDISPLAY_PRIMITIVE_TRIANGLE_FAN,
 orxDISPLAY_PRIMITIVE_NUMBER,
 
 orxDISPLAY_PRIMITIVE_NONE = 0xFFFFFFFF
	
end type

--orxDISPLAY Mesh Struct Conversion (TBD)

public constant u32Width = 0,
				u32Height = 4,
				u32Depth = 8,
				u32RefreshRate = 12,
				bFullScreen = 16,
				SIZEOF_orxDISPLAY_VIDEO_MODE = 20
				
--orxCHARACTER_GLYPH Struct Conversion (TBD)

public enum type orxDISPLAY_SMOOTHING

 orxDISPLAY_SMOOTHING_DEFAULT = 0,
 orxDISPLAY_SMOOTHING_ON,
 orxDISPLAY_SMOOTHING_OFF,
 orxDISPLAY_SMOOTHING_NUMBER,
 orxDISPLAY_SMOOTHING_NONE = 0xFFFFFFFF
	
end type

public enum type orxDISPLAY_BLEND_MODE

 orxDISPLAY_BLEND_MODE_ALPHA = 0,
 orxDISPLAY_BLEND_MODE_MULTIPLY,
 orxDISPLAY_BLEND_MODE_ADD,
 orxDISPLAY_BLEND_MODE_PREMUL,
 orxDISPLAY_BLEND_MODE_NUMBER,
 orxDISPLAY_BLEND_MODE_NONE = 0xFFFFFFFF
	
end type

public constant vRGB = 0, --orxVector (union)
				vHSL = 0, --orxVector (union)
				vHSV = 0, --orxVector (union)
				fAlpha = 4, --float
				SIZEOF_orxCOLOR = 8
				
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
				
public enum type orxDISPLAY_EVENT

 orxDISPLAY_EVENT_SET_VIDEO_MODE = 0,
 orxDISPLAY_EVENT_LOAD_BITMAP,
 orxDISPLAY_EVENT_NUMBER,
 orxDISPLAY_EVENT_NONE = 0xFFFFFFFF
	
end type

--orxDisplay_Event_Payload Struct (TBD)
­130.39