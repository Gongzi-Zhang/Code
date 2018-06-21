# the else clauses on Loops
'''
Loop statements may have an else clause; it is executed when the loop
terminates through exhaustion of the list (with for) or when the condition
becomes false (with while); but not when the loop is terminated by a break
statement.
'''
for n in range(2, 10):
    for x in range(2, n):
        if n % x == 0:
            print(n, 'equals', x, '*', n//x) 
            break
    else:
        print (n, 'is a prime number')


# pass: do nothing
whiel True:
    pass
