#include <iostream>

using namespace std;

int main(){

}

/* the most important thing we need to know about a variable is its
 * scope and type. of course, initialization and release is also needed
 * to be kept in mind.
 */

/*			Class Inheritance
 * If we define a load of different subclasses of a Base class, all of
 * which redifine some virtual method of the original superclass, then
 * a method in Base class(such as Draw() ) is called through a Bash 
 * pointer(actually holding an instance of one of the subclasses), then
 * the method defined in that specific subclass is run, despite the 
 * call not knowing about the actual specific type of the instance 
 * being manipulated. Of course, all the discussion base on the 
 * assumpsion that use virtual methods. if you fail to do so, then the
 * version defined in the subclass will be run when the object is
 * accessed through a superclass's pointer. The methods defined on
 * the subclass are effectively hidden and inaccessible, as are any 
 * methods defined solely on the subclass.
 */


/* CPP is strong typed, every variable has its type, and (I hope) the 
 * compiler will check variables' type before doing any operation to
 * them.
 */

/* whenever "new" operator is called, a instance of some type is 
 * created in the heap, with all the members of itself and its
 * parent classes. 
 */

/* the consideration is how compiler dealing with the calling of a 
 * pointer, more specifically, what's the order the compiler look 
 * for the destinating method. For example, with class "Base" and class
 * "Derived" derived from "Base",which has same method "Draw", and two 
 * pointer(b and d) both point to one instance of Direved class but 
 * of different type( Base and Derived respectively) . When b call the
 * method "Draw()", which one is call? and what about the d? 
 */
