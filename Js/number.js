use strict

// methods of 
let n = 1.23456;
n.toFixed(2);	// "1.23": round to the given precision

n = 255;
// n.toString(base): the base varies from 2 to 36, default is 10
n.toString(16);	// base: 16;	"ff"
n.toString(2);	// base: 2;	"11111111"
123456..toString(36);	// "2n9c"; 2 dots notation
(123456).toString(36);


// test: isNaN, isFinite: convert their argument to a number and then test it
isNaN(NaN);	// true
isNaN("str");	// true

isFinite("15");	// true
isFinite("str");	// false
isFinite(Infinity);	// false


// conversion to number
parseInt('100px');  // 100
parseInt('12.3');   // 12
parseFloat('12.5em');	// 12.5
parseFloat('12.3.4');   // 12.3
// optional second argument as base
parseInt('0xff', 16);	// 255
parseInt('ff', 16);	// 255

// Math
Math.ceil(n);
Math.floor(n);
Math.round(n);
Math.trunc(n);

Math.random();
Math.Max(a, b, c...), Math.Min(a, b, c...)
Math.pow(n, power)
