# mode: error
# tag: extern

cdef void cfunc():
    cdef extern void* c_function()

def pyfunc():
    cdef extern int c_variable

def outer():
    def inner():
        cdef extern int c_variable2
    return inner

def with_extern_block():
    cdef extern from *:
        int c_function2()

def with_extern_header_block():
    cdef extern from "math.h":
        double sin(double)

_ERRORS = """
5:4: extern declarations are only allowed at module level
8:4: extern declarations are only allowed at module level
12:8: extern declarations are only allowed at module level
16:4: cdef extern blocks are only allowed at module level
20:4: cdef extern blocks are only allowed at module level
"""
