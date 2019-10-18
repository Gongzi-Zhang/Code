[ "a", "b", "c", "d"]
 0    1    2    3
 -4  -3   -2   -1

typeof [];  // object
Array.isArray([]);  // true

// destructuring assignment, not desctructive, the original array remains
let arr = ["Ilya", "Middle", "Kantor"];
let [firstName, , surname] = arr;   // ignore elements using commas
alert(firstName);

let arr = Array.from(arrayLike/iterator [,mapFn, thisArg]);   // create array from iterator or array-like objects: which have indexed properties and length

// length: this is actually not the count of values, but the greatest numeric index plus one (similar to lua)
let fruits = ['apple', 'pear', 'peach'];
fruits[123] = "banana";
fruits.length;	// 124: 

/// this property is mutable, so we can change it manually. 
/// if we increase it, nothing interesting happens;
/// if we decrease it, then the array is trucnated (irreversible)
arr = [1, 2, 3, 4, 5];
arr.length = 2;	// truncate to 2 elements
arr;	// [1, 2]

arr.length = 5;	// increase it
arr[3];		// undefined

arr.length = 0;	// clear it

// array is just a special object (ordered), if misused, then their benefirs disappear. Some example of misuse:
arr.text = 5;	// add a non-numeric property
arr[0] = 1, arr[999] = 2;   // make holes
arr[1000] = 1, arr[999] = 2;	// fill the array in the reverse order

// methods
/// splice: Swiss knife: do almost everything with array
arr.splice(postion [, deleteCount [, insertEle1, ... insertEleN]])
arr = [1, 2, 5];
arr.splice(-1, 0, 3, 4);    // also works with negative index
/// concat
/// when concat an object, it the object has no Symbol.isConcatSpreadable property, then it is just concated as an regular element; but if the object has this property, then it is treated as an array by concat, its elements are added then.

// search an array
/// indexOf, lastIndexOf and includes
/// indexOf and lastIndexOf use === comparison
arr.indexOf(item [, from]), arr.lastIndexOf(item [, from]);
arr.includes(item [, from])

arr = [NaN];
arr.indexOf(NaN);   // -1, because NaN !== NaN
arr.includes(NaN);  // true

/// find
arr.find(function(item, index, array){   // find only the first one
    ...
});
arr.findIndex(functioni(item, index, array){
    ...
});
arr.filter(function(item, index, array){   // find an array of all matched elements
    ...
});

/// transform an array
/// map
arr.map(function(item, index, array){	// calls the function for each element and returns the array of results; similar to python's map function
    ...
});
/// reduce
arr.reduce(function(previousValue, item, index, array){
    // previousValue is the result of the previous function call, equals initial ther first time (when provided); if there is no initial value, then the reduce method takes the first element as the initial value and starts the iteration from the 2nd element.
    ...
}, [initial]);

/// sort
arr.sort(); // default sort, compare as string in ascending order
arr.sort(function(){});	// sort according to customized algorithm, similar to python's sort
arr = [1, 15, 2];
arr.sort(); // [1, 15, 2]: because "15" < "2"
function compare(a, b){
    if (a > b) return 1;
    else if (a == b) return 0;
    else return -1;
}
arr.sort(compare);  // [1, 2, 15]
arr.sort( (a, b) => a - b); // more easy way: a comparison func is only required to return a positive number to say "greater" and a negative number to say "less"

arr.reverse();	// reverse sort
arr.reverse(function(){});  // also allow customized ordering

// thisArg: most array methods (except sort) accepts the optional last argument: thisArg, which becomes 'this' for function. This is useful when call a function from an object which use 'this' in the funciton body, otherwise, 'this' will be undefined.
