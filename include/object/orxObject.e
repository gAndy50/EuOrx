
include "orxInclude.e"

public include "anim/orxAnimSet.e"
public include "core/orxClock.e"
public include "display/orxDisplay.e"
public include "display/orxGraphic.e"
public include "display/orxTexture.e"
public include "math/orxOBox.e"
public include "memory/orxBank.e"
public include "object/orxStructure.e"
public include "sound/orxSound.e"

constant
	xorxObject_Setup                        = orxDefine( "orxObject_Setup", {} ),
	xorxObject_Init                         = orxDefine( "orxObject_Init", {}, C_UINT ),
	xorxObject_Exit                         = orxDefine( "orxObject_Exit", {} ),
	xorxObject_Create                       = orxDefine( "orxObject_Create", {}, C_POINTER ),
	xorxObject_CreateFromConfig             = orxDefine( "orxObject_CreateFromConfig", {C_STRING}, C_POINTER ),
	xorxObject_Delete                       = orxDefine( "orxObject_Delete", {C_POINTER}, C_UINT ),
	xorxObject_Update                       = orxDefine( "orxObject_Update", {C_POINTER,C_POINTER}, C_UINT ),
	xorxObject_Enable                       = orxDefine( "orxObject_Enable", {C_POINTER,C_BOOL} ),
	xorxObject_EnableRecursive              = orxDefine( "orxObject_EnableRecursive", {C_POINTER,C_BOOL} ),
	xorxObject_IsEnabled                    = orxDefine( "orxObject_IsEnabled", {C_POINTER}, C_BOOL ),
	xorxObject_Pause                        = orxDefine( "orxObject_Pause", {C_POINTER,C_BOOL} ),
	xorxObject_PauseRecursive               = orxDefine( "orxObject_PauseRecursive", {C_POINTER,C_BOOL} ),
	xorxObject_IsPaused                     = orxDefine( "orxObject_IsPaused", {C_POINTER}, C_BOOL ),
	xorxObject_SetUserData                  = orxDefine( "orxObject_SetUserData", {C_POINTER,C_POINTER} ),
	xorxObject_GetUserData                  = orxDefine( "orxObject_GetUserData", {C_POINTER}, C_POINTER ),
	xorxObject_SetOwner                     = orxDefine( "orxObject_SetOwner", {C_POINTER,C_POINTER} ),
	xorxObject_GetOwner                     = orxDefine( "orxObject_GetOwner", {C_POINTER}, C_POINTER ),
	xorxObject_GetOwnedChild                = orxDefine( "orxObject_GetOwnedChild", {C_POINTER}, C_POINTER ),
	xorxObject_GetOwnedSibling              = orxDefine( "orxObject_GetOwnedSibling", {C_POINTER}, C_POINTER ),
	xorxObject_SetClock                     = orxDefine( "orxObject_SetClock", {C_POINTER,C_POINTER}, C_UINT ),
	xorxObject_GetClock                     = orxDefine( "orxObject_GetClock", {C_POINTER}, C_POINTER ),
	xorxObject_LinkStructure                = orxDefine( "orxObject_LinkStructure", {C_POINTER,C_POINTER}, C_UINT ),
	xorxObject_UnlinkStructure              = orxDefine( "orxObject_UnlinkStructure", {C_POINTER,C_UINT} ),
	x_orxObject_GetStructure                = orxDefine( "_orxObject_GetStructure", {C_POINTER,C_UINT}, C_POINTER ),
	xorxObject_SetFlip                      = orxDefine( "orxObject_SetFlip", {C_POINTER,C_BOOL,C_BOOL}, C_UINT ),
	xorxObject_GetFlip                      = orxDefine( "orxObject_GetFlip", {C_POINTER,C_POINTER,C_POINTER}, C_UINT ),
	xorxObject_SetPivot                     = orxDefine( "orxObject_SetPivot", {C_POINTER,C_POINTER}, C_UINT ),
	xorxObject_SetOrigin                    = orxDefine( "orxObject_SetOrigin", {C_POINTER,C_POINTER}, C_UINT ),
	xorxObject_SetSize                      = orxDefine( "orxObject_SetSize", {C_POINTER,C_POINTER}, C_UINT ),
	xorxObject_GetPivot                     = orxDefine( "orxObject_GetPivot", {C_POINTER,C_POINTER}, C_POINTER ),
	xorxObject_GetOrigin                    = orxDefine( "orxObject_GetOrigin", {C_POINTER,C_POINTER}, C_POINTER ),
	xorxObject_GetSize                      = orxDefine( "orxObject_GetSize", {C_POINTER,C_POINTER}, C_POINTER ),
	xorxObject_SetPosition                  = orxDefine( "orxObject_SetPosition", {C_POINTER,C_POINTER}, C_UINT ),
	xorxObject_SetWorldPosition             = orxDefine( "orxObject_SetWorldPosition", {C_POINTER,C_POINTER}, C_UINT ),
	xorxObject_SetRotation                  = orxDefine( "orxObject_SetRotation", {C_POINTER,C_FLOAT}, C_UINT ),
	xorxObject_SetWorldRotation             = orxDefine( "orxObject_SetWorldRotation", {C_POINTER,C_FLOAT}, C_UINT ),
	xorxObject_SetScale                     = orxDefine( "orxObject_SetScale", {C_POINTER,C_POINTER}, C_UINT ),
	xorxObject_SetWorldScale                = orxDefine( "orxObject_SetWorldScale", {C_POINTER,C_POINTER}, C_UINT ),
	xorxObject_GetPosition                  = orxDefine( "orxObject_GetPosition", {C_POINTER,C_POINTER}, C_POINTER ),
	xorxObject_GetWorldPosition             = orxDefine( "orxObject_GetWorldPosition", {C_POINTER,C_POINTER}, C_POINTER ),
	xorxObject_GetRotation                  = orxDefine( "orxObject_GetRotation", {C_POINTER}, C_FLOAT ),
	xorxObject_GetWorldRotation             = orxDefine( "orxObject_GetWorldRotation", {C_POINTER}, C_FLOAT ),
	xorxObject_GetScale                     = orxDefine( "orxObject_GetScale", {C_POINTER,C_POINTER}, C_POINTER ),
	xorxObject_GetWorldScale                = orxDefine( "orxObject_GetWorldScale", {C_POINTER,C_POINTER}, C_POINTER ),
	xorxObject_SetParent                    = orxDefine( "orxObject_SetParent", {C_POINTER,C_POINTER}, C_UINT ),
	xorxObject_GetParent                    = orxDefine( "orxObject_GetParent", {C_POINTER}, C_POINTER ),
	xorxObject_GetChild                     = orxDefine( "orxObject_GetChild", {C_POINTER}, C_POINTER ),
	xorxObject_GetSibling                   = orxDefine( "orxObject_GetSibling", {C_POINTER}, C_POINTER ),
	xorxObject_GetNextChild                 = orxDefine( "orxObject_GetNextChild", {C_POINTER,C_POINTER,C_UINT}, C_POINTER ),
	xorxObject_Attach                       = orxDefine( "orxObject_Attach", {C_POINTER,C_POINTER}, C_UINT ),
	xorxObject_Detach                       = orxDefine( "orxObject_Detach", {C_POINTER}, C_UINT ),
	xorxObject_LogParents                   = orxDefine( "orxObject_LogParents", {C_POINTER}, C_UINT ),
	xorxObject_SetAnimSet                   = orxDefine( "orxObject_SetAnimSet", {C_POINTER,C_POINTER}, C_UINT ),
	xorxObject_SetAnimFrequency             = orxDefine( "orxObject_SetAnimFrequency", {C_POINTER,C_FLOAT}, C_UINT ),
	xorxObject_SetAnimFrequencyRecursive    = orxDefine( "orxObject_SetAnimFrequencyRecursive", {C_POINTER,C_FLOAT} ),
	xorxObject_GetAnimFrequency             = orxDefine( "orxObject_GetAnimFrequency", {C_POINTER}, C_FLOAT ),
	xorxObject_SetCurrentAnim               = orxDefine( "orxObject_SetCurrentAnim", {C_POINTER,C_STRING}, C_UINT ),
	xorxObject_SetCurrentAnimRecursive      = orxDefine( "orxObject_SetCurrentAnimRecursive", {C_POINTER,C_STRING} ),
	xorxObject_SetTargetAnim                = orxDefine( "orxObject_SetTargetAnim", {C_POINTER,C_STRING}, C_UINT ),
	xorxObject_SetTargetAnimRecursive       = orxDefine( "orxObject_SetTargetAnimRecursive", {C_POINTER,C_STRING} ),
	xorxObject_GetCurrentAnim               = orxDefine( "orxObject_GetCurrentAnim", {C_POINTER}, C_STRING ),
	xorxObject_GetTargetAnim                = orxDefine( "orxObject_GetTargetAnim", {C_POINTER}, C_STRING ),
	xorxObject_IsCurrentAnim                = orxDefine( "orxObject_IsCurrentAnim", {C_POINTER,C_STRING}, C_BOOL ),
	xorxObject_IsTargetAnim                 = orxDefine( "orxObject_IsTargetAnim", {C_POINTER,C_STRING}, C_BOOL ),
	xorxObject_SetSpeed                     = orxDefine( "orxObject_SetSpeed", {C_POINTER,C_POINTER}, C_UINT ),
	xorxObject_SetRelativeSpeed             = orxDefine( "orxObject_SetRelativeSpeed", {C_POINTER,C_POINTER}, C_UINT ),
	xorxObject_SetAngularVelocity           = orxDefine( "orxObject_SetAngularVelocity", {C_POINTER,C_FLOAT}, C_UINT ),
	xorxObject_SetCustomGravity             = orxDefine( "orxObject_SetCustomGravity", {C_POINTER,C_POINTER}, C_UINT ),
	xorxObject_GetSpeed                     = orxDefine( "orxObject_GetSpeed", {C_POINTER,C_POINTER}, C_POINTER ),
	xorxObject_GetRelativeSpeed             = orxDefine( "orxObject_GetRelativeSpeed", {C_POINTER,C_POINTER}, C_POINTER ),
	xorxObject_GetAngularVelocity           = orxDefine( "orxObject_GetAngularVelocity", {C_POINTER}, C_FLOAT ),
	xorxObject_GetCustomGravity             = orxDefine( "orxObject_GetCustomGravity", {C_POINTER,C_POINTER}, C_POINTER ),
	xorxObject_GetMass                      = orxDefine( "orxObject_GetMass", {C_POINTER}, C_FLOAT ),
	xorxObject_GetMassCenter                = orxDefine( "orxObject_GetMassCenter", {C_POINTER,C_POINTER}, C_POINTER ),
	xorxObject_ApplyTorque                  = orxDefine( "orxObject_ApplyTorque", {C_POINTER,C_FLOAT}, C_UINT ),
	xorxObject_ApplyForce                   = orxDefine( "orxObject_ApplyForce", {C_POINTER,C_POINTER,C_POINTER}, C_UINT ),
	xorxObject_ApplyImpulse                 = orxDefine( "orxObject_ApplyImpulse", {C_POINTER,C_POINTER,C_POINTER}, C_UINT ),
	xorxObject_Raycast                      = orxDefine( "orxObject_Raycast", {C_POINTER,C_POINTER,C_UINT,C_UINT,C_BOOL,C_POINTER,C_POINTER}, C_POINTER ),
	xorxObject_SetTextString                = orxDefine( "orxObject_SetTextString", {C_POINTER,C_STRING}, C_UINT ),
	xorxObject_GetTextString                = orxDefine( "orxObject_GetTextString", {C_POINTER}, C_STRING ),
	xorxObject_GetBoundingBox               = orxDefine( "orxObject_GetBoundingBox", {C_POINTER,C_POINTER}, C_POINTER ),
	xorxObject_AddFX                        = orxDefine( "orxObject_AddFX", {C_POINTER,C_STRING}, C_UINT ),
	xorxObject_AddFXRecursive               = orxDefine( "orxObject_AddFXRecursive", {C_POINTER,C_STRING,C_FLOAT} ),
	xorxObject_AddUniqueFX                  = orxDefine( "orxObject_AddUniqueFX", {C_POINTER,C_STRING}, C_UINT ),
	xorxObject_AddUniqueFXRecursive         = orxDefine( "orxObject_AddUniqueFXRecursive", {C_POINTER,C_STRING,C_FLOAT} ),
	xorxObject_AddDelayedFX                 = orxDefine( "orxObject_AddDelayedFX", {C_POINTER,C_STRING,C_FLOAT} ),
	xorxObject_AddDelayedFXRecursive        = orxDefine( "orxObject_AddDelayedFXRecursive", {C_POINTER,C_STRING,C_FLOAT,C_BOOL} ),
	xorxObject_AddUniqueDelayedFX           = orxDefine( "orxObject_AddUniqueDelayedFX", {C_POINTER,C_STRING,C_FLOAT} ),
	xorxObject_AddUniqueDelayedFXRecursive  = orxDefine( "orxObject_AddUniqueDelayedFXRecursive", {C_POINTER,C_STRING,C_FLOAT,C_BOOL} ),
	xorxObject_RemoveFX                     = orxDefine( "orxObject_RemoveFX", {C_POINTER,C_STRING}, C_UINT ),
	xorxObject_RemoveFXRecursive            = orxDefine( "orxObject_RemoveFXRecursive", {C_POINTER,C_STRING} ),
	xorxObject_RemoveAllFXs                 = orxDefine( "orxObject_RemoveAllFXs", {C_POINTER}, C_UINT ),
	xorxObject_SynchronizeFX                = orxDefine( "orxObject_SynchronizeFX", {C_POINTER,C_POINTER}, C_UINT ),
	xorxObject_AddSound                     = orxDefine( "orxObject_AddSound", {C_POINTER,C_STRING}, C_UINT ),
	xorxObject_RemoveSound                  = orxDefine( "orxObject_RemoveSound", {C_POINTER,C_STRING}, C_UINT ),
	xorxObject_GetLastAddedSound            = orxDefine( "orxObject_GetLastAddedSound", {C_POINTER}, C_POINTER ),
	xorxObject_SetVolume                    = orxDefine( "orxObject_SetVolume", {C_POINTER,C_FLOAT}, C_UINT ),
	xorxObject_SetPitch                     = orxDefine( "orxObject_SetPitch", {C_POINTER,C_FLOAT}, C_UINT ),
	xorxObject_Play                         = orxDefine( "orxObject_Play", {C_POINTER}, C_UINT ),
	xorxObject_Stop                         = orxDefine( "orxObject_Stop", {C_POINTER}, C_UINT ),
	xorxObject_AddShader                    = orxDefine( "orxObject_AddShader", {C_POINTER,C_STRING}, C_UINT ),
	xorxObject_AddShaderRecursive           = orxDefine( "orxObject_AddShaderRecursive", {C_POINTER,C_STRING} ),
	xorxObject_RemoveShader                 = orxDefine( "orxObject_RemoveShader", {C_POINTER,C_STRING}, C_UINT ),
	xorxObject_RemoveShaderRecursive        = orxDefine( "orxObject_RemoveShaderRecursive", {C_POINTER,C_STRING} ),
	xorxObject_EnableShader                 = orxDefine( "orxObject_EnableShader", {C_POINTER,C_BOOL} ),
	xorxObject_IsShaderEnabled              = orxDefine( "orxObject_IsShaderEnabled", {C_POINTER}, C_BOOL ),
	xorxObject_AddTimeLineTrack             = orxDefine( "orxObject_AddTimeLineTrack", {C_POINTER,C_STRING}, C_UINT ),
	xorxObject_AddTimeLineTrackRecursive    = orxDefine( "orxObject_AddTimeLineTrackRecursive", {C_POINTER,C_STRING} ),
	xorxObject_RemoveTimeLineTrack          = orxDefine( "orxObject_RemoveTimeLineTrack", {C_POINTER,C_STRING}, C_UINT ),
	xorxObject_RemoveTimeLineTrackRecursive = orxDefine( "orxObject_RemoveTimeLineTrackRecursive", {C_POINTER,C_STRING} ),
	xorxObject_EnableTimeLine               = orxDefine( "orxObject_EnableTimeLine", {C_POINTER,C_BOOL} ),
	xorxObject_IsTimeLineEnabled            = orxDefine( "orxObject_IsTimeLineEnabled", {C_POINTER}, C_BOOL ),
	xorxObject_GetName                      = orxDefine( "orxObject_GetName", {C_POINTER}, C_STRING ),
	xorxObject_CreateNeighborList           = orxDefine( "orxObject_CreateNeighborList", {C_POINTER,C_STRING}, C_POINTER ),
	xorxObject_DeleteNeighborList           = orxDefine( "orxObject_DeleteNeighborList", {C_POINTER} ),
	xorxObject_SetSmoothing                 = orxDefine( "orxObject_SetSmoothing", {C_POINTER,C_UINT}, C_UINT ),
	xorxObject_SetSmoothingRecursive        = orxDefine( "orxObject_SetSmoothingRecursive", {C_POINTER,C_UINT} ),
	xorxObject_GetSmoothing                 = orxDefine( "orxObject_GetSmoothing", {C_POINTER}, C_UINT ),
	xorxObject_GetWorkingTexture            = orxDefine( "orxObject_GetWorkingTexture", {C_POINTER}, C_POINTER ),
	xorxObject_GetWorkingGraphic            = orxDefine( "orxObject_GetWorkingGraphic", {C_POINTER}, C_POINTER ),
	xorxObject_SetColor                     = orxDefine( "orxObject_SetColor", {C_POINTER,C_POINTER}, C_UINT ),
	xorxObject_SetColorRecursive            = orxDefine( "orxObject_SetColorRecursive", {C_POINTER,C_POINTER} ),
	xorxObject_HasColor                     = orxDefine( "orxObject_HasColor", {C_POINTER}, C_BOOL ),
	xorxObject_GetColor                     = orxDefine( "orxObject_GetColor", {C_POINTER,C_POINTER}, C_POINTER ),
	xorxObject_SetRGB                       = orxDefine( "orxObject_SetRGB", {C_POINTER,C_POINTER}, C_UINT ),
	xorxObject_SetRGBRecursive              = orxDefine( "orxObject_SetRGBRecursive", {C_POINTER,C_POINTER} ),
	xorxObject_SetAlpha                     = orxDefine( "orxObject_SetAlpha", {C_POINTER,C_FLOAT}, C_UINT ),
	xorxObject_SetAlphaRecursive            = orxDefine( "orxObject_SetAlphaRecursive", {C_POINTER,C_FLOAT} ),
	xorxObject_SetRepeat                    = orxDefine( "orxObject_SetRepeat", {C_POINTER,C_FLOAT,C_FLOAT}, C_UINT ),
	xorxObject_GetRepeat                    = orxDefine( "orxObject_GetRepeat", {C_POINTER,C_POINTER,C_POINTER}, C_UINT ),
	xorxObject_SetBlendMode                 = orxDefine( "orxObject_SetBlendMode", {C_POINTER,C_UINT}, C_UINT ),
	xorxObject_SetBlendModeRecursive        = orxDefine( "orxObject_SetBlendModeRecursive", {C_POINTER,C_UINT} ),
	xorxObject_HasBlendMode                 = orxDefine( "orxObject_HasBlendMode", {C_POINTER}, C_BOOL ),
	xorxObject_GetBlendMode                 = orxDefine( "orxObject_GetBlendMode", {C_POINTER}, C_UINT ),
	xorxObject_SetLifeTime                  = orxDefine( "orxObject_SetLifeTime", {C_POINTER,C_FLOAT}, C_UINT ),
	xorxObject_GetLifeTime                  = orxDefine( "orxObject_GetLifeTime", {C_POINTER}, C_FLOAT ),
	xorxObject_GetActiveTime                = orxDefine( "orxObject_GetActiveTime", {C_POINTER}, C_FLOAT ),
	xorxObject_GetDefaultGroupID            = orxDefine( "orxObject_GetDefaultGroupID", {}, C_POINTER ),
	xorxObject_GetGroupID                   = orxDefine( "orxObject_GetGroupID", {C_POINTER}, C_POINTER ),
	xorxObject_SetGroupID                   = orxDefine( "orxObject_SetGroupID", {C_POINTER,C_POINTER}, C_UINT ),
	xorxObject_SetGroupIDRecursive          = orxDefine( "orxObject_SetGroupIDRecursive", {C_POINTER,C_POINTER} ),
	xorxObject_GetNext                      = orxDefine( "orxObject_GetNext", {C_POINTER,C_POINTER}, C_POINTER ),
	xorxObject_GetNextEnabled               = orxDefine( "orxObject_GetNextEnabled", {C_POINTER,C_POINTER}, C_POINTER ),
	xorxObject_Pick                         = orxDefine( "orxObject_Pick", {C_POINTER,C_POINTER}, C_POINTER ),
	xorxObject_BoxPick                      = orxDefine( "orxObject_BoxPick", {C_POINTER,C_POINTER}, C_POINTER )

