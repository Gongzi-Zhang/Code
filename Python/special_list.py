# array
from array import array
'''array() object is a list that stores only homogeneous data and stores 
it more compactly'''

'''Typecode
    'd'
    'H':    two bytes unsigned binary number
'''
r = array('d', range(0,100))
a = array('H', [4000, 10, 700, 22222])
sum(a)      # 26932
a[1:3]

# deque
'''a list with faster appends and pops from the left side but slower lookups in the middle. '''
from collections import deque
d = deque(['task1', 'task2', 'task3'])
d.append('task4')
print('Handling', d.popleft())


# heapq
'''heap based on regular lists, the lowest valued entry is always kept at 
position zero'''
