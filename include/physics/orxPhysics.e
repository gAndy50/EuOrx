include "orxInclude.e"
public include "plugin/orxPluginCore.e"
public include "math/orxAABox.e"

public constant orxBODY_DEF_KU32_FLAG_NONE = #00000000,
				orxBODY_DEF_KU32_FLAG_2D = #00000001,
				orxBODY_DEF_KU32_FLAG_DYNAMIC = #00000002,
				orxBODY_DEF_KU32_FLAG_HIGH_SPEED = #00000004,
				orxBODY_DEF_KU32_FLAG_FIXED_ROTATION = #00000008,
				orxBODY_DEF_KU32_FLAG_CAN_MOVE = #00000010,
				orxBODY_DEF_KU32_FLAG_ALLOW_SLEEP = #00000020,
				orxBODY_DEF_KU32_FLAG_MASK_ALL = #FFFFFFFF,
				orxBODY_PART_DEF_KU32_FLAG_NONE = 0,
				orxBODY_PART_DEF_KU32_FLAG_SPHERE = 1,
				orxBODY_PART_DEF_KU32_FLAG_BOX = 2,
				orxBODY_PART_DEF_KU32_FLAG_MESH = 4,
				orxBODY_PART_DEF_KU32_FLAG_EDGE = 8,
				orxBODY_PART_DEF_KU32_FLAG_CHAIN = #00000010,
				orxBODY_PART_DEF_KU32_MASK_TYPE = #0000001F,
				orxBODY_PART_DEF_KU32_FLAG_SOLID = #10000000,
				orxBODY_PART_DEF_KU32_MASK_ALL = #FFFFFFFF,
				orxBODY_JOINT_DEF_KU32_FLAG_NONE = 0,
				orxBODY_JOINT_DEF_KU32_FLAG_REVOLUTE = 1,
				orxBODY_JOINT_DEF_KU32_FLAG_PRISMATIC = 2,
				orxBODY_JOINT_DEF_KU32_FLAG_SPRING = 4,
				orxBODY_JOINT_DEF_KU32_FLAG_ROPE = 8,
				orxBODY_JOINT_DEF_KU32_FLAG_PULLEY = #00000010,
				orxBODY_JOINT_DEF_KU32_FLAG_SUSPENSION = #00000020,
				orxBODY_JOINT_DEF_KU32_FLAG_WELD = #00000040,
				orxBODY_JOINT_DEF_KU32_FLAG_FRICTION = #00000080,
				orxBODY_JOINT_DEF_KU32_FLAG_GEAR = #00000100,
				orxBODY_JOINT_DEF_KU32_MASK_TYPE = #00000FFF,
				orxBODY_JOINT_DEF_KU32_FLAG_COLLIDE = #10000000,
				orxBODY_JOINT_DEF_KU32_FLAG_ROTATION_LIMIT = #20000000,
				orxBODY_JOINT_DEF_KU32_FLAG_MOTOR = #40000000,
				orxBODY_JOINT_DEF_KU32_FLAG_TRANSLATION_LIMIT = #80000000,
				orxBODY_JOINT_DEF_KU32_MASK_ALL = #FFFFFFFF,
				orxBODY_PART_DEF_KU32_MESH_VERTEX_NUMBER = 8
				
public constant ORXBODY_DEF_VPOSITION = 0,
				ORXBODY_DEF_FROTATION = 4,
				ORXBODY_DEF_FINERTIA = 8,
				ORXBODY_DEF_FMASS = 12,
				ORXBODY_DEF_FLINEARDAMPING = 16,
				ORXBODY_DEF_FANGULARDAMPING = 20,
				ORXBODY_DEF_U32FLAGS = 24,
				SIZEOF_ORXBODY_DEF = 28,
				$
				