public constant orxOBJECT_KZ_DEFAULT_GROUP = "default"

public enum type orxOBJECT_EVENT

	orxOBJECT_EVENT_CREATE = 0,
	orxOBJECT_EVENT_DELETE,
	orxOBJECT_EVENT_PREPARE,
	orxOBJECT_EVENT_ENABLE,
	orxOBJECT_EVENT_DISABLE,
	orxOBJECT_EVENT_PAUSE,
	orxOBJECT_EVENT_UNPAUSE,
	orxOBJECT_EVENT_NUMBER,
	orxOBJECT_EVENT_NONE = 0xFFFFFFFF -- orxENUM_NONE

end type -- orxOBJECT_EVENT

public procedure orxObject_Setup()
	orxProc( xorxObject_Setup, {} )
end procedure

public function orxObject_Init()
	return orxFunc( xorxObject_Init, {} )
end function

public procedure orxObject_Exit()
	orxProc( xorxObject_Exit, {} )
end procedure

public function orxObject_Create()
	return orxFunc( xorxObject_Create, {} )
end function

public function orxObject_CreateFromConfig( object _zConfigID )
	return orxFunc( xorxObject_CreateFromConfig, {_zConfigID} )
end function

public function orxObject_Delete( atom _pstObject )
	return orxFunc( xorxObject_Delete, {_pstObject} )
