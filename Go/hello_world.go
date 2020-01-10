package main

import "fmt"
import ("time"
	"math/rand"
	"math/cmplx"
	"io"
	"strings"
)

// when not explicitly initialized, var are given zero value of their type: 
// false for boolean, 0 for numeric and "" for string, nil for pointer
var t, f bool = true, false

var x int, x8 int8, x16 int16, x32 int32, x64 int64
var y uint, y8 uint8, y16 uint16, y32 uint32, y64 uint64
var z byte  // alias for uint8
var u rune  // alias for int32; Unicode code point
var v1 float32, v2 float64
var w1 complex64, w2 complex128 = cmplx.Sqrt(-5 + 12i)

var s string = "hello world"

// type conversion is explicit: Type(value)
v1 = float32(u)

// constants
const Pi = 3.14	// constant can't be declared using the := syntax
const (
    Big = 1 << 100
    Small = Big >> 99
)

// pointer
var i int = 42
var p *int = &i
*p = 21
fmt.Println(*p)


// struct: collection of fields
type Vertex struct {
    X int
    Y int
}
var v Vertex = Vertex{1, 2}
v.X = 4
/// pointer of vertex
var p *Vertex = &v
(*p).Y = 10 // this is cumbersome
p.Y = 10    // syntax sugar: go will interpret it as (*p).Y = 10

// array and slice
func array() {
    // arrays: fixed size
    var arr [5]int = [1, 2, 3, 4, 5]
    arr[0] = 6	// 0 based
    /// array literal
    p := [6]int{2, 3, 4, 5, 6, 7}


    // slice: varied size
    var slice []int = arr[1:4]	// half open: include the first one, but exclude the last one
    /// slice doesn't store any data, it likes a view of the underlying array; change the elements of a slice modifies the corresponding elements of the underlying array; other slices that share the same array will also see the changes
    /// make: create a zeroed array and return a slice that refers to that array
    a := make([]int, 5)	// len(a)=5
    b := make([]int, 0, 5)  // len(b)=0, cap(b)=5

    /// slice literal
    var s []int	// nil slice
    s == nil
    q := []int{2, 3, 5, 7, 11, 13}
    r := []bool{true, false, true, false, true, false}
    s := []struct {
	i int
	b bool
    }{
	{2, true},
	{3, false},
	{5, true},
	{7, true},
	{11, false},
	{13, true},
    }

    /// default bounds
    var a [10]int
    a[0:10] == a[:10] == a[0:] == a[:]

    /// length and capacity of a slice
    len(s)  // the number of elements a slice contains
    cap(s)  // the number of elements in the underlying array, counting from the first element in the slice

    /// re-slicing
    s := []int{2, 3, 5, 7, 11, 13}  // len=6; cap=6
    s = s[:0]	// len=0; cap=6
    s = s[:4]	// len=4; cap=6; here we can extend the slice because the underlying capicity is 6
    s = s[2:]	// len=2; cap=4

    /// slices of slices
    board := [][]string {
	[]string{"_", "_", "_"},
	[]string{"_", "_", "_"},
	[]string{"_", "_", "_"},
    }

    /// appending to a slice
    append(s []T, vs ... T) []T	    // if the backing array of s is too small to fit all the given values, a bigger array will be allocated, and then return slice that refers to the newly allocated array

    /// iterate over a slice (map): range
    pow := []int{1, 2, 4, 8, 16, 32, 64, 128}
    for i, v := range pow {
	...
    }
    for i := range pow {    // index only, omit the value
	...
    }
}

func maps() {
    // a nil map has no keys, nor can keys be added
    var m map[string]int
    m = make(map[string]int)
    m["Bobs"] = 100

    // map literals
    var m = map[string]int{
	"Bell": 10,
	"Google": 20,
    }

    // delete an element
    delete(m, key)

    elem, ok = m[key]
    // if key is in m, ok is true; otherwise ok is false, elem is the zero value for the map's element type
}

func main() {
    w := "word"	// short assignment, only available inside a function, declare with implicit type
    fmt.Println("Hello, World!")
    fmt.Println("The time is", time.Now())
    fmt.Println(rand.Intn(10))
    math.Sqrt(7)
    a, b = swap("hello", "world")
}

Exported    // only Capitalized names are exported (can be used by other packages)

// functions: arguments passed as value
/// post-parameter type
func add(x int, y int) int {
    return x + y
}
/// consecutive parameter type
func add(x, y int) int {    // omit the consecutive parameter type
    return x + y
}
/// function literal: kind of anonymous function
func(a, b int) { return a*b}(3, 4)

/// multiple returns
func swap(x, y string) (string, string) {
    return y, x
}

