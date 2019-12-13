// objects are copied by reference, not by value; so copying an object variable creates one more reference to the same object.

// constructor: new
function User(name) {
    this.name = name;
    this.isAdmin = false;
};
let user = new User("Jack");
user.name, user.isAdmin;
/*  when a function is executed with enw, it does the following steps:
 *  1. A new empty object is created and assigned to this
 *  2. the funciton body executes, which usually will modify this
 *  3. the value of this is returned
 *
 *  So the abaove function equals to:
 */

function User(name) {
    this = {};	// implicitly

    this.name = name;
    this.isAdmin = false;

    return this; // implicitly
};
/* Technically, any function can be used as a constructor. */
/* return value:
 * 1. if return is called with an object, then the object is returned instead of this
 * 2. if return is called with a primitive, it's ignored
 */
// by specification, object property keys can only be string or symbol, not any other type
let user = {
    8: 89,  // equal to "8": 89
}
// two objects are equal only if they are the same object (copy by reference)
{} != {}, {} !== {}   // two empty objects, not the same one


// Clone: There is no easy way to clone an object, you have to do tedious job to create a new object and then iterate through each property of the old object. 
// one possible walk around is:
Object.assign(dest, [src1, src2, src3...])  // all arguments are objects
let dest = {};
let name = "John";
Object.assign(dest, {name});	// clone an anonymous object
let permission1 = {view: true};
let permission2 = {edit: true};
Object.assign(dest, permission1, permission2);
// now dest = {name: "John", view: true, edit: true}

// with this method, the same name property will be overwritten
// just a shorter version of
for (obj in [src1, src2, src3...]){
    for (property in obj){
	dest[property] = obj[property];
    }
}
// notice that this only works for primitive value, is a value is an object, then the clone method will fail, because it simply copy the reference; to fix that, we need to check the data type of each value, if it is an object, then replicate its structure as well, which is called "deep cloning".
function clone(dest, [src1, src2, src3...]){
    for (obj in [src1, src2, src3...]){
	for (property in obj){
	    if (typeof(obj[property] === "object")){
		dest[property] = clone({}, obj[property]);
	    } else {
		dest[property] = obj[property];
	    }
	}
    }
}


Object.keys(obj);   // return an array of keys, ignoring symbolic keys
Object.values(obj); // return an array of values, ignoring symbolic properties
Object.entries(obj);	// returns an array of key/value pairs for an object exactly in that format, ignoring symbolic properties
Object.fromEntries(map);    // create an object from an array of [key, value] pairs
Object.getOwnPropertySymbols(obj);  // get all symbols
Reflect.ownKeys(obj);	// return all keys of an object including symbolic ones

Object.assign({}, obj);	// this assignment include symbolic keys

Object.is(NaN, NaN) === true;	// though NaN != NaN
Object.is(0, -0)    === false;	// though 0 == -0
Object.is(a, b);    // for other cases, equals to: a === b

// conversion
/* To do the conversion, Js tries to find and call three object methods:
 * 1. obj[Symbol.toPrimitive](hint) if it exists
 * 2. Otherwise if hint is "string": obj.toString() and obj.valueOf(), whatever exists
 * 3. Otherwise if hint is "number" or "default": obj.valueOf() and obj.toString(), whatever exists.
 *
 * As we can see, the conversion doesnot necessarily return the "hinted" primitive
 */
/// "string": when used as keys or apply a function that expects a string, like alert
alert(obj);
anotherObj[obj] = 123;

/// "number": when doing a math
let num = Number(obj);

let n = +obj;	// unary mathematical operation
let delta = obj1 - obj2;    // binary operation

let greater = obj1 > obj2;  // comparison

/// "default": when the operator is not sure what type to expect, like binary plus '+':: the same as number

// Iterable
/// for ... of loop:
/// 1. when it starts, it calls the Symbol.iterator method, which return an iterator -- an object with the next() method . (just return the iterator, but not any value, the first value comes with next() method).
/// 2. onward, the loop works only with that returned iterator; when it wants the next value, it calls next() on that object.
/// 3. the result of next() must have the form {done: boolean, value: val}, where done=true means that the iteration is finished, otherwise val is the next value.
/// from rule 1, we know that the object don't need to have next() method directly, of course, it can have if the returned object is the object itself.
let range = {
    from: 1,
    to: 5,
};

range[Symbol.iterator] = function() {
    return {
	current: this.from,
	last: this.to,

	next() {
	    if (this.current <= this.last) {
		return {done: false, value: this.current++};
	    } else {
		return {done: true};
	    }
	}
    };
};

range = {
    from: 1,
    to: 5,

    [Symbol.iterator]() {
	this.current: this.from,
	return this,
    },
    next() {
	if (this.current <= this.to) {
	    return {done: false, value: this.current++};
	} else {
	    return {done: true};
	}
    }
};
// one of the disadvantage is with this is that you can't operator two for..of loops over this object simultaneously