end function

public function orxObject_Update( atom _pstObject, atom _pstClockInfo )
	return orxFunc( xorxObject_Update, {_pstObject,_pstClockInfo} )
end function

public procedure orxObject_Enable( atom _pstObject, atom _bEnable )
	orxProc( xorxObject_Enable, {_pstObject,_bEnable} )
end procedure

public procedure orxObject_EnableRecursive( atom _pstObject, atom _bEnable )
	orxProc( xorxObject_EnableRecursive, {_pstObject,_bEnable} )
end procedure

public function orxObject_IsEnabled( atom _pstObject )
	return orxFunc( xorxObject_IsEnabled, {_pstObject} )
end function

public procedure orxObject_Pause( atom _pstObject, atom _bPause )
	orxProc( xorxObject_Pause, {_pstObject,_bPause} )
end procedure

public procedure orxObject_PauseRecursive( atom _pstObject, atom _bPause )
	orxProc( xorxObject_PauseRecursive, {_pstObject,_bPause} )
end procedure

public function orxObject_IsPaused( atom _pstObject )
	return orxFunc( xorxObject_IsPaused, {_pstObject} )
end function

public procedure orxObject_SetUserData( atom _pstObject, atom _pUserData )
	orxProc( xorxObject_SetUserData, {_pstObject,_pUserData} )
