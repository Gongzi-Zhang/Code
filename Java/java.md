|-- System
    |-- in
    |-- out
	|-- println
|-- java
    |-- lang	:: imported by default for any class that you created in Java
	|-- Object
	|-- String
	|-- Math
	|-- reflect
	|-- Class
	|-- Field
	|-- Method
	|-- Constructor
	|-- Modifier
	|-- Runnable
	|-- Thread
	|-- Cloneable
	|-- Throwable
    |-- io
	|-- BufferedReader
	|-- FileReader
	|-- Serializable
    |-- sql

* Nonprimitive Data Types: objects and arrasy
    All nonprimitive types are handled by reference-that means when you pass a nonprimitive type to a method, the address of the object is passed to the method. The primitive types, however, are passed by value-that means a copy of the data is passed to the method.

* final
    * a final variable becomes a constant and can't be changed
    * a final method can't be overridden
    * a final class can't be inherited and its value can't be altered once created. (String is a final class)

* memory allocation in Java:
    1. Code: it contains your bytecode (commands/instructions)
    2. Stack: it contains methods, local variables and reference var.
    3. Heap: it contains objects (may also reference var.)
    4. Static: it contains static data/methods

*  In java, we can pass argument to a function **only by value** and *not by reference*.



# Q&A
* How we can execute any code even before main method?
Ans: If we want to execute any statements before even creation of objects at load time of class, we can use a static block of code in the class. Any statements inside this static block of code will get executed once at the time of loading the class even before creation of objects in the main method.

*  How objects of a class are created if no constructor is defined in the class?
Ans: Even if no explicit constructor is defined in a java class, objects get created successfully as a **default constructor** is implicitly used for object creation. This constructor has no parameters.

*  Can we use a default constructor of a class even if an explicit constructor is defined?
Ans: Java provides a default no argument constructor if no explicit constructor is defined in a Java class. But if an explicit constructor has been defined, default constructor can't be invoked and developer can use only those constructors which are defined in the class.

* Give an example of use of Pointers in Java class.
Ans: There are no pointers in Java. 

*  In java, how we can disallow serialization of variables?
Ans: If we want certain variables of a class not to be serialized, we can use the keyword **transient** while declaring them. 

* Can we call a non-static method from inside a static method?
Ans: Non-Static methods are owned by objects of a class and have object level scope and in order to call the non-Static methods from a static block (like from a static main method), an object of the class needs to be created first. Then using object reference, these methods can be invoked.

* Can a dead thread be started again?
Ans: In java, a thread which is in dead state can't be started again. There is no way to restart a dead thread.

* What's the difference between comparison done by equals method and == operator?
Ans: In Java, equals() method is used to compare the contents of two string objects and returns true if the two have same value while == operator compares the references of two string objects.

* Is it possible to define a method in Java class but provide it's implementation in the code of another language like C?
Ans: Yes, we can do this by use of native methods. In case of native method based development, we define public static methods in our Java class without its implementation and then implementation is done in another language like C separately.

* In a class implementing an interface, can we change the value of any variable defined in the interface?
Ans: No, we can't change the value of any variable of an interface in the implementing class as all variables defined in the interface are by default public, static and Final and final variables are like constants which can't be changed later.

* Can we have any other return type than void for main method?
Ans: No, Java class main method can have only void return type for the program to get successfully executed.
    Nonetheless , if you absolutely must return a value to at the completion of main method , you can use System.exit(int status)

*  How can we find the actual size of an object on the heap?
Ans: In java, there is no way to find out the exact size of an object on the heap.

* What's meant by anonymous class?
Ans: An anonymous class is a class defined without any name in a single line of code using new keyword.

*  If an application has multiple classes in it, is it okay to have a main method in more than one class?
Ans: If there is main method in more than one classes in a java application, it won't cause any issue as entry point for any application will be a specific class and code will start from the main method of that particular class only.

* I want to persist data of objects for later use. What's the best approach to do so?
Ans: The best way to persist data for future use is to use the concept of serialization.

* Which API is provided by Java for operations on set of objects?
Ans: Java provides a Collection API which provides many useful methods which can be applied on a set of objects. Some of the important classes provided by Collection API include ArrayList, HashMap, TreeSet and TreeMap.

* Can we cast any other type to Boolean Type with type casting?
Ans: No, we can neither cast any other primitive type to Boolean data type nor can cast Boolean data type to any other primitive data type.

* Can we use different return types for methods when overridden?
Ans: The basic requirement of method overriding in Java is that the overridden method should have same name, and parameters.But a method can be overridden with a different return type as long as the new return type extends the original.