public constant ORXBODY_PART_DEF_VSCALE = 0,
				ORXBODY_PART_DEF_FFRICTION = 4,
				ORXBODY_PART_DEF_FRESTITUTION = 8,
				ORXBODY_PART_DEF_FDENSITY = 12,
				ORXBODY_PART_DEF_U16SELFFLAGS = 16,
				ORXBODY_PART_DEF_U16CHECKMASK = 20,
				ORXBODY_PART_DEF_U32FLAGS = 24,
				--UNION ST SPHERE
				ORXBODY_PART_DEF_VCENTER = 28,
				ORXBODY_PART_DEF_FRADIUS = 28,
				--STBOX (ORXAABOX)
				ORXBODY_PART_DEF_STAABOX = 28,
				--STMESH
				ORXBODY_PART_DEF_U32VERTEXCOUNT = 28,
				ORXBODY_PART_DEF_AVVERTICES = 28, --[orxBODY_PART_DEF_KU2_MESH_VERTEX_NUMBER]
				--STEDGE
				ORXBODY_PART_DEF_AVVERTICES_ = 28,
				ORXBODY_PART_DEF_AVVERTICES_2 = 28, --ARRAY OF 2
				ORXBODY_PART_DEF_VNEXT = 28,
				ORXBODY_PART_DEF_BHASPREVIOUS = 28,
				ORXBODY_PART_DEF_BHASNEXT = 28,
				--STCHAIN
				ORXBODY_PART_DEF_VPREVIOUS = 28,
				ORXBODY_PART_DEF_VNEXT_ = 28,
				ORXBODY_PART_DEF_AVVERTICES_P = 28, --VECTOR POINTER
				ORXBODY_PART_DEF_BISLOOP = 28,
				ORXBODY_PART_DEF_BHASPREVIOUS_ = 28,
				ORXBODY_PART_DEF_BHASNEXT_ = 28,
				SIZEOF_ORXBODY_PART_DEF = 32,
				$
				
public constant ORXBODY_JOINT_DEF_VSRCSCALE = 0,
				ORXBODY_JOINT_DEF_VDSTSCALE = 4,
				ORXBODY_JOINT_DEF_VSRCANCHOR = 8,
				ORXBODY_JOINT_DEF_VDSTANCHOR = 12,
				--UNION 
				ORXBODY_JOINT_DEF_FDEFAULTROTATION = 16,
				ORXBODY_JOINT_DEF_FMINROTATION = 16,
				ORXBODY_JOINT_DEF_FMAXROTATION = 16,
				ORXBODY_JOINT_DEF_FMOTORSPEED = 16,
				ORXBODY_JOINT_DEF_FMAXMOTORTORQUE = 16,
				--STREVOLUTE
				ORXBODY_JOINT_DEF_VTRANSLATIONAXIS = 16,
				--ORXBODY_JOINT_DEF_FDEFAULTROTATION = 16,
				ORXBODY_JOINT_DEF_FMINTRANSLATION = 16,
				ORXBODY_JOINT_DEF_FMAXTRANSLATION = 16,
			--	ORXBODY_JOINT_DEF_FMOTORSPEED = 16,
				ORXBODY_JOINT_DEF_FMAXMOTORFORCE = 16,
				--STPRISMATIC
				ORXBODY_JOINT_DEF_FLENGTH = 16,
				ORXBODY_JOINT_DEF_FREQUENCY = 16,
				ORXBODY_JOINT_DEF_FDAMPING = 16,
				--STSPRING
				--ORXBODY_JOINT_DEF_FLENGTH = 16,
				--STROPE
				ORXBODY_JOINT_DEF_VSRCGROUNDANCHOR = 16,
				ORXBODY_JOINT_DEF_VDSTGROUNDANCHOR = 16,
				ORXBODY_JOINT_DEF_FLENGTHRATIO = 16,
				ORXBODY_JOINT_DEF_FSRCLENGTH = 16,
				ORXBODY_JOINT_DEF_FMAXSRCLENGTH = 16,
				ORXBODY_JOINT_DEF_DSTLENGTH = 16,
				ORXBODY_JOINT_DEF_FMAXDSTLENGTH = 16,
				--STPULLEY
				--ORXBODY_JOINT_DEF_VTRANSLATIONAXIS = 16,
				ORXBODY_JOINT_DEF_FFREQUENCY = 16,
				--ORXBODY_JOINT_DEF_FDAMPING = 16,
				--ORXBODY_JOINT_DEF_FMOTORSPEED = 16,
				--ORXBODY_JOINT_DEF_FMAXMOTORFORCE = 16,
				--STSUSPENSION
				ORXBODY_JOINT_DEF_FDEFAULTROATION = 16,
				--STWELD
				ORXBODY_JOINT_DEF_FMAXFORCE = 16,
				ORXBODY_JOINT_DEF_FMAXTORQUE = 16,
				--STFRICTION
				ORXBODY_JOINT_DEF_ZSRCJOINTNAME = 16,
				ORXBODY_JOINT_DEF_ZDSTJOINTNAME = 16,
				ORXBODY_JOINT_DEF_FJOINTRATIO = 16,
				--STGEAR
				SIZEOF_ORXBODY_JOINT_DEF = 20,
				$
				