end procedure

public function orxObject_GetUserData( atom _pstObject )
	return orxFunc( xorxObject_GetUserData, {_pstObject} )
end function

public procedure orxObject_SetOwner( atom _pstObject, atom _pOwner )
	orxProc( xorxObject_SetOwner, {_pstObject,_pOwner} )
end procedure

public function orxObject_GetOwner( atom _pstObject )
	return orxFunc( xorxObject_GetOwner, {_pstObject} )
end function

public function orxObject_GetOwnedChild( atom _pstObject )
	return orxFunc( xorxObject_GetOwnedChild, {_pstObject} )
end function

public function orxObject_GetOwnedSibling( atom _pstObject )
	return orxFunc( xorxObject_GetOwnedSibling, {_pstObject} )
end function

public function orxObject_SetClock( atom _pstObject, atom _pstClockInfo )
	return orxFunc( xorxObject_SetClock, {_pstObject,_pstClockInfo} )
end function

public function orxObject_GetClock( atom _pstObject )
	return orxFunc( xorxObject_GetClock, {_pstObject} )
end function

public function orxObject_LinkStructure( atom _pstObject, atom _pstStructure )
	return orxFunc( xorxObject_LinkStructure, {_pstObject,_pstStructure} )
end function

public procedure orxObject_UnlinkStructure( atom _pstObject, atom _eStructureID )
	orxProc( xorxObject_UnlinkStructure, {_pstObject,_eStructureID} )
