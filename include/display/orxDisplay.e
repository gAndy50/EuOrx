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

--orxDISPLAY Mesh Struct Conversion
public constant astVertexList = 4, --orxDISPLAY_VERTEX Pointer
				au16IndexList = 8, --orxU16
				u32VertexNumber = 12, --orxu32
				u32IndexNumber = 16, --orxu32
				ePrimitive = 20, --orxDISPLAY_PRIMITIVE
				SIZEOF_orxDISPLAY_MESH = 24

public constant u32Width = 0,
				u32Height = 4,
				u32Depth = 8,
				u32RefreshRate = 12,
				bFullScreen = 16,
				SIZEOF_orxDISPLAY_VIDEO_MODE = 20
				
--orxCHARACTER_GLYPH Struct Conversion 
public constant fGlyphX = 0, -- float
				fGlyphY = 4, --float
				fGlyphWidth = 8, --float
				SIZEOF_CHARACTER_GLYPH = 12
				
--orxCHARACTER_MAP Sturct Conversion
public constant fCharacterHeight = 0, --float
				pstCharacterBank = 8, --orxBANK
				pstCharacterTable = 16, --orxHASHTABLE
				SIZEOF_orxCHARACTER_MAP = 20

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
public constant u32Width = 0, --u32
				u32Height = 0, --u32
				u32Depth = 0, --u32
				u32RefreshRate = 0, --u32
				u32PreviousWidth = 0, --u32
				u32PreviousHeight = 0, --u32
				u32PreviousDepth = 0, --u32
				u32PreviousRefreshRate = 0, --u32
				bFullScreen = 0, --u32
				--stVideoMode Union
				zLocation = 8, --orxSTRING
				stFilenameID = 16, --orxSTRINGID
				u32ID = 20, --u32
				--stBitmap
				SIZEOF_orxDISPLAY_EVENT_PAYLOAD = 24
				
--TBD: Inline Functions
				
constant xorxDisplay_Setup = orxDefine("orxDisplay_Setup",{})

public procedure orxDisplay_Setup()

 orxProc(xorxDisplay_Setup,{})
	
end procedure

public constant xorxDisplay_GetBlendModeFromString = orxDefine("orxDisplay_GetBlendModeFromString",{C_STRING},C_INT)

public function orxDisplay_GetBlendModeFromString(object _zBlendMode)

 return orxFunc(xorxDisplay_GetBlendModeFromString,{_zBlendMode})
	
end function

constant xorxDisplay_Init = orxDefine("orxDisplay_Init",{},C_INT),
		 xorxDisplay_Exit = orxDefine("orxDisplay_Exit",{})
		 
public function orxDisplay_Init()

 return orxFunc(xorxDisplay_Init,{})
	
end function

public procedure orxDisplay_Exit()

 orxProc(xorxDisplay_Exit,{})
	
end procedure

constant xorxDisplay_Swap = orxDefine("orxDisplay_Swap",{},C_INT)

public function orxDisplay_Swap()

 return orxFunc(xorxDisplay_Swap,{})
	
end function

constant xorxDisplay_CreateBitmap = orxDefine("orxDisplay_CreateBitmap",{C_UINT,C_UINT},C_POINTER),
		 xorxDisplay_DeleteBitmap = orxDefine("orxDisplay_DeleteBitmap",{C_POINTER})
		 
public function orxDisplay_CreateBitmap(atom _u32Width,atom _u32Height)

 return orxFunc(xorxDisplay_CreateBitmap,{_u32Width,_u32Height})
	
end function

public procedure orxDisplay_DeleteBitmap(object _pstBitmap)

 orxProc(xorxDisplay_DeleteBitmap,{_pstBitmap})
	
end procedure

constant xorxDisplay_LoadBitmap = orxDefine("orxDisplay_LoadBitmap",{C_STRING},C_POINTER),
		 xorxDisplay_SaveBitmap = orxDefine("orxDisplay_SaveBitmap",{C_POINTER,C_STRING},C_INT)
		 
public function orxDisplay_LoadBitmap(object _zFileName)

 return orxFunc(xorxDisplay_LoadBitmap,{_zFileName})
	
end function

public function orxDisplay_SaveBitmap(object _pstBitmap,object _zFileName)

 return orxFunc(xorxDisplay_SaveBitmap,{_pstBitmap,_zFileName})
	
end function

constant xorxDisplay_SetTempBitmap = orxDefine("orxDisplay_SetTempBitmap",{C_POINTER},C_INT),
		 xorxDisplay_GetTempBitmap = orxDefine("orxDisplay_GetTempBitmap",{},C_POINTER)
		 
