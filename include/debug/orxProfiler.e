include "orxInclude.e"

--include "core/orxThread.e"

public constant orxPROFILER_KS32_MARKER_ID_NONE = -1

constant
	xorxProfiler_Setup                      = orxDefine( "orxProfiler_Setup", {} ),
	xorxProfiler_Init                       = orxDefine( "orxProfiler_Init", {}, C_INT ),
	xorxProfiler_Exit                       = orxDefine( "orxProfiler_Exit", {} ),
	xorxProfiler_GetIDFromName              = orxDefine( "orxProfiler_GetIDFromName", {C_STRING}, C_INT ),
	xorxProfiler_IsMarkerIDValid            = orxDefine( "orxProfiler_IsMarkerIDValid", {C_INT}, C_BOOL ),
	xorxProfiler_PushMarker                 = orxDefine( "orxProfiler_PushMarker", {C_INT} ),
	xorxProfiler_PopMarker                  = orxDefine( "orxProfiler_PopMarker", {} ),
	xorxProfiler_EnableMarkerOperations     = orxDefine( "orxProfiler_EnableMarkerOperations", {C_BOOL} ),
	xorxProfiler_AreMarkerOperationsEnabled = orxDefine( "orxProfiler_AreMarkerOperationsEnabled", {}, C_BOOL ),
	xorxProfiler_Pause                      = orxDefine( "orxProfiler_Pause", {C_BOOL} ),
	xorxProfiler_IsPaused                   = orxDefine( "orxProfiler_IsPaused", {}, C_BOOL ),
	xorxProfiler_ResetAllMarkers            = orxDefine( "orxProfiler_ResetAllMarkers", {} ),
	xorxProfiler_ResetAllMaxima             = orxDefine( "orxProfiler_ResetAllMaxima", {} ),
	xorxProfiler_GetResetTime               = orxDefine( "orxProfiler_GetResetTime", {}, C_DOUBLE ),
	xorxProfiler_GetMaxResetTime            = orxDefine( "orxProfiler_GetMaxResetTime", {}, C_DOUBLE ),
	xorxProfiler_GetMarkerCount             = orxDefine( "orxProfiler_GetMarkerCount", {}, C_INT ),
	xorxProfiler_GetNextMarkerID            = orxDefine( "orxProfiler_GetNextMarkerID", {C_INT}, C_INT ),
	xorxProfiler_GetNextSortedMarkerID      = orxDefine( "orxProfiler_GetNextSortedMarkerID", {C_INT}, C_INT ),
	xorxProfiler_SelectQueryFrame           = orxDefine( "orxProfiler_SelectQueryFrame", {C_UINT,C_UINT}, C_INT ),
	xorxProfiler_GetMarkerTime              = orxDefine( "orxProfiler_GetMarkerTime", {C_INT}, C_DOUBLE ),
	xorxProfiler_GetMarkerMaxTime           = orxDefine( "orxProfiler_GetMarkerMAxTime", {C_INT}, C_DOUBLE ),
	xorxProfiler_GetMarkerName              = orxDefine( "orxProfiler_GetMarkerName", {C_INT}, C_STRING ),
	xorxProfiler_GetMarkerPushCount         = orxDefine( "orxProfiler_GetMarkerPushCount", {C_INT}, C_UINT ),
	xorxProfiler_IsUniqueMarker             = orxDefine( "orxProfiler_IsUniqueMarker", {C_INT}, C_BOOL ),
	xorxProfiler_GetUniqueMarkerStartTime   = orxDefine( "orxProfiler_GetUniqueMarkerStartTime", {C_INT}, C_DOUBLE ),
	xorxProfiler_GetUniqueMarkerDepth       = orxDefine( "orxProfiler_GetUniqueMarkerDepth", {C_INT}, C_UINT )

public procedure orxProfiler_Setup()
	orxProc( xorxProfiler_Setup, {} )
end procedure

