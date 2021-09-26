
include std/machine.e
include "orxInclude.e"

public include "math/orxVector.e"
public include "plugin/orxPluginCore.e"

public enum type orxSOUNDSYSTEM_STATUS

	orxSOUNDSYSTEM_STATUS_PLAY = 0,
	orxSOUNDSYSTEM_STATUS_PAUSE,
	orxSOUNDSYSTEM_STATUS_STOP,
	orxSOUNDSYSTEM_STATUS_NUMBER,
	orxSOUNDSYSTEM_STATUS_NONE = 0xFFFFFFFF

end type

public constant orxSOUNDSYSTEM_KZ_CONFIG_SECTION = "SoundSystem"
public constant orxSOUNDSYSTEM_KZ_CONFIG_RATIO = "DimensionRatio"
public constant orxSOUNDSYSTEM_KZ_CONFIG_STREAM_BUFFER_SIZE = "StreamBufferSize"
public constant orxSOUNDSYSTEM_KZ_CONFIG_STREAM_BUFFER_NUMBER = "StreamBufferNumber"

constant
	xorxSoundSystem_Setup                = orxDefine( "orxSoundSystem_Setup", {} ),
	xorxSoundSystem_Init                 = orxDefine( "orxSoundSystem_Init", {}, C_INT ),
	xorxSoundSystem_Exit                 = orxDefine( "orxSoundSystem_Exit", {} ),
	xorxSoundSystem_CreateSample         = orxDefine( "orxSoundSystem_CreateSample", {C_UINT,C_UINT,C_UINT}, C_POINTER ),
	xorxSoundSystem_LoadSample           = orxDefine( "orxSoundSystem_LoadSample", {C_STRING}, C_POINTER ),
	xorxSoundSystem_DeleteSample         = orxDefine( "orxSoundSystem_DeleteSample", {C_POINTER}, C_INT ),
	xorxSoundSystem_GetSampleInfo        = orxDefine( "orxSoundSystem_GetSampleInfo", {C_POINTER,C_POINTER,C_POINTER,C_POINTER}, C_INT ),
	xorxSoundSystem_SetSampleData        = orxDefine( "orxSoundSystem_SetSampleData", {C_POINTER,C_POINTER,C_UINT}, C_INT ),
	xorxSoundSystem_CreateFromSample     = orxDefine( "orxSoundSystem_CreateFromSample", {C_POINTER,C_POINTER}, C_POINTER ),
	xorxSoundSystem_CreateStream         = orxDefine( "orxSoundSystem_CreateStream", {C_POINTER,C_UINT,C_UINT}, C_POINTER ),
	xorxSoundSystem_CreateStreamFromFile = orxDefine( "orxSoundSystem_CreateStreamFromFile", {C_POINTER,C_STRING}, C_POINTER ),
	xorxSoundSystem_Delete               = orxDefine( "orxSoundSystem_Delete", {C_POINTER}, C_INT ),
	xorxSoundSystem_Play                 = orxDefine( "orxSoundSystem_Play", {C_POINTER}, C_INT ),
	xorxSoundSystem_Pause                = orxDefine( "orxSoundSystem_Pause", {C_POINTER}, C_INT ),
	xorxSoundSystem_Stop                 = orxDefine( "orxSoundSystem_Stop", {C_POINTER}, C_INT ),
	xorxSoundSystem_StartRecording       = orxDefine( "orxSoundSystem_StartRecording", {C_POINTER,C_BOOL,C_UINT,C_UINT}, C_INT ),
	xorxSoundSystem_StopRecording        = orxDefine( "orxSoundSystem_StopRecording", {}, C_INT ),
	xorxSoundSystem_HasRecordingSupport  = orxDefine( "orxSoundSystem_HasRecordingSupport", {}, C_BOOL ),
	xorxSoundSystem_SetVolume            = orxDefine( "orxSoundSystem_SetVolume", {C_POINTER,C_FLOAT}, C_INT ),
	xorxSoundSystem_SetPitch             = orxDefine( "orxSoundSystem_SetPitch", {C_POINTER,C_FLOAT}, C_INT ),
	xorxSoundSystem_SetTime              = orxDefine( "orxSoundSystem_SetTime", {C_POINTER,C_FLOAT}, C_INT ),
	xorxSoundSystem_SetPosition          = orxDefine( "orxSoundSystem_SetPosition", {C_POINTER,C_POINTER}, C_INT ),
	xorxSoundSystem_SetAttenuation       = orxDefine( "orxSoundSystem_SetAttenuation", {C_POINTER,C_FLOAT}, C_INT ),
	xorxSoundSystem_SetReferenceDistance = orxDefine( "orxSoundSystem_SetReferenceDistance", {C_POINTER,C_FLOAT}, C_INT ),
	xorxSoundSystem_Loop                 = orxDefine( "orxSoundSystem_Loop", {C_POINTER,C_BOOL}, C_INT ),
	xorxSoundSystem_GetVolume            = orxDefine( "orxSoundSystem_GetVolume", {C_POINTER}, C_FLOAT ),
	xorxSoundSystem_GetPitch             = orxDefine( "orxSoundSystem_GetPitch", {C_POINTER}, C_FLOAT ),
	xorxSoundSystem_GetTime              = orxDefine( "orxSoundSystem_GetTime", {C_POINTER}, C_FLOAT ),
	xorxSoundSystem_GetPosition          = orxDefine( "orxSoundSystem_GetPosition", {C_POINTER,C_POINTER}, C_POINTER ),
	xorxSoundSystem_GetAttenuation       = orxDefine( "orxSoundSystem_GetAttenuation", {C_POINTER}, C_FLOAT ),
	xorxSoundSystem_GetReferenceDistance = orxDefine( "orxSoundSystem_GetReferenceDistance", {C_POINTER}, C_FLOAT ),
	xorxSoundSystem_IsLooping            = orxDefine( "orxSoundSystem_IsLooping", {C_POINTER}, C_BOOL ),
	xorxSoundSystem_GetDuration          = orxDefine( "orxSoundSystem_GetDuration", {C_POINTER}, C_FLOAT ),
	xorxSoundSystem_GetStatus            = orxDefine( "orxSoundSystem_GetStatus", {C_POINTER}, C_INT ),
	xorxSoundSystem_SetGlobalVolume      = orxDefine( "orxSoundSystem_SetGlobalVolume", {C_FLOAT}, C_INT ),
	xorxSoundSystem_GetGlobalVolume      = orxDefine( "orxSoundSystem_GetGlobalVolume", {}, C_FLOAT ),
	xorxSoundSystem_SetListenerPosition  = orxDefine( "orxSoundSystem_SetListenerPosition", {C_POINTER}, C_INT ),
	xorxSoundSystem_GetListenerPosition  = orxDefine( "orxSoundSystem_GetListenerPosition", {C_POINTER}, C_POINTER )

