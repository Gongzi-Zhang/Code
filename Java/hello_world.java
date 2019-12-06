import packageName;
import jave.awt.event.*;    // import all classes of Abstract Widget Toolkit (awt)
import javax.swing.JFrame;  // import only one class
// importing a package doesn't import its sub-packages

public class hello_world {
    static final void main (String [] args) throws Exception {
	System.out.println("Hello World!");
	System.out.println("command line argument one: " + args[0]);	// the first argument, not the command name

	System.out.println("Please input a number: ");
	Scanner scanner = new Scanner(System.in);
	int num = scanner.nextInt();
    }

    static void time () {
	long time = System.currentTimeMillis();
	Runtime runtime = Runtime.getRuntime();
    }
}

class primitive_data_type {
    // boolean
    boolean bool = true || false;   // 1 byte

    // Numeric
    /// char
    char x;	// 2 bytes -- support for unicode
	x = 'v';

    /// Int
    byte vb;	// 1 byte
    short vs;	// 2 bytes
    int vi;	// 4 bytes  
	vi = 0; vi = 10_000;   
    long vl;	// 8 bytes

    /// float
    float vf;	// 4 bytes	
	vf = 3.14f;	
    double vd;	// 8 bytes	
	vd = 20.22d;	

    // data casting
    ///* smaller capacity is assigned to a var of bigger capacity -- implicit
    vd = vi;
    ///* larger capacity to smaller capacity -- explicit
    vi = (int) vd;
}

class string {
    char [] arr = {'H', 'e', 'l', 'l', 'o'};
    String str1 = new String(arr);

    String str2 = "Hello World!";   // The JVM creates a memory location especially for Strings called String Constant Pool. That’s why String can be initialized without ‘new’ keyword.

    // methods
    str2.charAt(0); // 0 based
    str2.indexOf('H', int startIndex = 0);
    str2.indexOf("He");
    str2.lastIndexOf('H');
    str2.lastIndexOf("He");

    str2.length();
    str2.contains("substr");
    str2.startsWith("perfix");
    str2.endsWith("suffix");
    str2.replace("substr", "substitution"); // replace all occurrence
    str2.replaceAll("regexp", "substitution");
    str2.replaceFisrt("regexp", "substitution");
    str2.toLowerCase();
    str2.toUpperCase();

    String str3 = str1.concat(str2);
    String str4 = str1 + str2;

    /// comparison
    str2.compareTo("string");
    str2.compareToIgnoreCase("string");

    // splitting
    String str = "alpha, beta, delta, gamma, sigma";
    String arrSplit = str.split("regexp", int limit = 0);	// if the limit is omitted or zero, it will return all the strings splitted by the regex; otherwise, returns only required number of components without splitting the last component
    arrSplit = str.split("\\s");    // split by space
    
    // string to int
    String val = "100";
    int num1 = Integer.parseInt(val);
    int num2 = Integer.valueOf(val);
    // invalid number string will throw a NumberFormatException Error
}


class array {
    // declaration
    type[] arrayName;
    type arrayName[];

    type arrayName = new type[]; // declaration and construction

    type arrayName[] = {val1, valu2, valu3 ...};    // declaration and initialization

    // multi-dim arrays
    int[][] twoD = new int[4][4];

    // methods
    array.length;
    
}

class ArrayList { // size variable array
    ArrayList<type> a = new ArrayList<type>();

    // methods
    type o;
    a.add(o);
    a.remove(o);    // remove an element
    a.remove(0);    // remove element by index
    a.size();
    a.contains(o);  // returns boolean

}

class HashMaps {
    // it stores only object reference. so we can't use primitive data type like double or int; use wrapper class like Integer or Double instead
    HashMap<class1, class2> map = new HashMap<class1, class2>();
    map.get(key);
    map.put(key, class2 value);
    map.remove(key);	// remove an element 
    map.containsKey(key);
    map.isEmpty();
    map.keySet();   // all available keys
    map.values();   // all available values
}
class control_flow {
    // for
    for(i=0; i<5; i++) {
	System.out.println(i);
    }

