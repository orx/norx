import norx/typ

type
  orxPLUGIN_FUNCTION_BASE_ID_KEYBOARD* {.size: sizeof(cint).} = enum
    orxPLUGIN_FUNCTION_BASE_ID_KEYBOARD_INIT = 0,
    orxPLUGIN_FUNCTION_BASE_ID_KEYBOARD_EXIT,
    orxPLUGIN_FUNCTION_BASE_ID_KEYBOARD_IS_KEY_PRESSED,
    orxPLUGIN_FUNCTION_BASE_ID_KEYBOARD_GET_KEY_DISPLAY_NAME,
    orxPLUGIN_FUNCTION_BASE_ID_KEYBOARD_READ_KEY,
    orxPLUGIN_FUNCTION_BASE_ID_KEYBOARD_READ_STRING,
    orxPLUGIN_FUNCTION_BASE_ID_KEYBOARD_CLEAR_BUFFER,
    orxPLUGIN_FUNCTION_BASE_ID_KEYBOARD_SHOW,
    orxPLUGIN_FUNCTION_BASE_ID_KEYBOARD_NUMBER,
    orxPLUGIN_FUNCTION_BASE_ID_KEYBOARD_NONE = orxENUM_NONE