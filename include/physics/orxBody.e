include "orxInclude.e"

include "object/orxStructure.e"
include "physics/orxPhysics.e"

public constant xorxBody_Setup = orxDefine("orxBody_Setup",{}),
				xorxBody_Init = orxDefine("orxBody_Init",{},C_INT),
				xorxBody_Exit = orxDefine("orxBody_Exit",{})
				
public procedure orxBody_Setup()

 orxProc(xorxBody_Setup,{})
	
end procedure

public function orxBody_Init()

 return orxFunc(xorxBody_Init,{})
	
end function

public procedure orxBody_Exit()

 orxProc(xorxBody_Exit,{})
	
end procedure

public constant xorxBody_Create = orxDefine("orxBody_Create",{C_POINTER,C_POINTER},C_POINTER),
				xorxBody_CreateFromConfig = orxDefine("orxBody_CreateFromConfig",{C_POINTER,C_STRING},C_POINTER),
				xorxBody_Delete = orxDefine("orxBody_Delete",{C_POINTER},C_INT),
				xorxBody_GetName = orxDefine("orxBody_GetName",{C_POINTER},C_STRING)
				
public function orxBody_Create(object _pstOwner,object _BodyDef)

 _pstOwner = allocate_data(SIZEOF_ORXSTRUCTURE)
 _BodyDef = allocate_data(SIZEOF_ORXBODY_DEF)
 
 return orxFunc(xorxBody_Create,{_pstOwner,_BodyDef})
	
end function

public function orxBody_CreateFromConfig(object _pstOwner,object _zConfigID)

 _pstOwner = allocate_data(SIZEOF_ORXSTRUCTURE)
 
 return orxFunc(xorxBody_CreateFromConfig,{_pstOwner,_zConfigID})
	
end function

public function orxBody_Delete(object _pstBody)

 return orxFunc(xorxBody_Delete,{_pstBody})
	
end function

public function orxBody_GetName(object _pstBody)

 return orxFunc(xorxBody_GetName,{_pstBody})
	
end function

public constant xorxBody_TestDefFlags = orxDefine("orxBody_TestDefFlags",{C_POINTER,C_UINT},C_BOOL),
				xorxBody_TestAllDefFlags = orxDefine("orxBody_TestAllDefFlags",{C_POINTER,C_UINT},C_BOOL),
				xorxBody_GetDefFlags = orxDefine("orxBody_GetDefFlags",{C_POINTER,C_UINT},C_UINT)
				
public function orxBody_TestDefFlags(object _pstBody,atom _u32Flags)

 return orxFunc(xorxBody_TestDefFlags,{_pstBody,_u32Flags})
	
end function

public function orxBody_TestAllDefFlags(object _pstBody,atom _u32Flags)

 return orxFunc(xorxBody_TestAllDefFlags,{_pstBody,_u32Flags})
	
end function

public function orxBody_GetDefFlags(object _pstBody,atom _u32Mask)

 return orxFunc(xorxBody_GetDefFlags,{_pstBody,_u32Mask})
	
end function

public constant xorxBody_AddPart = orxDefine("orxBody_AddPart",{C_POINTER,C_POINTER},C_POINTER),
				xorxBody_AddPartFromConfig = orxDefine("orxBody_AddPartFromConfig",{C_POINTER,C_STRING},C_POINTER),
				xorxBody_RemovePArtFromConfig = orxDefine("orxBody_RemovePartFromConfig",{C_POINTER,C_STRING},C_INT),
				xorxBody_GetNextPart = orxDefine("orxBody_GetNextPart",{C_POINTER,C_POINTER},C_POINTER),
				xorxBody_GetPartName = orxDefine("orxBody_GetPartName",{C_POINTER},C_STRING),
				xorxBody_GetPartDef = orxDefine("orxBody_GetPartDef",{C_POINTER},C_POINTER),
				xorxBody_GetPartBody = orxDefine("orxBody_GetPartBody",{C_POINTER},C_POINTER),
				xorxBody_RemovePart = orxDefine("orxBody_RemovePart",{C_POINTER},C_INT)
				
