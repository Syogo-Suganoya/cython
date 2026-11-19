# mode: run
# tag: pep448, unpacking

# Unparenthesised starred expressions in places where
# CPython (bpo-34508) also allows them.


def return_star():
    """
    >>> return_star()
    (1, 2, 3)
    """
    return *(1, 2), 3


def return_star_only():
    """
    >>> return_star_only()
    (1, 2)
    """
    return *(1, 2),


def return_star_list():
    """
    >>> return_star_list()
    (1, 2, 3, 4)
    """
    a = [2, 3]
    return 1, *a, 4


def yield_star():
    """
    >>> list(yield_star())
    [(1, 2, 3)]
    """
    yield *(1, 2), 3


def inplace_add_star():
    """
    >>> inplace_add_star()
    [0, 1, 2, 3]
    """
    a = [0]
    a += *(1, 2), 3
    return a


def for_in_star():
    """
    >>> for_in_star()
    [1, 2, 3]
    """
    result = []
    for i in *(1, 2), 3:
        result.append(i)
    return result


def for_in_star_generator():
    """
    >>> for_in_star_generator()
    [1, 2, 3]
    """
    return [i for i in [*(1, 2), 3]]


def assign_star():
    """
    >>> assign_star()
    (1, 2, 3)
    """
    x = *(1, 2), 3
    return x
