include "orxInclude.e"

include "math/orxVector.e"
include "memory/orxMemory.e"

include "debug/orxDebug.e"

public constant orxSTRING_KC_VECTOR_START = "("
public constant orxSTRING_KC_VECTOR_START_ALT = "{"
public constant orxSTRING_KC_VECTOR_SEPARATOR = ","
public constant orxSTRING_KC_VECTOR_END = ")"
public constant orxSTRING_KC_VECTOR_END_ALT = "}"

public constant xorxString_Setup = orxDefine("orxString_Setup",{}),
				xorxString_Init = orxDefine("orxString_Init",{},C_INT),
				xorxString_Exit = orxDefine("orxString_Exit",{})
				
public procedure orxString_Setup()

 orxProc(xorxString_Setup,{})
	
end procedure

public function orxString_Init()

 return orxFunc(xorxString_Init,{})
	
end function

public procedure orxString_Exit()

 orxProc(xorxString_Exit,{})
	
end procedure

public constant xorxString_NHash = orxDefine("orxString_NHash",{C_STRING,C_UINT},C_STRING),
				xorxString_Hash = orxDefine("orxString_Hash",{C_STRING},C_STRING),
				xorxString_GetID = orxDefine("orxString_GetID",{C_STRING},C_STRING),
				xorxString_GetFromID = orxDefine("orxString_GetFromID",{C_STRING},C_STRING),
				xorxString_Store = orxDefine("orxString_Store",{C_STRING},C_STRING)
				
public function orxString_NHash(object _zSt,atom _u32CharNum)

 return orxFunc(xorxString_NHash,{_zSt,_u32CharNum})
	
end function

public function orxString_Hash(object _zSt)

 return orxFunc(xorxString_Hash,{_zSt})
	
end function

public function orxString_GetID(object _zSt)

 return orxFunc(xorxString_GetID,{_zSt})
	
end function

public function orxString_GetFromID(object _ID)

 return orxFunc(xorxString_GetFromID,{_ID})
	
end function

public function orxString_Store(object _zSt)

 return orxFunc(xorxString_Store,{_zSt})
	
end function
­68.40