public function orxBody_AddPart(object _pstBody,object _pstBodyPartDef)

 _pstBodyPartDef = allocate_data(SIZEOF_ORXBODY_PART_DEF)
 
 return orxFunc(xorxBody_AddPart,{_pstBody,_pstBodyPartDef})
	
end function

public function orxBody_AddPartFromConfig(object _pstBody,object _zConfigID)

 return orxFunc(xorxBody_AddPartFromConfig,{_pstBody,_zConfigID})
	
end function

public function orxBody_RemovePartFromConfig(object _pstBody,object _zConfigID)

 return orxFunc(xorxBody_RemovePartFromConfig,{_pstBody,_zConfigID})
	
end function

public function orxBody_GetNextPart(object _pstBody,object _pstBodyPart)

 return orxFunc(xorxBody_GetNextPart,{_pstBody,_pstBodyPart})
	
end function

public function orxBody_GetPartName(object _pstBodyPart)

 return orxFunc(xorxBody_GetPartName,{_pstBodyPart})
	
end function

public function orxBody_GetPartDef(object _pstBodyPart)

 return orxFunc(xorxBody_GetPartDef,{_pstBodyPart})
	
end function

public function orxBody_GetPartBody(object _pstBodyPart)

 return orxFunc(xorxBody_GetPartBody,{_pstBodyPart})
	
end function

public function orxBody_RemovePart(object _pstBodyPart)

 return orxFunc(xorxBody_RemovePart,{_pstBodyPart})
	
end function

public constant xorxBody_AddJoint = orxDefine("orxBody_AddJoint",{C_POINTER,C_POINTER,C_POINTER},C_POINTER),
				xorxBody_AddJointFromConfig = orxDefine("orxBody_AddJointFromConfig",{C_POINTER,C_POINTER,C_STRING},C_POINTER),
				xorxBody_GetNextJoint = orxDefine("orxBody_GetNextJoint",{C_POINTER,C_POINTER},C_POINTER),
				xorxBody_GetJointName = orxDefine("orxBody_GetJointName",{C_POINTER},C_STRING),
				xorxBody_RemoveJoint = orxDefine("orxBody_RemoveJoint",{C_POINTER},C_INT)
				
public function orxBody_AddJoint(object _SrcBody,object _DstBody,object _BodyJointDef)

 _BodyJointDef = allocate_data(SIZEOF_ORXBODY_JOINT_DEF)
 
 return orxFunc(xorxBody_AddJoint,{_SrcBody,_DstBody,_BodyJointDef})
	
end function

public function orxBody_AddJointFromConfig(object _SrcBody,object _DstBody,object _zConfigID)

 return orxFunc(xorxBody_AddJointFromConfig,{_SrcBody,_DstBody,_zConfigID})
	
end function

public function orxBody_GetNextJoint(object _Body,object _BodyJoint)

 return orxFunc(xorxBody_GetNextJoint,{_Body,_BodyJoint})
	
end function

public function orxBody_GetJointName(object _BodyJoint)

 return orxFunc(xorxBody_GetJointName,{_BodyJoint})
	
end function

public function orxBody_RemoveJoint(object _BodyJoint)

 return orxFunc(xorxBody_RemoveJoint,{_BodyJoint})
	
end function

