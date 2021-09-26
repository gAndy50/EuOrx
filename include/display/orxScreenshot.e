
include "orxInclude.e"

constant
	xorxScreenshot_Setup   = orxDefine( "orxScreenshot_Setup", {} ),
	xorxScreenshot_Init    = orxDefine( "orxScreenshot_Init", {}, C_INT ),
	xorxScreenshot_Exit    = orxDefine( "orxScreenshot_Exit", {} ),
	xorxScreenshot_Capture = orxDefine( "orxScreenshot_Capture", {}, C_INT )

public constant orxSCREENSHOT_KZ_DEFAULT_DIRECTORY_NAME = "."
public constant orxSCREENSHOT_KZ_DEFAULT_BASE_NAME = "screenshot-"
public constant orxSCREENSHOT_KZ_DEFAULT_EXTENSTION = "tga"
public constant orxSCREEN_KU32_DEFAULT_DIGITS = 4

public procedure orxScreenshot_Setup()
	orxProc( xorxScreenshot_Setup, {} )
end procedure

public function orxScreenshot_Init()
	return orxFunc( xorxScreenshot_Init, {} )
end function

public procedure orxScreenshot_Exit()
	orxProc( xorxScreenshot_Exit, {} )
end procedure

public function orxScreenshot_Capture()
	return orxFunc( xorxScreenshot_Capture, {} )
end function
­33.42