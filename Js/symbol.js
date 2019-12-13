//  Symbols allow us to create "hidden" properties of an object, that no other part of code can accidentally access or overwrite.

// symbols make isolation between different party's usage of some shared code, avoid possible overwritten;

// "hiding" principle: invisible to most libraries, built-in functions and syntax constructs
let id = Symbol("id");
id.description;	    // id
id.toString();


// global symbols: make sure the same name return the same symbol
/// get symbol by name
let gId1 = Symbol.for("id"); // to read (create if absent) a symbol from the registry
let gId2 = Symbol.for("id");
gId1 == gId2;
/// get name by symbol
Symbol.keyFor(gId1);	// "id"; this function uses the global symbol registry to look up the key for the symbol, so it doesn't work for non-global symbols
Symbol.keyFor(gId);	// underfined; for undefined or non-global symbols

// System symbols
Symbol.hasInstance
Symbol.isConcatSpreadable
Symbol.iterator
Symbol.toPrimitive