public procedure orxSoundSystem_Setup()
	orxProc( xorxSoundSystem_Setup, {} )
end procedure


public function orxSoundSystem_Init()
	return orxFunc( xorxSoundSystem_Init, {} )
end function

public procedure orxSoundSystem_Exit()
	orxProc( xorxSoundSystem_Exit, {} )
end procedure

public function orxSoundSystem_CreateSample( atom _u32ChanNum, atom _u32FrameNum, atom _u32SampRate )
	return orxFunc( xorxSoundSystem_CreateSample, {_u32ChanNum,_u32FrameNum,_u32SampRate} )
end function

public function orxSoundSystem_LoadSample( object _zFileName )
	return orxFunc( xorxSoundSystem_LoadSample, {_zFileName} )
end function

public function orxSoundSystem_DeleteSample( object _pstSamp )
	return orxFunc( xorxSoundSystem_DeleteSample, {_pstSamp} )
end function

public function orxSoundSystem_GetSampleInfo( object _pstSamp, object _pu32ChanNum, object _pu32FrameNum, object _pu32SampRate )
	return orxFunc( xorxSoundSystem_GetSampleInfo, {_pstSamp,_pu32ChanNum,_pu32FrameNum,_pu32SampRate} )
end function

public function orxSoundSystem_SetSampleData( object _pstSamp, object _as16Dat, atom _u32SampNum )
	return orxFunc( xorxSoundSystem_SetSampleData, {_pstSamp,_as16Dat,_u32SampNum} )
end function

public function orxSoundSystem_CreateFromSample( object _userData, object _pstSamp )
	return orxFunc( xorxSoundSystem_CreateFromSample, {_userData,_pstSamp} )
end function

public function orxSoundSystem_CreateStream( object _userData, atom _u32ChanNum, atom _u32SampRate )
	return orxFunc( xorxSoundSystem_CreateStream, {_userData,_u32ChanNum,_u32SampRate} )
end function

public function orxSoundSystem_CreateStreamFromFile( object _userData, object _zFile )
	return orxFunc( xorxSoundSystem_CreateStreamFromFile, {_userData,_zFile} )
end function

public function orxSoundSystem_Delete( object _pstS )
	return orxFunc( xorxSoundSystem_Delete, {_pstS} )
end function

