"use strict"

alert("Hello World");

// primitive data type
let x;
x = null;	// null type
typeof null;	// object; this is wrong

x = undefined;	// undefined type

x = true;	// boolean
x = false;

x = 1;		// numbers
x = 1.;
x = Infinity;
x = -Infinity;
x = NaN;

const x = "hello world";	// string
x = `hello world`;

// expression
let a, b, c, x, y, z;
let name;
x = ${1 + 2}
x = ${name}

// "" convert to string in addition (only in addition)
x = "" + 1 + 0;	    // "10"
x = "" - 1 + 0;	    // -1
x = 2 + 2 + "1";    // "41"
x = "2" + "3";	    // "23"
x = +"2" + +"3";    // 5
b = 2;
x = 3 - (a = b + 1) // 0
x++;
--x;
x += 3; x -= 3; x *= 3; x /= 3;
x = 1+2, 3+4;	    // 3
x = (1+2, 3+4);	    // 7

debugger;   // suspend code execution here
// 0, false, "", null, undefined
0 == false;	    // true
0 === false;	    // false

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
for (begin; condiiton; step;) {
    ...
}

switch (condtion) {
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
