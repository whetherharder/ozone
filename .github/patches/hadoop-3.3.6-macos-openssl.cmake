
# Patch for macOS OpenSSL and ZLIB
if(APPLE)
  # Fix OpenSSL paths
  if(DEFINED ENV{OPENSSL_ROOT_DIR})
    set(OPENSSL_ROOT_DIR $ENV{OPENSSL_ROOT_DIR})
  elseif(EXISTS "/usr/local/opt/openssl@3")
    set(OPENSSL_ROOT_DIR "/usr/local/opt/openssl@3")
  endif()

  if(OPENSSL_ROOT_DIR)
    set(OPENSSL_INCLUDE_DIR "${OPENSSL_ROOT_DIR}/include")
    set(OPENSSL_CRYPTO_LIBRARY "${OPENSSL_ROOT_DIR}/lib/libcrypto.dylib")
    set(OPENSSL_SSL_LIBRARY "${OPENSSL_ROOT_DIR}/lib/libssl.dylib")
    include_directories(${OPENSSL_INCLUDE_DIR})
    message(STATUS "Using OpenSSL from: ${OPENSSL_ROOT_DIR}")
  endif()

  # Fix ZLIB paths for macOS
  if(EXISTS "/usr/local/opt/zlib")
    set(ZLIB_ROOT "/usr/local/opt/zlib")
    set(ZLIB_INCLUDE_DIR "/usr/local/opt/zlib/include")
    set(ZLIB_LIBRARY "/usr/local/opt/zlib/lib/libz.dylib")
    message(STATUS "Using ZLIB from: ${ZLIB_ROOT}")
  endif()
endif()
