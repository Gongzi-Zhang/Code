'''
    Why 0.1*10 == 1

    The exact value of decimal 0.1 can't be represented in 64-bit binary floating-point, so it gets rounded to the nearest representable value, which is 0.1000000000000000055511151231257827021181583404541015625.

    However, while the exact value of 0.1000000000000000055511151231257827021181583404541015625 * 10 can be represented in binary, it would take more bits of precision than 64-bit binary floating-point has. The result also gets rounded to the nearest representable value, and it turns out the nearest representable value is exactly 1.0.

    Basically, you have two rounding errors, and they happen to cancel.
'''
