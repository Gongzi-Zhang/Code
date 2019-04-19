# Scale, Scale, Scale
* when the total number of object is less than 10, you can always use **enumeration**

* stochastic cooling: 
    1. For N numbers: x1, x2 ..... xN;
    2. collects them into M subgroups (randomly): (x1, x2, ... xM) ... (x(N-M+1), x(N-M+2) ... xN)
    3. take the average of each subgroups: <x>1 = (x1 + x2 + ... + xM)/M
    4. correct deviation: (x1-<x>1, x2-<x>1, ... xM-<x>1), .... (x(N-M+1)-<x>M, x(N-M+2)-<x>M, ... xN-<x>M)
    5. new arrays: xc1, xc2, .... xcN;
    6. repeat 2-5 for new arrays
