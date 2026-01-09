---@meta

-- https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Gcrypt.html
-- https://github.com/wireshark/wireshark/blob/4988cfd31b29704411a7bd341a3034a989996943/test/lua/globals_5.0.txt#L1694

---Cipher algorithms
GCRY_CIPHER_NONE = 0
GCRY_CIPHER_IDEA = 1
GCRY_CIPHER_3DES = 2
GCRY_CIPHER_CAST5 = 3
GCRY_CIPHER_BLOWFISH = 4
GCRY_CIPHER_SAFER_SK128 = 5
GCRY_CIPHER_DES_SK = 6
GCRY_CIPHER_AES = 7
GCRY_CIPHER_AES192 = 8
GCRY_CIPHER_AES256 = 9
GCRY_CIPHER_TWOFISH = 10
GCRY_CIPHER_ARCFOUR = 301
GCRY_CIPHER_DES = 302
GCRY_CIPHER_TWOFISH128 = 303
GCRY_CIPHER_SERPENT128 = 304
GCRY_CIPHER_SERPENT192 = 305
GCRY_CIPHER_SERPENT256 = 306
GCRY_CIPHER_RFC2268_40 = 307
GCRY_CIPHER_RFC2268_128 = 308
GCRY_CIPHER_SEED = 309
GCRY_CIPHER_CAMELLIA128 = 310
GCRY_CIPHER_CAMELLIA192 = 311
GCRY_CIPHER_CAMELLIA256 = 312
GCRY_CIPHER_SALSA20 = 313
GCRY_CIPHER_SALSA20R12 = 314
GCRY_CIPHER_GOST28147 = 315
GCRY_CIPHER_CHACHA20 = 316
GCRY_CIPHER_GOST28147_MESH = 317
GCRY_CIPHER_SM4 = 318

---Cipher modes
GCRY_CIPHER_MODE_NONE = 0
GCRY_CIPHER_MODE_ECB = 1
GCRY_CIPHER_MODE_CFB = 2
GCRY_CIPHER_MODE_CBC = 3
GCRY_CIPHER_MODE_STREAM = 4
GCRY_CIPHER_MODE_OFB = 5
GCRY_CIPHER_MODE_CTR = 6
GCRY_CIPHER_MODE_AESWRAP = 7
GCRY_CIPHER_MODE_CCM = 8
GCRY_CIPHER_MODE_GCM = 9
GCRY_CIPHER_MODE_POLY1305 = 10
GCRY_CIPHER_MODE_OCB = 11
GCRY_CIPHER_MODE_CFB8 = 12
GCRY_CIPHER_MODE_XTS = 13
GCRY_CIPHER_MODE_EAX = 14

---Cipher flags
GCRY_CIPHER_SECURE = 1
GCRY_CIPHER_ENABLE_SYNC = 2
GCRY_CIPHER_CBC_CTS = 4
GCRY_CIPHER_CBC_MAC = 8

