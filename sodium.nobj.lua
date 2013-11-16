-- make generated variable nicer
set_variable_format "%s"

c_module "sodium" {

-- enable FFI bindings support.
luajit_ffi = true,

-- load SYSFS shared library.
ffi_load"sodium",

sys_include "sodium.h",

subfiles {
"src/crypto_scalarmult.nobj.lua",
},
}

