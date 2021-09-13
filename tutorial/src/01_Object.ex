
include "orx.e"

function Init()

	orxLOG( "\n* This tutorial creates a viewport/camera couple and an object" &
			"\n* You can play with the config parameters in ../01_Object.ini" &
			"\n* After changing them, relaunch the tutorial to see their effects" )

	orxViewport_CreateFromConfig( "Viewport" )

	orxObject_CreateFromConfig( "Object" )

	return orxSTATUS_SUCCESS
end function

function Run()

	integer eResult = orxSTATUS_SUCCESS

	if orxInput_IsActive( "Quit" ) then

		eResult = orxSTATUS_FAILURE

	end if

	return eResult
end function

function Exit()

	return orxNULL
end function

procedure main()

	orx_Execute( "Init", "Run", "Exit" )

end procedure

main()
