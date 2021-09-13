# READ ME
To build Orx using a 32-bit DLL using the CDECL calling convention. 

Go to the orxDECL.h file. Look for "Windows" around line 249. A couple of lines down 254 you'll see "#define orxFASTCALL _fastcall."
Change the _fastcall to _cdecl and it will build the DLL using the CDECL calling convention. You can use your IDE to make the DLL either 32 or 64-bit. 
Make sure you have the entire Orx project loaded in your IDE so that it gets built correctly. 
