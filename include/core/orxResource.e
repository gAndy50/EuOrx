include "orxInclude.e"

public constant orxRESOURCE_KC_LOCATION_SEPARATOR = ":"
public constant orxRESOURCE_KZ_DEFAULT_STORAGE = "."
public constant orxRESOURCE_KZ_TYPE_TAG_FILE = "file"

public constant ORXRESOURCE_TYPE_INFO_ZTAG = 0,
				ORXRESOURCE_TYPE_INFO_PFNLOCATE = 4,
				ORXRESOURCE_TYPE_INFO_PFNGETTIME = 8,
				ORXRESOURCE_TYPE_INFO_PFNOPEN = 12,
				ORXRESOURCE_TYPE_INFO_PFNCLOSE = 16,
				ORXRESOURCE_TYPE_INFO_PFNGETSIZE = 20,
				ORXRESOURCE_TYPE_INFO_PFNSEEK = 24,
				ORXRESOURCE_TYPE_INFO_PFNTELL = 28,
				ORXRESOURCE_TYPE_INFO_PFNREAD = 32,
				ORXRESOURCE_TYPE_INFO_PFNWRITE = 36,
				ORXRESOURCE_TYPE_INFO_PFNDELETE = 40,
				SIZEOF_ORXRESOURCE_TYPE_INFO = 44

public enum type orxRESOURCE_EVENT

	orxRESOURCE_EVENT_UPDATE = 0,
	orxRESOURCE_EVENT_ADD,
	orxRESOURCE_EVENT_REMOVE,
	orxRESOURCE_EVENT_NUMBER,
	orxRESOURCE_EVENT_NONE = 0xFFFFFFFF

end type

public constant ORXRESOURCE_EVENT_PAYLOAD_S64TIME = 0,
				ORXRESOURCE_EVENT_PAYLOAD_ZLOCATION = 4,
				ORXRESOURCE_EVENT_PAYLOAD_PSTTYPEINFO = 8,
				ORXRESOURCE_EVENT_PAYLOAD_STGROUPID = 12,
				ORXRESOURCE_EVENT_PAYLOAD_STNAMEID = 16,
				SIZEOF_ORXRESOURCE_EVENT_PAYLOAD = 20

constant
	xorxResource_Setup                  = orxDefine( "orxResource_Setup", {} ),
	xorxResource_Init                   = orxDefine( "orxResource_Init", {}, C_INT ),
	xorxResource_Exit                   = orxDefine( "orxResource_Exit", {} ),
	xorxResource_GetGroupCount          = orxDefine( "orxResource_GetGroupCount", {}, C_UINT ),
	xorxResource_GetGroup               = orxDefine( "orxResource_GetGroup", {C_UINT}, C_STRING ),
	xorxResource_AddStorage             = orxDefine( "orxResource_AddStorage", {C_STRING,C_STRING,C_BOOL}, C_INT ),
	xorxResource_RemoveStorage          = orxDefine( "orxResource_RemoveStorage", {C_STRING,C_STRING}, C_INT ),
	xorxResource_GetStorageCount        = orxDefine( "orxResource_GetStorageCount", {C_STRING}, C_UINT ),
	xorxResource_GetStorage             = orxDefine( "orxResource_GetStorage", {C_STRING,C_UINT}, C_STRING ),
	xorxResource_ReloadStorage          = orxDefine( "orxResource_ReloadStorage", {}, C_INT ),
	xorxResource_Locate                 = orxDefine( "orxResource_Locate", {C_STRING,C_STRING}, C_STRING ),
	xorxResource_LocateInStorage        = orxDefine( "orxResource_LocateInStorage", {C_STRING,C_STRING,C_STRING}, C_STRING ),
	xorxResource_GetPath                = orxDefine( "orxResource_GetPath", {C_STRING}, C_STRING ),
	xorxResource_GetType                = orxDefine( "orxResource_GetType", {C_STRING}, C_POINTER ),
	xorxResource_GetTime                = orxDefine( "orxResource_GetTime", {C_STRING}, C_LONG ),
	xorxResource_Open                   = orxDefine( "orxResource_Open", {C_STRING,C_BOOL}, C_POINTER ),
	xorxResource_Close                  = orxDefine( "orxResource_Close", {C_POINTER} ),
	xorxResource_GetLocation            = orxDefine( "orxResource_GetLocation", {C_POINTER}, C_STRING ),
	xorxResource_GetSize                = orxDefine( "orxResource_GetSize", {C_POINTER}, C_LONG ),
	xorxResource_Seek                   = orxDefine( "orxResource_Seek", {C_POINTER,C_LONG,C_INT}, C_LONG ),
	xorxResource_Tell                   = orxDefine( "orxResource_Tell", {C_POINTER}, C_LONG ),
	xorxResource_Read                   = orxDefine( "orxResource_Read", {C_POINTER,C_LONG,C_POINTER,C_POINTER,C_POINTER}, C_LONG ),
	xorxResource_Write                  = orxDefine( "orxResource_WRite", {C_POINTER,C_LONG,C_POINTER,C_POINTER,C_POINTER}, C_LONG ),
	xorxResource_Delete                 = orxDefine( "orxResource_Delete", {C_STRING}, C_INT ),
	xorxResource_GetPendingOpCount      = orxDefine( "orxResource_GetPendingOpCount", {C_POINTER}, C_UINT ),
	xorxResource_GetTotalPendingOpCount = orxDefine( "orxResource_GetTotalPendingOpCount", {}, C_UINT ),
	xorxResource_RegisterType           = orxDefine( "orxResource_RegisterType", {C_POINTER}, C_INT ),
	xorxResource_GetTypeCount           = orxDefine( "orxResource_GetTypeCount", {}, C_UINT ),
	xorxResource_GetTypeTag             = orxDefine( "orxResource_GetTypeTag", {C_UINT}, C_STRING ),
	xorxResource_Sync                   = orxDefine( "orxResource_Sync", {C_STRING}, C_INT ),
	xorxResource_ClearCache             = orxDefine( "orxResource_ClearCache", {C_STRING}, C_INT )

