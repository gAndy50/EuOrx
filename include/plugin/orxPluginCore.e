
include "orxInclude.e"

public include "plugin/orxPluginType.e"
public include "plugin/define/orxPlugin_CoreDefine.e"

public constant ORXPLUGIN_CORE_FUNCTION_EFUNCTIONID = 0,
				ORXPLUGIN_CORE_FUNCTION_PFNFUNCTION = 4,
				ORXPLUGIN_CORE_FUNCTION_PFNDEFAULTFUNCTION = 8,
				SIZEOF_ORXPLUGIN_CORE_FUNCTION = 12,
				$

public constant ORXPLUGIN_USER_FUNCTION_INFO_EFUNCTIONID = 0,
				ORXPLUGIN_USER_FUNCTION_INFO_PFNFUNCTION = 4,
				ORXPLUGIN_USER_FUNCTION_INFO_ZFUNCTIONARGS = 8,
				ORXPLUGIN_USER_FUNCTION_INFO_ZFUNCTION_NAME = 12,
				SIZEOF_ORXPLUGIN_USER_FUNCTION_INFO = 16,
				$

constant
	xorxPlugin_AddCoreInfo         = orxDefine( "orxPlugin_AddCoreInfo", {C_INT,C_INT,C_POINTER,C_UINT} ),
	xorxPlugin_DefaultCoreFunction = orxDefine( "orxPlugin_DefaultCoreFunction", {C_STRING,C_STRING,C_UINT}, C_POINTER )

public procedure orxPlugin_AddCoreInfo( atom _ePluginCoreID, atom _eModuleID, object _astCoreFunction, atom _u32CoreFuncNum )
	orxProc( xorxPlugin_AddCoreInfo, {_ePluginCoreID,_eModuleID,_astCoreFunction,_u32CoreFuncNum} )
end procedure


public function orxPlugin_DefaultCoreFunction( object _zFuncName, object _zFileName, atom _u32Line )
	return orxFunc( xorxPlugin_DefaultCoreFunction, {_zFuncName,_zFileName,_u32Line} )
end function

--Inline/Macros TBD
­35.19