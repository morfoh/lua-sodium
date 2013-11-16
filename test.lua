local crypto = require"sodium"

print("scalarmult_primitive", crypto.scalarmult_primitive())
print("scalarmult_bytes", crypto.scalarmult_bytes())
print("scalarmult_scalarbytes", crypto.scalarmult_scalarbytes())