public enum type orxPHYSICS_EVENT

 orxPHYSICS_EVENT_CONTACT_ADD = 0,
 orxPHYSICS_EVENT_CONTACT_REMOVE,
 orxPHYSICS_EVENT_NUMBER,
 orxPHYSICS_EVENT_NONE = 0xFFFFFFFF -- orxENUM_NONE
	
end type

public constant ORXPHYSICS_EVENT_PAYLOAD_VPOSITION = 0,
				ORXPHYSICS_EVENT_PAYLOAD_VNORMAL = 4,
				ORXPHYSICS_EVENT_PAYLOAD_ZSENDERPARTNAME = 8,
				ORXPHYSICS_EVENT_PAYLOAD_ZRECIPIENTPARTNAME = 12,
				SIZEOF_ORXPHYSICS_EVENT_PAYLOAD = 16,
				$
				
public constant orxPHYSICS_KZ_CONFIG_SECTION = "Physics",
				 orxPHYSICS_KZ_CONFIG_GRAVITY = "Gravity",
				 orxPHYSICS_KZ_CONFIG_ALLOW_SLEEP = "AllowSleep",
				 orxPHYSICS_KZ_CONFIG_ITERATIONS = "IterationsPerStep",
				 orxPHYSICS_KZ_CONFIG_RATIO  = "DimensionRatio",
				 orxPHYSICS_KZ_CONFIG_STEP_FREQUENCY = "StepFrequency",
				 orxPHYSICS_KZ_CONFIG_SHOW_DEBUG  = "ShowDebug",
				 orxPHYSICS_KZ_CONFIG_COLLISION_FLAG_LIST  = "CollisionFlagList",
				 orxPHYSICS_KZ_CONFIG_INTERPOLATE = "Interpolate"
				 
public constant xorxPhysics_Setup = orxDefine("orxPhysics_Setup",{}),
				xorxPhysics_GetCollisionFlagName = orxDefine("orxPhysics_GetCollisionFlagName",{C_UINT},C_STRING),
				xorxPhysics_GetCollisionFlagValue = orxDefine("orxPhysics_GetCollisionFlagValue",{C_STRING},C_UINT)
				
public procedure orxPhysics_Setup()

 orxProc(xorxPhysics_Setup,{})
	
end procedure

public function orxPhysics_GetCollisionFlagName(atom _u32Flag)

 return orxFunc(xorxPhysics_GetCollisionFlagName,{_u32Flag})
	
end function

public function orxPhysics_GetCollisionFlagValue(object _zFlag)

 return orxFunc(xorxPhysics_GetCollisionFlagValue,{_zFlag})
	
end function

