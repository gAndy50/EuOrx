include "orxInclude.e"

include "math/orxVector.e"

include "display/orxTexture.e"
include "object/orxObject.e"
include "utils/orxLinkList.e"

public enum type orxSHADER_PARAM_TYPE

 orxSHADER_PARAM_TYPE_FLOAT = 0,
 orxSHADER_PARAM_TYPE_TEXTURE,
 orxSHADER_PARAM_TYPE_VECTOR,
 orxSHADER_PARAM_TYPE_TIME,
 orxSHADER_PARAM_TYPE_NUMBER,
 orxSHADER_PARAM_TYPE_NONE = 0xFFFFFFFF
	
end type

--orxShader_Param Struct
public constant orxSHADER_PARAM_stNode = 8, --LinkList Node
				orxSHADER_PARAM_zName = 16, --orxString
				orxSHADER_PARAM_eType = 20, --orxShader Param Type
				orxSHADER_PARAM_u32ArraySize = 24, --u32ArraySize
				SIZEOF_orxSHADER_PARAM = 28
				
public enum type orxSHADER_EVENT

	orxSHADER_EVENT_SET_PARAM = 0,
	orxSHADER_EVENT_NUMBER,
	orxSHADER_EVENT_NONE = 0xFFFFFFFF
	
end type

--orxShader_Event Payload
public constant ORXSHADER_EVENT_pstShader = 8, --orxShader
				ORXSHADER_EVENT_zShaderName = 16, --orxstring
				ORXSHADER_EVENT_zParamName = 20, --orxstring
				ORXSHADER_EVENT_eParamType = 24, --orxShader_Param_Type
				ORXSHADER_EVENT_s32ParamIndex = 28, --orxS32
				--union
				ORXSHADER_EVENT_fValue = 32 --float,
				ORXSHADER_EVENT_pstValue = 32, --orxTexture
				ORXSHADER_EVENT_vValue = 32, --orxVector
				SIZEOF_ORXSHADER_EVENT = 36
				
public constant xorxShader_Setup = orxDefine("orxShader_Setup",{}),
				xorxShader_Init = orxDefine("orxShader_Init",{},C_INT),
				xorxShader_Exit = orxDefine("orxShader_Exit",{}),
				xorxShader_Create = orxDefine("orxShader_Create",{},C_POINTER),
				xorxShader_CreateFromConfig = orxDefine("orxShader_CreateFromConfig",{C_STRING},C_POINTER),
				xorxshader_Delete = orxDefine("orxShader_Delete",{C_POINTER},C_INT),
				xorxShader_ClearCache = orxDefine("orxShader_ClearCache",{},C_INT),
				xorxShader_Start = orxDefine("orxShader_Start",{C_POINTER,C_POINTER},C_INT),
				xorxShader_Stop = orxDefine("orxShader_Stop",{C_POINTER},C_INT)
				
public procedure orxShader_Setup()

 orxProc(xorxShader_Setup,{})
	
end procedure

public function orxShader_Init()

 return orxFunc(xorxShader_Init,{})
	
end function

public procedure orxShader_Exit()

 orxProc(xorxShader_Exit,{})
	
end procedure

public function orxShader_Create()

 return orxFunc(xorxShader_Create,{})
	
end function

public function orxShader_CreateFromConfig(object _zConfigID)

 return orxFunc(xorxShader_CreateFromConfig,{_zConfigID})
	
end function

public function orxShader_Delete(object _pstShader)

 return orxFunc(xorxShader_Delete,{_pstShader})
	
end function

public function orxShader_ClearCache()

 return orxFunc(xorxShader_ClearCache,{})
	
end function

public function orxShader_Start(object _pstShader,object _pstOwner)

 return orxFunc(xorxShader_Start,{_pstShader,_pstOwner})
	
end function

public function orxShader_Stop(object _pstShader)

 return orxFunc(xorxShader_Stop,{_pstShader})
	
end function

