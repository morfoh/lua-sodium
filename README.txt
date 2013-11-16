lua-sodium - Lua bindings for libsodium
=======================================
:author: Christian Wiese

[WARNING]
The Lua bindings for `libsodium` provided here are in a very early stage of
development, thus do not use them in a production environment!

Build Dependencies
------------------

Besides having a working compiler toolchain available you will need:

- cmake
- libsodium

Installing
----------

=== Install from git

.Clone the git repository
-----------------------------------------------------------------------------
git clone git://github.com/morfoh/lua-sodium.git
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
cd lua-sodium
-----------------------------------------------------------------------------

.Prepare a dedicated build directory
-----------------------------------------------------------------------------
mkdir build
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
cd build
-----------------------------------------------------------------------------

.Generate Makefiles and related build infrastructure
-----------------------------------------------------------------------------
cmake ../
-----------------------------------------------------------------------------

.Alternatively you can specify the path where to install the module
-----------------------------------------------------------------------------
cmake ../ -DINSTALL_CMOD=/usr/local/lib/lua/5.1
-----------------------------------------------------------------------------

.Compile the module
-----------------------------------------------------------------------------
make
-----------------------------------------------------------------------------

.Install the module
-----------------------------------------------------------------------------
sudo make install
-----------------------------------------------------------------------------


=== Install using lua-rocks

-----------------------------------------------------------------------------
curl -O "https://github.com/morfoh/lua-sodium/raw/master/lua-sodium-scm-0.rockspec"
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
luarocks install lua-sodium-scm-0.rockspec
-----------------------------------------------------------------------------


Development
-----------

=== Re-generating the bindings

By default CMake will use the pre-generated bindings that are include in the
project.

To be able to re-generate the bindings, you will need to install
https://github.com/Neopallium/LuaNativeObjects[LuaNativeObjects] and set the
CMake variable `USE_PRE_GENERATED_BINDINGS` to `FALSE`.

-----------------------------------------------------------------------------
cmake ../ -DUSE_PRE_GENERATED_BINDINGS=FALSE
-----------------------------------------------------------------------------

Mandantory for re-generating Lua bindings from `*.nobj.lua` files:

* https://github.com/Neopallium/LuaNativeObjects[LuaNativeObjects], this is the
  bindings generator used to convert the `*.nobj.lua` files into a native Lua
  module.

Optional for re-generating documentation

* https://github.com/keplerproject/luadoc[luadoc]

To not re-generate documentation by luadocs when re-generating the bindings
you have to to set the CMake variable `GENERATE_LUADOCS` to `FALSE`.
-----------------------------------------------------------------------------
cmake ../ -DUSE_PRE_GENERATED_BINDINGS=FALSE -DGENERATE_LUADOCS=FALSE
-----------------------------------------------------------------------------

Implementation status
---------------------

=== Scalar multiplication

[IMPORTANT]
Currently only http://cr.yp.to/ecdh.html[curve25519] is supported as it is
the default used in libsodium!

==== crypto_scalarmult_curve25519

[options="header"]
|============================================================================
|Function			|Status

|scalarmult_bytes		|DONE
|scalarmult_scalarbytes		|DONE
|scalarmult_primitive		|DONE
|crypto_scalarmult_base		|TODO
|crypto_scalarmult		|TODO

|============================================================================


=== Public-key authenticated encryption: crypto_box

[IMPORTANT]
Currently only curve25519xsalsa20poly1305 is supported as it is the default
used in libsodium!

==== crypto_box_curve25519xsalsa20poly1305

[options="header"]
|============================================================================
|C Function			|Status

|crypto_box_primitive		|DONE
|crypto_box_publickeybytes	|DONE
|crypto_box_secretkeybytes	|DONE
|crypto_box_beforenmbytes	|DONE
|crypto_box_noncebytes		|DONE
|crypto_box_zerobytes		|DONE
|crypto_box_boxzerobytes	|DONE
|crypto_box_macbytes		|DONE
|crypto_box_keypair		|TODO
|crypto_box_beforenm		|TODO
|crypto_box_afternm		|TODO
|crypto_box_open_afternm	|TODO
|crypto_box			|TODO
|crypto_box_open		|TODO

|============================================================================

