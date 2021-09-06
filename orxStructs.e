--Orx Structs converted to Eu
--letters or numbers after the name are to help with attempt to redefine variable name

include std/dll.e
--orxVector
--First Union
public constant fH = 0,
				fR = 0,
				fRho = 0,
				fX = 0,
				--Second Union
				fG = 4,
				fS = 4,
				fTheta = 4,
				fY = 4,
				--Third Union
				fB = 8,
				fL = 8,
				fPhi = 8,
				fV = 8,
				fZ = 8,
				SIZEOF_orxVECTOR = 12,
				$ 

public constant C_orxVECTOR = C_POINTER

--Clock_Info Struct
public constant fTickSize = 0,
				fDT = 4,
				fTime = 8,
				afModifierList = 12,
				SIZEOF_orxCLOCK_INFO = 16,
				$
				
public constant C_orxCLOCKINFO = C_POINTER

public constant zName = 0,
				eType = 1,
				SIZEOF_orxCOMMAND_VAR_DEF = 2,
				$
				
public constant C_orxCOMMAND_VAR_DEF = C_POINTER

public constant vValue = 4,
				zValue = 8,
				u32Value = 12,
				s32Value = 12,
				U64Value = 12,
				s64Value = 12,
				fValue = 12,
				bValue = 12,
				SIZE_OF_orxCOMMAND_VAR = 16,
				$
				
public constant C_orxCOMMAND_VAR = C_POINTER

--orxEvent Struct
public constant eType_0 = 0,
				eID = 1,
				hSender = 4,
				hRecipient = 8,
				pstPayload = 12,
				pContext = 16,
				SIZEOF_orxEVENT = 20,
				$

--orxLOCALE Event Payload				
public constant zLanguage = 0,
				zStringKey = 4,
				zStringValue = 8,
				SIZEOF_orxLOCALE_EVENT_PAYLOAD = 12,
				$

--Event Payload Struct				
public constant u32FrameCount = 0,
				dTime = 4,
				u32ID = 4,
				fX_0 = 4,fY_0 = 4, fPressure_0 = 4,
				dTime_0 = 8,
				vAcceleration = 8,
				azValueList = 12,
				u32Numer = 12,
				zValue_0 = 16,
				SIZEOF_EVENT_PAYLOAD = 20,
				$
				
--orxAnim Event Payload
public constant pstAnim = 0,
				zAnimName = 4,
				u32Count = 8,
				fTime_0 = 12,
				zName_0 = 16,
				fValue_0 = 20,
				fTime_1 = 24,
				SIZEOF_orxANIM_EVENT_PAYLOAD = 28,
				$

--orxAnim Custom Event
public constant zName_1 = 0,
				fValue_1 = 4,
				fTimeStamp = 8,
				SIZEOF_orxANIM_CUSTOM_EVENT = 12,
				$

--orxBody Def Struct				
public constant vPosition = 0,
				fRotation = 4,
				fInertia = 8,
				fMass = 12,
				fLinearDamping = 16,
				fAngularDamping = 20,
				u32Flags = 24,
				SIZEOF_orxBODY_DEF = 28,
				$
				
--orxBody Def Part Struct
public constant vScale = 0,
				fFriction = 4,
				fRestitution = 8,
				fDensity = 12,
				u16SelfFlags = 13,
				u16CheckMash = 14,
				u32Flags_0 = 15,
				--union
				vCenter = 19,
				fRadius = 19,
				stBox = 19,
				u32VertexCount = 19,
				avVertices = 19, --[orxBODY_PART_DEF_KU32_MESH_VERTEX_NUMBER]
				avVertices_2 = 19, --array of 2
				vPrevious = 19,
				vNext = 19,
				bHasPrevious = 19,
				bHasNext = 19,
				vPrevious_2 = 19,
				vNext_2 = 19,
				avVertices_3 = 19,
				u32VertexCount_2 = 19,
				bIsLoop = 19,
				bHasPrevious_2 = 19,
				bHasNext_2 = 19,
				SIZEOF_BODY_PART_DEF = 20,
				$

