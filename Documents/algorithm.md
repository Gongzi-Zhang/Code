# Scale, Scale, Scale
* when the total number of object is less than 10, you can always use **enumeration**

* stochastic cooling: 
    1. For N numbers: x1, x2 ..... xN;
    2. collects them into M subgroups (randomly): (x1, x2, ... xM) ... (x(N-M+1), x(N-M+2) ... xN)
    3. take the average of each subgroups: <x>1 = (x1 + x2 + ... + xM)/M
    4. correct deviation: (x1-<x>1, x2-<x>1, ... xM-<x>1), .... (x(N-M+1)-<x>M, x(N-M+2)-<x>M, ... xN-<x>M)
    5. new arrays: xc1, xc2, .... xcN;
    6. repeat 2-5 for new arrays

* regression/modelling/fitting
  To avoid under-fitting requires:
    * selecting a family of functions adapted to the data to be modelled;
    * choosing an optimisation algorithm capable of minimising the chosen criterion;
    * giving enough degrees of freedom to the model to fit the data.
  To avoid over-fitting, you must:
    * ensure that the examples used to build the model are representative of the domain of validity in question;
    * have a strategy to control the degrees of freedom of the model.
  Some examples of control strategies role:
    * control the number of model parameters;
    * control the range of variation of the parameters values;
    * monitor the progress of the optimisation;
    * etc...
