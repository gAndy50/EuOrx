include "orxInclude.e"

--include "orxDisplay.e"
--include "math/orxMath.e"

public constant orxTEXTURE_KZ_RESOURCE_GROUP = "Texture"

public constant orxTEXTURE_KZ_SCREEN = "screen"
public constant orxTEXTURE_KZ_PIXEL = "pixel"

public enum type orxTEXTURE_EVENT

 orxTEXTURE_EVENT_CREATE = 0,
 orxTEXTURE_EVENT_DELETE,
 orxTEXTURE_EVENT_LOAD,
 orxTEXTURE_EVENT_NUMBER,
 orxTEXTURE_EVENT_NONE = 0xFFFFFFFF
	
end type

constant xorxTexture_Setup = orxDefine("orxTexture_Setup",{}),
		 xorxTexture_Init = orxDefine("orxTexture_Init",{},C_INT),
		 xorxTexture_Exit = orxDefine("orxTexture_Exit",{})
		 
public procedure orxTexture_Setup()

 orxProc(xorxTexture_Setup,{})
	
end procedure

public function orxTexture_Init()

 return orxFunc(xorxTexture_Init,{})
	
end function

public procedure orxTexture_Exit()

 orxProc(xorxTexture_Exit,{})
	
end procedure

constant xorxTexture_Create = orxDefine("orxTexture_Create",{},C_POINTER),
		 xorxTexture_CreateFromFile = orxDefine("orxTexture_CreateFromFile",{C_STRING,C_BOOL},C_POINTER),
		 xorxTexture_Delete = orxDefine("orxTexture_Delete",{C_POINTER},C_INT),
		 xorxTexture_ClearCache = orxDefine("orxTexture_ClearCache",{},C_INT),
		 xorxTexture_LinkBitmap = orxDefine("orxTexture_LinkBitmap",{C_POINTER,C_POINTER,C_STRING,C_BOOL},C_INT),
		 xorxTexture_UnlinkBitmap = orxDefine("orxTexture_UnlinkBitmap",{C_POINTER},C_INT)
		 
public function orxTexture_Create()

 return orxFunc(xorxTexture_Create,{})
	
end function

public function orxTexture_CreateFromFile(object _zFileName,atom _bKeepInCache)

 return orxFunc(xorxTexture_CreateFromFile,{_zFileName,_bKeepInCache})
	
end function

public function orxTexture_Delete(object _pstTexture)

 return orxFunc(xorxTexture_Delete,{_pstTexture})
	
end function

public function orxTexture_ClearCache()

 return orxFunc(xorxTexture_ClearCache,{})
	
end function

public function orxTexture_LinkBitmap(object _pstTexture,object _pstBitmap,object _zDataName,atom _bTransferOwnership)

 return orxFunc(xotxTexture_LinkBitmap,{_pstTexture,_pstBitmap,_zDataName,_bTransferOwnership})
	
end function

public function orxTexture_UnlinkBitmap(object _pstTexture)

 return orxFunc(xorxTexture_UnlinkBitmap,{_pstTexture})
	
end function

constant xorxTexture_GetBitmap = orxDefine("orxTexture_GetBitmap",{C_POINTER},C_POINTER),
		 xorxTexture_GetSize = orxDefine("orxTexture_GetSize",{C_POINTER,C_POINTER,C_POINTER},C_INT),
		 xorxTexture_Get = orxDefine("orxTexture_Get",{C_STRING},C_POINTER),
		 xorxTexture_GetName = orxDefine("orxTexture_GetName",{C_POINTER},C_STRING),
		 xorxTexture_GetScreenTexture = orxDefine("orxTexture_GetScreenTexture",{},C_POINTER),
		 xorxTexture_GetLoadCount = orxDefine("orxTexture_GetLoadCount",{},C_UINT)
		 
public function orxTexture_GetBitmap(object _pstTexture)

 return orxFunc(xorxTexture_GetBitmap,{_pstTexture})
	
end function

public function orxTexture_GetSize(object _pstTexture,atom _pfWidth,atom _pfHeight)

 return orxFunc(xorxTexture_GetSize,{_pstTexture,_pfWidth,_pfHeight})
	
end function

public function orxTexture_Get(object _zName)

 return orxFunc(xorxTexture_Get,{_zName})
	
end function

public function orxTexture_GetName(object _pstTexture)

 return orxFunc(xorxTexture_GetName,{_pstTexture})
	
end function

public function orxTexture_GetScreenTexture()

 return orxFunc(xorxTexture_GetScreenTexture,{})
	
end function

public function orxTexture_GetLoadCount()

 return orxFunc(xorxTexture_GetLoadCount,{})
	
end function
­125.44