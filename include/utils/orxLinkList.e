
include std/machine.e
include "orxInclude.e"

public include "debug/orxDebug.e"

public constant ORXLINKLIST_NODE_PSTNEXT = 8,
				ORXLINKLIST_NODE_PSTPREVIOUS = 16,
				ORXLINKLIST_NODE_PSTLIST = 24,
				SIZEOF_ORXLINKLIST_NODE = 32

public constant ORXLINKLIST_PSTFIRST = 8,
				ORXLINKLIST_PSTLAST = 16,
				ORXLINKLIST_U32COUNT = 20,
				SIZEOF_ORXLINKLIST = 24

constant
	xorxLinkList_Clean     = orxDefine( "orxLinkList_Clean", {C_POINTER}, C_INT ),
	xorxLinkList_AddStart  = orxDefine( "orxLinkList_AddStart", {C_POINTER,C_POINTER}, C_INT ),
	xorxLinkList_AddEnd    = orxDefine( "orxLinkList_AddEnd", {C_POINTER,C_POINTER}, C_INT ),
	xorxLinkList_AddBefore = orxDefine( "orxLinkList_AddBefore", {C_POINTER,C_POINTER}, C_INT ),
	xorxLinkList_AddAfter  = orxDefine( "orxLinkList_AddAfter", {C_POINTER,C_POINTER}, C_INT ),
	xorxLinkList_Remove    = orxDefine( "orxLinkList_Remove", {C_POINTER}, C_INT )

public function orxLinkList_Clean( object _List )

	_List = allocate_data( SIZEOF_ORXLINKLIST )

	return orxFunc( xorxLinkList_Clean, {_List} )
end function


public function orxLinkList_AddStart( object _List, object _Node )

	_List = allocate_data( SIZEOF_ORXLINKLIST )
	_Node = allocate_data( SIZEOF_ORXLINKLIST_NODE )

	return orxFunc( xorxLinkList_AddStart, {_List,_Node} )
end function

public function orxLinkList_AddEnd( object _List, object _Node )

	_List = allocate_data( SIZEOF_ORXLINKLIST )
	_Node = allocate_data( SIZEOF_ORXLINKLIST_NODE )

	return orxFunc( xorxLinkList_AddEnd, {_List,_Node} )
end function

public function orxLinkList_AddBefore( object RefNode, object Node )

 RefNode = allocate_data( SIZEOF_ORXLINKLIST_NODE )
 Node = allocate_data( SIZEOF_ORXLINKLIST_NODE )

	return orxFunc( xorxLinkList_AddBefore, {RefNode,Node} )
end function

public function orxLinkList_AddAfter( object RefNode, object Node )

 RefNode = allocate_data( SIZEOF_ORXLINKLIST_NODE )
 Node = allocate_data( SIZEOF_ORXLINKLIST_NODE )

	return orxFunc( xorxLinkList_AddAfter, {RefNode,Node} )
end function

public function orxLinkList_Remove( object Node )

 Node = allocate_data( SIZEOF_ORXLINKLIST_NODE )

	return orxFunc( xorxLinkList_Remove, {Node} )
end function
­70.43