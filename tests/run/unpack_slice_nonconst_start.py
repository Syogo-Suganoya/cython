# mode: run
# tag: unpacking, slicing

import cython


def first_two(s, i):
    """
    >>> first_two([1, 2, 3], 1)
    (2, 3)
    >>> first_two("abc", 1)
    ('b', 'c')
    """
    a, b = s[i:]
    return a, b


def window(values: list, i: cython.Py_ssize_t):
    """
    >>> window([1, 2, 3, 4], 2)
    (3, 4)
    """
    a, b = values[i:i + 2]
    return a, b


def typed_tuple(t: tuple[int, str, float], i):
    """
    >>> typed_tuple((1, 'x', 2.0), 1)
    ('x', 2.0)
    """
    a, b = t[i:]
    return a, b


def starred(s, i):
    """
    >>> starred([1, 2, 3, 4], 1)
    (2, [3, 4])
    >>> starred([1, 2, 3, 4], 0)
    ([1, 2, 3], 4)
    """
    if i:
        a, *rest = s[i:]
        return a, rest
    *init, last = s[i:]
    return init, last


def nested(s, i):
    """
    >>> nested([0, (1, 2), 3], 1)
    (1, 2, 3)
    """
    (a, b), c = s[i:]
    return a, b, c


def cascaded(s, j):
    """
    >>> cascaded([1, 2, 3], 1)
    ([2, 3], 2, 3)
    """
    x = a, b = s[j:]
    return x, a, b


def with_stop(s, i, j):
    """
    >>> with_stop([1, 2, 3, 4], 1, 3)
    (2, 3)
    """
    a, b = s[i:j]
    return a, b