public function orxDisplay_SetTempBitmap(object _pstBitmap)

 return orxFunc(xorxDisplay_SetTempBitmap,{_pstBitmap})
	
end function

public function orxDisplay_GetTempBitmap()

 return orxFunc(xorxDisplay_GetTempBitmap,{})
	
end function

constant xorxDisplay_SetDestinationBitmaps = orxDefine("orxDisplay_SetDestinationBitmaps",{C_POINTER,C_UINT},C_INT),
		 xorxDisplay_ClearBitmap = orxDefine("orxDisplay_ClearBitmap",{C_POINTER,C_INT},C_INT),
		 xorxDisplay_SetBlendMode = orxDefine("orxDisplay_SetBlendMode",{C_INT},C_INT),
		 xorxDisplay_SetBitmapClipping = orxDefine("orxDisplay_SetBitmapClipping",{C_POINTER,C_UINT,C_UINT,C_UINT,C_UINT},C_INT)
		 
public function orxDisplay_SetDestinationBitmaps(object _apstBitmapList, atom _u32Number)

 return orxFunc(xorxDisplay_SetDestinationBitmaps,{_apstBitmapList,_u32Number})
	
end function

public function orxDisplay_ClearBitmap(object _pstBitmap, atom _stColor)

 return orxFunc(xorxDisplay_ClearBitmap,{_pstBitmap,_stColor})
	
end function

public function orxDisplay_SetBlendMode(atom _eBlendMode)

 return orxFunc(xorxDisplay_SetBlendMode,{_eBlendMode})
	
end function

public function orxDisplay_SetBitmapClipping(object _pstBitmap,atom _u32TLX, atom _u32TLY, atom _u32BRX, atom _u32BRY)

 return orxFunc(xorxDisplay_SetBitmapClipping,{_pstBitmap,_u32TLX,_u32TLY,_u32BRX,_u32BRY})
	
end function

constant xorxDisplay_SetBitmapData = orxDefine("orxDisplay_SetBitmapData",{C_POINTER,C_POINTER,C_UINT},C_INT),
		 xorxDisplay_GetBitmapData = orxDefine("orxDisplay_GetBitmapData",{C_POINTER,C_POINTER,C_UINT},C_INT),
		 xorxDisplay_SetPartialBitmapData = orxDefine("orxDisplay_SetPartialBitmapData",{C_POINTER,C_POINTER,C_UINT,C_UINT,C_UINT,C_UINT},C_INT),
		 xorxDisplay_GetBitmapSize = orxDefine("orxDisplay_GetBitmapSize",{C_POINTER,C_POINTER,C_POINTER},C_INT),
		 xorxDisplay_GetBitmapID = orxDefine("orxDisplay_GetBitmapID",{C_POINTER},C_UINT)
		 
public function orxDisplay_SetBitmapData(object _pstBitmap,object _au8Data, atom _u32ByteNumber)

 return orxFunc(xorxDisplay_SetBitmapData,{_pstBitmap,_au8Data,_u32ByteNumber})
	
end function

public function orxDisplay_GetBitmapData(object _pstBitmap,object _au8Data,atom _u32ByteNumber)

 return orxFunc(xorxDisplay_GetBitmapData,{_pstBitmap,_au8Data,_u32ByteNumber})
	
end function

public function orxDisplay_SetPartialBitmapData(object _pstBitmap,object _au8Data,atom _u32X,atom _u32Y,atom _u32Width, atom _u32Height)

 return orxFunc(xorxDisplay_SetPartialBitmapData,{_pstBitmap,_au8Data,_u32X,_u32Y,_u32Width,_u32Height})
	
end function

public function orxDisplay_GetBitmapSize(object _pstBitmap,atom _pfWidth,atom _pfHeight)

 return orxFunc(xorxDisplay_GetBitmapSize,{_pstBitmap,_pfWidth,_pfHeight})
	
end function

public function orxDisplay_GetBitmapID(object _pstBitmap)

 return orxFunc(xorxDisplay_GetBitmapID,{_pstBitmap})
	
end function

constant xorxDisplay_TransformBitmap = orxDefine("orxDisplay_TransformBitmap",{C_POINTER,C_POINTER,C_INT,C_INT,C_INT},C_INT),
		 xorxDisplay_TransformText = orxDefine("orxDisplay_TransformText",{C_STRING,C_POINTER,C_POINTER,C_POINTER,C_INT,C_INT,C_INT},C_INT)
		 
