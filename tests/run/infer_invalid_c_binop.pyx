# mode: run
# tag: typeinference

# Inferring the type of a C operation that is invalid for C types
# (e.g. a bit shift of a double) must not crash the compiler.

cimport cython


def shift_double_twice(double x):
    """
    >>> shift_double_twice(1.0)
    Traceback (most recent call last):
    TypeError: unsupported operand type(s) for >>=: 'float' and 'int'
    """
    i = x
    i >>= 1
    i >>= 1
    return i


def shift_power_in_loop(int n):
    """
    >>> shift_power_in_loop(2)
    Traceback (most recent call last):
    TypeError: unsupported operand type(s) for >>=: 'float' and 'int'
    """
    i = 2 ** n  # inferred as double
    while i:
        i >>= 1
    return i


def or_double(double x):
    """
    >>> or_double(1.0)
    Traceback (most recent call last):
    TypeError: unsupported operand type(s) for |=: 'float' and 'int'
    """
    i = x
    i |= 1
    i |= 2
    return i


def shift_inferred_type(double x):
    """
    >>> shift_inferred_type(1.0)
    'Python object'
    """
    i = x
    if x > 10:
        i >>= 1
        i >>= 1
    return cython.typeof(i)
