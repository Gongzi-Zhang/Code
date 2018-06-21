reduce(lambda x, y: x+y, range(5))
int_base_2 = partial(int, base=2)   # partial can be used for changing default configuration
print(int_base_2("10010"))  # 18
