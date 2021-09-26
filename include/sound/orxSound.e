
include std/machine.e
include "orxInclude.e"

public include "sound/orxSoundSystem.e"
public include "math/orxVector.e"

public constant orxSOUND_KZ_RESOURCE_GROUP = "Sound"
public constant orxSOUND_KZ_MASTER_BUS = "master"

public enum type orxSOUND_STATUS

	orxSOUND_STATUS_PLAY = 0,
	orxSOUND_STATUS_PAUSE,
	orxSOUND_STATUS_STOP,
	orxSOUND_STATUS_NUMBER,
	orxSOUND_STATUS_NONE = 0xFFFFFFFF

end type

public enum type orxSOUND_EVENT

	orxSOUND_EVENT_START = 0,
	orxSOUND_EVENT_STOP,
	orxSOUND_EVENT_ADD,
	orxSOUND_EVENT_REMOVE,
	orxSOUND_EVENT_PACKET,
	orxSOUND_EVENT_RECORDING_START,
	orxSOUND_EVENT_RECORDING_STOP,
	orxSOUND_EVENT_RECORDING_PACKET,
	orxSOUND_EVENT_NUMBER,
	orxSOUND_EVENT_NONE = 0xFFFFFFFF

end type

public constant ORXSOUND_STREAM_INFO_ZNAME = 0,
				ORXSOUND_STREAM_INFO_U32SAMPLERATE = 4,
				ORXSOUND_STREAM_INFO_U32CHANNELNUMBER = 8,
				SIZEOF_ORXSOUND_STREAM_INFO = 12,
				$

public constant ORXSOUND_STREAM_PACKET_U32SAMPLENUMBER = 0,
				ORXSOUND_STREAM_PACKET_AS16SAMPELIST = 4,
				ORXSOUND_STREAM_PACKET_FTIMESTAMP = 8,
				ORXSOUND_STREAM_PACKET_FTIME = 12,
				ORXSOUND_STREAM_PACKET_S32ID = 16,
				ORXSOUND_STREAM_PACKET_BDISCARD = 20,
				ORXSOUND_STREAM_PACKET_BLAST = 24,
				SIZEOF_ORXSOUND_STREAM_PACKET = 28,
				$

public constant ORXSOUND_EVENT_PAYLOAD_PSTSOUND = 0,
				ORXSOUND_EVENT_PAYLOAD_STINFO = 4,
				ORXSOUND_EVENT_PAYLOAD_STPACKET = 8,
				SIZEOF_ORXSOUND_EVENT_PAYLOAD = 12,
				$

