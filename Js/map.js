// map is a collection of keyed data items, just like an object. The main difference is that map allows keys of any type; like map function in C++
// any type means NaN can also be used as key, map uses the SameValueZero algorithm so that NaN == NaN.
let map = new Map();
map = new Map([
    ['1', 'str'],
    [1,	  'num'],
    [true, 'bool'],
]);

let obj = {
    name: "John",
    age: 30,
};
map = new Map(Object.entries(obj));
map.get('name');

map.set(key, vlaue);
map.get(key);
map.has(key);
map.delete(key);
map.clear();
map.size;   // property, not method


// iteration
map.keys(); // returns an iterable for keys
map.values(); // returns an iterable for values
map.entries();	// returns an iterable for entries [key, value]
map.forEach( (value, key, map) => {
    ...
});
for (a of map) {
    ...
};  // which equlas to
for (a of map.entries()) {
    ...
};


// weakMap
/*  1. allows only object as keys
 *  2. the object exists in the weakMap while it is reachable from somewhere else, otherwise, it will be garbage collected (even though the weakMap still refers to it) -- the specific garbage collection is engine dependent
 *  3. It doesn't support iteration or methods: keys(), values(), entries()
 *  4. it hsa only the following methods: .get(key); .set(key, value); .delete(key); .has(key);
 */
