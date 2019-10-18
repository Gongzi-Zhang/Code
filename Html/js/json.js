// JS Object Notaion
let json = `{
  name: "John",                     // mistake: property name without quotes
  "surname": 'Smith',               // mistake: single quotes in value (must be double)
  'isAdmin': false                  // mistake: single quotes in key (must be double)
  "birthday": new Date(2000, 2, 3), // mistake: no "new" is allowed, only bare values
  "friends": [0,1,2,3]              // here all fine
}`;

let json = JSON.stringify(value [, replacer, space]);
/*  replacer: array of properties to encode or a mapping function; if it s funciton, it will get every key/value pair including nested objects and array items; it is applied recursively
 *  space: amount of space used for indentation
 */
JSON.stringify(1);  // number: 1
JSON.stringify('test');	// string: "test"
JSON.stringify(true);	// boolean: true
JSON.stringify([1, 2, 3]);	// array: [1, 2, 3]
JSON.stringify(obj);	// object; skip function properties, symbolic properties and properties that store undefioned
// circular reference will throw up errors


// toJSON(): object may customized this funciton to be called by JSON.stringigy()




// decoding
JSON.parse(str [, reviver]);	// reviver is the optional function(key, value) that will be applied to each key/value pair, which may transform the value
