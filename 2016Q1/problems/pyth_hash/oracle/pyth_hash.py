from __future__ import print_function
import sys
import struct
import binascii
import base64
import os
from ctypes import *

print("Content-Type: text/plain\n")

# Change this dylib name for different platforms
hash_lib = CDLL("oracle.dll")
hash_lib.hash.restype = c_uint64

b64input = os.environ['QUERY_STRING'] if 'QUERY_STRING' in os.environ else None
if b64input is None:
    print("No input given. Pass your input as the query string.")
    sys.exit()

try:
    input = base64.b64decode(b64input)
except:
    print("Invalid input given (should be base64-encoded).")
    sys.exit()

inplen = len(input)
if inplen > 32:
    print("Input too long. (Maximum 32 bytes.)")
    sys.exit()

out = hash_lib.hash(input, c_uint32(len(input)))
print(binascii.hexlify(struct.pack('=Q', out)))
