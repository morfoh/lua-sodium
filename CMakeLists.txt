#
# Lua bindings for libsodium
#
cmake_minimum_required(VERSION 2.8)

project(lua-sodium C)

set(BUILD_SHARED_LIBS TRUE)

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

set(INSTALL_CMOD share/lua/cmod CACHE PATH "Directory to install Lua binary modules (configure lua via LUA_CPATH)")

set(COMMON_CFLAGS "${CFLAGS}")
set(COMMON_LDFLAGS)
set(COMMON_LIBS)

## Lua 5.1.x
include(FindLua51)
if(NOT ${LUA51_FOUND})
    message(FATAL_ERROR "The FindLua51 module could not find lua :-(")
endif()
set(COMMON_LIBS "${COMMON_LIBS};${LUA_LIBRARIES}")

## LibSodium
include(FindPkgConfig)
pkg_search_module(SODIUM REQUIRED libsodium)
set(COMMON_CFLAGS "${COMMON_CFLAGS} ${SODIUM_CFLAGS}")
set(COMMON_LDFLAGS "${COMMON_LDFLAGS} ${SODIUM_LDFLAGS}")
set(COMMON_LIBS "${COMMON_LIBS};${SODIUM_LIBRARIES}")

## LuaNativeObjects
include(LuaNativeObjects)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}
                    ${CMAKE_CURRENT_BINARY_DIR}
                    ${LUA_INCLUDE_DIR})

## LuaSodium
set(LUA_SODIUM_SRC
	sodium.nobj.lua
)

if(${USE_PRE_GENERATED_BINDINGS})
	set(LUA_SODIUM_SRC src/pre_generated-sodium.nobj.c)
else()
	# Generate Lua bindings.
	GenLuaNativeObjects(LUA_SODIUM_SRC)
endif()

add_library(lua-sodium MODULE ${LUA_SODIUM_SRC})
target_link_libraries(lua-sodium ${COMMON_LIBS})
set_target_properties(lua-sodium PROPERTIES PREFIX "")
set_target_properties(lua-sodium PROPERTIES COMPILE_FLAGS "${COMMON_CFLAGS}")
set_target_properties(lua-sodium PROPERTIES OUTPUT_NAME sodium)

install(TARGETS lua-sodium
        DESTINATION "${INSTALL_CMOD}")

