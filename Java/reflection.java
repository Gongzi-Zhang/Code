import java.lang.reflect.*;

// Java Reflection is the process of analyzing and modifying all the capabilities of a class at runtime. Reflection API in Java is used to manipulate class and its members which include fields, methods, constructor, etc. at runtime.

class reflection {
    reflection() {
	...
    }

    // get metadata of a class
    reflection ref = new reflection();
    // get class name
    Class classObj = ref.getClass();
    system.out.println(classObj.getName());

    // get super classes
    Class[] interfaceList = ref.getInterfaces();

    // get access modifiers
    int modifier = ref.getModifiers();
    system.out.println(Modifier.toString(modifier));

    // get fields
    Field[] field1 = ref.getFields();	// returns metadata of the public variable from the specified class as well as its super classes
    Field[] field2 = ref.getDeclaredFields();	// reads only the specified class
    for (Field field: field1) {
	// name of the field
	String name = field.getName();
	// value of the field
	type value = field.get(field);	
	// modifier of the field
	int modifier = field.getModifiers();
	// type of the field
	Class type = field.getType();
    }

    // get metadata of methods
    Method[] method1 = ref.getMethods();    // including super methods of super classes.
    Method[] method2 = ref.getDeclaredMethods();    // methods of specified class only
    for (Method method : method1) {
	// name
	String name = method.getName();
	// return type
	String return_type = method.getReturnType();
	// modifier 
	int modifier = field.getModifiers();
	// parameters
	Class[] paramList = method.getParameterTypes();
	for (Class class1 : paramList) {
	    System.out.println(class1.getName());
	}
	// Exceptions
	Class[] exceptionList = method.getExceptionType();
	for (Class exception : exceptionList) {
	    System.out.println(exception.getName());
	}
    }

    // metadata of constructors
    Constructor[] constructorList = ref.getConstructors();
    for (Constructor constructor : constructorList) {
	// name
	String name = constructor.getName();
	// modifier 
	int modifier = field.getModifiers();
	// parameters
	Class[] paramList = method.getParameterTypes();
	for (Class class1 : paramList) {
	    System.out.println(class1.getName());
	}
	// Exceptions
	Class[] exceptionList = method.getExceptionType();
	for (Class exception : exceptionList) {
	    System.out.println(exception.getName());
	}
    }
}
