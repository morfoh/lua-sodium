#!/usr/bin/env lua

package	= 'lua-sodium'
version	= 'scm-0'
source	= {
	url	= 'https://github.com/morfoh/lua-sodium.git'
}
description	= {
	summary	= "Lua bindings for libsodium.",
	detailed	= 'lua-sodium provides Lua bindings for libsodium.',
	homepage	= 'https://github.com/morfoh/lua-sodium',
	license	= 'MIT',
	maintainer = "Christian Wiese",
}
dependencies = {
	'lua >= 5.1',
}
external_dependencies = {
	SODIUM = {
		header = "sodium.h",
		library = "sodium",
	}
}
build	= {
	type = "builtin",
	modules = {
		sodium = {
			sources = { "src/pre_generated-sodium.nobj.c" },
			libraries = { "sodium" },
		}
	}
}
