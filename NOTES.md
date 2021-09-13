# Notes

Some notes on wrapping Orx for Euphoria.

## Layout

### File structure

The structure of the [include](include/) and directory should match the original
structure of [Orx] as closely possible. Any Orx include files referenced should
be *publicly* included to match C's behavior.

[Orx]:[https://github.com/orx/orx/tree/master/code/include]

So given this line in the original Orx file:

    #include "math/orxVector.h"

The Euphoria wrapper should mirror that:

    public include "math/orxVector.e"

### Include files

The typical order of any include file should be:

1. local `include` statements (such as `std/math.e`)
2. public `include` statements (such as `math/orxVector.e`
3. local C function and variable definitions (see [`orxDefine()`](#orxDefine))
4. public constants, enumerators, enum types, and macro functions
5. public wrapper functions and procedures

## Wrapping

### Constants

Constants are typically declared in C as simple `#define` macros. Literal numbers
and strings can be copied directly, even hex values declared using `0x...` syntax.

### Macros

Some macros aren't constants but instead apply some transformation. These can
typically be wrapped as functions, unless they have side-effects the expect to
operate directly inline with other code.

### Types

It's unlikely any actual `typedef` types need to be wrapped in Euphoria unless
there are special bounds-checking required. Most proper type conversion occurs
when passing values to and from C routines. All types in wrapper functions can
be declared as Euphoria's base types: atom, sequence, or object.

### Enumerators

Euphoria's `enum` starts at *one* while C's `enum` starts at *zero*. Make sure
any enumerators have their first member explicitly declared with `= 0` if it is
not already.

Some enumerators also include a `typedef` in which case Euphoria's `enum type`
can be used. The actual `typedef` name is what *follows* the `enum` block. For
example:

    typedef enum __orxEVENT_TYPE_t
    {
      orxEVENT_TYPE_ANIM = 0,
      orxEVENT_TYPE_CLOCK,
      orxEVENT_TYPE_CONFIG,
      orxEVENT_TYPE_DISPLAY,
      ...
    } orxEVENT_TYPE;

Would be wrapped like this:

    public enum type orxEVENT_TYPE

        orxEVENT_TYPE_ANIM = 0,
        orxEVENT_TYPE_CLOCK,
        orxEVENT_TYPE_CONFIG,
        orxEVENT_TYPE_DISPLAY,
        ...

    end type -- orxEVENT_TYPE

Also note that `enum` types in C are *int* value so use `C_INT` for these.

### Structures

Any "opaque" structures (which are allocated and freed entirely by the library)
probably don't need to be wrapped. Only structures that need to have their member
values referenced directly need to be address.

When wrapping structures, declare each member as a constant of its offset in
bytes. It's good practice to make note of the type and size of each member in
comments to the write. Follow up with a "sizeof" constant representing the
entire structure size.

    public constant
        orxEVENT_eType      =  0, -- orxEVENT_TYPE (4)
        orxEVENT_eID        =  4, -- orxENUM       (4)
        orxEVENT_hSender    =  8, -- orxHANDLE     (8)
        orxEVENT_hRecipient = 16, -- orxHANDLE     (8)
        orxEVENT_pstPayload = 24, -- void*         (8)
        orxEVENT_pContext   = 32, -- void*         (8)
        SIZEOF_ORXEVENT     = 40

Some structures need to be adjusted in size to account for 32 and 64-bit member
sizes. Most often these are structures that contain pointer values. In this case,
wrap each structure separately in an `ifdef BITS64` block.

    ifdef BITS64 then
        /* 64-bit version */
    elsedef -- BITS32
        /* 32-bit version */
    end ifdef

### Routines

Most routines can be wrapped directly by defining their name and types and then
passing and returning values in-and-out. Additional steps must be taken when
sending strings or when having to pass values via memory address. Strings are
already handled by [`orxDefine()`](#orxDefine) which covered more in that section.

Here are a pair of Set/Get routines. At first glance they look nearly identical.
However, there is a subtle differences: the last two params of the Get routine
are labeled as "out" in the comments, and that function expects two pointers.

    /** Sets object repeat (wrap) values.
     * @param[in]   _pstObject      Concerned object
     * @param[in]   _fRepeatX       X-axis repeat value
     * @param[in]   _fRepeatY       Y-axis repeat value
     * @return      orxSTATUS_SUCCESS / orxSTATUS_FAILURE
     */
    extern orxDLLAPI orxSTATUS orxFASTCALL orxObject_SetRepeat(orxOBJECT *_pstObject, orxFLOAT _fRepeatX, orxFLOAT _fRepeatY);

    /** Gets object repeat (wrap) values.
     * @param[in]   _pstObject     Concerned object
     * @param[out]  _pfRepeatX      X-axis repeat value
     * @param[out]  _pfRepeatY      Y-axis repeat value
     * @return      orxSTATUS_SUCCESS / orxSTATUS_FAILURE
     */
    extern orxDLLAPI orxSTATUS orxFASTCALL orxObject_GetRepeat(const orxOBJECT *_pstObject, orxFLOAT *_pfRepeatX, orxFLOAT *_pfRepeatY);

Wrapping the Set routine is straight-forward, we just pass the values verbatim:

    constant xorxObject_SetRepeat = orxDefine( "orxObject_SetRepeat", {C_POINTER,C_FLOAT,C_FLOAT}, C_INT )

    public function orxObject_SetRepeat( atom _pstObject, atom _fRepeatX, atom _fRepeatY )
        return orxFunc( xorxObject_SetRepeat, {_pstObject,_fRepeatX,_fRepeatY} )
    end function

But wrapping the Get routine is entirely different! We skip the two "out" items
in our function parameters and instead we construct some memory to accept them,
and then pass the two pointers to where we want the values to go. Then we return
the values from memory if the the call was successful, or return the error code.

    constant xorxObject_GetRepeat = orxDefine( "orxObject_GetRepeat", {C_POINTER,C_POINTER,C_POINTER}, C_INT )

    public function orxObject_GetRepeat( atom _pstObject )

        -- we need memory for two floats, which will free automatically
        atom _pfBuffer = allocate_data( sizeof(C_FLOAT)*2, orxTRUE )

        -- get the offsets for each of the slots in memory
        atom _pfRepeatX = _pfBuffer + sizeof(C_FLOAT)*0
        atom _pfRepeatY = _pfBuffer + sizeof(C_FLOAT)*1

        -- call the function with the pointers to accept the values
        object eResult = orxFunc( xorxObject_GetRepeat, {_pstObject,_pfRepeatX,_pfRepeatY} )

        if eResult = orxSTATUS_SUCCESS then
            -- peek_float32() isn't a builtin routine,
            -- but it is declared in base/orxDecl.e
            eResult = peek_float32({ _pfBuffer, 2 })
        end if

        return eResult -- will be either {X,Y} or orxSTATUS_FAILURE
    end function

## Debugging

Orx provides a couple proprocessor flags to trigger debugging and profiling:
`__orxDEBUG__` and `__orxPROFILER__`. The wrappers in [orxDecl.e](include/base/orxDecl.e)
and [orxDebug.e](include/debug/orxDebug.e) will also use these flags if they
are present on the command line (`-D __orxDEBUG__`) or in your `eu.cfg` file.

Specifically, `__orxDEBUG__` will load the `orxd.dll` or `orxd.so` library and
trigger additional debugging and logging in [orxDebug.e](include/debug/orxDebug.e),
while `__orxPROFILER__` will load the `orxp.dll` or `orxp.so` library and only
trigger additional profiler information in [orxProfiler.e](include/debug/orxProfiler.e).

You can also use the `__orxVERBOSE__` flag to trigger verbose output from
[`orxDefine()`](#orxDefine) and [`orxCallback()`](#orxCallback). This can be
helpful to ensure library routines are being loaded and callbacks are set up
correctly.

## Reference Guide

Most of the "guts" of the wrapper live in [orxDecl.e](include/base/orxDecl.e).
This is where the shared library name is determed by platform, and where you
will find our custom functions for wrapping the Orx library. A lot of care has
been taken to ensure these functions account for maximum compatability with Orx.

* [`orxDefine()`](#orxDefine)
* [`orxCallback()`](#orxCallback)
* [`orxFunc()`](#orxFunc)
* [`orxProc()`](#orxProc)

### orxDefine()

    include "base/orxDecl.e"  
    public function orxDefine( sequence fname, object fargs=0, atom ftype=0 )

Locates a variable or routine in the Orx library and returns its ID (for
routines) or address (for variables). _**Note:** this routine will crash
your application if the named variable or routine cannot be found._

#### Variables

If `fargs` is an atom, then `fname` should be a valid C variable in the library.
In this case, the only valid option for `fargs` is `C_STRING`, in which case the
pointer to the variable will be dereferenced (with `peek_pointer()`) so that it
can safely be read with `peek_string()`. The value of `ftype` is always ignored.

#### Routines

If `fargs` is a sequence, then `fname` should be a valid C routine in the library.
In this case, `fargs` should be zero or more types such as `C_INT` or `C_POINTER`.
There is one special type, `C_STRING` which is referenced as `C_POINTER` but will
be used to automatically allocate and peek C string values passed to and from
[`orxFunc()`](#orxFunc) or [`orxProc()`](#orxProc).

#### Parameters

* `fname` : the name of the variable or routine to define
* `fargs` : the list of argument types for the routine
* `ftype` : the return type if the routine is a function

#### Returns

For variables, returns the address of the variable in memory. For routines, returns
the C routine ID for use with [`orxFunc()`](#orxFunc) or [`orxProc()`](#orxProc).

### orxCallback()

    include "base/orxDecl.e"  
    public function orxCallback( integer func, sequence name="" )

Sets up a Euphoria `call_back()` address for the provided routine ID. By default,
`call_back()` will return a *new* address each time it is called for the same
routine ID. Using `orxCallback()` works around this problem by only setting up
the address once and then storing the value in a lookup table for future calls.

#### Parameters

* `func` : the routine ID of the function
* `name` : the name of the routine (optional)

#### Returns

Always returns the same call back address for a given routine ID.

### orxFunc()

    include "base/orxDecl.e"  
    public function orxFunc( integer id, sequence pargs )

Calls a C routine with the given ID and returns the result. If any value in
`pargs` is a sequence and the parameter type was defined as `C_STRING` it will
be automatically allocated to memory and freed when the function call returns.

#### Parameters

* `id` : the C routine ID as returned from [`orxDefine()`](#orxDefine)
* `pargs` : a list of zero or more parameters passed to the function

#### Returns

Returns the value returned by the function call. If the return type was defined
as `C_STRING` then the value will be retrieved using `peek_string()`.

### orxProc()

    include "base/orxDecl.e"  
    public procedure orxProc( integer id, sequence pargs )

This is the same as [`orxFunc()`](#orxFunc) but the result of the function call
is ignored (it is assumed to be zero).

#### Parameters

* `id` : the C routine ID as returned from [`orxDefine()`](#orxDefine)
* `pargs` : a list of zero or more parameters passed to the function