public constant xorxShader_AddFloatParam = orxDefine("orxShader_AddFloatParam",{C_POINTER,C_STRING,C_UINT,C_FLOAT},C_INT),
				xorxShader_AddTextureParam = orxDefine("orxShader_AddTextureParam",{C_POINTER,C_STRING,C_UINT,C_POINTER},C_INT),
				xorxShader_AddVectorParam = orxDefine("orxShader_AddVectorParam",{C_POINTER,C_STRING,C_UINT,C_POINTER},C_INT),
				xorxShader_AddTimeParam = orxDefine("orxShader_AddTimeParam",{C_POINTER,C_STRING},C_INT),
				xorxShader_SetFloatParam = orxDefine("orxShader_SetFloatParam",{C_POINTER,C_STRING,C_UINT,C_FLOAT},C_INT),
				xorxShader_SetVectorParam = orxDefine("orxShader_SetVectorParam",{C_POINTER,C_STRING,C_UINT,C_POINTER},C_INT),
				xorxShader_CompileCode = orxDefine("orxShader_CompileCode",{C_POINTER,C_POINTER,C_UINT},C_INT),
				xorxShader_Enable = orxDefine("orxShader_Enable",{C_POINTER,C_BOOL}),
				xorxShader_IsEnabled = orxDefine("orxShader_IsEnabled",{C_POINTER},C_BOOL),
				xorxShader_GetName = orxDefine("orxShader_GetName",{C_POINTER},C_STRING),
				xorxShader_GetID = orxDefine("orxShader_GetID",{C_POINTER},C_UINT)
				
public function orxShader_AddFloatParam(object _pstShader,object _zName,atom _u32ArraySize,atom _afValueList)

 return orxFunc(xorxShader_AddFloatParam,{_pstShader,_zName,_u32ArraySize,_afValueList})
	
end function

public function orxShader_AddTextureParam(object _pstShader,object _zName,atom _u32ArraySize,object _apstValueList)

 return orxFunc(xorxShader_AddTextureParam,{_pstShader,_zName,_u32ArraySize,_apstValueList})
	
end function

public function orxShader_AddVectorParam(object _pstShader,object _zName,atom _u32ArraySize,object _avValueList)

 return orxFunc(xorxShader_AddVectorParam,{_pstShader,_zName,_u32ArraySize,_avValueList})
	
end function

public function orxShader_AddTimeParam(object _pstShader,object _zName)

 return orxFunc(xorxShader_AddTimeParam,{_pstShader,_zName})
	
end function

public function orxShader_SetFloatParam(object _pstShader,object _zName,atom _u32ArraySize,object _afValueList)

 return orxFunc(xorxShader_SetFloatParam,{_pstShader,_zName,_u32ArraySize,_afValueList})
	
end function

public function orxShader_SetTextureParam(object _pstShader,object _zName,atom _u32ArraySize,object _apstValueList)

 return orxFunc(xorxShader_SetTextureParam,{_pstShader,_zName,_u32ArraySize,_apstValueList})
	
end function

public function orxShader_SetVectorParam(object _pstShader,object _zName,atom _u32ArraySize,object _avValueList)

 return orxFunc(xorxShader_SetVectorParam,{_pstShader,_zName,_u32ArraySize,_avValueList})
	
end function

public function orxShader_CompileCode(object _pstShader,object _azCodeList,atom _u32Size)

 return orxFunc(xorxShader_CompileCode,{_pstShader,_azCodeList,_u32Size})
	
end function

public procedure orxShader_Enable(object _pstShader,atom _bEnable)

 orxProc(xorxShader_Enable,{_pstShader,_bEnable})
	
end procedure

public function orxShader_IsEnabled(object _pstShader)

 return orxFunc(xorxShader_IsEnabled,{_pstShader})
	
end function

public function orxShader_GetName(object _pstShader)

 return orxFunc(xorxShader_GetName,{_pstShader})
	
end function

public function orxShader_GetID(object _pstShader)

 return orxFunc(xorxShader_GetID,{_pstShader})
	
end function
­191.46