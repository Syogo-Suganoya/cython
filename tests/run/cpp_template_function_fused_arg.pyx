# mode: run
# tag: cpp, fused, cpp_templates

from libc.stdint cimport int32_t, int64_t

cdef extern from *:
    """
    template <typename T>
    int size_of_type() { return (int) sizeof(T); }

    template <typename T, typename U>
    int size_of_types() { return (int) (sizeof(T) + sizeof(U)); }
    """
    int size_of_type[T]()
    int size_of_types[T, U]()

ctypedef fused numT:
    int32_t
    int64_t


cdef int cfunc(numT dummy):
    return size_of_type[numT]()

cdef int cfunc2(numT dummy):
    return size_of_types[numT, double]()


def test_cdef():
    """
    >>> test_cdef()
    (4, 8)
    """
    return cfunc(<int32_t>1), cfunc(<int64_t>1)


def test_cdef_mixed_args():
    """
    >>> test_cdef_mixed_args()
    (12, 16)
    """
    return cfunc2(<int32_t>1), cfunc2(<int64_t>1)
