include "orxInclude.e"

public enum type orxLOCALE_EVENT

 orxLOCALE_EVENT_SELECT_LANGUAGE = 0,
 orxLOCALE_EVENT_SET_STRING,
 orxLOCALE_EVENT_NUMBER,
 orxLOCALE_EVENT_NONE = 0xFFFFFFFF
	
end type

public constant ORXLOCALE_EVENT_PAYLOAD_ZLANGUAGE = 0,
				ORXLOCALE_EVENT_PAYLOAD_ZSTRINGKEY = 4,
				ORXLOCALE_EVENT_PAYLOAD_ZSTRINGVALUE = 8,
				SIZEOF_ORXLOCALE_EVENT_PAYLOAD = 12
				
public constant xorxLocale_Setup = orxDefine("orxLocale_Setup",{}),
				xorxLocale_Init = orxDefine("orxLocale_Init",{},C_INT),
				xorxLocale_Exit = orxDefine("orxLocale_Exit",{})
				
public procedure orxLocale_Setup()

 orxProc(xorxLocale_Setup,{})
	
end procedure

public function orxLocale_Init()

 return orxFunc(xorxLocale_Init,{})
	
end function

public procedure orxLocale_Exit()

 orxProc(xorxLocale_Exit,{})
	
end procedure

public constant xorxLocale_SelectLanguage = orxDefine("orxLocale_SelectLanguage",{C_STRING},C_INT),
				xorxLocale_GetCurrentLanuage = orxDefine("orxLocale_GetCurrentLanguage",{},C_STRING),
				xorxLocale_HasLanguage = orxDefine("orxLocale_HasLanguage",{C_STRING},C_BOOL),
				xorxLocale_GetLanguageCount = orxDefine("orxLocale_GetLanguageCount",{},C_UINT),
				xorxLocale_GetLanguage = orxDefine("orxLocale_GetLanguage",{C_UINT},C_STRING)
				
public function orxLocale_SelectLanguage(object _zLang)

 return orxFunc(xorxLocale_SelectLanguage,{_zLang})
	
end function

public function orxLocale_GetCurrentLanguage()

 return orxFunc(xorxLocale_GetCurrentLanguage,{})
	
end function

public function orxLocale_HasLanguage(object _zLang)

 return orxFunc(xorxLocale_HasLanguage,{_zLang})
	
end function

public function orxLocale_GetLanguageCount()

 return orxFunc(xorxLocale_GetLanguageCount,{})
	
end function

public function orxLocale_GetLanguage(atom _u32LangInd)

 return orxFunc(xorxLocale_GetLanguage,{_u32LangInd})
	
end function

public constant xorxLocale_HasString = orxDefine("orxLocale_HasString",{C_STRING},C_BOOL),
				xorxLocale_GetString = orxDefine("orxLocale_GetString",{C_STRING},C_STRING),
				xorxLocale_SetString = orxDefine("orxLocale_SetString",{C_STRING,C_STRING},C_INT}),
				xorxLocale_GetKeyCount = orxDefine("orxLocale_GetKeyCount",{},C_UINT),
				xorxLocale_GetKey = orxDefine("orxLocale_GetKey",{C_UINT},C_STRING)
				
public function orxLocale_HasString(object _zKey)

 return orxFunc(xorxLocale_HasString,{_zKey})
	
end function

public function orxLocale_GetString(object _zKey)

 return orxFunc(xorxLocale_GetString,{_zKey})
	
end function

public function orxLocale_SetString(object _zKey,object _zVal)

 return orxFunc(xorxLocale_SetString,{_zKey,_zVal})
	
end function

public function orxLocale_GetKeyCount()

 return orxFunc(xorxLocale_GetKeyCount,{})
	
end function

public function orxLocale_GetKey(atom _u32KeyInd)

 return orxFunc(xorxLocale_GetKey,{_u32KeyInd})
	
end function
­107.47