public constant xorxBody_SetPosition = orxDefine("orxBody_SetPosition",{C_POINTER,C_POINTER},C_INT),
				xorxBody_SetRotation = orxDefine("orxBody_SetRotation",{C_POINTER,C_FLOAT},C_INT),
				xorxBody_SetScale = orxDefine("orxBody_SetScale",{C_POINTER,C_POINTER},C_INT),
				xorxBody_SetSpeed = orxDefine("orxBody_SetSpeed",{C_POINTER,C_POINTER},C_INT),
				xorxBody_SetAngularVelocity = orxDefine("orxBody_SetAngularVelocity",{C_POINTER,C_FLOAT},C_INT),
				xorxBody_SetCustomGravity = orxDefine("orxBody_SetCustomGravity",{C_POINTER,C_POINTER},C_INT),
				xorxBody_SetFixedRotation = orxDefine("orxBody_SetFixedRotation",{C_POINTER,C_BOOL},C_INT),
				xorxBody_SetDynamic = orxDefine("orxBody_SetDynamic",{C_POINTER,C_BOOL},C_INT),
				xorxBody_SetAllowMoving = orxDefine("orxBody_SetAllowMoving",{C_POINTER,C_BOOL},C_INT),
				xorxBody_GetPosition = orxDefine("orxBody_GetPosition",{C_POINTER,C_POINTER},C_POINTER),
				xorxBody_GetRotation = orxDefine("orxBody_GetRotation",{C_POINTER},C_FLOAT),
				xorxBody_GetSpeed = orxDefine("orxBody_GetSpeed",{C_POINTER,C_POINTER},C_POINTER),
				xorxBody_GetSpeedAtWorldPosition = orxDefine("orxBody_GetSpeedAtWorldPosition",{C_POINTER,C_POINTER,C_POINTER},C_POINTER),
				xorxBody_GetAngularVelocity = orxDefine("orxBody_GetAngularVelocity",{C_POINTER},C_FLOAT),
				xorxBody_GetCustomGravity = orxDefine("orxBody_GetCustomGravity",{C_POINTER,C_POINTER},C_POINTER),
				xorxBody_IsFixedRotation = orxDefine("orxBody_IsFixedRotation",{C_POINTER},C_BOOL),
				xorxBody_IsDynamic = orxDefine("orxBody_IsDynamic",{C_POINTER},C_BOOL),
				xorxBody_GetAllowMoving = orxDefine("orxBody_GetAllowMoving",{C_POINTER},C_BOOL),
				xorxBody_GetMass = orxDefine("orxBody_GetMass",{C_POINTER},C_FLOAT),
				xorxBody_GetMassCenter = orxDefine("orxBody_GetMassCenter",{C_POINTER,C_POINTER},C_POINTER)
				
public function orxBody_SetPosition(object _pstBody,object _pvPos)

 _pvPos = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxBody_SetPosition,{_pstBody,_pvPos})
	
end function

public function orxBody_SetRotation(object _pstBody,atom _fRot)

 return orxFunc(xorxBody_SetRotation,{_pstBody,_fRot})
	
end function

public function orxBody_SetScale(object _pstBody,object _pvScale)

 _pvScale = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxBody_SetScale,{_pstBody,_pvScale})
	
end function

public function orxBody_SetSpeed(object _pstBody,object _pvSpd)

 _pvSpd = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxBody_SetSpeed,{_pstBody,_pvSpd})
	
end function

public function orxBody_SetAngularVelocity(object _pstBody,atom _fVel)

 return orxFunc(xorxBody_SetAngularVelocity,{_pstBody,_fVel})
	
end function

public function orxBody_SetCustomGravity(object _pstBody,object _pvCusGrav)

 _pvCusGrav = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxBody_SetCustomGravity,{_pstBody,_pvCusGrav})
	
end function

public function orxBody_SetFixedRotation(object _pstBody,atom _bFixed)

 return orxFunc(xorxBody_SetFixedRotation,{_pstBody,_bFixed})
	
end function

public function orxBody_SetDynamic(object _pstBody,atom _bDynamic)

 return orxFunc(xorxBody_SetDynamic,{_pstBody,_bDynamic})
	
end function

public function orxBody_SetAllowMoving(object _pstBody,atom _bAllow)

 return orxFunc(xorxBody_SetAllowMoving,{_pstBody,_bAllow})
	
