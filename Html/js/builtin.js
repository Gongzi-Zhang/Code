// operator
typeof id;
+true;		    // 1; a short version of Number
+"";		    // 0

/// this is not bound, it will be evaluated during runtime
function sayHi() {
    alert(this.name);
}
//// when called without an object, this == undefined in strict mode,
function makeUser() {
    return {
	name: "John",
	ref: this,
    }
};
let user = makeUser();
user.ref.name;	    // Error: Cannot read property 'name' of undefined
//// this is not set at object definition, only the moment of call matters
function makeUser() {	// correct version
    return {
	name: "John",
	ref() {
	    return this;
	},
    }
};
let user = makeUser();
user.ref().name;	// "John": funciton call set this a value


// funciton
/// typeof
typeof(id);
typeof undefined    // "undefined"
typeof 0	    // "number"
typeof true	    // "boolean"
typeof "foo"	    // "string"
typeof Symbol("id") // "symbol"
typeof Math	    // "object"
typeof null	    // "string"
typeof alert	    // "function"

String(undefined);  // "undefined"
String(null);	    // "null"
String(NaN);	    // "NaN"
String(true);	    // "true"

Number(undefined);  // NaN
Number(null);	    // 0
Number(true);	    // 1
Number(false);	    // 0
Number("");	    // 0
Number("123");	    // 123
Number("123z");	    // NaN

Boolean(undefined); // false
Boolean(null);	    // false
Boolean(NaN);	    // false
Boolean(1);	    // true
Boolean(0);	    // false
Boolean("hello");   // true
Boolean("");	    // false

// objects
Math


// IO
/// prompt
let value = prompt("What's your name?");
value = prompt("What's your name?", "John");	// default value
