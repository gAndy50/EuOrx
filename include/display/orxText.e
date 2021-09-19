include "orxInclude.e"

include "display/orxFont.e"

public constant xorxText_Setup = orxDefine("orxText_Setup",{}),
				xorxText_Init = orxDefine("orxText_Init",{},C_INT),
				xorxText_Exit = orxDefine("orxText_Exit",{})
				
public procedure orxText_Setup()

 orxProc(xorxText_Setup,{})
	
end procedure

public function orxText_Init()

 return orxFunc(xorxText_Init,{})
	
end function

public procedure orxText_Exit()

 orxProc(xorxText_Exit,{})
	
end procedure

public constant xorxText_Create = orxDefine("orxText_Create",{},C_POINTER),
				xorxText_CreateFromConfig = orxDefine("orxText_CreateFromConfig",{C_STRING},C_POINTER),
				xorxText_Delete = orxDefine("orxText_Delete",{C_POINTER},C_INT)
				
public function orxText_Create()

 return orxFunc(xorxText_Create,{})
	
end function

public function orxText_CreateFromConfig(object _zConfigID)

 return orxFunc(xorxText_CreateFromConfig,{_zConfigID})
	
end function

public function orxText_Delete(object _pstText)

 return orxFunc(xorxText_Delete,{_pstText})
	
end function

public constant xorxText_GetName = orxDefine("orxText_GetName",{C_POINTER},C_STRING),
				xorxText_GetLineCount = orxDefine("orxText_GetLineCount",{C_POINTER},C_UINT),
				xorxText_GetLineSize = orxDefine("orxText_GetLineSize",{C_POINTER,C_UINT,C_POINTER,C_POINTER},C_INT),
				xorxText_IsFixedSize = orxDefine("orxText_IsFixedSize",{C_POINTER},C_BOOL)
				
public function orxText_GetName(object _pstText)

 return orxFunc(xorxText_GetName,{_pstText})
	
end function

public function orxText_GetLineCount(object _pstText)

 return orxFunc(xorxText_GetLineCount,{_pstText})
	
end function

public function orxText_GetLineSize(object _pstText,atom _u32Line,atom _pfWidth,atom _pfHeight)

 return orxFunc(xorxText_GetLineSize,{_pstText,_u32Line,_pfWidth,_pfHeight})
	
end function

public function orxText_IsFixedSize(object _pstText)

 return orxFunc(xorxText_IsFixedSize,{_pstText})
	
end function

public constant xorxText_GetSize = orxDefine("orxText_GetSize",{C_POINTER,C_POINTER,C_POINTER},C_INT),
				xorxText_GetString = orxDefine("orxText_GetString",{C_POINTER},C_STRING),
				xorxText_GetFont = orxDefine("orxText_GetFont",{C_POINTER},C_POINTER)
				
public function orxText_GetSize(object _pstText,atom _pfWidth,atom _pfHeight)

 return orxFunc(xorxText_GetSize,{_pstText,_pfWidth,_pfHeight})
	
end function

public function orxText_GetString(object _pstText)

 return orxFunc(xorxText_GetString,{_pstText})
	
end function

public function orxText_GetFont(object _pstText)

 return orxFunc(xorxText_GetFont,{_pstText})
	
end function

public constant xorxText_SetSize = orxDefine("orxText_SetSize",{C_POINTER,C_FLOAT,C_FLOAT,C_POINTER},C_INT),
				xorxText_SetString = orxDefine("orxText_SetString",{C_POINTER,C_STRING},C_INT),
				xorxText_SetFont = orxDefine("orxText_SetFont",{C_POINTER,C_POINTER},C_INT)
				
public function orxText_SetSize(object _pstText,atom _fWidth,atom _fHeight,object _pzExtra)

 return orxFunc(xorxText_SetSize,{_pstText,_fWidth,_fHeight,_pzExtra})
	
end function

public function orxText_SetString(object _pstText, object _zString)

 return orxFunc(xorxText_SetString,{_pstText,_zString})
	
end function

public function orxText_SetFont(object _pstText,object _pstFont)

 return orxFunc(xorxText_SetFont,{_pstText,_pstFont})
	
end function
­118.53