end function

public function orxBody_GetPosition(object _pstBody,object _pvPos)

 _pvPos = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxBody_GetPosition,{_pstBody,_pvPos})
	
end function

public function orxBody_GetRotation(object _pstBody)

 return orxFunc(xorxBody_GetRotation,{_pstBody})
	
end function

public function orxBody_GetSpeed(object _pstBody,object _pvSpd)

 _pvSpd = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxBody_GetSpeed,{_pstBody,_pvSpd})
	
end function

public function orxBody_GetSpeedAtWorldPosition(object _pstBody,object _pvPos,object _pvSpd)

 _pvPos = allocate_data(SIZEOF_ORXVECTOR)
 _pvSpd = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxBody_GetSpeedAtWorldPosition,{_pstBody,_pvPos,_pvSpd})
	
end function

public function orxBody_GetAngularVelocity(object _pstBody)

 return orxFunc(xorxBody_GetAngularVelocity,{_pstBody})
	
end function

public function orxBody_GetCustomGravity(object _pstBody,object _pvCusGrav)

 return orxFunc(xorxBody_GetCustomGravity,{_pstBody,_pvCusGrav})
	
end function

public function orxBody_IsFixedRotation(object _pstBody)

 return orxFunc(xorxBody_IsFixedRotation,{_pstBody})
	
end function

public function orxBody_IsDynamic(object _pstBody)

 return orxFunc(xorxBody_IsDynamic,{_pstBody})
	
end function

public function orxBody_GetAllowMoving(object _pstBody)

 return orxFunc(xorxBody_GetAllowMoving,{_pstBody})
	
end function

public function orxBody_GetMass(object _pstBody)

 return orxFunc(xorxBody_GetMass,{_pstBody})
	
end function

public function orxBody_GetMassCenter(object _pstBody,object _pvMassCt)

 _pvMassCt = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxBody_GetMassCenter,{_pstBody,_pvMassCt})
	
end function

public constant xorxBody_SetLinearDamping = orxDefine("orxBody_SetLinearDamping",{C_POINTER,C_FLOAT},C_INT),
				xorxBody_SetAngularDamping = orxDefine("orxBody_SetAngularDamping",{C_POINTER,C_FLOAT},C_INT),
				xorxBody_GetLinearDamping = orxDefine("orxBody_GetLinearDamping",{C_POINTER},C_FLOAT),
				xorxBody_GetAngularDamping = orxDefine("orxBody_GetAngularDamping",{C_POINTER},C_FLOAT),
				xorxBody_IsInside = orxDefine("orxBody_IsInside",{C_POINTER,C_POINTER},C_BOOL)
				
public function orxBody_SetLinearDamping(object _pstBody,atom _fDamp)

 return orxFunc(xorxBody_SetLinearDamping,{_pstBody,_fDamp})
	
end function

public function orxBody_SetAngularDamping(object _pstBody,atom _fDamp)

 return orxFunc(xorxBody_SetAngularDamping,{_pstBody,_fDamp})
	
end function

public function orxBody_GetLinearDamping(object _pstBody)

 return orxFunc(xorxBody_GetLinearDamping,{_pstBody})
	
end function

public function orxBody_GetAngularDamping(object _pstBody)

 return orxFunc(xorxBody_GetAngularDamping,{_pstBody})
	
end function

public function orxBody_IsInside(object _pstBody,object _pvPos)

 _pvPos = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxBody_IsInside,{_pstBody,_pvPos})
	
end function

public constant xorxBody_ApplyTorque = orxDefine("orxBody_ApplyTorque",{C_POINTER,C_FLOAT},C_INT),
				xorxBody_ApplyForce = orxDefine("orxBody_ApplyForce",{C_POINTER,C_POINTER,C_POINTER},C_INT),
				xorxBody_ApplyImpulse = orxDefine("orxBody_ApplyImpulse",{C_POINTER,C_POINTER,C_POINTER},C_INT)
				