public constant xorxPhysics_Init = orxDefine("orxPhysics_Init",{},C_INT),
				xorxPhysics_Exit = orxDefine("orxPhysics_Exit",{})
				
public function orxPhysics_Init()

 return orxFunc(xorxPhysics_Init,{})
	
end function

public procedure orxPhysics_Exit()

 orxProc(xorxPhysics_Exit,{})
	
end procedure

public constant xorxPhysics_SetGravity = orxDefine("orxPhysics_SetGravity",{C_POINTER},C_INT),
				xorxPhysics_GetGravity = orxDefine("orxPhysics_GetGravity",{C_POINTER},C_POINTER)
				
public function orxPhysics_SetGravity(object _pvGravity)

 _pvGravity = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxPhysics_SetGravity,{_pvGravity})
	
end function

public function orxPhysics_GetGravity(object _pvGravity)

 _pvGravity = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxPhysics_GetGravity,{_pvGravity})
	
end function

public constant xorxPhysics_CreateBody = orxDefine("orxPhysics_CreateBody",{C_POINTER,C_POINTER},C_POINTER),
				xorxPhysics_DeleteBody = orxDefine("orxPhysics_DeleteBody",{C_POINTER}),
				xorxPhysics_CreatePart = orxDefine("orxPhysics_CreatePart",{C_POINTER,C_POINTER,C_POINTER},C_POINTER),
				xorxPhysics_DeletePart = orxDefine("orxPhysics_DeletePart",{C_POINTER})
				
public function orxPhysics_CreateBody(object _hUserData,object _BodyDef)

 _BodyDef = allocate_data(SIZEOF_ORXBODY_DEF)
 
 return orxFunc(xorxPhysics_CreateBody,{_BodyDef})
	
end function

public procedure orxPhysics_Delete(object _pstBody)

 orxProc(xorxPhysics_Delete,{_pstBody})
	
end procedure

public function orxPhysics_CreatePart(object _pstBody,object _hUserData,object _BodyPartDef)

 _BodyPartDef = allocate_data(SIZEOF_ORXBODY_PART_DEF)
 
 return orxFunc(xorxPhysics_CreatePart,{_pstBody,_hUserData,_BodyPartDef})
	
end function

public procedure orxPhysics_DeletePart(object _pstBodyPart)

 orxProc(xorxPhysics_DeletePart,{_pstBodyPart})
	
end procedure

public constant xorxPhysics_CreateJoint = orxDefine("orxPhysics_CreateJoint",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_POINTER)

public function orxPhysics_CreateJoint(object _pstSrcBody,object _pstDstBody,object _hUserData,object _pstBodyJointDef)

 _pstBodyJointDef = allocate_data(SIZEOF_ORXBODY_JOINT_DEF)
 
 return orxFunc(xorxPhysics_CreateJoint,{_pstSrcBody,_pstDstBody,_hUserData,_pstBodyJointDef})
	
end function

public constant xorxPhysics_DeleteJoint = orxDefine("orxPhysics_DeleteJoint",{C_POINTER})

public procedure orxPhysics_DeleteJoint(object _pstBodyJoint)

 orxProc(xorxPhysics_DeleteJoint,{_pstBodyJoint})
	
end procedure

