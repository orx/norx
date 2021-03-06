import incl

##  Macro definition
##  Flags definitions

const
  orxPARAM_KU32_FLAG_NONE* = 0x00000000
  orxPARAM_KU32_FLAG_MULTIPLE_ALLOWED* = 0x00000001
  orxPARAM_KU32_FLAG_STOP_ON_ERROR* = 0x00000002

## * Callback definition (called when a parameter has been found
##  @param[in] _u32NbParam Number of extra parameters read for this option
##  @param[in] _azParams   Array of extra parameters (the first one is always the option name)
##  @return Returns orxSTATUS_SUCCESS if read information is correct, orxSTATUS_FAILURE if a problem occurred
##

type
  orxPARAM_INIT_FUNCTION* = proc (u32NbParam: orxU32; azParams: cstringArray): orxSTATUS {.
      cdecl.}

##  Parameter's info

type
  orxPARAM* {.bycopy.} = object
    u32Flags*: orxU32          ##  Flags associated to the parameters' parser
    ##  Short parameter name (ex: "h" for help (will be -h))
    zShortName*: cstring    ##  Long parameter name (ex: "help" for help (will be --help))
    zLongName*: cstring     ##  Short description (ex: "shows params' list")
    zShortDesc*: cstring ##  Long description (ex: "Display the list of parameters.
                          ##  -help <param> displays the <param> long description")
    zLongDesc*: cstring     ##  Function called when the parameter is detected in the command line
    pfnParser*: orxPARAM_INIT_FUNCTION


## * Setups param module
##

proc orxParam_Setup*() {.cdecl, importc: "orxParam_Setup", dynlib: libORX.}
## * Inits the param Module
##  @return orxSTATUS_SUCCESS / orxSTATUS_FAILURE
##

proc orxParam_Init*(): orxSTATUS {.cdecl, importc: "orxParam_Init",
                                dynlib: libORX.}
## * Exits from the param module
##

proc orxParam_Exit*() {.cdecl, importc: "orxParam_Exit", dynlib: libORX.}
## * Registers a new parameter
##  @param[in] _pstParam Information about the option to register
##  @return orxSTATUS_SUCCESS / orxSTATUS_FAILURE
##

proc orxParam_Register*(pstParam: ptr orxPARAM): orxSTATUS {.cdecl,
    importc: "orxParam_Register", dynlib: libORX.}
## * Displays help if requested
##  @return orxSTATUS_SUCCESS / orxSTATUS_FAILURE
##

proc orxParam_DisplayHelp*(): orxSTATUS {.cdecl, importc: "orxParam_DisplayHelp",
                                       dynlib: libORX.}
## * Sets the command line arguments
##  @param[in] _u32NbParams  Number of read parameters
##  @param[in] _azParams     List of parameters
##  @return orxSTATUS_SUCCESS / orxSTATUS_FAILURE
##

proc orxParam_SetArgs*(u32NbParams: orxU32; azParams: cstringArray): orxSTATUS {.
    cdecl, importc: "orxParam_SetArgs", dynlib: libORX.}
## * @}
