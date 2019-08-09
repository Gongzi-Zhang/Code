import numpy as np

N = 100
is_prime = np.ones((N,), dtype = bool)
is_prime[:2] = 0
N_max = int(np.sqrt(len(is_prime) - 1))
for j in range(2, N_max + 1):
    if not is_prime[j]:
        is_prime[2*j::j] = False

