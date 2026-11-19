# mode: error
# tag: dataclass

import dataclasses

dataclass_kwargs = {"order": True}
dataclass_args = ()

@dataclasses.dataclass(**dataclass_kwargs)
cdef class WithStarStarKwargs:
    x: int

@dataclasses.dataclass(*dataclass_args)
cdef class WithStarArgs:
    x: int

_ERRORS = """
9:22: Arguments of a dataclass decorator on a cdef class must be explicit keyword arguments (no '*' or '**' unpacking).
13:22: Arguments of a dataclass decorator on a cdef class must be explicit keyword arguments (no '*' or '**' unpacking).
"""
