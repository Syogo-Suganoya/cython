# mode: run
# tag: typeof

cimport cython


def typeof_cast():
    """
    >>> typeof_cast()
    ('int', 'int')
    """
    cdef double a = 5
    b = cython.cast(cython.int, a)
    return cython.typeof(cython.cast(cython.int, a)), cython.typeof(b)


def typeof_cast_expression():
    """
    >>> typeof_cast_expression()
    'long'
    """
    cdef double a = 1.5
    return cython.typeof(cython.cast(cython.long, a) + 1)


def typeof_sizeof():
    """
    >>> typeof_sizeof()
    'size_t'
    """
    cdef double a = 5
    return cython.typeof(cython.sizeof(a))


def typeof_address():
    """
    >>> typeof_address()
    'double *'
    """
    cdef double a = 5
    return cython.typeof(cython.address(a))


def typeof_typeof():
    """
    >>> typeof_typeof()
    'Python object'
    """
    cdef double a = 5
    return cython.typeof(cython.typeof(a))


def typeof_lambda():
    """
    >>> typeof_lambda()
    'Python object'
    """
    return cython.typeof(lambda: 0)


calls = []

def _side_effect():
    calls.append(1)
    return 1

def typeof_not_evaluated():
    """
    >>> typeof_not_evaluated()
    ('Python object', [])
    """
    return cython.typeof(_side_effect()), calls