/// named return 
func split(sum int) (x, y int) {
    x = sum * 4 / 9
    y = sum - x
    return  // a return statement without arguments returns the named return values!!! BAD, don't do this
}

/// Defer: defer the execution of a function until the surrounding func returns; but the arguments are evaluated immediately
/*  1. A deferred function's arguments are evaluated when the defer statement is evaluated
    2. defer stack: LIFO
    3. deferred functions mya read and assign to the returning value
*/
func defer_func () {
    defer fmt.Println("world")

    fmt.Println("Hello")

    // defer stack: all deferred funcitons all push into a stack
    fmt.Println("counting")

    for i:= 0; i<10; i++ {
	defer fmt.Println(i)
    }

    fmt.Println("done")
}

fun c() (i int) {
    defer func() { i++ }()  // the return value is 2
    return 1
}
/// func as function argument
func compute(fn func(float64, float64) float64) float64 {
    return fn(3, 4)
}

/// closures
/// a closure is a function that references variables from outside its body. The function may access and assign to the referenced variables
func adder() func(int) int {	// return a closure
    sum := 0
    return func(x int) int {
	sum += x
	return sum  // each closure is bound to its own sum variable
    }
}

// control flows
/// if
if x < 0 {  // no parentheses, but {} is required
    ...
} else {
    ...
}
//// initialization for if
if v :=  math.Pow(x, n); v < lim {
    ...
}


/// switch
switch os := runtime.GOOS; os {
case "darwin":
    ...
case "linux":
    ...
default:
    ...
}
//// switch with no condition: which equals to switch true
switch {    // switch true
case 1:
    ...
case 2:
    ...
default:
    ...
}
/// loop: for
for i := 0; i<10; i++ {	// no parentheses around conditions; {} are required
    sum += i
}

/// simulated while
for sum < 1000 {
    sum += sum
}

//// forever running
for {
    ...
}

func methods() {
    // methods: go doesn't have classes. However, you can define methods on types
    /// A method is a function with a special receiver argument (like the self/this in other programming language), which appears between the func keyword and the method name
    func (v Vertex) Abs() float64 {
	return math.Sqrt(v.X*v.X + v.Y*v.Y)
    }
    /// you can only decalre a method with a receiver whose type is defined in the same package as the method; you can't declare a method with a receiver whose type is defined in another package (which includes the built-in types such as int)
    /// so if you want to declare a method for some built-in type; you need to create your own version
    type MyFloat float64
    func (f MyFloat) Abs() float64 {
	if f < 0 {
	    return float64(-f)
	}
	return float64(f)
    }

    /// pointer receivers
    /// the pointer must be the pointer of some *real* type, rather than pointer of a pointer
    /// methods with pointer receivers can modify the value to which the receiver points. while value receiver can't
    func (v *Vertex) Scale(f float64) {
	v.X = v.X * f
	v.Y = v.Y * f
    }

    /// calling a pointer receiver
    v := Vertex{3, 4}
    p := &Vertex{4, 3}
    v.Scale(3)	// syntax sugar: go will interpret it as (&v).Scale(3)
    p.Scale(3)
    /// the reverse also works: call a value receiver method with a pointer
    v.Abs()
    p.Abs() // go will interpret it as (*p).Abs()

    /// interface: an interface type is defined as a set of method signatures; a value of interface type can hold any value that implements those methods
    type Abser interface {
	Abs() float64
    }

    var a Abser
    f :=  float64(-math.Sqrt(2))
    v := Vertex{3, 4}

    a = f   // a float64 implementation of Abser
    a = &v  // a *Vertex implementation of Abser

    a.Abs()

    func (f float64) Abs() float64 {
	if f<0 {
	    return float64(-f)
	}
	return float64(f)
    }

    func (v *Vertex) Abs() float64 {
	return math.Sqrt(v.X*v.X + v.Y*v.Y)
    }

    /// an interface value can be though of as a tuple of (value, type) with the value in tuple being the concrete value of specific type
    /// nil value: an interface value that hold nil concrete value of some type is itself-non nil
    /// a nil interface value holds neither value nor concrete type. Calling a method on a nil interface is a run-time error 

    /// empty interface
    var i interface{}
    describe(i)	// (<nil>, <nil>)

    i = 42
    describe(i)	// (42, int)
    /// An empty intreface may hold values of any type (every type implements at least zero methods)

    /// type assertion: return an interface value's underlying concrete value
    t := i.(T)	    // if i doesn't hold type T, it will trigger a panic
    t, ok := i.(T)  // test if i holds type T; if not, t will be the zero value of type T and ok being false; and no panic occurs

    /// type switch: test type in series
    switch v := i.(type) {
    case T:
	...
    case S:
	...
    default:
	...
    }
}
