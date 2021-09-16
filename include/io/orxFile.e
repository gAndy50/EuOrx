include "orxInclude.e"

public constant orxFILE_KU32_FLAG_INFO_NORMAL = 0x00000001
public constant orxFILE_KU32_FLAG_INFO_READONLY = 0x00000002
public constant orxFILE_KU32_FLAG_INFO_HIDDEN = 0x00000004
public constant orxFILE_KU32_FLAG_INFO_DIRECTORY = 0x00000008
public constant orxFILE_KU32_FLAG_OPEN_READ = 0x10000000
public constant orxFILE_KU32_FLAG_OPEN_WRITE = 0x20000000
public constant orxFILE_KU32_FLAG_OPEN_APPEND = 0x40000000
public constant orxFILE_KU32_FLAG_OPEN_BINARY = 0x80000000 

public constant s64Size = 8, --orxS64
			    s64TimeStamp = 16, --orxS64
			    u32Flags = 20, --orxU32
			    hInternal = 24, --orxHANDLE
			    zName = 28, --orxCHAR
			    zPattern = 32, --orxCHAR
			    zPath = 36, --orxCHAR
			    zFullName = 40, --orxCHAR
			    SIZEOF_orxFILE_INFO = 44
			    
public constant xorxFile_Setup = orxDefine("orxFile_Setup",{}),
				xorxFile_Init = orxDefine("orxFile_Init",{},C_INT),
				xorxFile_Exit = orxDefine("orxFile_Exit",{}),
				xorxFile_GetHomeDirectory = orxDefine("orxFile_GetHomeDirectory",{C_STRING},C_STRING),
				xorxFile_GetApplicationSaveDirectory = orxDefine("orxFile_GetApplicationSaveDirectory",{C_STRING},C_STRING),
				xorxFile_Exists = orxDefine("orxFile_Exists",{C_STRING},C_BOOL),
				xorxFile_FindFirst = orxDefine("orxFile_FindFirst",{C_STRING,C_POINTER},C_INT),
				xorxFile_FindNext = orxDefine("orxFile_FindNext",{C_POINTER},C_INT),
				xorxFile_FindClose = orxDefine("orxFile_FindClose",{C_POINTER}),
				xorxFile_GetInfo = orxDefine("orxFile_GetInfo",{C_STRING,C_POINTER},C_INT),
				xorxFile_Remove = orxDefine("orxFile_Remove",{C_STRING},C_INT),
				xorxFile_MakeDirectory = orxDefine("orxFile_MakeDirectory",{C_STRING},C_INT),
				xorxFile_Open = orxDefine("orxFile_Open",{C_STRING,C_UINT},C_LONG),
				xorxFile_Read = orxDefine("orxFile_Read",{C_POINTER,C_LONG,C_LONG,C_POINTER},C_LONG),
				xorxFile_Write = orxDefine("orxFile_Write",{C_POINTER,C_LONG,C_LONG,C_POINTER},C_LONG),
				xorxFile_Delete = orxDefine("orxFile_Delete",{C_STRING},C_INT),
				xorxFile_Seek = orxDefine("orxFile_Seek",{C_POINTER,C_LONG,C_INT},C_LONG),
				xorxFile_Tell = orxDefine("orxFile_Tell",{C_POINTER},C_LONG),
				xorxFile_GetSize = orxDefine("orxFile_GetSize",{C_POINTER},C_LONG),
				xorxFile_GetTime = orxDefine("orxFile_GetTime",{C_POINTER},C_LONG),
				xorxFile_Print = orxDefine("orxFile_Print",{C_POINTER,C_STRING},C_INT),
				xorxFile_Close = orxDefine("orxFile_Close",{C_POINTER},C_INT)
				
public procedure orxFile_Setup()

 orxProc(xorxFile_Setup,{})
	
end procedure

public function orxFile_Init()

 return orxFunc(xorxFile_Init,{})
	
end function

public procedure orxFile_Exit()

 orxProc(xorxFile_Exit,{})
	
end procedure

public function orxFile_GetHomeDirectory(object _zSubPath)

 return orxFunc(xorxFile_GetHomeDirectory,{_zSubPath})
	
end function

public function orxFile_GetApplicationSaveDirectory(object _zSubPath)

 return orxFunc(xorxFile_GetApplicationSaveDirectory,{_zSubPath})
	
end function

public function orxFile_Exists(object _zFileName)

 return orxFunc(xorxFile_Exists,{_zFileName})
	
end function

public function orxFile_FindFirst(object _zSearchPattern,object _pstFileInfo)

 _pstFileInfo = allocate_data(SIZEOF_orxFILE_INFO)
 
 return orxFunc(xorxFile_FindFirst,{_zSearchPattern,_pstFileInfo})
	
end function

public function orxFile_FindNext(object _pstFileInfo)

 _pstFileInfo = allocate_data(SIZEOF_orxFILE_INFO)
 
 return orxFunc(xorxFile_FindNext,{_pstFileInfo})
	
end function

public function orxFile_FindClose(object _pstFileInfo)

 _pstFileInfo = allocate_data(SIZEOF_orxFILE_INFO)
 
 return orxFunc(xorxFile_FindClose,{_pstFileInfo})
	
end function

public function orxFile_GetInfo(object _zFileName,object _pstFileInfo)

 _pstFileInfo = allocate_data(SIZEOF_orxFILE_INFO)
 
 return orxFunc(xorxFile_GetInfo,{_zFileName,_pstFileInfo})
	
end function

public function orxFile_Remove(object _zFileName)

 return orxFunc(xorxFile_Remove,{_zFileName})
	
end function

public function orxFile_MakeDirectory(object _zName)

 return orxFunc(xorxFile_MakeDirectory,{_zName})
	
end function

public function orxFile_Open(object _zFileName,atom _u32OpenFlags)

 return orxFunc(xorxFile_Open,{_zFileName,_u32OpenFlags})
	
end function

public function orxFile_Read(object _pReadData, atom _s64ElemSize,atom _s64NbElem,object _pstFile)

 return orxFunc(xorxFile_Read,{_pReadData,_s64ElemSize,_s64NbElem,_pstFile})
	
end function

public function orxFile_Write(object _pDataToWrite,atom _s64ElemSize,atom _s64NbElem,object _pstFile)

 return orxFunc(xorxFile_Write,{_pDataToWrite,_s64ElemSize,_s64NbElem,_pstFile})
	
end function

public function orxFile_Delete(object _zFileName)

 return orxFunc(xorxFile_Delete,{_zFileName})
	
end function

public function orxFile_Seek(object _pstFile,atom _s64Position,atom _eWhence)

 return orxFunc(xorxFile_Seek,{_pstFile,_s64Position,_eWhence})
	
end function

public function orxFile_Tell(object _pstFile)

 return orxFunc(xorxFile_Tell,{_pstFile})
	
end function

public function orxFile_GetSize(object _pstFile)

 return orxFunc(xorxFile_GetSize,{_pstFile})
	
end function

public function orxFile_GetTime(object _pstFile)

 return orxFunc(xorxFile_GetTime,{_pstFile})
	
end function

public function orxFile_Print(object _pstFile,object _zString)

 return orxFile_Print,{_pstFile,_zString})
	
end function

public function orxFile_Close(object _pstFile)

 return orxFile_Close,{_pstFile})
	
end function
­181.33