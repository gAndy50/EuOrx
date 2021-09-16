include "orxInclude.e"

public constant orxFPS_KZ_CLOCK_NAME = "fps

constant xorxFPS_Setup = orxDefine("orxFPS_Setup",{}),
		 xorxFPS_Init = orxDefine("orxFPS_Init",{},C_INT),
		 xorxFPS_Exit = orxDefine("orxFPS_Exit",{}),
		 xorxFPS_IncreaseFrameCount = orxDefine("orxFPS_IncreaseFrameCount",{}),
		 xorxFPS_GetFPS = orxDefine("orxFPS_GetFPS",{},C_UINT)
		 
public procedure orxFPS_Setup()

 orxProc(xorxFPS_Setup,{})
	
end procedure

public function orxFPS_Init()

 return orxFunc(xorxFPS_Init,{})
	
end function

public procedure orxFPS_Exit()

 orxProc(xorxFPS_Exit,{})
	
end procedure

public procedure orxFPS_IncreaseFrameCount()

 orxProc(xorxFPS_IncreaseFrameCount,{})
	
end procedure

public function orxFPS_GetFPS()

 return orxFunc(xorxFPS_GetFPS,{})
	
end function
­37.34