end procedure

public function _orxObject_GetStructure( atom _pstObject, atom _eStructureID )
	return orxFunc( x_orxObject_GetStructure, {_pstObject,_eStructureID} )
end function

public function orxObject_SetFlip( atom _pstObject, atom _bFlipX, atom _bFlipY )
	return orxFunc( xorxObject_SetFlip, {_pstObject,_bFlipX,_bFlipY} )
end function

public function orxObject_GetFlip( atom _pstObject, atom _pbFlipX, atom _pbFlipY )
	return orxFunc( xorxObject_GetFlip, {_pstObject,_pbFlipX,_pbFlipY} )
end function

public function orxObject_SetPivot( atom _pstObject, atom _pvPivot )
	return orxFunc( xorxObject_SetPivot, {_pstObject,_pvPivot} )
end function

public function orxObject_SetOrigin( atom _pstObject, atom _pvOrigin )
	return orxFunc( xorxObject_SetOrigin, {_pstObject,_pvOrigin} )
end function

public function orxObject_SetSize( atom _pstObject, atom _pvSize )
	return orxFunc( xorxObject_SetSize, {_pstObject,_pvSize} )
end function

public function orxObject_GetPivot( atom _pstObject, atom _pvPivot )
	return orxFunc( xorxObject_GetPivot, {_pstObject,_pvPivot} )
end function

public function orxObject_GetOrigin( atom _pstObject, atom _pvOrigin )
	return orxFunc( xorxObject_GetOrigin, {_pstObject,_pvOrigin} )
end function

public function orxObject_GetSize( atom _pstObject, atom _pvSize )
	return orxFunc( xorxObject_GetSize, {_pstObject,_pvSize} )
end function

public function orxObject_SetPosition( atom _pstObject, atom _pvPosition )
	return orxFunc( xorxObject_SetPosition, {_pstObject,_pvPosition} )
end function

public function orxObject_SetWorldPosition( atom _pstObject, atom _pvPosition )
	return orxFunc( xorxObject_SetWorldPosition, {_pstObject,_pvPosition} )
end function

public function orxObject_SetRotation( atom _pstObject, atom _fRotation )
	return orxFunc( xorxObject_SetRotation, {_pstObject,_fRotation} )
end function

public function orxObject_SetWorldRotation( atom _pstObject, atom _fRotation )
	return orxFunc( xorxObject_SetWorldRotation, {_pstObject,_fRotation} )
end function

public function orxObject_SetScale( atom _pstObject, atom _pvScale )
	return orxFunc( xorxObject_SetScale, {_pstObject,_pvScale} )
end function

public function orxObject_SetWorldScale( atom _pstObject, atom _pvScale )
	return orxFunc( xorxObject_SetWorldScale, {_pstObject,_pvScale} )
end function

public function orxObject_GetPosition( atom _pstObject, atom _pvScale )
	return orxFunc( xorxObject_GetPosition, {_pstObject,_pvScale} )
end function

public function orxObject_GetWorldPosition( atom _pstObject, atom _pvPosition )
	return orxFunc( xorxObject_GetWorldPosition, {_pstObject,_pvPosition} )
end function

public function orxObject_GetRotation( atom _pstObject )
	return orxFunc( xorxObject_GetRotation, {_pstObject} )
end function

public function orxObject_GetWorldRotation( atom _pstObject )
	return orxFunc( xorxObject_GetWorldRotation, {_pstObject} )
end function

public function orxObject_GetScale( atom _pstObject, atom _pvScale )
	return orxFunc( xorxObject_GetScale, {_pstObject,_pvScale} )
end function

public function orxObject_GetWorldScale( atom _pstObject, atom _pvScale )
	return orxFunc( xorxObject_GetWorldScale, {_pstObject,_pvScale} )
end function

public function orxObject_SetParent( atom _pstObject, atom _pParent )
	return orxFunc( xorxObject_SetParent, {_pstObject,_pParent} )
end function

public function orxObject_GetParent( atom _pstObject )
	return orxFunc( xorxObject_GetParent, {_pstObject} )
end function

public function orxObject_GetChild( atom _pstObject )
	return orxFunc( xorxObject_GetChild, {_pstObject} )
end function

public function orxObject_GetSibling( atom _pstObject )
	return orxFunc( xorxObject_GetSibling, {_pstObject} )
end function

public function orxObject_GetNextChild( atom _pstObject, atom _pChild, atom _eStructureID )
	return orxFunc( xorxObject_GetNextChild, {_pstObject,_pChild,_eStructureID} )
end function