constant
	xorxSound_Setup                 = orxDefine( "orxSound_Setup", {} ),
	xorxSound_Init                  = orxDefine( "orxSound_Init", {}, C_INT ),
	xorxSound_Exit                  = orxDefine( "orxSound_Exit", {} ),
	xorxSound_Create                = orxDefine( "orxSound_Create", {}, C_POINTER ),
	xorxSound_CreateFromConfig      = orxDefine( "orxSound_CreateFromConfig", {C_STRING}, C_POINTER ),
	xorxSound_CreateWithEmptyStream = orxDefine( "orxSound_CreateWithEmptyStream", {C_UINT,C_UINT,C_STRING}, C_POINTER ),
	xorxSound_Delete                = orxDefine( "orxSound_Delete", {C_POINTER}, C_INT ),
	xorxSound_ClearCache            = orxDefine( "orxSound_ClearCache", {}, C_INT ),
	xorxSound_CreateSample          = orxDefine( "orxSound_CreateSample", {C_UINT,C_UINT,C_UINT,C_STRING}, C_POINTER ),
	xorxSound_GetSample             = orxDefine( "orxSound_GetSample", {C_STRING}, C_POINTER ),
	xorxSound_DeleteSample          = orxDefine( "orxSound_DeleteSample", {C_STRING}, C_INT ),
	xorxSound_LinkSample            = orxDefine( "orxSound_LinkSample", {C_POINTER,C_STRING}, C_INT ),
	xorxSound_UnlinkSample          = orxDefine( "orxSOund_UnlinkSample", {C_POINTER}, C_INT ),
	xorxSound_IsStream              = orxDefine( "orxSound_IsStream", {C_POINTER}, C_BOOL ),
	xorxSound_Play                  = orxDefine( "orxSound_Play", {C_POINTER}, C_INT ),
	xorxSound_Pause                 = orxDefine( "orxSound_Pause", {C_POINTER}, C_INT ),
	xorxSound_Stop                  = orxDefine( "orxSound_Stop", {C_POINTER}, C_INT ),
	xorxSound_StartRecording        = orxDefine( "orxSound_StartRecording", {C_POINTER,C_BOOL,C_UINT,C_UINT}, C_INT ),
	xorxSound_StopRecording         = orxDefine( "orxSound_StopRecording", {}, C_INT ),
	xorxSound_HasRecordingSupport   = orxDefine( "orxSound_HasRecordingSupport", {} ),
	xorxSound_SetVolume             = orxDefine( "orxSound_SetVolume", {C_POINTER,C_FLOAT}, C_INT ),
	xorxSound_SetPitch              = orxDefine( "orxSound_SetPitch", {C_POINTER,C_FLOAT}, C_INT ),
	xorxSound_SetTime               = orxDefine( "orxSound_SetTime", {C_POINTER,C_FLOAT}, C_INT ),
	xorxSound_SetPosition           = orxDefine( "orxSound_SetPosition", {C_POINTER,C_POINTER}, C_INT ),
	xorxSound_SetAttenuation        = orxDefine( "orxSound_SetAttenuation", {C_POINTER,C_FLOAT}, C_INT ),
	xorxSound_SetReferenceDistance  = orxDefine( "orxSound_SetReferenceDistance", {C_POINTER,C_FLOAT}, C_INT ),
	xorxSound_Loop                  = orxDefine( "orxSound_Loop", {C_POINTER,C_BOOL}, C_INT ),
	xorxSound_GetVolume             = orxDefine( "orxSound_GetVolume", {C_POINTER}, C_FLOAT ),
	xorxSound_GetPitch              = orxDefine( "orxSound_GetPitch", {C_POINTER}, C_FLOAT ),
	xorxSound_GetTime               = orxDefine( "orxSound_GetTime", {C_POINTER}, C_FLOAT ),
	xorxSound_GetPosition           = orxDefine( "orxSound_GetPosition", {C_POINTER,C_POINTER}, C_POINTER ),
	xorxSound_GetAttenuation        = orxDefine( "orxSound_GetAttenuation", {C_POINTER}, C_FLOAT ),
	xorxSound_GetReferenceDistance  = orxDefine( "orxSound_GetReferenceDistance", {C_POINTER}, C_FLOAT ),
	xorxSound_IsLooping             = orxDefine( "orxSound_IsLooping", {C_POINTER}, C_BOOL ),
	xorxSound_GetDuration           = orxDefine( "orxSound_GetDuration", {C_POINTER}, C_FLOAT ),
	xorxSound_GetStatus             = orxDefine( "orxSound_GetStatus", {C_POINTER}, C_INT ),
	xorxSound_GetName               = orxDefine( "orxSound_GetName", {C_POINTER}, C_STRING ),
	xorxSound_GetMasterBusID        = orxDefine( "orxSound_GetMasterBusID", {}, C_STRING ),
	xorxSound_GetBusID              = orxDefine( "orxSound_GetBusID", {C_POINTER}, C_STRING ),
	xorxSound_SetBusID              = orxDefine( "orxSound_SetBusID", {C_POINTER,C_STRING}, C_INT ),
	xorxSound_GetNext               = orxDefine( "orxSound_GetNext", {C_POINTER,C_STRING}, C_POINTER ),
	xorxSound_GetBusParent          = orxDefine( "orxSound_GetBusParent", {C_STRING}, C_STRING ),
	xorxSound_GetBusChild           = orxDefine( "orxSound_GetBusChild", {C_STRING}, C_STRING ),
	xorxSound_GetBusSibling         = orxDefine( "orxSound_GetBusSibling", {C_STRING}, C_STRING ),
	xorxSound_SetBusParent          = orxDefine( "orxSound_SetBusParent", {C_STRING,C_STRING}, C_INT ),
	xorxSound_GetBusVolume          = orxDefine( "orxSound_GetBusVolume", {C_STRING}, C_FLOAT ),
	xorxSound_GetBusPitch           = orxDefine( "orxSound_GetBusPitch", {C_STRING}, C_FLOAT ),
	xorxSound_SetBusVolume          = orxDefine( "orxSound_SetBusVolume", {C_STRING,C_FLOAT}, C_INT ),
	xorxSound_SetBusPitch           = orxDefine( "orxSound_SetBusPitch", {C_STRING,C_FLOAT}, C_INT ),
	xorxSound_GetBusGlobalVolume    = orxDefine( "orxSound_GetBusGlobalVolume", {C_STRING}, C_FLOAT ),
	xorxSound_GetBusGlobalPitch     = orxDefine( "orxSound_GetBusGlobalPitch", {C_STRING}, C_FLOAT )

