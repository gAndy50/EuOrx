include "orxInclude.e"

include "display/orxTexture.e"
include "math/orxVector.e"

public constant orxFONT_KZ_DEFAULT_FONT_NAME = "default"

public constant xorxFont_Setup = orxDefine("orxFont_Setup",{}),
				xorxFont_Init = orxDefine("orxFont_Init",{},C_INT),
				xorxFont_Exit = orxDefine("orxFont_Exit",{})
				
public procedure orxFont_Setup()

 orxProc(xorxFont_Setup,{})
	
end procedure

public function orxFont_Init()

 return orxFunc(xorxFont_Init,{})
	
end function

public procedure orxFont_Exit()

 orxProc(xorxFont_Exit,{})
	
end procedure

public constant xorxFont_Create = orxDefine("orxFont_Create",{},C_POINTER),
				xorxFont_CreateFromConfig = orxDefine("orxFont_CreateFromConfig",{C_STRING},C_POINTER),
				xorxFont_Delete = orxDefine("orxFont_Delete",{C_POINTER},C_INT)
				
public function orxFont_Create()

 return orxFunc(xorxFont_Create,{})
	
end function

public function orxFont_CreateFromConfig(object _zConfigID)

 return orxFunc(xorxFont_CreateFromConfig,{_zConfigID})
	
end function

public function orxFont_Delete(object _pstFont)

 return orxFunc(xorxFont_Delete,{_pstFont})
	
end function

public constant xorxFont_GetDefaultFont = orxDefine("orxFont_GetDefaultFont",{},C_POINTER)

public function orxFont_GetDefaultFont()

 return orxFunc(xorxFont_GetDefaultFont,{})
	
end function

public constant xorxFont_SetTexture = orxDefine("orxFont_SetTexture",{C_POINTER,C_POINTER},C_INT),
				xorxFont_SetCharacterList = orxDefine("orxFont_SetCharacterList",{C_POINTER,C_STRING},C_INT),
				xorxFont_SetCharacterHeight = orxDefine("orxFont_SetCharacterHeight",{C_POINTER,C_FLOAT},C_INT),
				xorxFont_SetCharacterWidthList = orxDefine("orxFont_SetCharacterWidthList",{C_POINTER,C_UINT,C_POINTER},C_INT),
				xorxFont_SetCharacterSpacing = orxDefine("orxFont_SetCharacterSpacing",{C_POINTER,C_POINTER},C_INT),
				xorxFont_SetOrigin = orxDefine("orxFont_SetOrigin",{C_POINTER,C_POINTER},C_INT),
				xorxFont_SetSize = orxDefine("orxFont_SetSize",{C_POINTER,C_POINTER},C_INT)
				
public function orxFont_SetTexture(object _pstFont,object _pstTexture)

 return orxFunc(xorxFont_SetTexture,{_pstFont,_pstTexture})
	
end function

public function orxFont_SetCharacterList(object _pstFont,object _zList)

 return orxFunc(xorxFont_SetCharacterList,{_pstFont,_zList})
	
end function

public function orxFont_SetCharacterHeight(object _pstFont,atom _fCharacterHeight)

 return orxFunc(xorxFont_SetCharacterHeight,{_pstFont,_fCharacterHeight})
	
end function

public function orxFont_SetCharacterWidthList(object _pstFont,atom _u32CharNumber,atom _afCharWidthList)

 return orxFunc(xorxFont_SetCharacterWidthList,{_pstFont,_u32CharNumber,_afCharWidthList})
	
end function

public function orxFont_SetCharacterSpacing(object _pstFont,object _pvSpacing)

 _pvSpacing = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxFont_SetCharacterSpacing,{_pstFont,_pvSpacing})
	
end function

public function orxFont_SetOrigin(object _pstFont,object _pvOrigin)

 _pvOrigin = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxFont_SetOrigin,{_pstFont,_pvOrigin})
	
end function

public function orxFont_SetSize(object _pstFont,object _pvSize)

 _pvSize = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxFont_SetSize,{_pstFont,_pvSize})
	
end function

public constant xorxFont_GetTexture = orxDefine("orxFont_GetTexture",{C_POINTER},C_POINTER),
				xorxFont_GetCharacterList = orxDefine("orxFont_GetCharacterList",{C_POINTER},C_STRING),
				xorxFont_GetCharacterHeight = orxDefine("orxFont_GetCharacterHeight",{C_POINTER},C_FLOAT),
				xorxFont_GetCharacterWidth = orxDefine("orxFont_GetCharacterWidth",{C_POINTER,C_UINT},C_FLOAT),
				xorxFont_GetCharacterSpacing = orxDefine("orxFont_GetCharacterSpacing",{C_POINTER,C_POINTER},C_POINTER),
				xorxFont_GetOrigin = orxDefine("orxFont_GetOrigin",{C_POINTER,C_POINTER},C_POINTER),
				xorxFont_GetSize = orxDefine("orxFont_GetSize",{C_POINTER,C_POINTER},C_POINTER)
				
public function orxFont_GetTexture(object _pstFont)

 return orxFunc(xorxFont_GetTexture,{_pstFont})
	
end function

public function orxFont_GetCharacterList(object _pstFont)

 return orxFunc(xorxFont_GetCharacterList,{_pstFont})
	
end function

public function orxFont_GetCharacterHeight(object _pstFont)

 return orxFunc(xorxFont_GetCharacterHeight,{_pstFont})
	
end function

public function orxFont_GetCharacterWidth(object _pstFont,atom _u32CharCodePt)

 return orxFunc(xorxFont_GetCharacterWidth,{_pstFont,_u32CharCodePt})
	
end function

public function orxFont_GetCharacterSpacing(object _pstFont,object _pvSpacing)

 _pvSpacing = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxFont_GetCharacterSpacing,{_pstFont,_pvSpacing})
	
end function

public function orxFont_GetOrigin(object _pstFont,object _pvOrigin)

 _pvOrigin = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxFont_GetOrigin,{_pvOrigin})
	
end function

public function orxFont_GetSize(object _pstFont,object _pvSize)

 _pvSize = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxFont_GetSize,{_pstFont,_pvSize})
	
end function

public constant xorxFont_GetMap = orxDefine("orxFont_GetMap",{C_POINTER},C_POINTER)

public function orxFont_GetMap(object _pstFont)

 return orxFunc(xorxFont_GetMap,{_pstFont})
	
end function

public constant xorxFont_GetName = orxDefine("orxFont_GetName",{C_POINTER},C_STRING)

public function orxFont_GetName(object _pstFont)

 return orxFunc(xorxFont_GetName,{_pstFont})
	
end function
­184.44