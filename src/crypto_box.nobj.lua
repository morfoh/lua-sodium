-- Copyright (c) 2013 by Christian Wiese <chris@opensde.org>
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.

--
-- Public-key authenticated encryption: crypto_box
--

--
-- typedefs
--
local typedefs = [[
]]
c_source "typedefs" (typedefs)
-- pass extra C type info to FFI.
ffi_cdef (typedefs)

--
-- Functions
--
c_function "box_publickeybytes" {
	var_out { "size_t", "publickeybytes" },
	c_source[[
  ${publickeybytes} = crypto_box_publickeybytes();
]],
}

c_function "box_secretkeybytes" {
	var_out { "size_t", "secretkeybytes" },
	c_source[[
  ${secretkeybytes} = crypto_box_secretkeybytes();
]],
}

c_function "box_beforenmbytes" {
	var_out { "size_t", "beforenmbytes" },
	c_source[[
  ${beforenmbytes} = crypto_box_beforenmbytes();
]],
}

c_function "box_noncebytes" {
	var_out { "size_t", "noncebytes" },
	c_source[[
  ${noncebytes} = crypto_box_noncebytes();
]],
}

c_function "box_zerobytes" {
	var_out { "size_t", "zerobytes" },
	c_source[[
  ${zerobytes} = crypto_box_zerobytes();
]],
}

c_function "box_boxzerobytes" {
	var_out { "size_t", "boxzerobytes" },
	c_source[[
  ${boxzerobytes} = crypto_box_boxzerobytes();
]],
}

c_function "box_macbytes" {
	var_out { "size_t", "macbytes" },
	c_source[[
  ${macbytes} = crypto_box_macbytes();
]],
}

c_function "box_primitive" {
	var_out { "const char *", "primitive" },
	c_source[[
  ${primitive} = crypto_box_primitive();
]],
}

object "crypto_box_publickey" {
	c_source [[
typedef unsigned char crypto_box_publickey;
]],
}

object "crypto_box_secretkey" {
	c_source [[
typedef unsigned char crypto_box_secretkey;
]],
}

-- int crypto_box_keypair(unsigned char *pk, unsigned char *sk);
c_function "box_keypair" {
	var_out { "crypto_box_publickey *", "pk" },
	var_out { "crypto_box_secretkey *", "sk" },
	c_source[[
  unsigned char tpk[crypto_box_publickeybytes()];
  unsigned char tsk[crypto_box_secretkeybytes()];

  crypto_box_keypair(tpk, tsk);

  ${pk} = tpk;
  ${sk} = tsk;
]],
}
