#serial 2

AC_DEFUN([AX_CHECK_CXX_LIB],[
    pushdef([LIBRARY],$1)
    pushdef([HEADER],$2)
    pushdef([SNIPPET],$3)
    pushdef([VALUE_IF_NOT_FOUND],$4)

    AC_LANG_PUSH([C++])
    pushdef([LDFLAGS], [-l]LIBRARY)

    AC_LINK_IFELSE(
    [AC_LANG_PROGRAM([#include <]HEADER[>],
                     SNIPPET)],
    [TEST_LIBS="$TEST_LIBS -l]LIBRARY["] [HAVE_]LIBRARY[=1],
    VALUE_IF_NOT_FOUND)

    popdef([LDFLAGS])
    AC_LANG_POP

    popdef([VALUE_IF_NOT_FOUND])
    popdef([SNIPPET])
    popdef([HEADER])
    popdef([LIBRARY])
])