--orxBody Joint Def Struct
 public constant vSrcScale = 0,
				 vDstScale = 4,
				 vSrcAnchor = 8,
				 vDstAnchor = 12,
				 --union
				 fDefaultRotation = 16,
				 fMinRotation = 16,
				 fMaxRotation = 16,
				 fMotorSpeed = 16,
				 fMaxMotorTorque = 16,
				 --stRevolute^
				 vTranslationAxis = 16,
				 fDefaultRotation_0 = 16,
				 fMinTranslation = 16,
				 fMaxTranslation = 16,
				 fMotorSpeed_0 = 16,
				 fMaxMotorForce = 16,
				 --stPrismatic^
				 fLength = 16,
				 --stRope^
				 fFrequency = 16,
				 fDamping = 16,
				 fLength_0 = 16,
				 vSrcGroundAnchor = 16,
				 vDstGroundAnchor = 16,
				 fLengthRatio = 16,
				 fSrcLength = 16,
				 fMaxSrcLength = 16,
				 fDstLength = 16,
				 fMaxDstLength = 16,
				 --stPulley^
				 vTranslationAxis_0 = 16,
				 fFrequency_0 = 16,
				 fDamping_0 = 16,
				 fMotorSpeed_1 = 16,
				 fMaxMotorForce_1 = 16,
				 --stSuspension^
				 fDefaultRotation_1 = 16,
				 --stWeld^
				 fMaxForce_1 = 16,
				 fMaxTorque_1 = 16,
				 --stFriction^
				 zSrcJointName = 16,
				 zDstJointName = 16,
				 fJointRatio = 16,
				 --stGear^
				 u32Flags_2 = 17,
				 SIZEOF_JOINT_DEF = 18,
				 $

--orxPhysics Event Payload
public constant vPosition_2 = 0,
				vNormal_2 = 4,
				zSenderPartName = 8,
				zRecipientPartName = 12,
				SIZEOF_PHYSICS_EVENT_PAYLOAD = 16,
				$

--orxRGBA Struct
public constant u8R = 0,
				u8G = 1,
				u8B = 2,
				u8A = 3,
				SIZEOF_u32RGBA = 4,
				$
				
--orxDisplay Vertext Struct
public constant fX_1 = 0,
				fY_1 = 4,
				fU_1 = 8,
				fV_1 = 12,
				stRGBA = 13,
				SIZEOF_orxDISPLAY_VERTEX = 17,
				$
				
--orxDisplay Transform Struct
public constant fSrcX = 0,
				fSrcY = 4,
				fDstX = 8,
				fDstY = 12,
				fRepeatX = 16,
				fRepeatY = 20,
				fScaleX = 24,
				fScaleY = 28,
				fRotation_0 = 32,
				SIZEOF_orxDISPLAY_TRANSFORM = 36,
				$

--orxDisplay Mesh Struct				
public constant astVertextList = 0,
				au16IndexList = 4,
				u32VertexNumber = 5,
				u32IndexNumber = 6,
				ePrimititve = 7,
				SIZEOF_orxDISPLAY_MESH = 8,
				$

--orxDisplay Video Mode Struct				
public constant u32Width = 0,
				u32Height = 1,
				u32Depth = 2,
				u32RefreshRate = 3,
				bFullScreen = 4,
				SIZEOF_orxDISPLAY_VIDEO_MODE = 5,
				$

--orxCharacter Glyph Struct				
public constant fX_2 = 0,
				fY_2 = 4,
				fWidth = 8,
				SIZEOF_orxCHARACTER_GLYPH = 12,
				$
				
--orxCharacter Map Struct
public constant fCharacterHeight = 0,
				pstCharacterBank = 4,
				pstCharacterTable = 8,
				SIZEOF_orxCHARACTER_MAP = 12,
				$
				
--orxColor Struct
public constant vRGB = 0,
				vHSL = 4,
				vHSV = 8,
				fAlpha = 12,
				SIZEOF_orxCOLOR = 16,
				$
				
--orxDisplay Event Payload
public constant u32Width_0 = 0,
				u32Height_0 = 0,
				u32Depth_0 = 0,
				u32RefreshRate_0 = 0,
				u32PreviousWidth_0 = 0,
				u32PreviousHeight_0 = 0,
				u32PreviousDepth_0 = 0,
				u32PreviousRefreshRate_0 = 0,
				bFullScreen_0 = 0,
				zLocation_2 = 4,
				stFilenameID = 4,
				u32ID_2 = 4,
				SIZEOF_orxDISPLAY_EVENT_PAYLOAD = 8,
				$
				
--orxFile File Info Struct
public constant s64Size = 0,
				s64TimeStamp = 8,
				u32Flags_3 = 9,
				hInternal = 10,
				zName_3 = 11, --[256]
				zPattern_3 = 12, --[256]
				zPath_3 = 13, --[1024]
				zFullName_3 = 14, --[1280]
				SIZEOF_FILE_INFO = 15,
				$
			