public procedure orxSound_Setup()
	orxProc( xorxSound_Setup, {} )
end procedure

public function orxSound_Init()
	return orxFunc( xorxSound_Init, {} )
end function

public procedure orxSound_Exit()
	orxProc( xorxSound_Exit, {} )
end procedure


public function orxSound_Create()
	return orxFunc( xorxSound_Create, {} )
end function

public function orxSound_CreateFromConfig( object _ID )
	return orxFunc( xorxSound_CreateFromConfig, {_ID} )
end function

public function orxSound_CreateWithEmptyStream( atom _u32ChanNum, atom _u32SampRate, object _zName )
	return orxFunc( xorxSound_CreateWithEmptyStream, {_u32ChanNum,_u32SampRate,_zName} )
end function

public function orxSound_ClearCache()
	return orxFunc( xorxSound_ClearCache, {} )
end function


public function orxSound_CreateSample( atom _u32ChanNum, atom _u32FrameNum, atom _u32SampRate, object _zName )
	return orxFunc( xorxSound_CreateSample, {_u32ChanNum,_u32FrameNum,_u32SampRate,_zName} )
end function

public function orxSound_GetSample( object _zName )
	return orxFunc( xorxSound_GetSample, {_zName} )
end function

public function orxSound_DeleteSample( object _zName )
	return orxFunc( xorxSound_DeleteSample, {_zName} )
end function

public function orxSound_LinkSample( object _pstS, object _SampName )
	return orxFunc( xorxSound_LinkSample, {_pstS,_SampName} )
end function

public function orxSound_UnlinkSample( object _pstS )
	return orxFunc( xorxSound_UnlinkSample, {_pstS} )
end function


public function orxSound_IsStream( object _pstS )
	return orxFunc( xorxSound_IsStream, {_pstS} )
end function


public function orxSound_Play( object _pstS )
	return orxFunc( xorxSound_Play, {_pstS} )
end function

public function orxSound_Pause( object _pstS )
	return orxFunc( xorxSound_Pause, {_pstS} )
end function

public function orxSound_Stop( object _pstS )
	return orxFunc( xorxSound_Stop, {_pstS} )
end function


public function orxSound_StartRecording( object _zName, atom _bWriteToFile, atom _u32SampRate, atom _u32ChanNum )
	return orxFunc( xorxSound_StartRecording, {_zName,_bWriteToFile,_u32SampRate,_u32ChanNum} )
end function

public function orxSound_StopRecording()
	return orxFunc( xorxSound_StopRecording, {} )
end function

public function orxSound_HasRecordingSupport()
	return orxFunc( xorxSound_HasRecordingSupport, {} )
end function


public function orxSound_SetVolume( object _pstS, atom _fVol )
	return orxFunc( xorxSound_SetVolume, {_pstS,_fVol} )
end function

public function orxSound_SetPitch( object _pstS, atom _fPit )
	return orxFunc( xorxSound_SetPitch, {_pstS,_fPit} )
end function

public function orxSound_SetTime( object _pstS, atom _fTime )
	return orxFunc( xorxSound_SetTime, {_pstS,_fTime} )
end function