public function orxProfiler_Init()
	return orxFunc( xorxProfiler_Init, {} )
end function

public procedure orxProfiler_Exit()
	orxProc( xorxProfiler_Exit, {} )
end procedure


public function orxProfiler_GetIDFromName( object _zName )
	return orxFunc( xorxProfiler_GetIDFromName, {_zName} )
end function

public function orxProfiler_IsMarkerIDValid( atom _s32MarkerID )
	return orxFunc( xorxProfiler_IsMarkerIDValid, {_s32MarkerID} )
end function


public procedure orxProfiler_PushMarker( atom _s32MarkerID )
	orxProc( xorxProfiler_PushMarker, {_s32MarkerID} )
end procedure

public procedure orxProfiler_PopMarker()
	orxProc( xorxProfiler_PopMarker, {} )
end procedure

public procedure orxProfiler_EnableMarkerOperations( atom _bEnable )
	orxProc( xorxProfiler_EnableMarkerOperations, {_bEnable} )
end procedure

public function orxProfiler_AreMarkerOperationsEnabled()
	return orxFunc( xorxProfiler_AreMarkerOperationsEnabled, {} )
end function

public procedure orxProfiler_Pause( atom _bPause )
	orxProc( xorxProfiler_Pause, {_bPause} )
end procedure

public function orxProfiler_IsPaused()
	return orxFunc( xorxProfiler_IsPaused, {} )
end function


public procedure orxProfiler_ResetAllMarkers()
	orxProc( xorxProfiler_ResetAllMarkers, {} )
end procedure

public procedure orxProfiler_ResetAllMaxima()
	orxProc( xorxProfiler_ResetAllMaxima, {} )
end procedure

public function orxProfiler_GetResetTime()
	return orxFunc( xorxProfiler_GetResetTime, {} )
end function

public function orxProfiler_GetMaxResetTime()
	return orxFunc( xorxProfiler_GetMaxResetTime, {} )
end function


public function orxProfiler_GetMarkercount()
	return orxFunc( xorxProfiler_GetMarkerCount, {} )
end function


public function orxProfiler_GetNextMarkerID( atom _s32MarkerID )
	return orxFunc( xorxProfiler_GetNextMarkerID, {_s32MarkerID} )
end function

public function orxProfiler_GetNextSortedMarkerID( atom _s32MarkerID )
	return orxFunc( xorxProfiler_GetNextSortedMarkerID, {_s32MarkerID} )
end function


public function orxProfiler_SelectQueryFrame( object _u32QueryFrame, object _u32ThreadID )
	return orxFunc( xorxProfiler_SelectQueryFrame, {_u32QueryFrame,_u32ThreadID} )
end function


public function orxProfiler_GetMarkerTime( atom _s32MarkID )
	return orxFunc( xorxProfiler_GetMarkerTime, {_s32MarkID} )
end function

public function orxProfiler_GetMarkerMaxTime( atom _s32MarkID )
	return orxFunc( xorxProfiler_GetMarkerMaxTime, {_s32MarkID} )
end function

public function orxProfiler_GetMarkerName( atom _s32MarkID )
	return orxFunc( xorxProfiler_GetMarkerName, {_s32MarkID} )
end function

public function orxProfiler_GetMarkerPushCount( atom _s32MarkID )
	return orxFunc( xorxProfiler_GetMarkerPushCount, {_s32MarkID} )
end function


public function orxProfiler_IsUniqueMarker( atom _s32MarkID )
	return orxFunc( xorxProfiler_IsUniqueMarker, {_s32MarkID} )
end function


public function orxProfiler_GetUniqueMarkerStartTime( atom _s32MarkID )
	return orxFunc( xorxProfiler_GetUniqueMarkerStartTime, {_s32MarkID} )
end function

public function orxProfiler_GetUniqueMarkerDepth( atom _s32MarkID )
	return orxFunc( xorxProfiler_GetUniqueMarkerDepth, {_s32MarkID} )
end function
­53.35