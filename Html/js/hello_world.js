"use strict"

alert("Hello World");

// Data type
/// primitive: a single thing
let x;
x = null;	// null type

x = undefined;	// undefined type

x = true;	// boolean
x = false;

x = 1, 1_000	// numbers
x = 1.23;		
x = 1.23E+8, 1.23e8, 1.23e-6;
x = 0b11111111, 0o377, 0xff, 0xFF;   // 255: binary, octal and hexadecimal
x = -Infinity, Infinity;	// special values of numbers
x = NaN;
1e500 == Infinity;	// too big number, overflow the 64-bit storage
0.1 + 0.2 != 0.3;
(0.1*10 + 0.2*10) / 10 == 0.3;


const x = "hello \n world";	// string, double quote
x = 'hello \n world';		// single quote
x = `hello 
    world`; // backticks allow multilines, while ' and " don't
x = "\u00A9";
x = "\u{20331}";

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
x();	// () mean execution of a function
/// destructuring assignment: it works with any iterable (array-like) on the right-side
let [a, b, c] = "abc";	// string
let [firstName, surname] = ["Ilya", "Kantor"];	// array
let [one, , two] = new Set([1, 2, 3]);	// set, ignore some elements with commas
let user={};
[user.name, user.age] = ["Ilya", 30];	// leftside can be anything
[firstName, surname] = [];	// unmatched number of variables
firstName;	// undefined
[firstName = "Julias", surname = "Romio"] = [];	    // default value
[name = prompt('name?'), surname = prompt('surname?')] = ["Julius"];	// default value can even be function, but it will run only for the missing one
let [name1, name2, ...rest] = ["Bob", "Kyler", "Seamus", "Joy", "Paul"];    // the rest using ...
name1;		// "Bob"
name2;		// "Kyler"
rest.length;	// 3

let {var1, var2} = {var1:..., var2:...};    // obejct, the left side should contain a "pattern" for corresponding properties
let options = {title: "Menu", width: 100, height: 200};
let {title, width, height} = options;
title, width, height;	// "Menu", 100, 200
({width: w, height: h, title} = options;)   // in any order. Note the surrounding (), if there is no prefixing let, then {} will be regarded as a code block by js engine, rather than destructuring assignment.
title, w, h;	// "Menu", 100, 200
delete options.width;
delete options.height;
({width = 100, height: h=200, title} = options;)    // default value, can also be function
({title, ...rest} = options;)	// the ... pattern, rest will be an object
rest.width;	// 100
rest.height;	// 200
options = {
    size: {
	width: 100,
	height: 200,
    },
    items: ["Cake", "Donut"],
    extra: true,
};

let {
    size: {
	width,
	height,
    },
    item: [item1, item2],
    title = "Menu"
} = options;	// nested destructuring


b = 2;
x = 3 - (a = b + 1) // 0
x++;
--x;
x += 3; x -= 3; x *= 3; x /= 3;
x = 1+2, 3+4;	    // 3
x = (1+2, 3+4);	    // 7

/// bit operation
x = ~2;	// bitwise NOT: it converts a number to a 32-bit int, and then reverses all bits in its binary representation. So: ~n = -(n+1)
~4294967295 = 0;    // due to 32-bit truncation

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
NaN != NaN;

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

// string
let str = 'Hello\nworld'
str[0],	str.charAt(0);	// H: 0-based
str[str.length - 1];	// the last char
str[str.length + 1];	// undefined
str.charAt(str.length+1);   // ""

str.indexOf('Hello');	// 0
str.indexOf('hello');	// -1; not found
str.indexOf('o', 5);	// 7: begin from position 5
str.lastIndexOf(substr, postion);   // search in reversed order

str.slice(start [, end]);   // start < end, negative value means count from the end (both need to be negative)
str.slice(2, 4);	// "ll"
str.slice(4, 2);	// ""
str.slice(-5);		// "world"
str.slice(-5, -1);	// "worl"
str.slice(-5, 0);	// ""
str.substring(start [, end]);	// almost the same as slice, but it allows start > end. negative number are treated as 0
str.substring(2, 4);	// "ll"
str.substring(4, 2);	// "ll"
str.substring(-4, 2);	// "he"
str.substr(start [, length]);	// negative means to count from the end

for (char of 'Hello') {	// loop through a string
    ...
}

// compound data structure
/// array -- mutable
let arr = new Array(2);	// create a new array with length 2, but all elements undefined.
let arr = []

let fruits = ["apple", "orange", "plum"];
fruits[0];  // 0-based
arr = ['apple', { name: 'John'}, true, function() {alert('Hello');} ];
arr[3]();

fruits.length;	// a property, not a method; 
fruits.slice([start,] [end]);	// not includes end, negative allowed
fruits.pop();	// remove the last element
fruits.push("pear" [, ...]);	// append an element
fruits.shift();	// remove the first element
fruits.unshft("apple" [, ...]);	// add an element to the beginning of the array
fruits.concat(arg1, arg2...);	// concat array with new elements or array


for (fruit of fruits) {	// loop through only the numeric elements
    ...
}

fruits.forEach(function(item, index, array){
    ...
});

let matrix = [	// multi-dim arrasy
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
];
matrix[1][1];	// 5

arr = [1, 2, 3];
String(arr) == "1,2,3";
[1] + 1;    // "11"

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

function fun(arg1 = value1, arg2 = value2, ...) {
    return expression;
}

function fun({	// use destructuring assignment as funciton parameters
    arg1 = "value1",
    arg2: a2 = "value2",
    item: [item1, item2]
} = {}) {
    ...
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

/// constructed with a function
user = new function() {
    this.name = "John";
    this.aget = 30;
    ...
};

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

for ([key, value] of Object.entries(user)){
    ...
};