public function orxObject_Attach( atom _pstObject, atom _pParent )
	return orxFunc( xorxObject_Attach, {_pstObject,_pParent} )
end function

public function orxObject_Detach( atom _pstObject )
	return orxFunc( xorxObject_Detach, {_pstObject} )
end function

public function orxObject_LogParents( atom _pstObject )
	return orxFunc( xorxObject_LogParents, {_pstObject} )
end function

public function orxObject_SetAnimSet( atom _pstObject, atom _pstAnimSet )
	return orxFunc( xorxObject_SetAnimSet, {_pstObject,_pstAnimSet} )
end function

public function orxObject_SetAnimFrequency( atom _pstObject, atom _fFrequency )
	return orxFunc( xorxObject_SetAnimFrequency, {_pstObject,_fFrequency} )
end function

public procedure orxObject_SetAnimFrequencyRecursive( atom _pstObject, atom _fFrequency )
	orxProc( xorxObject_SetAnimFrequencyRecursive, {_pstObject,_fFrequency} )
end procedure

public function orxObject_GetAnimFrequency( atom _pstObject )
	return orxFunc( xorxObject_GetAnimFrequency, {_pstObject} )
end function

public function orxObject_SetCurrentAnim( atom _pstObject, object _zAnimName )
	return orxFunc( xorxObject_SetCurrentAnim, {_pstObject,_zAnimName} )
end function

public procedure orxObject_SetCurrentAnimRecursive( atom _pstObject, object _zAnimName )
	orxProc( xorxObject_SetCurrentAnimRecursive, {_pstObject,_zAnimName} )
end procedure

public function orxObject_SetTargetAnim( atom _pstObject, object _zAnimName )
	return orxFunc( xorxObject_SetTargetAnim, {_pstObject,_zAnimName} )
end function

public procedure orxObject_SetTargetAnimRecursive( atom _pstObject, object _zAnimName )
	orxProc( xorxObject_SetTargetAnimRecursive, {_pstObject,_zAnimName} )
end procedure

public function orxObject_GetCurrentAnim( atom _pstObject )
	return orxFunc( xorxObject_GetCurrentAnim, {_pstObject} )
end function

public function orxObject_GetTargetAnim( atom _pstObject )
	return orxFunc( xorxObject_GetTargetAnim, {_pstObject} )
end function

public function orxObject_IsCurrentAnim( atom _pstObject, object _zAnimName )
	return orxFunc( xorxObject_IsCurrentAnim, {_pstObject,_zAnimName} )
end function

public function orxObject_IsTargetAnim( atom _pstObject, object _zAnimName )
	return orxFunc( xorxObject_IsTargetAnim, {_pstObject,_zAnimName} )
end function

public function orxObject_SetSpeed( atom _pstObject, atom _pvSpeed )
	return orxFunc( xorxObject_SetSpeed, {_pstObject,_pvSpeed} )
end function

public function orxObject_SetRelativeSpeed( atom _pstObject, atom _pvRelativeSpeed )
	return orxFunc( xorxObject_SetRelativeSpeed, {_pstObject,_pvRelativeSpeed} )
end function

public function orxObject_SetAngularVelocity( atom _pstObject, atom _fVelocity )
	return orxFunc( xorxObject_SetAngularVelocity, {_pstObject,_fVelocity} )
end function

public function orxObject_SetCustomGravity( atom _pstObject, atom _pvCustomGravity )
	return orxFunc( xorxObject_SetCustomGravity, {_pstObject,_pvCustomGravity} )
end function

public function orxObject_GetSpeed( atom _pstObject, atom _pvSpeed )
	return orxFunc( xorxObject_GetSpeed, {_pstObject,_pvSpeed} )
end function

public function orxObject_GetRelativeSpeed( atom _pstObject, atom _pvRelativeSpeed )
	return orxFunc( xorxObject_GetRelativeSpeed, {_pstObject,_pvRelativeSpeed} )
end function

public function orxObject_GetAngularVelocity( atom _pstObject )
	return orxFunc( xorxObject_GetAngularVelocity, {_pstObject} )
end function

public function orxObject_GetCustomGravity( atom _pstObject, atom _pvCustomGravity )
	return orxFunc( xorxObject_GetCustomGravity, {_pstObject,_pvCustomGravity} )
end function

public function orxObject_GetMass( atom _pstObject )
	return orxFunc( xorxObject_GetMass, {_pstObject} )
end function

public function orxObject_GetMassCenter( atom _pstObject, atom _pvMassCenter )
	return orxFunc( xorxObject_GetMassCenter, {_pstObject,_pvMassCenter} )
end function

public function orxObject_ApplyTorque( atom _pstObject, atom _fTorque )
	return orxFunc( xorxObject_ApplyTorque, {_pstObject,_fTorque} )
end function

public function orxObject_ApplyForce( atom _pstObject, atom _pvForce, atom _pvPoint )
	return orxFunc( xorxObject_ApplyForce, {_pstObject,_pvForce,_pvPoint} )
end function

public function orxObject_ApplyImpulse( atom _pstObject, atom _pvImpulse, atom _pvPoint )
	return orxFunc( xorxObject_ApplyImpulse, {_pstObject,_pvImpulse,_pvPoint} )
end function

public function orxObject_Raycast( atom _pvBegin, atom _pvEnd, atom _u16SelfFlags, atom _u16CheckMask, atom _bEarlyExit, atom _pvContact, atom _pvNormal )
	return orxFunc( xorxObject_Raycast, {_pvBegin,_pvEnd,_u16SelfFlags,_u16CheckMask,_bEarlyExit,_pvContact,_pvNormal} )
end function

public function orxObject_SetTextString( atom _pstObject, object _zString )
	return orxFunc( xorxObject_SetTextString, {_pstObject,_zString} )
end function

public function orxObject_GetTextString( atom _pstObject )
	return orxFunc( xorxObject_GetTextString, {_pstObject} )
end function

public function orxObject_GetBoundingBox( atom _pstObject, atom _pstBoundingBox )
	return orxFunc( xorxObject_GetBoundingBox, {_pstObject,_pstBoundingBox} )
