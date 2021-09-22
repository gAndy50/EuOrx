include "orxInclude.e"
include "object/orxStructure.e"

public enum type orxTIMELINE_EVENT

 orxTIMELINE_EVENT_TRACK_START = 0,
 orxTIMELINE_EVENT_TRACK_STOP,
 orxTIMELINE_EVENT_TRACK_ADD,
 orxTIMELINE_EVENT_TRACK_REMOVE,
 orxTIMELINE_EVENT_LOOP,
 orxTIMELINE_EVENT_TRIGGER,
 orxTIMELINE_EVENT_NUMBER,
 orxTIMELINE_EVENT_NONE = 0xFFFFFFFF
	
end type

public constant ORXTIMELINE_EVENT_PAYLOAD_PSTTIMELINE = 8,
				ORXTIMELINE_EVENT_PAYLOAD_ZTRACKNAME = 16,
				ORXTIMELINE_EVENT_PAYLOAD_ZEVENT = 24,
				ORXTIMELINE_EVENT_PAYLOAD_FTIMESTAMP = 32,
				SIZEOF_ORXTIMELINE_EVENT_PAYLOAD = 40
				
public constant xorxTimeLine_Setup = orxDefine("orxTimeLine_Setup",{}),
				xorxTimeLine_Init = orxDefine("orxTimeLine_Init",{},C_INT),
				xorxTimeLine_Exit = orxDefine("orxTimeLine_Exit",{}),
				xorxTimeLine_Create = orxDefine("orxTimeLine_Create",{},C_POINTER),
				xorxTimeLine_Delete = orxDefine("orxTimeLine_Delete",{C_POINTER},C_INT),
				xorxTimeLine_ClearCache = orxDefine("orxTimeLine_ClearCache",{},C_INT),
				xorxTimeLine_Enable = orxDefine("orxTimeLine_Enable",{C_POINTER,C_BOOL}),
				xorxTimeLine_IsEnabled = orxDefine("orxTimeLine_IsEnabled",{C_POINTER},C_BOOL),
				xorxTimeLine_AddTrackFromConfig = orxDefine("orxTimeLine_AddTrackFromConfig",{C_POINTER,C_STRING},C_INT),
				xorxTimeLine_RemoveTrackFromConfig = orxDefine("orxTimeLine_RemoveTrackFromConfig",{C_POINTER,C_STRING},C_INT),
				xorxTimeLine_GetCount = orxDefine("orxTimeLine_GetCount",{C_POINTER},C_UINT),
				xorxTimeLine_GetTrackDuration = orxDefine("orxTimeLine_GetTrackDuration",{C_STRING},C_FLOAT)
				
public procedure orxTimeLine_Setup()

 orxProc(xorxTimeLine_Setup,{})
	
end procedure

public function orxTimeLine_Init()

 return orxFunc(xorxTimeLine_Init,{})
	
end function

public procedure orxTimeLine_Exit()

 orxProc(xorxTimeLine_Exit,{})
	
end procedure

public function orxTimeLine_Create()

 return orxFunc(xorxTimeLine_Create,{})
	
end function

public function orxTimeLine_Delete(object TL)

 return orxFunc(xorxTimeLine_Delete,{TL})
	
end function

public function orxTimeLine_ClearCache()

 return orxFunc(xorxTimeLine_ClearCache,{})
	
end function

public procedure orxTimeLine_Enable(object TL,atom _bEn)

 orxProc(xorxTimeLine_Enable,{TL,_ben})
	
end procedure

public function orxTimeLine_IsEnabled(object TL)

 return orxFunc(xorxTimeLine_IsEnabled,{TL})
	
end function

public function orxTimeLine_AddTrackFromConfig(object TL,object ID)

 return orxFunc(xorxTimeLine_AddTrackFromConfig,{TL,ID})
	
end function

public function orxTimeLine_RemoveTrackFromConfig(object TL,object ID)

 return orxFunc(xorxTimeLine_RemoveTrackFromConfig,{TL,ID})
	
end function

public function orxTimeLine_GetCount(object TL)

 return orxFunc(xorxTimeLine_GetCount,{TL})
	
end function

public function orxTimeLine_GetTrackDuration(object ID)

 return orxFunc(xorxTimeLine_GetTrackDuration,{ID})
	
end function
­104.51