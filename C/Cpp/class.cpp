#include<iostream>
#include <string>
#include <iomanip>
/* copy construct function
 *
 * If a class do not specify a copy construct function, compiler will create
 * one for it, which will copy the memory content of old class object to new
 * one. 
 * Sometimes, we don't want such default action, to disable it, use delete in
 * class construction function.
 */

class Box
{
    protected:
	float length,width,height;
    public:
	Box(){length=1; width=1; height=1;}
	Box& operator = (const Box&) = delete;	// disable default = operator
	Box(const Box&) = delete;   // disable default copy construct function
//	Box& operator = (const Box&) = default;	// enable default = operator explicitly
//	Box(const Box&) = default;   // enable default copy construct function explicitly
	Box(float le, float wi, float he ){ length=le; width=wi; height=he;}
	virtual ~Box() {}
	virtual void life() = 0; // pure virtual function.
	virtual void display();
};

// for class with pure virtual function, you can't create a object for it.
// because there is uncompleted functions there.

void Box::display()
{
    std::cout << "Box information:" << std::endl;
    std::cout << std::setw(10) 
	<< "length: " << length 
	<< "width: " << width 
	<< "height: " << height << std::endl;
}

class Desk : public Box
{
protected:
    float weight;
public:
    Desk() : Box(),weight(1) {};
    Desk(float le, float wi, float he, float we) : Box(le, wi, he) 
    {
	weight=we;
    }
    void display();
};

void Desk::display()
{
    std::cout << "Desk information: " << std::endl;
    std::cout << std::setw(10) 
	<< "length: " << length 
	<< "width: " << width 
	<< "height: " << height 
	<< "weight: " << weight << std::endl;
}

class Cupboard : public Desk
{
protected:
    char * color;
public:
    Cupboard() : Desk(), color("white") {}
    Cupboard(float le, float wi, float he, float we, char * co) 
	    : Desk(le, wi, he, we), color(co) {}
     ~Cupboard() {}
    void display();
};

void Cupboard::display()
{
    std::cout << "Cupboard information: " << std::endl;
    std::cout << std::setw(10) 
	<< "length: " << length 
	<< "width: " << width 
	<< "height: " << height 
	<< "weight: " << weight 
	<< "color: " << color <<  std::endl;
} 
	
int main()
{
    Cupboard cupb(3,2,5,10,"red");
    Cupboard * cupb2 = new Cupboard;
    Cupboard * cupb1 = &cupb;
    Box * box = &cupb;

    std::cout << "pointer pointing to Cupboard: " << cupb1 << std::endl;
    std::cout << "pointer of Box type: " << box << std::endl;

    box->display();
//  cupb1->display();
    cupb2->display();	
    return 0;
}

/* function override
 *
 * within class, a member function call will firstly search in its own
 * function members, and then its parent classes; if there is a function with
 * same name found in its member function, then the compiler will don't go
 * up to its parent classes for possible function overload (functions with
 * same name but different parameter list.) so if you have a member function 
 * directly define in your class, and called it with a different parameters
 * which is defined in the parent classes, the compiler will throw out an
 * error that function called not defined.
 */
class Human{
    public:
	virtual void talk() {   cout << "Ahaa" << endl; }
	virtual void talk(string msg) { cout << msg << endl;    }
};

class Baby : public Human {
    public:
	void talk() {	cout << "Ma-Ma" << endl;    }
};

Baby cici;
cici.talk("Ba-Ba"); // Error, function not defined.
((Human)cici).talk("Ba-Ba");	// force type casting (upward casting)
