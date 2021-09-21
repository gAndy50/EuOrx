include "orxInclude.e"

include "debug/orxDebug.e"

public constant ORXTREE_NODE_PSTPARENT = 8,
				ORXTREE_NODE_PSTCHILD = 16,
				ORXTREE_NODE_PSTSIBLING = 24,
				ORXTREE_NODE_PSTPREVIOUS = 32,
				ORXTREE_NODE_PSTTREE = 40,
				SIZEOF_ORXTREE_NODE = 48
				
public constant ORXTREE_PSTROOT = 8,
				ORXTREE_U32COUNT = 12,
				SIZEOF_ORXTREE = 16
				
public constant xorxTree_Clean = orxDefine("orxTree_Clean",{C_POINTER},C_INT),
				xorxTree_AddRoot = orxDefine("orxTree_AddRoot",{C_POINTER,C_POINTER},C_INT),
				xorxTree_AddParent = orxDefine("orxTree_AddParent",{C_POINTER,C_POINTER},C_INT),
				xorxTree_AddSibling = orxDefine("orxTree_AddSibling",{C_POINTER,C_POINTER},C_INT),
				xorxTree_AddChild = orxDefine("orxTree_AddChild",{C_POINTER,C_POINTER},C_INT),
				xorxTree_MoveAsChild = orxDefine("orxTree_MoveAsChild",{C_POINTER,C_POINTER},C_INT),
				xorxTree_Remove = orxDefine("orxTree_Remove",{C_POINTER},C_INT)
				
public function orxTree_Clean(object Tree)

 Tree = allocate_data(SIZEOF_ORXTREE)

 return orxFunc(xorxTree_Clean,{Tree})
	
end function

public function orxTree_AddRoot(object Tree,object Node)

 Tree = allocate_data(SIZEOF_ORXTREE)
 Node = allocate_data(SIZEOF_ORXTREE_NODE)
 
 return orxFunc(xorxTree_AddRoot,{Tree,Node})
	
end function

public function orxTree_AddParent(object RefNode,object Node)

 RefNode = allocate_data(SIZEOF_ORXTREE_NODE)
 Node = allocate_data(SIZEOF_ORXTREE_NODE)
 
 return orxFunc(xorxTree_AddParent,{RefNode,Node})
	
end function

public function orxTree_AddSibling(object RefNode,object Node)

 RefNode = allocate_data(SIZEOF_ORXTREE_NODE)
 Node = allocate_data(SIZEOF_ORXTREE_NODE)
 
 return orxFunc(xorxTree_AddSibling,{RefNode,Node})
	
end function

public function orxTree_AddChild(object RefNode,object Node)

 RefNode = allocate_data(SIZEOF_ORXTREE_NODE)
 Node = allocate_data(SIZEOF_ORXTREE_NODE)
 
 return orxFunc(xorxTree_AddChild,{RefNode,Node})
	
end function

public function orxTree_MoveAsChild(object RefNode,object Node)

 RefNode = allocate_data(SIZEOF_ORXTREE_NODE)
 Node = allocate_data(SIZEOF_ORXTREE_NODE)
 
 return orxFunc(xorxTree_MoveAsChild,{RefNode,Node})
	
end function

public function orxTree_Remove(object Node)

 Node = allocate_data(SIZEOF_ORXTREE_NODE)
 
 return orxFunc(xorxTree_Remove,{Node})
	
end function
­81.39