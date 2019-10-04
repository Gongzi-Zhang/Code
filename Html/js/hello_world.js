"use strict"

alert("Hello World");

// Data type
/// primitive: a single thing
let x;
x = null;	// null type

x = undefined;	// undefined type

x = true;	// boolean
x = false;

x = 1;		// numbers
x = 1.23;
x = Infinity;	// special values of numbers
x = -Infinity;
x = NaN;

const x = "hello world";	// string, double quote
x = 'hello world';		// single quote
x = `hello world`;		// backticks

x = Symbol();       // symbol
x = Symbol("id");   // symbol with the description "id"
		    // symbols are guaranteed to be unique

/// Compound: objects:: collection of data
let user = {	    // "object literal" syntax
    name: "John",   // by key "name" store value "John"
    age: 30
};
x = new Object();   // "object constructor" syntax


typeof null;	// object; this is wrong due to compatibility



// expression
let a, b, c, x, y, z;
let name;
x = `value is ${1 + 2}`;
x = `name is ${name}`;
x = function() {
    alert("Hello!");
};
x();

b = 2;
x = 3 - (a = b + 1) // 0
x++;
--x;
x += 3; x -= 3; x *= 3; x /= 3;
x = 1+2, 3+4;	    // 3
x = (1+2, 3+4);	    // 7

/// conversion

/*  because binary plus '+' works for both string (concatenation) and number (addition), we need an explicit rule for it: "" convert to string in addition.
 *  For binary minus '-', it only works for numbers, so strings are converted to numbers
 */
x = +"2";	    // 2: unary math operation
x = -"2";
x = "" + 1 + 0;	    // "1" + 0 = "10"
x = "" + 1 - 0;	    // "1" - 0 = 1
x = "" - 1 + 0;	    // -1
x = 2 + 2 + "1";    // 4 + "1" = "41"
x = 2 + 2 - "1";    // 4 - "1" = 3
x = "2" + "3";	    // "23"
x = "2" - "3";	    // -1
x = +"2" + +"3";    // 5

x = "hello" + "world";	// "helloworld"
x = "hello" - "world";	// NaN

// symbols don't auto-convert to a string
Symbol("id").toString();    // "Symbol(id)"

debugger;   // suspend code execution here
/// 0, NaN, false, "", null, undefined: are all regarded as false in boolean context
/// {}: is true, all object (including empty object) are true in boolean context
/// Comparison
0 == false;	    
0 !== false;	    // strict equility
"" == false;
"" !== false;
undefined != false;
null != false;

0 == ""
0 !== ""
0 != undefined;
0 != null;
{} != {};
{} !== {};
let id1 = Symbol("id");
let id2 = Symbol("id");
id1 != id2;

"z" > "a" > "Z" > "A" > "9" > "1" > "0";

// control flow
let result = condition ? value1 : value2;
let result = (score < 60) ? 'D' :
    (score < 80) ? 'C' :
    (score < 90) ? 'B' : 'A'
if (x == 1) {
    ...
} else if (x == 2){
    ...
} else {
    ...
}

/// while
while (condition) {
    ...
    break;
}

do {
    ...
    continue;
} while (condition)

outer: for (let i=0; i<3; i++) {
    inner: for (let j=0; j<3; j++) {
	let input = prompt('please input your name', 'zhang san');
	if (!input) break outer;
    }
}
for (begin; condition; step;) {
    ...
}

switch (condition) {
    case value1:
	...
	break;
    case value2:
    case value3:
	...
	break;
    default:
	...
}

// function
function fun() {
    ...
}

/// arrow function
let fun = (arg1, arg2, ...) => expression;

function fun(arg1, arg2, ...) {
    return expression;
}

// objects: associative arrays with several special features
/// Constructor
let child = prompt("Do you have son or daughter, or both?");
let gender = "M";
let id = Symbol("id");
let user = {
    name: "John",
    age: 30,
    'like bird': true,
    gender,		// a shorthand of gender: gender
    [child]: true,	// computed properties, this can't be shorthanded
    [child + "number"]: 3,  // more complex computed properties
    let: 2,		// reserved words are allowed as property names
    8: 89,		// "8": 89 <-- only string and symbols are allowed as key, other type will be converted to string
    [id]: "id",		// symbol needed to be square bracketed to be key 
    sayHi() {		// shorthand for: sayHi: function()
	alert(user.name);
	alert(this.age);
    }
    sayBye() {
	// arrow functions don't have their own this, it refer to the outer "normal" function
	let arrow = () => alert("Bye, " + this.name);
	arrow();
    }
};   // here user stores a reference to an anonymous object


const user = {
    name,
    gender,
};
user.age = 30;	// though user is const, it only fixes the value (reference) of user itself, not the object that it refers to.
user = {    // Error, can't assign a new reference to a const value
    name,
};  

/// setter and getter
user.name;	    // dot notation, only work for single word properties
user["name"];	    // square bracket notation, works for all properties
user['8'];	    
user[8];	    // though this is still valid
user[`name`];	    // "John"
user["like bird"]
user[name];	    // Undefined
let key = "name";
user[key];	    // "John"
user.sayHi = function() {
    alert("Hello!");
}
user.sayHi();	    // 1. the dot retrieves the property; 2. parentheses execute it
user['sayHi']();
let hi = user.sayHi;	// assign function to hi, but without execution, this is undefined
hi();		    // Error, because 'this' is undefined
//// walk around: reference type:: (base, name, strict)
/*
 * base is the object
 * name is the property name
 * strict is true if use strict is in effect
 */
hi = (user, "sayHi", true); // this receive the full info about the object and its method (set the this value)
hi();		    // this will work properly

/// destructor
delete user["like bird"]
delete user

/// existence
user.noSuchProperty;	// undefined if user doesn't have a property
"key" in user;		
let key = "property"
key in user;

/// loop over properties of an object
for (key in user) { // integer properties are sorted, others appear in creation order
    // The interger property here means a string that can be converted to-and-from an integer without a change:
    // so, "49" is an integer property name, while "+49" and "1.2" are not
    // symbolic properties are skipped by for...in loop
    ...
}