public constant xorxPhysics_SetPosition = orxDefine("orxPhysics_SetPosition",{C_POINTER,C_POINTER},C_INT),
				xorxPhysics_SetRotation = orxDefine("orxPhysics_SetRotation",{C_POINTER,C_FLOAT},C_INT),
				xorxPhysics_SetSpeed = orxDefine("orxPhysics_SetSpeed",{C_POINTER,C_POINTER},C_INT),
				xorxPhysics_SetAngularVelocity = orxDefine("orxPhysics_SetAngularVelocity",{C_POINTER,C_FLOAT},C_INT),
				xorxPhysics_SetCustomGravity = orxDefine("orxPhysics_SetCustomGravity",{C_POINTER,C_POINTER},C_INT),
				xorxPhysics_SetFixedRotation = orxDefine("orxPhysics_SetFixedRotation",{C_POINTER,C_BOOL},C_INT),
				xorxPhysics_SetDynamic = orxDefine("orxPhysics_SetDynamic",{C_POINTER,C_BOOL},C_INT),
				xorxPhysics_SetAllowMoving = orxDefine("orxPhysics_SetAllowMoving",{C_POINTER,C_BOOL},C_INT),
				xorxPhysics_GetPosition = orxDefine("orxPhysics_GetPosition",{C_POINTER,C_POINTER},C_POINTER),
				xorxPhysics_GetRotation = orxDefine("orxPhysics_GetRotation",{C_POINTER},C_FLOAT),
				xorxPhysics_GetSpeed = orxDefine("orxPhysics_GetSpeed",{C_POINTER,C_POINTER},C_POINTER)
				
public function orxPhysics_SetPosition(object _pstBody,object _pvPosition)

 _pvPosition = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxPhysics_SetPosition,{_pstBody,_pvPosition})
	
end function

public function orxPhysics_SetRotation(object _pstBody,atom _fRot)

 return orxFunc(xorxPhysics_SetRotation,{_pstBody,_fRot})
	
end function

public function orxPhysics_SetSpeed(object _pstBody,object _pvSpd)

 _pvSpd = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxPhysics_SetSpeed,{_pstBody,_pvSpd})
	
end function

public function orxPhysics_SetAngularVelocity(object _pstBody,atom _fVel)

 return orxFunc(xorxPhysics_SetAngularVelocity,{_pstBody,_fVel})
	
end function

public function orxPhysics_SetCustomGravity(object _pstBody,object _pvCusGrav)

 _pvCusGrav = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxPhysics_SetCustomGravity,{_pstBody,_pvCusGrav})
	
end function

public function orxPhysics_SetFixedRotation(object _pstBody,atom _bFixed)

 return orxFunc(xorxPhysics_SetFixedRotation,{_pstBody,_bFixed})
	
end function

public function orxPhysics_SetDynamic(object _pstBody,atom _bDynamic)

 return orxFunc(xorxPhysics_SetDynamic,{_pstBody,_bDynamic})
	
end function

public function orxPhysics_SetAllowMoving(object _pstBody,atom _bAllow)

 return orxFunc(xorxPhysics_SetAllowMoving,{_pstBody,_bAllow})
	
end function

public function orxPhysics_GetPosition(object _pstBody,object _pvPos)

 _pvPos = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxPhysics_GetPosition,{_pstBody,_pvPos})
	
end function

public function orxPhysics_GetRotation(object _pstBody)

 return orxFunc(xorxPhysics_GetRotation,{_pstBody})
	
end function

public function orxPhysics_GetSpeed(object _pstBody,object _pvSpd)

 _pvSpd = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxPhysics_GetSpeed,{_pstBody,_pvSpd})
	
end function

public constant xorxPhysics_GetSpeedAtWorldPosition = orxDefine("orxPhysics_GetSpeedAtWorldPosition",{C_POINTER,C_POINTER,C_POINTER},C_POINTER),
				xorxPhysics_GetAngularVelocity = orxDefine("orxPhysics_GetAngularVelocity",{C_POINTER},C_FLOAT),
				xorxPhysics_GetCustomGravity = orxDefine("orxPhysics_GetCustomGravity",{C_POINTER,C_POINTER},C_POINTER),
				xorxPhysics_IsFixedRotation = orxDefine("orxPhysics_IsFixedRotation",{C_POINTER},C_BOOL),
				xorxPhysics_GetMass = orxDefine("orxPhysics_GetMass",{C_POINTER},C_FLOAT),
				xorxPhysics_GetMassCenter = orxDefine("orxPhysics_GetMassCenter",{C_POINTER,C_POINTER},C_POINTER)
				