    String arr[] = {"Hello", "World"};
    for (String ele : arr) {
	...
    }

    while (i<10) {
	...
    }

    do {
	...
    } while (i<10);

    // switch case
    int Switch = 4;
    swithc(Switch) {	// swtich can take input only as int or char, string is supported in new Java version 
	case 0:
	    ...;
	    break;
	case 1:
	    ...;
	    break;
	default:
	    ...;
	    break;
    }
}

class Class {
    //* static variable belongs to the class, rather than an object; they will be initialized before the initialization of any instance. Then a simply copy will be shared by all instances of this class, it can be accessed directly by the class name and don't need any object.
    //* static method belongs to the class, rather than an object; a static method can access only static data, it can not access non-static data (instance variables). A static method can call only other static methods and can not call a non-static method from it. A static method can be accessed directly by the class name and doesn't need any object; a static method can't refer to "this" or "super" keywords in anyway
    //* static block is a block of statement inside a Java class that will be executed when a class is first loaded into the JVM


    // Instance variable is declared inside a class but not inside a method
    int a;

    void set(int a) {
	// Local variable are declared inside a method including method arguments.
	this.a = a;
    }

    // constructor: 
    //* it has the same name as the class
    //* it should not return a value not even void

    // If no user-defined constructor is provided for a class, compiler initializes member variables to its default values.
    //* numeric data types are set to 0
    //* char data types are set to null character('\0')
    //* reference variables are set to null
    Class() {
	...
    }
}

class Class1 extends Class {	// class inheritance
    //* The "super" keyword: it is similar to "this" keyword, which can be used to access any data member or methods of the parent class

    //* the overridden method can widen the accessibility (private -> public) but not the vice versa. 

    //* dynamic polymorphism: If a base class reference (it may refer to an object of a child class) is used to call a method, the method to be invoked is decided by the JVM during run-time, depending on the object the reference is pointing to

    //* how to refer to parents methods when the parents and grandparents have the same name methods? still using super? how to distinguish parents and grandparents?

    // constructor chaining
    Class1() {
	super(arguments);   // the super statement needs to be the first line of code in the constructor of the child class
    }
}

abstract class Abstract {
    // An abstract class can't be instantiated
    // a class must be compulsorily labeled abstract, if it has one or more abstract methods

    // abstract method: method with only declaration
    abstract public void method();
}

interface Interface{
    // An interface is just like Java Class, but it only has static constants and abstract method. Java uses Interface to implement multiple inheritance. All methods in an interface are implicitly public and abstract.

    // Java doesn't allow multiple inheritance (can't extend more than 1 class), but an interface can extend from one or many interfaces. So the walkaround is interface. A class can implement multiple interfaces. It is necessary that the class must implement all the methods declared in the interfaces. The class cannot implement two interfaces in java that have methods with same name but different return type.

    // in interface, only one specifier is used -- public
    // the interface can't contain data fields
    // An interface cannot declare constructors or destructors.

    // An interface which is declared inside another interface is referred as nested interface
    
    // At the time of declaration, interface variable must be initialized. Otherwise, the compiler will throw an error.
}

class imp implements Interface {    // to use an interface in a class
}

class Error_n_Exception {
    /* There are two types of errors:
     * 1. compile time errors -- syntax errors, semantic errors
     * 2. runtiem errors: exception
     */
    try {
	statements;
    } catch (exceptionType) {
	...
    } catch (anotherException) {
	...
    } finally {
	...
    }

    // It may cumbersome to catch every excetpion, so Java use throw exception syntax:
    public static void method() throws IOException ArrayIndexBoundExcetpion {	// note here: we use throws (not throw) in method definition
	// By declaring the method may throw an excetpion
    }
}

class myException extends Exception {	// user-defined exception
    myException(int b) {
	...
    }

    public String toString() {
	return ("myException!");
    }


    try {
	throw new myException(2);
    } catch (myException e){
	System.out.println(e)
    }
}
