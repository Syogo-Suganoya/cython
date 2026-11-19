# mode: error
# tag: struct, warnings

cdef extern from *:
    """
    typedef struct t_context { int frame; } t_context;
    struct s_context { int frame; };
    """
    # These define empty structs, not forward declarations.
    ctypedef struct t_context:
        pass
    cdef struct s_context:
        pass

    ctypedef struct t_context:
        int frame
    cdef struct s_context:
        int frame


cdef t_context* p = NULL
print(p.frame)

_WARNINGS = """
15:4: 't_context' was already defined as an empty struct, ignoring this definition. To forward declare it, leave out the body, as in 'ctypedef struct t_context'.
17:4: 's_context' was already defined as an empty struct, ignoring this definition. To forward declare it, leave out the body, as in 'cdef struct s_context'.
"""

_ERRORS = """
22:6: Cannot convert 't_context *' to Python object
"""
