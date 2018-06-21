# provide operations corresponding to the built-in operation in Python
operator.add(x, y)
print(reduce(lambda x, y: x + y, range(10)))    # 45
print(reduce(add, range(10)))   # 45
