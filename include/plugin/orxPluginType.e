include "orxInclude.e"

public constant orxPLUGIN_KU32_FLAG_CORE_ID = 0x10000000
public constant orxPLUGIN_KU32_MASK_PLUGIN_ID = 0x0000FF00
public constant orxPLUGIN_KU32_SHIFT_PLUGIN_ID = 8
public constant orxPLUGIN_KU32_MASK_FUNCTION_ID = 0x000000FF
public constant orxPLUGIN_KU32_FUNCTION_ARG_SIZE = 128

public enum type ORX_PLUGIN_FUNCTION_ID

	orxPLUGIN_FUNCTION_ID_NONE = 0xFFFFFFF

end type
­11.39