public function orxDisplay_TransformBitmap(object _pstSrc,object _pstTransform,atom _stColor,atom _eSmoothing,atom _eBlendMode)

 return orxFunc(xorxDisplay_TransformBitmap,{_pstSrc,_pstTransform,_stColor,_eSmoothing,_eBlendMode})
	
end function

public function orxDisplay_TransformText(object _zString,object _pstFont, object _pstMap,object _pstTransform,atom _stColor,atom _eSmooting,atom _eBlendMode)

 return orxFunc(xorxDisplay_TransformText,{_zString,_pstFont,_pstMap,_pstTransform,_stColor,_eSmooting,_eBlendMode})
	
end function

constant xorxDisplay_DrawLine = orxDefine("orxDisplay_DrawLine",{C_POINTER,C_POINTER,C_INT},C_INT),
		 xorxDisplay_DrawPolyLine = orxDefine("orxDisplay_DrawPolyLine",{C_POINTER,C_UINT,C_INT},C_INT),
		 xorxDisplay_DrawPolygon = orxDefine("orxDisplay_DrawPolygon",{C_POINTER,C_UINT,C_INT,C_BOOL},C_INT),
		 xorxDisplay_DrawCircle = orxDefine("orxDisplay_DrawCircle",{C_POINTER,C_FLOAT,C_INT,C_BOOL},C_INT),
		 xorxDisplay_DrawOBox = orxDefine("orxDisplay_DrawOBox",{C_POINTER,C_INT,C_BOOL},C_INT),
		 xorxDisplay_DrawMesh = orxDefine("orxDisplay_DrawMesh",{C_POINTER,C_POINTER,C_INT,C_INT},C_INT)
		 
public function orxDisplay_DrawLine(object _pvStart,object _pvEnd,atom _stColor)

 return orxFunc(xorxDisplay_DrawLine,{_pvStart,_pvEnd,_stColor})
	
end function

public function orxDisplay_DrawPolyLine(object _avVertexList,object _u32VertexNumber,atom _stColor)

 return orxFunc(xorxDisplay_DrawPolyLine,{_avVertexList,_u32VertexNumber,_stColor})
	
end function

public function orxDisplay_DrawPolygon(object _avVertexList,atom _u32VertexNumber,atom _stColor,atom _bFill)

 return orxFunc(xorxDisplay_DrawPolygon,{_avVertexList,_u32VertexNumber_stColor,_bFill})
	
end function

public function orxDisplay_DrawCircle(object _pvCenter,atom _fRadius,atom _stColor,atom _bFill)

 return orxFunc(xorxDisplay_DrawCircle,{_pvCenter,_fRadius,_stColor,_bFill})
	
end function

public function orxDisplay_DrawOBox(object _pstBox,atom _stColor,atom _bFill)

 return orxFunc(xorxDisplay_DrawOBox,{_pstBox,_stColor,_bFill})
	
end function

public function orxDisplay_DrawMesh(object _pstMesh,object _pstBitmap,atom _eSmoothing,atom _eBlendMode)

 return orxFunc(xorxDisplay_DrawMesh,{_pstMesh,_pstBitmap,_eSmoothing,_eBlendMode})
	
end function

constant xorxDisplay_HasShaderSupport = orxDefine("orxDisplay_HasShaderSupport",{},C_BOOL),
		 xorxDisplay_CreateShader = orxDefine("orxDisplay_CreateShader",{C_STRING,C_UINT,C_POINTER,C_BOOL},C_POINTER),
		 xorxDisplay_DeleteShader = orxDefine("orxDisplay_DeleteShader",{C_POINTER}),
		 xorxDisplay_StartShader = orxDefine("orxDisplay_StartShader",{C_POINTER},C_INT),
		 xorxDisplay_StopShader = orxDefine("orxDisplay_StopShader",{C_POINTER},C_INT),
		 xorxDisplay_GetParameterID = orxDefine("orxDisplay_GetParameterID",{C_POINTER,C_STRING,C_INT,C_BOOL},C_INT)
		 
public function orxDisplay_HasShaderSupport()

 return orxFunc(xorxDisplay_HasShaderSupport,{})
	
end function

public function orxDisplay_CreateShader(object _azCodeList,atom _u32Size,object _pstParamList,atom _bUseCustomParam)

 return orxFunc(orxDisplay_CreateShader,{_azCodeList,_u32Size,_pstParamList,_bUseCustomParam})
	
end function

