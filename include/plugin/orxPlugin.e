include "orxInclude.e"
include "plugin/orxPluginType.e"

public constant xorxPlugin_Setup = orxDefine("orxPlugin_Setup",{}),
				xorxPlugin_Init = orxDefine("orxPlugin_Init",{},C_INT),
				xorxPlugin_Exit = orxDefine("orxPlugin_Exit",{})
				
public procedure orxPlugin_Setup()

 orxProc(xorxPlugin_Setup,{})
	
end procedure

public function orxPlugin_Init()

 return orxFunc(xorxPlugin_Init,{})
	
end function

public procedure orxPlugin_Exit()

 orxProc(xorxPlugin_Exit,{})
	
end procedure

public constant xorxPlugin_Load = orxDefine("orxPlugin_Load",{C_STRING,C_STRING},C_POINTER),
				xorxPlugin_LoadUsingExt = orxDefine("orxPlugin_LoadUsingExt",{C_STRING,C_STRING},C_POINTER),
				xorxPlugin_Unload = orxDefine("orxPlugin_Unload",{C_POINTER},C_INT),
				xorxPlugin_GetFunction = orxDefine("orxPlugin_GetFunction",{C_POINTER,C_STRING},C_INT),
				xorxPlugin_GetHandle = orxDefine("orxPlugin_GetHandle",{C_STRING},C_POINTER),
				xorxPlugin_GetName = orxDefine("orxPlugin_GetName",{C_POINTER},C_STRING)
				
public function orxPlugin_Load(object _zFileName,object _Name)

 return orxFunc(xorxPlugin_Load,{_zFileName,_Name})
	
end function

public function orxPlugin_LoadUsingExt(object _FileName,object _Name)

 return orxFunc(xorxPlugin_LoadUsingExt,{_FileName,_Name})
	
end function

public function orxPlugin_Unload(object _hand)

 return orxFunc(xorxPlugin_Unload,{_hand})
	
end function

public function orxPlugin_GetFunction(object _hand,object _name)

 return orxFunc(xorxPlugin_GetFunction,{_hand,_name})
	
end function

public function orxPlugin_GetHandle(object _name)

 return orxFunc(xorxPlugin_GetHandle,{_name})
	
end function

public function orxPlugin_GetName(object _hand)

 return orxFunc(xorxPlugin_GetName,{_hand})
	
end function
­65.43