public procedure orxResource_Setup()
	orxProc( xorxResource_Setup, {} )
end procedure

public function orxResource_Init()
	return orxFunc( xorxResource_Init, {} )
end function

public procedure orxResource_Exit()
	orxProc( xorxResource_Exit, {} )
end procedure


public function orxResource_GetGroupCount()
	return orxFunc( xorxResource_GetGroupCount, {} )
end function

public function orxResource_GetGroup( atom _u32Ind )
	return orxFunc( xorxResource_GetGroup, {_u32Ind} )
end function


public function orxResource_AddStorage( object _zGroup, object _zStorage, atom _bAddFirst )
	return orxFunc( xorxResource_AddStorage, {_zGroup,_zStorage,_bAddFirst} )
end function

public function orxResource_RemoveStorage( object _zGroup, object _zStorage )
	return orxFunc( xorxResource_RemoveStorage, {_zGroup,_zStorage} )
end function

public function orxResource_GetStorageCount( object _zGroup )
	return orxFunc( xorxResource_GetStorageCount, {_zGroup} )
end function

public function orxResource_GetStorage( object _zGroup, atom _u32Ind )
	return orxFunc( xorxResource_GetStorage, {_zGroup,_u32Ind} )
end function

public function orxResource_ReloadStorage()
	return orxFunc( xorxResource_ReloadStorage, {} )
end function


public function orxResource_Locate( object _zGroup, object _zName )
	return orxFunc( xorxResource_Locate, {_zGroup,_zName} )
end function

public function orxResource_LocateInStorage( object _zGroup, object _zStorage, object _zName )
	return orxFunc( xorxResource_LocateInStorage, {_zGroup,_zStorage,_zName} )
end function

public function orxResource_GetPath( object _zLocation )
	return orxFunc( xorxResource_GetPath, {_zLocation} )
end function

public function orxResource_GetType( object _zLocation )
	return orxFunc( xorxResource_GetType, {_zLocation} )
end function


public function orxResource_GetTime( object _zLocation )
	return orxFunc( xorxResource_GetTime, {_zLocation} )
end function

public function orxResource_Open( object _zLocation, atom _bEraseMode )
	return orxFunc( xorxResource_Open, {_zLocation,_bEraseMode} )
end function

public procedure orxResource_Close( object _hRes )
	orxProc( xorxResource_Close, {_hRes} )
end procedure

public function orxResource_GetLocation( object _hRes )
	return orxFunc( xorxResource_GetLocation, {_hRes} )
end function

public function orxResource_GetSize( object _hRes )
	return orxFunc( xorxResource_GetSize, {_hRes} )
end function

public function orxResource_Seek( object _hRes, atom _s64Off, atom _eWhen )
	return orxFunc( xorxResource_Seek, {_hRes,_s64Off,_eWhen} )
end function

public function orxResource_Tell( object _hRes )
	return orxFunc( xorxResource_Tell, {_hRes} )
end function

public function orxResource_Read( object _hRes, atom _s64Size, object _pBuff, object _pfnCb, object _pCtx )
	return orxFunc( xorxResource_Read, {_hRes,_s64Size,_pBuff,_pfnCb,_pCtx} )
end function

public function orxResource_Write( object _hRes, atom _s64Size, object _pBuff, object _pfnCb, object _pCtx )
	return orxFunc( xorxResource_Write, {_hRes,_s64Size,_pBuff,_pfnCb,_pCtx} )
end function

public function orxResource_Delete( object _zLocation )
	return orxFunc( xorxResource_Delete, {_zLocation} )
end function


public function orxResource_GetPendingOpCount( object _hRes )
	return orxFunc( xorxResource_GetPendingOpCount, {_hRes} )
end function

public function orxResource_GetTotalPendingOpCount()
	return orxFunc( xorxResource_GetTotalPendingOpCount, {} )
end function


public function orxResource_RegisterType( object _pstInfo )
	return orxFunc( xorxResource_RegisterType, {_pstInfo} )
end function

public function orxResource_GetTypeCount()
	return orxFunc( xorxResource_GetTypeCount, {} )
end function

public function orxResource_GetTypeTag( atom _u32Ind )
	return orxFunc( xorxResource_GetTypeTag, {_u32Ind} )
end function


public function orxResource_Sync( object _zGroup )
	return orxFunc( xorxResource_Sync, {_zGroup} )
end function

public function orxResource_ClearCache( object _zGroup )
	return orxFunc( xorxResource_ClearCache, {_zGroup} )
end function
­258.50