public function orxDisplay_DeleteShader(object _hShader)

 return orxFunc(xorxDisplay_DeleteShader,{_hShader})
	
end function

public function orxDisplay_StartShader(object _hShader)

 return orxFunc(xorxDisplay_StartShader,{_hShader})
	
end function

public function orxDisplay_StopShader(object _hShader)

 return orxFunc(xorxDisplay_StopShader,{_hShader})
	
end function

public function orxDisplay_GetParameterID(object _hShader,object _zParam,atom _s32Index,atom _bIsTexture)

 return orxFunc(xorxDisplay_GetParameterID,{_hShader,_zParam,_s32Index,_bIsTexture})
	
end function

constant xorxDisplay_SetShaderBitmap = orxDefine("orxDisplay_SetShaderBitmap",{C_POINTER,C_INT,C_POINTER},C_INT),
		 xorxDisplay_SetShaderFloat = orxDefine("orxDisplay_SetShaderFloat",{C_POINTER,C_INT,C_FLOAT},C_INT),
		 xorxDisplay_SetShaderVector = orxDefine("orxDisplay_SetShaderVector",{C_POINTER,C_INT,C_POINTER},C_INT),
		 xorxDisplay_GetShaderID = orxDefine("orxDisplay_GetShaderID",{C_POINTER},C_UINT)
		 
public function orxDisplay_SetShaderBitmap(object _hShader,atom _s32ID,object _pstValue)

 return orxFunc(xorxDisplay_SetShaderBitmap,{_hShader,_s32ID,_pstValue})
	
end function

public function orxDisplay_SetShaderFloat(object _hShader,atom _s32ID,atom _fValue)

 return orxFunc(xorxDisplay_SetShaderFloat,{_hShader,_s32ID,_fValue})
	
end function

public function orxDisplay_SetShaderVector(object _hShader,atom _s32ID,object _pvValue)

 return orxFunc(xorxDisplay_SetShaderVector,{_hShader,_s32ID,_pvValue})
	
end function

public function orxDisplay_GetShaderID(object _hShader)

 return orxFunc(xorxDisplay_GetShaderID,{_hShader})
	
end function

constant xorxDisplay_EnableVSync = orxDefine("orxDisplay_EnableVSync",{C_BOOL},C_INT),
		 xorxDisplay_IsVSyncEnabled = orxDefine("orxDisplay_IsVSyncEnabled",{},C_BOOL)
		 
public function orxDisplay_EnableVSync(atom _bEnable)

 return orxFunc(xorxDisplay_EnableVSync,{_bEnable})
	
end function

public function orxDisplay_IsVSyncEnabled()

 return orxFunc(xorxDisplay_IsVSyncEnabled,{})
	
end function

constant xorxDisplay_SetFullScreen = orxDefine("orxDisplay_SetFullScreen",{C_BOOL},C_INT),
		 xorxDisplay_IsFullScreen = orxDefine("orxDisplay_IsFullScreen",{},C_BOOL)
		 
public function orxDisplay_SetFullScreen(atom _bFullScreen)

 return orxFunc(xorxDisplay_SetFullScreen,{_bFullScreen})
	
end function

public function orxDisplay_IsFullScreen()

 return orxFunc(xorxDisplay_IsFullScreen,{})
	
end function

constant xorxDisplay_GetVideoModeCount = orxDefine("orxDisplay_GetVideoModeCount",{},C_UINT),
		 xorxDisplay_GetVideoMode = orxDefine("orxDisplay_GetVideoMode",{C_UINT,C_POINTER},C_POINTER),
		 xorxDisplay_SetVideoMode = orxDefine("orxDisplay_SetVideoMode",{C_POINTER},C_INT),
		 xorxDisplay_IsVideoModeAvailable = orxDefine("orxDisplay_IsVideoModeAvailable",{C_POINTER},C_BOOL)
		 
public function orxDisplay_GetVideoModeCount()

 return orxFunc(xorxDisplay_GetVideoModeCount,{})
	
end function

public function orxDisplay_GetVideoMode(atom _u32Index,object _pstVideoMode)

 return orxFunc(xorxDisplay_GetVideoMode,{_u32Index,_pstVideoMode})
	
end function

public function orxDisplay_SetVideoMode(object _pstVideoMode)

 return orxFunc(xorxDisplay_SetVideoMode,{_pstVideoMode})
	
end function

public function orxDisplay_IsVideoModeAvailable(object _pstVideoMode)

 return orxFunc(xorxDisplay_IsVideoModeAvailable,{_pstVideoMode})
	
end function
­499.65