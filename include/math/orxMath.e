include "orxInclude.e"
include "debug/orxDebug.e"

public constant xorxMath_InitRandom = orxDefine("orxMath_InitRandom",{C_UINT}),
				xorxMath_GetRandomFloat = orxDefine("orxMath_GetRandomFloat",{C_FLOAT,C_FLOAT},C_FLOAT),
				xorxMath_GetSteppedRandomFloat = orxDefine("orxMath_GetSteppedRandomFloat",{C_FLOAT,C_FLOAT,C_FLOAT},C_FLOAT),
				xorxMath_GetRandomU32 = orxDefine("orxMath_GetRandomU32",{C_UINT,C_UINT},C_UINT),
				xorxMath_GetSteppedRandomU32 = orxDefine("orxMath_GetSteppedRandomU32",{C_UINT,C_UINt,C_UINT},C_UINT),
				xorxMath_GetRandomS32 = orxDefine("orxMath_GetRandomS32",{C_INT,C_INT},C_INT),
				xorxMath_GetSteppedRandomS32 = orxDefine("orxMath_GetSteppedRandomS32",{C_INT,C_INT,C_INT},C_INT),
				xorxMath_GetRandomU64 = orxDefine("orxMath_GetRandomU64",{C_LONG,C_LONG},C_LONG),
				xorxMath_GetSteppedRandomU64 = orxDefine("orxMath_GetSteppedRandomU64",{C_LONG,C_LONG,C_LONG},C_LONG),
				xorxMath_GetRandomS64 = orxDefine("orxMath_GetRandomS64",{C_LONG,C_LONG},C_LONG),
				xorxMath_GetSteppedRandomS64 = orxDefine("orxMath_GetSteppedRandomS64",{C_LONG,C_LONG,C_LONG},C_LONG),
				xorxMath_GetRandomSeeds = orxDefine("orxMath_GetRandomSeeds",{C_UINT,C_UINT,C_UINT,C_UINT}),
				xorxMath_SetRandomSeeds = orxDefine("orxMath_SetRandomSeeds",{C_UINT,C_UINT,C_UINT,C_UINT})
				
public procedure orxMath_InitRandom(atom _u32Seed)

 orxProc(xorxMath_InitRandom,{_u32Seed})
	
end procedure

public function orxMath_GetRandomFloat(atom _fMin,atom _fMax)

 return orxFunc(xorxMath_GetRandomFloat,{_fMin,_fMax})
	
end function

public function orxMath_GetSteppedRandomFloat(atom _fMin,atom _fMax,atom _fStep)

 return orxFunc(xorxMath_GetSteppedRandomFloat,{_fMin,_fMax,_fStep})
	
end function

public function orxMath_GetRandomU32(atom _u32Min,atom _u32Max)

 return orxFunc(xorxMath_GetRandomU32,{_u32Min,_u32Max})
	
end function

public function orxMath_GetSteppedRandomU32(atom _u32Min,atom _u32Max,atom _u32Step)

 return orxFunc(xorxMath_GetSteppedRandomU32,{_u32Min,_u32Max,_u32Step})
	
end function

public function orxMath_GetRandomS32(atom _s32Min,atom _s32Max)

 return orxFunc(xorxMath_GetRandomS32,{_s32Min,_s32Max})
	
end function

public function orxMath_GetSteppedRandomS32(atom _s32Min,atom _s32Max,atom _s32Step)

 return orxFunc(xorxMath_GetSteppedRandomS32,{_s32Min,_s32Max,_s32Step})
	
end function

public function orxMath_GetRandomU64(atom _u64Min,atom _u64Max)

 return orxFunc(xorxMath_GetRandomU64,{_u64Min,_u64Max})
	
end function

public function orxMath_GetSteppedRandomU64(atom _u64Min,atom _u64Max,atom _u64Step)

 return orxFunc(xorxMath_GetSteppedRandomU64,{_u64Min,_u64Max,_u64Step})
	
end function

public function orxMath_GetRandomS64(atom _s64Min,atom _s64Max)

 return orxFunc(xorxMath_GetRandomS64,{_s64Min,_s64Max})
	
end function

public function orxMath_GetSteppedRandomS64(atom _s64Min,atom _s64Max,atom _s64Step)

 return orxFunc(xorxMath_GetSteppedRandomS64,{_s64Min,_s64Max,_s64Step})
	
end function

public procedure orxMath_GetRandomSeeds(atom _au32Seeds1,atom _au32Seeds2,atom _au32Seeds3,atom _au32Seeds4)

 orxProc(xorxMath_GetRandomSeeds,{_au32Seeds1,_au32Seeds2,_au32Seeds3,_au32Seeds4})
	
end procedure

public procedure orxMath_SetRandomSeeds(atom _au32Seeds1,atom _au32Seeds2,atom _au32Seeds3,atom _au32Seeds4)

 orxProc(xorxMath_SetRandomSeeds,{_au32Seeds1,_au32Seeds2,_au32Seeds3,_au32Seeds4})
	
end procedure
­92.83