public function orxBody_ApplyTorque(object _pstBody,atom _fTor)

 return orxFunc(xorxBody_ApplyTorque,{_pstBody,_fTor})
	
end function

public function orxBody_ApplyForce(object _pstBody,object _pvFor,object _pvPt)

 _pvFor = allocate_data(SIZEOF_ORXVECTOR)
 _pvPt = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxBody_ApplyForce,{_pstBody,_pvFor,_pvPt})
	
end function

public function orxBody_ApplyImpulse(object _pstBody,object _pvImp,object _pvPt)

 _pvImp = allocate_data(SIZEOF_ORXVECTOR)
 _pvPt = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxBody_ApplyImpulse,{_pstBody,_pvImp,_pvPt})
	
end function

public constant xorxBody_SetPartSelfFlags = orxDefine("orxBody_SetPartSelfFlags",{C_POINTER,C_UINT},C_INT),
				xorxBody_SetParCheckMask = orxDefine("orxBody_SetPartCheckMask",{C_POINTER,C_UINT},C_INT),
				xorxBody_GetPartSelfFlags = orxDefine("orxBody_GetPartSelfFlags",{C_POINTER},C_UINT),
				xorxBody_GetPartCheckMask = orxDefine("orxBody_GetPartCheckMask",{C_POINTER},C_UINT),
				xorxBody_SetPartSolid = orxDefine("orxBody_SetPartSolid",{C_POINTER,C_BOOL},C_INT),
				xorxBody_IsPartSolid = orxDefine("orxBody_IsPartSolid",{C_POINTER},C_BOOL),
				xorxBody_SetPartFriction = orxDefine("orxBody_SetPartFriction",{C_POINTER,C_FLOAT},C_INT),
				xorxBody_GetPartFriction = orxDefine("orxBody_GetPartFriction",{C_POINTER},C_FLOAT),
				xorxBody_SetPartRestitution = orxDefine("orxBody_SetPartRestitution",{C_POINTER,C_FLOAT},C_INT),
				xorxBody_GetPartRestitution = orxDefine("orxBody_GetPartRestitution",{C_POINTER},C_FLOAT),
				xorxBody_SetPartDensity = orxDefine("orxBody_SetPartDensity",{C_POINTER,C_FLOAT},C_INT),
				xorxBody_GetPartDensity = orxDefine("orxBody_GetPartDensity",{C_POINTER},C_FLOAT),
				xorxBody_IsInsidePart = orxDefine("orxBody_IsInsidePart",{C_POINTER,C_POINTER},C_BOOL)
				
public function orxBody_SetPartSelfFlags(object _pstBody,atom _SelfFlags)

 return orxFunc(xorxBody_SetPartSelfFlags,{_pstBody,_SelfFlags})
	
end function

public function orxBody_SetPartCheckMask(object _pstBody,atom _CheckMask)

 return orxFunc(xorxBody_SetPartCheckMask,{_pstBody,_CheckMask})
	
end function

public function orxBody_GetPartSelfFlags(object _pstBody)

 return orxFunc(xorxBody_GetPartSelfFlags,{_pstBody})
	
end function

public function orxBody_GetPartCheckMask(object _pstBody)

 return orxFunc(xorxBody_GetPartCheckMask,{_pstBody})
	
end function

public function orxBody_SetPartSolid(object _pstBody,atom _bSol)

 return orxFunc(xorxBody_SetPartSolid,{_pstBody,_bSol})
	
end function

public function orxBody_IsPartSolid(object _pstBody)

 return orxFunc(xorxBody_IsPartSolid,{_pstBody})
	
end function

public function orxBody_SetPartFriction(object _pstbody,atom _fFri)

 return orxFunc(xorxBody_SetPartFriction,{_pstBody,_fFri})
	
end function

public function orxBody_GetPartFriction(object _pstBody)

 return orxFunc(xorxBody_GetPartFriction,{_pstBody})
	