public function orxPhysics_GetSpeedAtWorldPosition(object _pstBody,object _pvPos,object _pvSpd)

 _pvPos = allocate_data(SIZEOF_ORXVECTOR)
 _pvSpd = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxPhysics_GetSpeedAtWorldPosition,{_pstBody,_pvPos,_pvSpd})
	
end function

public function orxPhysics_GetAngularVelocity(object _pstBody)

 return orxFunc(xorxPhysics_GetAngularVelocity,{_pstBody})
	
end function

public function orxPhysics_GetCustomGravity(object _pstBody,object _pvCusGrav)

 _pvCusGrav = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxPhysics_GetCustomGravity,{_pstBody,_pvCusGrav})
	
end function

public function orxPhysics_IsFixedRotation(object _pstBody)

 return orxFunc(xorxPhysics_IsFixedRotation,{_pstBody})
	
end function

public function orxPhysics_GetMass(object _pstBody)

 return orxFunc(xorxPhysics_GetMass,{_pstBody})
	
end function

public function orxPhysics_GetMassCenter(object _pstBody,object _pvMassCtr)

 _pvMassCtr = allocate_data(SIZEOF_ORXVECTOR)
  
return orxFunc(xorxPhysics_GetMassCenter,{_pstBody,_pvMassCtr})
	
end function

public constant xorxPhysics_SetLinearDamping = orxDefine("orxPhysics_SetLinearDamping",{C_POINTER,C_FLOAT},C_INT),
				xorxPhysics_SetAngularDamping = orxDefine("orxPhysics_SetAngularDamping",{C_POINTER,C_FLOAT},C_INT),
				xorxPhysics_GetLinearDamping = orxDefine("orxPhysics_GetLinearDamping",{C_POINTER},C_FLOAT),
				xorxPhysics_GetAngularDamping = orxDefine("orxPhysics_GetAngularDamping",{C_POINTER},C_FLOAT)
				
public function orxPhysics_SetLinearDamping(object _pstBody,atom _fDamp)

 return orxFunc(xorxPhysics_SetLinearDamping,{_pstBody,_fDamp})
	
end function

public function orxPhysics_SetAngularDamping(object _pstBody,atom _fDamp)

 return orxFunc(xorxPhysics_SetAngularDamping,{_pstBody,_fDamp})
	
end function

public function orxPhysics_GetLinearDamping(object _pstBody)

 return orxFunc(xorxPhysics_GetLinearDamping,{_pstBody})
	
end function

public function orxPhysics_GetAngularDamping(object _pstBody)

 return orxFunc(xorxPhysics_GetAngularDamping,{_pstBody})
	
end function

public constant xorxPhysics_ApplyTorque = orxDefine("orxPhysics_ApplyTorque",{C_POINTER,C_FLOAT},C_INT),
				xorxPhysics_ApplyForce = orxDefine("orxPhysics_ApplyForce",{C_POINTER,C_POINTER,C_POINTER},C_INT),
				xorxPhysics_ApplyImpulse = orxDefine("orxPhysics_ApplyImpulse",{C_POINTER,C_POINTER,C_POINTER},C_INT)
				
public function orxPhysics_ApplyTorque(object _pstBody,atom _fTor)

 return orxFunc(xorxPhysics_ApplyTorque,{_pstBody,_fTor})
	
end function

public function orxPhysics_ApplyForce(object _pstBody,object _pvForce,object _pvPt)

 _pvForce = allocate_data(SIZEOF_ORXVECTOR)
 _pvPt = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxPhysics_ApplyForce,{_pstBody,_pvForce,_pvPt})
	
end function

public function orxPhysics_ApplyImpulse(object _pstBody,object _pvImp,object _pvPt)

 _pvImp = allocate_data(SIZEOF_ORXVECTOR)
 _pvPt = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxPhysics_ApplyImpulse,{_pstBody,_pvImp,_pvPt})
	
end function

