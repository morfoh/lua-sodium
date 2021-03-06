local crypto = require"sodium"

print("crypto_scalarmult")
print("=====================================================")
print("scalarmult_primitive", crypto.scalarmult_primitive())
print("scalarmult_bytes", crypto.scalarmult_bytes())
print("scalarmult_scalarbytes", crypto.scalarmult_scalarbytes())
print("-----------------------------------------------------")

print("crypto_box")
print("=====================================================")
print("box_primitive", crypto.box_primitive())
print("box_publickeybytes", crypto.box_publickeybytes())
print("box_secretkeybytes", crypto.box_secretkeybytes())
print("box_beforenmbytes", crypto.box_beforenmbytes())
print("box_noncebytes", crypto.box_noncebytes())
print("box_zerobytes", crypto.box_zerobytes())
print("box_boxzerobytes", crypto.box_boxzerobytes())
print("box_macbytes", crypto.box_macbytes())

local pk, sk = crypto.box_keypair()
print("box_keypair", "public key", pk)
print("box_keypair", "secret key", sk)
print("-----------------------------------------------------")

print("randombytes")
print("=====================================================")
print("randombytes", crypto.randombytes(crypto.box_noncebytes()))
print("-----------------------------------------------------")