end function

public function orxObject_AddFX( atom _pstObject, object _zFXConfigID )
	return orxFunc( xorxObject_AddFX, {_pstObject,_zFXConfigID} )
end function

public procedure orxObject_AddFXRecursive( atom _pstObject, object _zFXConfigID )
	orxProc( xorxObject_AddFXRecursive, {_pstObject,_zFXConfigID} )
end procedure

public function orxObject_AddUniqueFX( atom _pstObject, object _zFXConfigID )
	return orxFunc( xorxObject_AddUniqueFX, {_pstObject,_zFXConfigID} )
end function

public procedure orxObject_AddUniqueFXRecursive( atom _pstObject, object _zFXConfigID )
	orxProc( xorxObject_AddUniqueFXRecursive, {_pstObject,_zFXConfigID} )
end procedure

public procedure orxObject_AddDelayedFX( atom _pstObject, object _zFXConfigID, atom _fDelay )
	orxProc( xorxObject_AddDelayedFX, {_pstObject,_zFXConfigID,_fDelay} )
end procedure

public procedure orxObject_AddDelayedFXRecursive( atom _pstObject, object _zFXConfigID, atom _fDelay )
	orxProc( xorxObject_AddDelayedFXRecursive, {_pstObject,_zFXConfigID,_fDelay} )
end procedure

public procedure orxObject_AddUniqueDelayedFX( atom _pstObject, object _zFXConfigID, atom _fDelay )
	orxProc( xorxObject_AddUniqueDelayedFX, {_pstObject,_zFXConfigID,_fDelay} )
end procedure

public procedure orxObject_AddUniqueDelayedFXRecursive( atom _pstObject, object _zFXConfigID, atom _fDelay, atom _bPropagate )
	orxProc( xorxObject_AddUniqueDelayedFXRecursive, {_pstObject,_zFXConfigID,_fDelay,_bPropagate} )
end procedure

public function orxObject_RemoveFX( atom _pstObject, object _zFXConfigID )
	return orxFunc( xorxObject_RemoveFX, {_pstObject,_zFXConfigID} )
end function

public procedure orxObject_RemoveFXRecursive( atom _pstObject, object _zFXConfigID )
	orxProc( xorxObject_RemoveFXRecursive, {_pstObject,_zFXConfigID} )
end procedure

public function orxObject_RemoveAllFXs( atom _pstObject )
	return orxFunc( xorxObject_RemoveAllFXs, {_pstObject} )
end function

public function orxObject_SynchronizeFX( atom _pstObject, atom _pstModel )
	return orxFunc( xorxObject_SynchronizeFX, {_pstObject,_pstModel} )
end function

public function orxObject_AddSound( atom _pstObject, object _zSoundConfigID )
	return orxFunc( xorxObject_AddSound, {_pstObject,_zSoundConfigID} )
end function

public function orxObject_RemoveSound( atom _pstObject, object _zSoundConfigID )
	return orxFunc( xorxObject_RemoveSound, {_pstObject,_zSoundConfigID} )
end function

public function orxObject_GetLastAddedSound( atom _pstObject )
	return orxFunc( xorxObject_GetLastAddedSound, {_pstObject} )
end function

public function orxObject_SetVolume( atom _pstObject, atom _fVolume )
	return orxFunc( xorxObject_SetVolume, {_pstObject,_fVolume} )
end function

public function orxObject_SetPitch( atom _pstObject, atom _fPitch )
	return orxFunc( xorxObject_SetPitch, {_pstObject,_fPitch} )
end function

public function orxObject_Play( atom _pstObject )
	return orxFunc( xorxObject_Play, {_pstObject} )
end function

public function orxObject_Stop( atom _pstObject )
	return orxFunc( xorxObject_Stop, {_pstObject} )
end function

public function orxObject_AddShader( atom _pstObject, object _zShaderConfigID )
	return orxFunc( xorxObject_AddShader, {_pstObject,_zShaderConfigID} )
end function

public procedure orxObject_AddShaderRecursive( atom _pstObject, object _zShaderConfigID )
	orxProc( xorxObject_AddShaderRecursive, {_pstObject,_zShaderConfigID} )
end procedure

public function orxObject_RemoveShader( atom _pstObject, object _zShaderConfigID )
	return orxFunc( xorxObject_RemoveShader, {_pstObject,_zShaderConfigID} )
end function

public procedure orxObject_RemoveShaderRecursive( atom _pstObject, object _zShaderConfigID )
	orxProc( xorxObject_RemoveShaderRecursive, {_pstObject,_zShaderConfigID} )
end procedure

public procedure orxObject_EnableShader( atom _pstObject, atom _bEnable )
	orxProc( xorxObject_EnableShader, {_pstObject,_bEnable} )
end procedure

public function orxObject_IsShaderEnabled( atom _pstObject )
	return orxFunc( xorxObject_IsShaderEnabled, {_pstObject} )
end function

public function orxObject_AddTimeLineTrack( atom _pstObject, object _zTrackConfigID )
	return orxFunc( xorxObject_AddTimeLineTrack, {_pstObject,_zTrackConfigID} )
end function

public procedure orxObject_AddTimeLineTrackRecursive( atom _pstObject, object _zTrackConfigID )
	orxProc( xorxObject_AddTimeLineTrackRecursive, {_pstObject,_zTrackConfigID} )
end procedure

public function orxObject_RemoveTimeLineTrack( atom _pstObject, object _zTrackConfigID )
	return orxFunc( xorxObject_RemoveTimeLineTrack, {_pstObject,_zTrackConfigID} )
end function

public procedure orxObject_RemoveTimeLineTrackRecursive( atom _pstObject, object _zTrackConfigID )
	orxProc( xorxObject_RemoveTimeLineTrackRecursive, {_pstObject,_zTrackConfigID} )
end procedure

public procedure orxObject_EnableTimeLine( atom _pstObject, atom _bEnable )
	orxProc( xorxObject_EnableTimeLine, {_pstObject,_bEnable} )