public function orxSound_SetPosition( object _pstS, object _pvPos )

	_pvPos = allocate_data( SIZEOF_ORXVECTOR )

	return orxFunc( xorxSound_SetPosition, {_pstS,_pvPos} )
end function

public function orxSound_SetAttenuation( object _pstS, atom _fAtt )
	return orxFunc( xorxSound_SetAttenuation, {_pstS,_fAtt} )
end function

public function orxSound_SetReferenceDistance( object _pstS, atom _fDis )
	return orxFunc( xorxSound_SetReferenceDistance, {_pstS,_fDis} )
end function

public function orxSound_Loop( object _pstS, atom _bLoop )
	return orxFunc( xorxSound_Loop, {_pstS,_bLoop} )
end function


public function orxSound_GetVolume( object _pstS )
	return orxFunc( xorxSound_GetVolume, {_pstS} )
end function

public function orxSound_GetPitch( object _pstS )
	return orxFunc( xorxSound_GetPitch, {_pstS} )
end function

public function orxSound_GetTime( object _pstS )
	return orxFunc( xorxSound_GetTime, {_pstS} )
end function

public function orxSound_GetPosition( object _pstS, object _pvPos )

	_pvPos = allocate_data( SIZEOF_ORXVECTOR )

	return orxFunc( xorxSound_GetPosition, {_pstS,_pvPos} )
end function

public function orxSound_GetAttenuation( object _pstS )
	return orxFunc( xorxSound_GetAttenuation, {_pstS} )
end function

public function orxSound_GetReferenceDistance( object _pstS )
	return orxFunc( xorxSound_GetReferenceDistance, {_pstS} )
end function

public function orxSound_IsLooping( object _pstS )
	return orxFunc( xorxSound_IsLooping, {_pstS} )
end function


public function orxSound_GetDuration( object _pstS )
	return orxFunc( xorxSound_GetDuration, {_pstS} )
end function

public function orxSound_GetStatus( object _pstS )
	return orxFunc( xorxSound_GetStatus, {_pstS} )
end function

public function orxSound_GetName( object _pstS )
	return orxFunc( xorxSound_GetName, {_pstS} )
end function

public function orxSound_GetMasterBusID()
	return orxFunc( xorxSound_GetMasterBusID, {} )
end function

public function orxSound_GetBusID( object _pstS )
	return orxFunc( xorxSound_GetBusID, {_pstS} )
end function

public function orxSound_SetBusID( object _pstS, object _ID )
	return orxFunc( xorxSound_SetBusID, {_pstS,_ID} )
end function

public function orxSound_GetNext( object _pstS, object _ID )
	return orxFunc( xorxSound_GetNext, {_pstS,_ID} )
end function

public function orxSound_GetBusParent( object _ID )
	return orxFunc( xorxSound_GetBusParent, {_ID} )
end function

public function orxSound_GetBusChild( object _ID )
	return orxFunc( xorxSound_GetBusChild, {_ID} )
end function

public function orxSound_GetBusSibling( object _ID )
	return orxFunc( xorxSound_GetBusSibling, {_ID} )
end function

public function orxSound_SetBusParent( object _ID, object _ID2 )
	return orxFunc( xorxSound_SetBusParent, {_ID,_ID2} )
end function

public function orxSound_GetBusVolume( object _ID )
	return orxFunc( xorxSound_GetBusVolume, {_ID} )
end function

public function orxSound_GetBusPitch( object _ID )
	return orxFunc( xorxSound_GetBusPitch, {_ID} )
end function

public function orxSound_SetBusVolume( object _ID, atom _fVol )
	return orxFunc( xorxSound_SetBusVolume, {_ID,_fVol} )
end function

public function orxSound_SetBusPitch( object _ID, atom _fPit )
	return orxFunc( xorxSound_SetBusPitch, {_ID,_fPit} )
end function

public function orxSound_GetBusGlobalVolume( object _ID )
	return orxFunc( xorxSound_GetBusGlobalVolume, {_ID} )
end function

public function orxSound_GetBusGlobalPitch( object _ID )
	return orxFunc( xorxSound_GetBusGlobalPitch, {_ID} )
end function
­441.50