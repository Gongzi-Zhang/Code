# data compression
import zlib
s = b'witch which has which witches wrist watch'
len(s)

t = zlib.compress(s)
len(t)

zlib.decompress(t)
zlib.crc32(s)

# performance measurement
from timeit import Timer
Timer('t=a; a=b; b=t', 'a=1; b=2').timeit()
Timer('a, b = b, a', 'a=1; b=2').timeit()


# Quality Control: testing each function
def average(values):
    """ Computes the arithmatic mean of a list of numbers.
    
    >>> print(average([20, 30, 70])) 
    40.0
    """
    return sum(values) / len(values)

import doctest
doctest.testmod()

import unittest
class TestStatisticalFunctions(unittest.TestCase):
    def test_average(self):
        self.assertEqual(average([20, 30, 70]), 40.0)
        self.assertEqual(round(average([1, 5, 7]), 1), 4.3)
        with self.assertRaises(ZeroDivisionError):
            average([])
        with self.assertRaises(TypeError):
            average(20, 30, 70)

unittest.main()  # Calling from the command line invokes all tests

