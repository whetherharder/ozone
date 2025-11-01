
# Patch for macOS OpenSSL
if(APPLE)
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
endif()