---Control commands
GCRYCTL_CFB_SYNC = 3
GCRYCTL_RESET = 4
GCRYCTL_FINALIZE = 5
GCRYCTL_GET_KEYLEN = 6
GCRYCTL_GET_BLKLEN = 7
GCRYCTL_TEST_ALGO = 8
GCRYCTL_IS_SECURE = 9
GCRYCTL_GET_ASNOID = 10
GCRYCTL_ENABLE_ALGO = 11
GCRYCTL_DISABLE_ALGO = 12
GCRYCTL_DUMP_RANDOM_STATS = 13
GCRYCTL_DUMP_SECMEM_STATS = 14
GCRYCTL_GET_ALGO_NPKEY = 15
GCRYCTL_GET_ALGO_NSKEY = 16
GCRYCTL_GET_ALGO_NSIGN = 17
GCRYCTL_GET_ALGO_NENCR = 18
GCRYCTL_SET_VERBOSITY = 19
GCRYCTL_SET_DEBUG_FLAGS = 20
GCRYCTL_CLEAR_DEBUG_FLAGS = 21
GCRYCTL_USE_SECURE_RNDPOOL = 22
GCRYCTL_DUMP_MEMORY_STATS = 23
GCRYCTL_INIT_SECMEM = 24
GCRYCTL_TERM_SECMEM = 25
GCRYCTL_DISABLE_SECMEM_WARN = 27
GCRYCTL_SUSPEND_SECMEM_WARN = 28
GCRYCTL_RESUME_SECMEM_WARN = 29
GCRYCTL_DROP_PRIVS = 30
GCRYCTL_ENABLE_M_GUARD = 31
GCRYCTL_START_DUMP = 32
GCRYCTL_STOP_DUMP = 33
GCRYCTL_GET_ALGO_USAGE = 34
GCRYCTL_IS_ALGO_ENABLED = 35
GCRYCTL_DISABLE_INTERNAL_LOCKING = 36
GCRYCTL_DISABLE_SECMEM = 37
GCRYCTL_INITIALIZATION_FINISHED = 38
GCRYCTL_INITIALIZATION_FINISHED_P = 39
GCRYCTL_ANY_INITIALIZATION_P = 40
GCRYCTL_SET_CBC_CTS = 41
GCRYCTL_SET_CBC_MAC = 42
GCRYCTL_ENABLE_QUICK_RANDOM = 44
GCRYCTL_SET_RANDOM_SEED_FILE = 45
GCRYCTL_UPDATE_RANDOM_SEED_FILE = 46
GCRYCTL_SET_THREAD_CBS = 47
GCRYCTL_FAST_POLL = 48
GCRYCTL_SET_RANDOM_DAEMON_SOCKET = 49
GCRYCTL_USE_RANDOM_DAEMON = 50
GCRYCTL_FAKED_RANDOM_P = 51
GCRYCTL_SET_RNDEGD_SOCKET = 52
GCRYCTL_PRINT_CONFIG = 53
GCRYCTL_OPERATIONAL_P = 54
GCRYCTL_FIPS_MODE_P = 55
GCRYCTL_FORCE_FIPS_MODE = 56
GCRYCTL_SELFTEST = 57
GCRYCTL_DISABLE_HWF = 63
GCRYCTL_SET_ENFORCED_FIPS_FLAG = 64
GCRYCTL_SET_PREFERRED_RNG_TYPE = 65
GCRYCTL_GET_CURRENT_RNG_TYPE = 66
GCRYCTL_DISABLE_LOCKED_SECMEM = 67
GCRYCTL_DISABLE_PRIV_DROP = 68
GCRYCTL_SET_CCM_LENGTHS = 69
GCRYCTL_CLOSE_RANDOM_DEVICE = 70
GCRYCTL_INACTIVATE_FIPS_FLAG = 71
GCRYCTL_REACTIVATE_FIPS_FLAG = 72
GCRYCTL_SET_SBOX = 73
GCRYCTL_DRBG_REINIT = 74
GCRYCTL_SET_TAGLEN = 75
GCRYCTL_GET_TAGLEN = 76
GCRYCTL_REINIT_SYSCALL_CLAMP = 77
GCRYCTL_AUTO_EXPAND_SECMEM = 78
GCRYCTL_SET_ALLOW_WEAK_KEY = 79

---@class GcryptCipher
---A GcryptCipher object represents gcrypt symmetric cipher in Lua.
---The cipher functions are used for symmetrical cryptography, i.e. cryptography using a shared key.
GcryptCipher = {}

---Creates a new GcryptCipher object.
---This object uses the symmetric cipher functions to encrypt or decrypt data.
---@param algorithm number Select the algorithm for this cipher (GCRY_CIPHER_*).
---@param mode number Select mode for this algorithm (GCRY_CIPHER_MODE_*).
---@param flags number Set the flags for this cipher (GCRY_CIPHER_SECURE, etc.).
---@return GcryptCipher cipher The new GcryptCipher object.
function GcryptCipher.open(algorithm, mode, flags) end

---Perform various operations on the cipher object.
---@param cmd number Command identifier (GCRYCTL_*).
---@param buffer ByteArray ByteArray as buffer and buffer length.
function GcryptCipher:ctl(cmd, buffer) end

---Retrieve various information about the cipher object.
---@param what number Select what info will be returned (GCRYCTL_*).
---@param buffer_size number|nil Buffer size or NULL.
---@param nbytes number|nil Nbytes integer or NULL.
---@return any userdata The requested information.
---@return number nbytes Number of bytes.
function GcryptCipher:info(what, buffer_size, nbytes) end

