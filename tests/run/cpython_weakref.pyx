# mode: run
# tag: weakref

from cpython.weakref cimport PyWeakref_IsDead, PyWeakref_NewRef


class Obj:
    pass


def is_dead(ref):
    """
    >>> import weakref
    >>> o = Obj()
    >>> r = weakref.ref(o)
    >>> is_dead(r)
    False
    >>> del o
    >>> import gc; _ = gc.collect()
    >>> is_dead(r)
    True
    >>> is_dead(Obj())   # doctest: +ELLIPSIS
    Traceback (most recent call last):
    TypeError: expected a weakref...
    """
    return PyWeakref_IsDead(ref) == 1


def new_ref_is_dead():
    """
    >>> new_ref_is_dead()
    (False, True)
    """
    o = Obj()
    r = PyWeakref_NewRef(o, None)
    alive = PyWeakref_IsDead(r)
    del o
    import gc; gc.collect()
    return bool(alive), bool(PyWeakref_IsDead(r))