public constant xorxPhysics_SetPartSelfFlags = orxDefine("orxPhysics_SetPartSelfFlags",{C_POINTER,C_UINT},C_INT),
				xorxPhysics_SetPartCheckMask = orxDefine("orxPhysics_SetPartCheckMask",{C_POINTER,C_UINT},C_INT),
				xorxPhysics_GetPartSelfFlags = orxDefine("orxPhysics_GetPartSelfFlags",{C_POINTER},C_UINT),
				xorxPhysics_GetPartCheckMask = orxDefine("orxPhysics_GetPartCheckMask",{C_POINTER},C_UINT),
				xorxPhysics_SetPartSolid = orxDefine("orxPhysics_SetPartSolid",{C_POINTER,C_BOOL},C_INT),
				xorxPhysics_IsPartSolid = orxDefine("orxPhysics_IsPartSolid",{C_POINTER},C_BOOL),
				xorxPhysics_SetPartFriction = orxDefine("orxPhysics_SetPartFriction",{C_POINTER,C_FLOAT},C_INT),
				xorxPhysics_GetPartFriction = orxDefine("orxPhysics_GetPartFriction",{C_POINTER},C_FLOAT),
				xorxPhysics_SetPartRestitution = orxDefine("orxPhysics_SetPartRestitution",{C_POINTER,C_FLOAT},C_INT),
				xorxPhysics_GetPartRestitution = orxDefine("orxPhysics_GetPartRestitution",{C_POINTER},C_FLOAT),
				xorxPhysics_SetPartDensity = orxDefine("orxPhysics_SetPartDensity",{C_POINTER,C_FLOAT},C_INT),
				xorxPhysics_GetPartDensity = orxDefine("orxPhysics_GetPartDensity",{C_POINTER},C_FLOAT)
				
public function orxPhysics_SetPartSelfFlags(object _pstBody,atom _Flags)

 return orxFunc(xorxPhysics_SetPartSelfFlags,{_pstBody,_Flags})
	
end function

public function orxPhysics_SetPartCheckMask(object _pstBody,atom _Mask)

 return orxFunc(xorxPhysics_SetPartCheckMask,{_pstBody,_Mask})
	
end function

public function orxPhysics_GetPartSelfFlags(object _pstBody)

 return orxFunc(xorxPhysics_GetPartSelfFlags,{_pstBody})
	
end function

public function orxPhysics_GetPartCheckMask(object _pstBody)

 return orxFunc(xorxPhysics_GetPartCheckMask,{_pstBody})
	
end function

public function orxPhysics_SetPartSolid(object _pstBody,atom _bSolid)

 return orxFunc(xorxPhysics_SetPartSolid,{_pstBody,_bSolid})
	
end function

public function orxPhysics_IsPartSolid(object _pstBody)

 return orxFunc(xorxPhysics_IsPartSolid,{_pstBody})
	
end function

public function orxPhysics_SetPartFriction(object _pstBody,atom _fFri)

 return orxFunc(xorxPhysics_SetPartFriction,{_pstBody,_fFri})
	
end function

public function orxPhysics_GetPartFriction(object _pstBody)

 return orxFunc(xorxPhysics_GetPartFriction,{_pstBody})
	
end function

public function orxPhysics_SetPartRestitution(object _pstBody,atom _fRes)

 return orxFunc(xorxPhysics_SetPartRestitution,{_pstBody,_fRes})
	
end function

public function orxPhysics_GetPartRestitution(object _pstBody)

 return orxFunc(xorxPhysics_GetPartRestitution,{_pstBody})
	
end function

public function orxPhysics_SetPartDensity(object _pstBody,atom _fDen)

 return orxFunc(xorxPhysics_SetPartDensity,{_pstBody,_fDen})
	
end function

public function orxPhysics_GetPartDensity(object _pstBody)

 return orxFunc(xorxPhysics_GetPartDensity,{_pstBody})
	
end function