end function

public function orxBody_SetPartRestitution(object _pstBody,atom _fRes)

 return orxFunc(xorxBody_SetPartRestitution,{_pstBody,_fRes})
	
end function

public function orxBody_GetPartRestitution(object _pstBody)

 return orxFunc(xorxBody_GetPartRestitution,{_pstBody})
	
end function

public function orxBody_SetPartDensity(object _pstBody,atom _fDen)

 return orxFunc(xorxBody_SetPartDensity,{_pstBody,_fDen})
	
end function

public function orxBody_GetPartDensity(object _pstBody)

 return orxFunc(xorxBody_GetPartDensity,{_pstBody})
	
end function

public function orxBody_IsInsidePart(object _pstBody,object _pvPos)

 _pvPos = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxBody_IsInsidePart,{_pstBody,_pvPos})
	
end function

public constant xorxBody_EnableMotor = orxDefine("orxBody_EnableMotor",{C_POINTER,C_BOOL},C_INT),
				xorxBody_SetJointMotorSpeed = orxDefine("orxBody_SetJointMotorSpeed",{C_POINTER,C_FLOAT},C_INT),
				xorxBody_SetJointMaxMotorTorque = orxDefine("orxBody_SetJointMaxMotorTorque",{C_POINTER,C_FLOAT},C_INT)
				
public function orxBody_EnableMotor(object _pstJoint,atom _bEn)

 return orxFunc(xorxBody_EnableMotor,{_pstJoint,_bEn})
	
end function

public function orxBody_SetJointMotorSpeed(object _pstJoint,atom _fSpd)

 return orxFunc(xorxBody_SetJointMotorSpeed,{_pstJoint,_fSpd})
	
end function

public function orxBody_SetJointMaxMotorTorque(object _pstJoint)

 return orxFunc(xorxBody_SetJointMaxMotorTorque,{_pstJoint})
	
end function

public constant xorxBody_GetJointReactionForce = orxDefine("orxBody_GetJointReactionForce",{C_POINTER,C_POINTER},C_POINTER),
				xorxBody_GetJointReactionTorque = orxDefine("orxBody_GetJointReactionTorque",{C_POINTER},C_FLOAT)
				
public function orxBody_GetJointReactionForce(object Joint,object _pvFor)

 _pvFor = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxBody_GetJointReactionForce,{Jint,_pvFor})
	
end function

public function orxBody_GetJointReactionTorque(object Joint)

 return orxFunc(xBody_GetJointReactionTorque,{Joint})
	
end function

public constant xorxBody_Raycast = orxDefine("orxBody_Raycast",{C_POINTER,C_POINTER,C_UINt,C_UINT,C_BOOL,C_POINTER,C_POINTER},C_POINTER)

public function orxBody_Raycast(object _pvBegin,object _pvEnd,atom _SelfFlags,atom _CheckMask,atom _Early,object _pvCon,object _pvNorm)

 _pvBegin = allocate_data(SIZEOF_ORXVECTOR)
 _pvEnd = allocate_data(SIZEOF_ORXVECTOR)
 _pvCon = allocate_data(SIZEOF_ORXVECTOR)
 _pvNorm = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxBody_Raycast,{_pvBegin,_pvEnd,_SelfFlags,_CheckMask,_Early,_pvCon,_pvNorm})
	
end function

public constant xorxBody_BoxPick = orxDefine("orxBody_BoxPick",{C_POINTER,C_UINT,C_UINT,C_POINTER,C_UINT},C_UINT)

public function orxBody_BoxPick(object _pstBox,atom _Self,atom _Check,object _BodyList,atom _u32Num)

 _pstBox = allocate_data(SIZEOF_ORXAABOX)
 
 return orxFunc(xorxBody_BoxPick,{_pstBox,_Self,_Check,_BodyList,_u32Num})
	
end function
­557.74