--orxINPUT_EVENT_PAYLOAD	
public constant zSetName = 0,
				zInputName = 4,
				aeType = 5, --[orxINPUT_KU32_BINDING_NUMBER]
				aeID = 6, --[orxINPUT_KU32_BINDING_NUMNER]
				aeMode = 7, --[orxINPUT_KU32_BINDING_NUMBER]
				afValue = 11, --[orxINPUT_KU32_BIDING_NUMBER]
				SIZEOF_orxINPUT_EVENT_PAYLOAD = 12,
				$
				
--orxPARAM Struct
public constant u32Flags_4 = 0,
				zShortName = 4,
				zLongName = 8,
				zShortDesc = 12,
				zLongDesc = 16,
				pfnParser = 17,
				SIZEOF_orxPARAM = 18,
				$
				
--orxAABOX Struct
public constant vTL = 0,
				vBR = 4,
				SIZEOF_orxAABOX = 8,
				$
				
--orxOBOX Struct
public constant vPosition_4 = 0,
				vPivot = 4,
				vX = 8,
				vY = 12,
				vZ = 16,
				SIZEOF_orxOBOX = 20,
				$
				
--orxFX Event Payload Struct
public constant pstFX = 0,
				zFXName = 4,
				SIZEOF_orxFX_EVENT_PAYLOAD = 8,
				$
				
--orxSTRUCTURE Struct
public constant u64GUID = 0,
				u64OnwerGUID = 8,
				u32Flags_5 = 9,
				u32RefCount = 10,
				--union
				stLinkListNode = 14,
				stTreeNode = 14,
				SIZEOF_orxSTRUCTURE = 18,
				$
				
--orxTimeline Event Payload Struct
public constant pstTimeLine = 0,
				zTrackName = 4,
				zEvent = 8,
				fTimeStamp_3 = 12,
				SIZEOF_orxTIMELINE_EVENT_PAYLOAD = 16,
				$
				
--orxPlugin Core Function Struct
public constant eFunctionID = 0,
				pfnFunction = 4,
				pfnDefaultFunction = 8,
				SIZEOF_PLUGIN_CORE_FUNCTION = 12,
				$
				
--orxPlug User Function Info Struct
public constant eFunctionID_0 = 0,
				pfnFunction_0 = 4,
				zFunctionArgs = 8, --[orxPLUGIN_KU32_FUNCTION_ARG_SIZE]
				zFunctionName_4 = 12,
				SIZEOF_orxPLUGIN_USER_FUNCTION_INFO = 16,
				$
				
--orxRender Event Payload Struct
public constant pstTransform = 4,
				SIZEOF_orxRENDER_EVENT_PAYLOAD = 8,
				$
				
--orxShader Param Struct
public constant stNode = 0,
				zName_5 = 4,
				eType_5 = 5,
				u32ArraySize = 6,
				SIZEOF_orxSHADER_PARAM = 7,
				$ 
				
--orxShader Event Payload
public constant pstShader = 0,
				zShaderName = 4,
				zParamName = 8,
				eParamType = 9,
				s32ParamIndex = 10,
				--union
				fValue_5 = 14,
				pstValue = 14,
				vValue_5 = 14,
				SIZEOF_orxSHADER_EVENT_PAYLOAD = 18,
				$
				
--orxSound Stream Info Struct
public constant zName_s = 0,
				u32SampleRate = 1,
				u32ChannelNumber = 2,
				SIZEOF_orxSTREAM_INFO = 3,
				$
				
--orxsound Stream Packet Struct
public constant u32SampleNumber = 0,
				as16SampleList = 1,
				fTimeStamp_s = 4,
				fTime_s = 8,
				s32ID = 9,
				bDiscord = 10,
				bLast = 11,
				SIZEOF_orxSOUND_STREAM_PACKET = 12,
				$
				
--orxSound Event Payload Struct
public constant pstSound = 0,
				stInfo = 4,
				stPacket = 8,
				SIZEOF_orxSOUND_EVENT_PAYLOAD = 12,
				$
				
--orxLinklist Node Struct
public constant pstNext = 0,
				pstPrevious = 4,
				pstList = 8,
				SIZEOF_orxLINKLIST_NODE = 12,
				$
				
--orxLinkList Struct
public constant pstFirst = 0,
				pstLast = 4,
				u32Count_ll = 5,
				SIZEOF_orxLINKLIST = 6,
				$
				
--orxTree Node Struct
public constant pstParent = 0,
				pstChild = 4,
				pstSibling = 8,
				pstPrevious_t = 12,
				pstTree = 16,
				SIZEOF_orxTREE_NODE = 20,
				$
				
public constant pstRoot = 0,
				u32Count_tt = 1,
				SIZEOF_orxTREE = 2,
				$
­4.17