public constant xorxPhysics_IsInsidePart = orxDefine("orxPhysics_IsInsidePart",{C_POINTER,C_POINTER},C_BOOL)

public function orxPhysics_IsInsidePart(object _pstBody,object _pvPos)

 _pvPos = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxPhysics_IsInsidePart,{_pstBody,_pvPos})
	
end function

public constant xorxPhysics_EnableMotor = orxDefine("orxPhysics_EnableMotor",{C_POINTER,C_BOOL}),
				xorxPhysics_SetJointMotorSpeed = orxDefine("orxPhysics_SetJointMotorSpeed",{C_POINTER,C_FLOAT}),
				xorxPhysics_SetJointMaxMotorTorque = orxDefine("orxPhysics_SetJointMaxMotorTorque",{C_POINTER,C_FLOAT})
				
public procedure orxPhysics_EnableMotor(object _pstJoint,atom _bEn)

 orxProc(xorxPhysics_EnableMotor,{_pstJoint,_bEn})
	
end procedure

public procedure orxPhysics_SetJointMotorSpeed(object _pstJoint,atom _fSpd)

 orxProc(xorxPhysics_SetJointMotorSpeed,{_pstJoint,_fSpd})
	
end procedure

public procedure orxPhysics_SetJointMaxMotorTorque(object _pstJoint,atom _fMaxTor)

 orxProc(xorxPhysics_SetJointMaxMotorTorque,{_pstJoint,_fMaxTor})
	
end procedure

public constant xorxPhysics_GetJointReactionForce = orxDefine("orxPhysics_GetJointReactionForce",{C_POINTER,C_POINTER},C_POINTER),
				xorxPhysics_GetJointReactionTorque = orxDefine("orxPhysics_GetJointReactionTorque",{C_POINTER},C_FLOAT)
				
public function orxPhysics_GetJointReactionForce(object _pstJoint,object _pvForce)

 _pvForce = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxPhysics_GetJointReactionForce,{_pvForce})
	
end function

public function orxPhysics_GetJointReactionTorque(object _pstJoint)

 return orxFunc(xorxPhysics_GetJointReactionTorque,{_pstJoint})
	
end function

public constant xorxPhysics_Raycast = orxDefine("orxPhysics_Raycast",{C_POINTER,C_POINTER,C_UINT,C_UINT,C_BOOL,C_POINTER,C_POINTER},C_POINTER)

public function orxPhysics_Raycast(object _pvBegin,object _pvEnd, atom _SelfFlags,atom _CheckMask,atom _bEarlyExit,object _pvContact,object _pvNorm)

 _pvBegin = allocate_data(SIZEOF_ORXVECTOR)
 _pvEnd = allocate_data(SIZEOF_ORXVECTOR)
 _pvContact = allocate_data(SIZEOF_ORXVECTOR)
 _pvNorm = allocate_data(SIZEOF_ORXVECTOR)
 
 return orxFunc(xorxPhysics_Raycast,{_pvBegin,_pvEnd,_SelfFlags,_CheckMask,_bEarlyExit,_pvContact,_pvNorm})
	
end function

public constant xorxPhysics_BoxPick = orxDefine("orxPhysics_BoxPick",{C_POINTER,C_UINT,C_UINT,C_POINTER,C_UINT},C_UINT)

public function orxPhysics_BoxPick(object _pstBox,atom _SelfFlags,atom _CheckMask,object _UserDataList,atom _u32Num)

 _pstBox = allocate_data(SIZEOF_ORXAABOX)
 
 return orxFunc(xorxPhysics_BoxPick,{_pstBox,_SelfFlags,_CheckMask,_UserDataList,_u32Num})
	
end function

public constant xorxPhysics_EnableSimulation = orxDefine("orxPhysics_EnableSimulation",{C_BOOL})

public procedure orxPhysics_EnableSimulation(atom _bEn)

 orxProc(xorxPhysics_EnableSimulation,{_bEn})
	
end procedure
­8.11