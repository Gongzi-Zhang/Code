# scipy project
import math

## constants
math.cos(math.pi / 4)   # 0.70710678118654757
math.log(math.e)    # 1.0
math.log(1024, 2)   # 10

import random
random.choice(['apple', 'pear', 'banana'])
random.sample(range(100), 10)   # sampling
random.random() # random float
random.randrange(6) # random integer

import statistics
data = [2.75, 1.75, 1.25, 0.25, 0.5, 1.25, 3.5]
statistics.mean(data)
statistics.median(data)
statistics.variance(data)


x = 3.14159
x.as_integer_ratio()        # exact value of a float number
y = x.hex()                     # heximal value
x = float.fromhex(y)


# decimal: decimal floating point arithmetic
from decimal import *
round(Decimal('0.70') * Decimal('1.05'), 2)     # Decimal('0.74')
round(0.70 * 1.05, 2)       # 0.73


# rational arithmetics
import fractions