public function orxSoundSystem_Play( object _pstS )
	return orxFunc( xorxSoundSystem_Play, {_pstS} )
end function

public function orxSoundSystem_Pause( object _pstS )
	return orxFunc( xorxSoundSystem_Pause, {_pstS} )
end function

public function orxSoundSystem_Stop( object _pstS )
	return orxFunc( xorxSoundSystem_Stop, {_pstS} )
end function

public function orxSoundSystem_StartRecording( object _zName, atom _bWriteToFile, atom _u32SampRate, atom _u32ChanNum )
	return orxFunc( xorxSoundSystem_StartRecording, {_zName,_bWriteToFile,_u32SampRate,_u32ChanNum} )
end function

public function orxSoundSystem_StopRecording()
	return orxFunc( xorxSoundSystem_StopRecording, {} )
end function

public function orxSoundSystem_HasRecordingSupport()
	return orxFunc( xorxSoundSystem_HasRecordingSupport, {} )
end function

public function orxSoundSystem_SetVolume( object _pstS, atom _fVol )
	return orxFunc( xorxSoundSystem_SetVolume, {_pstS,_fVol} )
end function

public function orxSoundSystem_SetPitch( object _pstS, atom _fPitch )
	return orxFunc( xorxSoundSystem_SetPitch, {_pstS,_fPitch} )
end function

public function orxSoundSystem_SetTime( object _pstS, atom _fTime )
	return orxFunc( xorxSoundSystem_SetTime, {_pstS,_fTime} )
end function

public function orxSoundSystem_SetPosition( object _pstS, object _pvPos )

	_pvPos = allocate_data( SIZEOF_ORXVECTOR )

	return orxFunc( xorxSoundSystem_SetPosition, {_pstS,_pvPos} )
end function

public function orxSoundSystem_SetAttenuation( object _pstS, atom _fAtt )
	return orxFunc( xorxSoundSystem_SetAttenuation, {_pstS,_fAtt} )
end function

public function orxSoundSystem_SetReferenceDistance( object _pstS, atom _fDist )
	return orxFunc( xorxSoundSystem_SetReferenceDistance, {_pstS,_fDist} )
end function

public function orxSoundSystem_Loop( object _pstS, atom _bLoop )
	return orxFunc( xorxSoundSystem_Loop, {_pstS,_bLoop} )
end function

public function orxSoundSystem_GetVolume( object _pstS )
	return orxFunc( xorxSoundSystem_GetVolume, {_pstS} )
end function

public function orxSoundSystem_GetPitch( object _pstS )
	return orxFunc( xorxSoundSystem_GetPitch, {_pstS} )
end function

public function orxSoundSystem_GetTime( object _pstS )
	return orxFunc( xorxSoundSystem_GetTime, {_pstS} )
end function

public function orxSoundSystem_GetPosition( object _pstS, object _pvPos )

	_pvPos = allocate_data( SIZEOF_ORXVECTOR )

	return orxFunc( xorxSoundSystem_GetPosition, {_pstS,_pvPos} )
end function

public function orxSoundSystem_GetAttenuation( object _pstS )
	return orxFunc( xorxSoundSystem_GetAttenuation, {_pstS} )
end function

public function orxSoundSystem_GetReferenceDistance( object _pstS )
	return orxFunc( xorxSoundSystem_GetReferenceDistance, {_pstS} )
end function

public function orxSoundSystem_IsLooping( object _pstS )
	return orxFunc( xorxSoundSystem_IsLooping, {_pstS} )
end function

public function orxSoundSystem_GetDuration( object _pstS )
	return orxFunc( xorxSoundSystem_GetDuration, {_pstS} )
end function

public function orxSoundSystem_GetStatus( object _pstS )
	return orxFunc( xorxSoundSystem_GetStatus, {_pstS} )
end function

public function orxSoundSystem_SetGlobalVolume( atom _fGlobalVol )
	return orxFunc( xorxSoundSystem_SetGlobalVolume, {_fGlobalVol} )
end function

public function orxSoundSystem_GetGlobalVolume()
	return orxFunc( xorxSoundSystem_GetGlobalVolume, {} )
end function

public function orxSoundSystem_SetListenerPosition( object _pvPos )

	_pvPos = allocate_data( SIZEOF_ORXVECTOR )

	return orxFunc( xorxSoundSystem_SetListenerPosition, {_pvPos} )
end function

public function orxSoundSystem_GetListenerPosition( object _pvPos )

	_pvPos = allocate_data( SIZEOF_ORXVECTOR )

	return orxFunc( xorxSoundSystem_GetListenerPosition, {_pvPos} )
end function
­292.61