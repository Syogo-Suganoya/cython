# mode: error
# ticket: 6729

cdef f1(*values):
    return 1

cpdef f2(**kwargs):
    pass

cdef f3(a, *args):
    pass

cdef f4(a, **kwargs):
    pass

cdef f5(a, *, b):
    pass

_ERRORS = """
4:8: C functions do not support star-arguments (*args, **kwargs) or keyword-only arguments
7:9: C functions do not support star-arguments (*args, **kwargs) or keyword-only arguments
10:11: C functions do not support star-arguments (*args, **kwargs) or keyword-only arguments
13:11: C functions do not support star-arguments (*args, **kwargs) or keyword-only arguments
16:11: C functions do not support star-arguments (*args, **kwargs) or keyword-only arguments
"""