---Encrypt the plaintext using the cipher handle into the buffer.
---For most algorithms it is possible to pass NULL for in and do a in-place encryption.
---@param out ByteArray|nil ByteArray with data for in-place encryption or NULL.
---@param input ByteArray|nil ByteArray with data or NULL (optional).
---@return ByteArray encrypted The encrypted data.
function GcryptCipher:encrypt(out, input) end

---Decrypt the ciphertext using the cipher handle.
---The counterpart to encrypt.
---@param out ByteArray|nil ByteArray with data for in-place decryption or NULL.
---@param input ByteArray|nil ByteArray with data or NULL (optional).
---@return ByteArray decrypted The decrypted data.
function GcryptCipher:decrypt(out, input) end

---Set KEY of length KEYLEN bytes for the cipher handle.
---@param key ByteArray ByteArray as buffer and buffer length.
function GcryptCipher:setkey(key) end

---Set initialization vector IV of length IVLEN for the cipher handle.
---@param iv ByteArray ByteArray as buffer and buffer length.
function GcryptCipher:setiv(iv) end

---Provide additional authentication data for AEAD modes/ciphers.
---@param abuf ByteArray ByteArray as authentication data.
function GcryptCipher:authenticate(abuf) end

---Get authentication tag for AEAD modes/ciphers.
---@return ByteArray tag The authentication tag.
function GcryptCipher:gettag() end

---Check authentication tag for AEAD modes/ciphers.
---@param tag ByteArray ByteArray as authentication tag to check.
---@return number result 0 if tag is valid, non-zero otherwise.
---@return string|nil errstring Error string if tag is invalid.
function GcryptCipher:checktag(tag) end

---Set counter for CTR mode.
---(CTR,CTRLEN) must denote a buffer of block size length, or (NULL,0) to set the CTR to the all-zero block.
---@param ctr ByteArray|nil ByteArray with ctr or NULL.
---@param ctrlen number CTR Length.
function GcryptCipher:setctr(ctr, ctrlen) end

---Retrieve various information about the cipher algorithm.
---@param algorithm number Select the algorithm for this function (GCRY_CIPHER_*).
---@param what number Select the algorithm for this function (GCRYCTL_*).
---@param buffer_size number|nil Buffer size or NULL, optional only if nbytes not present.
---@param nbytes number|nil Nbytes integer or NULL, optional.
---@return any userdata The requested information.
---@return number nbytes Number of bytes.
function gcry_cipher_algo_info(algorithm, what, buffer_size, nbytes) end

---Map the cipher algorithm whose ID is contained in ALGORITHM to a string representation of the algorithm name.
---For unknown algorithm IDs this function returns "?".
---@param algorithm number Algorithm id for this function (GCRY_CIPHER_*).
---@return string name The algorithm name.
function gcry_cipher_algo_name(algorithm) end

---Map the algorithm name NAME to a cipher algorithm ID.
---Return 0 if the algorithm name is not known.
---@param name string Algorithm name for this function.
---@return number id The algorithm ID or 0.
function gcry_cipher_map_name(name) end

---Given an ASN.1 object identifier in standard IETF dotted decimal format in STRING,
---return the encryption mode associated with that OID or 0 if not known or applicable.
---@param oid string ASN.1 object identifier as STRING.
---@return number mode The encryption mode (GCRY_CIPHER_MODE_*) or 0.
function gcry_cipher_mode_from_oid(oid) end

---Retrieve the key length in bytes used with algorithm A.
---@param algorithm number Algorithm id for this function (GCRY_CIPHER_*).
---@return number length The key length in bytes.
function gcry_cipher_get_algo_keylen(algorithm) end

---Retrieve the block length in bytes used with algorithm A.
---@param algorithm number Algorithm id for this function (GCRY_CIPHER_*).
---@return number length The block length in bytes.
function gcry_cipher_get_algo_blklen(algorithm) end

local function GcryptCipher__TEST(data_out, data_in)
    local gcrypt = GcryptCipher.open(GCRY_CIPHER_AES, GCRY_CIPHER_MODE_CBC, 0)
    gcrypt:ctl(GCRYCTL_RESET, ByteArray.new())
    gcrypt:setkey(ByteArray.new("abcdefabcdef1234abcdefabcdef1234"))
    gcrypt:decrypt(data_out, data_in)
end