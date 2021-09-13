
include std/machine.e

public include "orxInclude.e"
public include "orxKernel.e"
public include "orxUtils.e"

public integer sbStopByEvent = orxFALSE

public function orx_DefaultEventHandler( atom _pstEvent )

	integer eResult = orxSTATUS_SUCCESS

	orxASSERT( orxEvent_GetType(_pstEvent) = orxEVENT_TYPE_SYSTEM )
	orxASSERT( orxEvent_GetID(_pstEvent) = orxSYSTEM_EVENT_CLOSE )

	sbStopByEvent = orxTRUE

	return eResult
end function

public function orx_MainSetup()

	orxModule_AddDependency( orxMODULE_ID_MAIN, orxMODULE_ID_OBJECT )
	orxModule_AddDependency( orxMODULE_ID_MAIN, orxMODULE_ID_RENDER )

	orxModule_AddOptionalDependency( orxMODULE_ID_MAIN, orxMODULE_ID_SCREENSHOT )

	return orxNULL
end function

public procedure orx_Execute( object _pfnInit, object _pfnRun, object _pfnExit, atom _u32NbParams=0, object _azParams=orxNULL, integer _ridInit=routine_id(_pfnInit), integer _ridRun=routine_id(_pfnRun), integer _ridExit=routine_id(_pfnExit) )

	if atom( _azParams ) then
		sequence cmd = command_line()
		{_azParams,_u32NbParams} = {cmd[2..$],length(cmd)-1}
	end if

	orxDEBUG_INIT()

	orxASSERT( _u32NbParams > 0 )
	orxASSERT( not equal(_azParams, orxNULL) )
	orxASSERT( not equal(_pfnRun, orxNULL) )

	orxModule_Register( orxMODULE_ID_MAIN, "MAIN", "orx_MainSetup", _pfnInit, _pfnExit, routine_id("orx_MainSetup"), _ridInit, _ridExit )

	if orxParam_SetArgs(_u32NbParams, _azParams) != orxSTATUS_FAILURE then

		if orxModule_Init(orxMODULE_ID_MAIN) != orxSTATUS_FAILURE then

			atom stPayload = allocate_data( SIZEOF_ORXSYSTEM_EVENT_PAYLOAD )
			integer eClockStatus, eMainStatus

			orxEvent_AddHandler( orxEVENT_TYPE_SYSTEM, "orx_DefaultEventHandler" )
			orxEvent_SetHandlerIDFlags( "orx_DefaultEventHandler", orxEVENT_TYPE_SYSTEM, orxNULL, orxEVENT_GET_FLAG(orxSYSTEM_EVENT_CLOSE), orxEVENT_KU32_MASK_ID_ALL )

			orxMemory_Zero( stPayload, SIZEOF_ORXSYSTEM_EVENT_PAYLOAD )

			loop do

				orxEVENT_SEND( orxEVENT_TYPE_SYSTEM, orxSYSTEM_EVENT_GAME_LOOP_START, orxNULL, orxNULL, stPayload )

				eMainStatus = call_func( _ridRun, {} )

				eClockStatus = orxClock_Update()

				orxEVENT_SEND( orxEVENT_TYPE_SYSTEM, orxSYSTEM_EVENT_GAME_LOOP_STOP, orxNULL, orxNULL, stPayload )

				atom u32FrameCount = peek4u( stPayload + orxSYSTEM_EVENT_PAYLOAD_u32FrameCount )
				poke4( stPayload + orxSYSTEM_EVENT_PAYLOAD_u32FrameCount, u32FrameCount+1 )

				until ((sbStopByEvent != orxFALSE) or (eMainStatus = orxSTATUS_FAILURE) or (eClockStatus = orxSTATUS_FAILURE))
			end loop

			orxEvent_RemoveHandler( orxEVENT_TYPE_SYSTEM, "orx_DefaultEventHandler" )

			orxModule_Exit( orxMODULE_ID_MAIN )
			free( stPayload )

		end if

	end if

	orxDEBUG_EXIT()

end procedure
