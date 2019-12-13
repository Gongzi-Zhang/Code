* Interactive learning
* Consistent and Easy interface (API)
* Rich and Complete documents

* every object has an identity, a type and a value
# each programming language should has the following data and data structure implementation
* Numbers
    +-- int
    +-- float
    
* String 

* Pointer (associated array), multilevel(nested) pointer

## Data structure
* list (vector, array)
    +-- insert
	++-- append (push)
	++-- prepend
    +-- remove (delete)
	++-- popd
    +-- extract
    +-- search (find)
    +-- replace (delete and then insert)

* matrix
* associate list (dictionary, hash table)


# lib
* random
* date time  
* timer
* regex
    +-- extract substring

## Gui
    +-- widgets (frame, button, window, layout)
	+-- size: fit, fix


### scope (parent/child relationship)
* * name space
    A scope is a textual region of a program where a namespace is directly accessible.
* * heritage of function (object)
* * why named arguments
    this is helpful when the function has many parameters, and many of them are optional
     


# rules
* if you can use **strict** syntax, then use it; it is always easier to detect syntax error than semantic error. provide as **less** optional as possible.


函数式编程:
>   函数是纯粹的，不能修改传递给函数的变量，不能修改全局变量，对于同样的输入参数，返回值总是相同的。
>   用递归解决循环
>   高阶函数以实现代码复用
>   没有side effect，不共享变量，可以安全地调度到任何一个CPU core上运行,适用于并发编程。

面向对象编程:
>   程序 = 数据结构 + 算法
>   Object: 把数据和操作结合，只有object的方法能操作数据
>   Class: 类的函数定义只有一份，但object（数据部分）可以有多份
>   this: 隐藏参数，以确定在有多份objects决定操作那个object的数据
>   继承和多态: 对同一个接口，使用不同的实例要执行不同的操作
> > 函数重载: 对同一个函数名，根据参数类型和数量不同调用不同的实现

>   优先使用组合而不是继承
>   面向接口编程，而不是面向实现编程

无论是面向对象的继承，还是函数式编程的高阶函数，都是为了代码复用，减少**代码冗余**

* an exception that is easily avoided should raise an error; otherwise, it should return an error code.

* 乘法的运算要比除法来得省时 (really?)
