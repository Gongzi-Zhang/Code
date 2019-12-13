// a set is a special type collection, where each value (no keys) may occur only once
let set = new Set(iterable)
set = new Set(["apple", "banana", "orange"]);
set.add(value);	// append a vlaue
set.delete(value);
set.has(value);
set.clear();
set.size;

set.forEach( (value, valueAgain, set) => {  // note the second parameter: valueAgain, which appears for compatibility with Map, which has three parameters
    ...
});

set.keys(); // returns an iterable object for values
set.values(); // the same as set.keys(); for compatibility with map
set.entries();	//  returns an iterable object for entries [value, value]; for compatibility with map


// weakSet
/*  1. allows only object 
 *  2. the object exists in the weakSet while it is reachable from somewhere else, otherwise, it will be garbage collected (even though the weakSet still refers to it) -- the specific garbage collection is engine dependent
 *  3. It doesn't support iteration or methods: keys(), values(), entries()
 *  4. it hsa only the following methods: add(), has(), and delete()
 */