end procedure

public function orxObject_IsTimeLineEnabled( atom _pstObject )
	return orxFunc( xorxObject_IsTimeLineEnabled, {_pstObject} )
end function

public function orxObject_GetName( atom _pstObject )
	return orxFunc( xorxObject_GetName, {_pstObject} )
end function

public function orxObject_CreateNeighborList( atom _pstCheckBox, atom _stGroupID )
	return orxFunc( xorxObject_CreateNeighborList, {_pstCheckBox,_stGroupID} )
end function

public procedure orxObject_DeleteNeighborList( atom _pstObject )
	orxProc( xorxObject_DeleteNeighborList, {_pstObject} )
end procedure

public function orxObject_SetSmoothing( atom _pstObject, atom _eSmoothing )
	return orxFunc( xorxObject_SetSmoothing, {_pstObject,_eSmoothing} )
end function

public procedure orxObject_SetSmoothingRecursive( atom _pstObject, atom _eSmoothing )
	orxProc( xorxObject_SetSmoothingRecursive, {_pstObject,_eSmoothing} )
end procedure

public function orxObject_GetSmoothing( atom _pstObject )
	return orxFunc( xorxObject_GetSmoothing, {_pstObject} )
end function

public function orxObject_GetWorkingTexture( atom _pstObject )
	return orxFunc( xorxObject_GetWorkingTexture, {_pstObject} )
end function

public function orxObject_GetWorkingGraphic( atom _pstObject )
	return orxFunc( xorxObject_GetWorkingGraphic, {_pstObject} )
end function

public function orxObject_SetColor( atom _pstObject, atom _pstColor )
	return orxFunc( xorxObject_SetColor, {_pstObject,_pstColor} )
end function

public procedure orxObject_SetColorRecursive( atom _pstObject, atom _pstColor )
	orxProc( xorxObject_SetColorRecursive, {_pstObject,_pstColor} )
end procedure

public function orxObject_HasColor( atom _pstObject )
	return orxFunc( xorxObject_HasColor, {_pstObject} )
end function

public function orxObject_GetColor( atom _pstObject, atom _pstColor )
	return orxFunc( xorxObject_GetColor, {_pstObject,_pstColor} )
end function

public function orxObject_SetRGB( atom _pstObject, atom _pvRGB )
	return orxFunc( xorxObject_SetRGB, {_pstObject,_pvRGB} )
end function

public procedure orxObject_SetRGBRecursive( atom _pstObject, atom _pvRGB )
	orxProc( xorxObject_SetRGBRecursive, {_pstObject,_pvRGB} )
end procedure

public function orxObject_SetAlpha( atom _pstObject, atom _fAlpha )
	return orxFunc( xorxObject_SetAlpha, {_pstObject,_fAlpha} )
end function

public procedure orxObject_SetAlphaRecursive( atom _pstObject, atom _fAlpha )
	orxProc( xorxObject_SetAlphaRecursive, {_pstObject,_fAlpha} )
end procedure

public function orxObject_SetRepeat( atom _pstObject, atom _fRepeatX, atom _fRepeatY )
	return orxFunc( xorxObject_SetRepeat, {_pstObject,_fRepeatX,_fRepeatY} )
end function

public function orxObject_GetRepeat( atom _pstObject, atom _pfRepeatX, atom _pfRepeatY )
	return orxFunc( xorxObject_GetRepeat, {_pstObject,_pfRepeatX,_pfRepeatY} )
end function

public function orxObject_SetBlendMode( atom _pstObject, atom _eBlendMode )
	return orxFunc( xorxObject_SetBlendMode, {_pstObject,_eBlendMode} )
end function

public procedure orxObject_SetBlendModeRecursive( atom _pstObject, atom _eBlendMode )
	orxProc( xorxObject_SetBlendModeRecursive, {_pstObject,_eBlendMode} )
end procedure

public function orxObject_HasBlendMode( atom _pstObject )
	return orxFunc( xorxObject_HasBlendMode, {_pstObject} )
end function

public function orxObject_GetBlendMode( atom _pstObject )
	return orxFunc( xorxObject_GetBlendMode, {_pstObject} )
end function

public function orxObject_SetLifeTime( atom _pstObject, atom _fLifeTime )
	return orxFunc( xorxObject_SetLifeTime, {_pstObject,_fLifeTime} )
end function

public function orxObject_GetLifeTime( atom _pstObject )
	return orxFunc( xorxObject_GetLifeTime, {_pstObject} )
end function

public function orxObject_GetActiveTime( atom _pstObject )
	return orxFunc( xorxObject_GetActiveTime, {_pstObject} )
end function

public function orxObject_GetDefaultGroupID()
	return orxFunc( xorxObject_GetDefaultGroupID, {} )
end function

public function orxObject_GetGroupID( atom _pstObject )
	return orxFunc( xorxObject_GetGroupID, {_pstObject} )
end function

public function orxObject_SetGroupID( atom _pstObject, atom _stGroupID )
	return orxFunc( xorxObject_SetGroupID, {_pstObject,_stGroupID} )
end function

public procedure orxObject_SetGroupIDRecursive( atom _pstObject, atom _stGroupID )
	orxProc( xorxObject_SetGroupIDRecursive, {_pstObject,_stGroupID} )
end procedure

public function orxObject_GetNext( atom _pstObject, atom _stGroupID )
	return orxFunc( xorxObject_GetNext, {_pstObject,_stGroupID} )
end function

public function orxObject_GetNextEnabled( atom _pstObject, atom _stGroupID )
	return orxFunc( xorxObject_GetNextEnabled, {_pstObject,_stGroupID} )
end function

public function orxObject_Pick( atom _pvPosition, atom _stGroupID )
	return orxFunc( xorxObject_Pick, {_pvPosition,_stGroupID} )
end function

public function orxObject_BoxPick( atom _pstBox, atom _stGroupID )
	return orxFunc( xorxObject_BoxPick, {_pstBox,_stGroupID} )
end function

