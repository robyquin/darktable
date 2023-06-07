# - Try to find Postgres
# Once done, this will define
#
#  Postgres_FOUND - system has Postgres
#  Postgres_INCLUDE_DIRS - the Postgres include directories
#  Postgres_LIBRARIES - link these to use Postgres

include(LibFindMacros)

libfind_pkg_detect(Postgres libpq
  FIND_PATH "libpq-fe.h"
  FIND_LIBRARY libpq
)

if (Postgres_PKGCONF_VERSION)
  set(Postgres_VERSION "${Postgres_PKGCONF_VERSION}")
endif()

# Set the include dir variables and the libraries and let libfind_process do the rest.
# NOTE: Singular variables for this library, plural for libraries this lib depends on.
set(Postgres_PROCESS_INCLUDES Postgres_INCLUDE_DIR)
set(Postgres_PROCESS_LIBS Postgres_LIBRARY)
libfind_process(Postgres)
