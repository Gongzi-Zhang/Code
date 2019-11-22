package hello_world
// default imports: kotlin
import kotlin.*
import kotlin.annotation.*
import kotlin.collections.*
import kotlin.comparisons.*
import kotlin.io.*
import kotlin.ranges.*
import kotlin.sequences.*
import kotlin.text.*
// platform depended packages
/// JVM
import java.lang.*
import kotlin.jvm.*
/// JS:
import kotlin.js.*


fun main() {
    println("Hello World!")
}

// data type
/// string
val s = "Hello, World!\n"   // excaped string
val text = """
    for (c in "foo")
	print(c)
"""	    // raw string

// pointer: null value

// type check
if (obj is String) { ... }

// variables that can be reassigned
var x = 5   // Int type is inferred
x += 1
println("sum of $a and $b is ${a+b}")

fun sum(a: Int, b: Int): Int {
    return a + b
}

// read only local variables (static in C)
val a: Int = 1
val b = 2   // Int type is inferred
val c: Int
c =  3	    // deferred assignment

/// swapping two variables
var a = 1 
var b = 2
a = b.also { b = a }

// operator: no ternary operator in kotlin
var x = expression ?: val2
/// bitwise operators
val x = (1 shl 2) and 0x000FF00
shl(bits)   // signed shift left
shr(bits)   // signed shift right
ushr(bits)  // unsigned shift right
and(bits)   // bitwise and
or(bit)	    // bitwise or
xor(bit)    // bitwise xor
inv()	    // bitwise inversion

// comparison
-0.0 < 0.0
NaN > POSITIVE_INFINITY
NaN == NaN
// list
val items = listOf("apple", "banana", "kiwifruit")
// filtering a list
list.filter(x -> x > 0)
list.filter(it > 0)

for ((k,v) in map) {
    println("$k -> $v")
}

// map
val map = mapOf("a" to 1, "b" to 2, "c" to 3)	// read-only map
println(map["a"])
map["key"] = value

// function
// inferred return type
fun sum(a: Int = 0, b: Int = 1) = a + b

fun maxOf(a: Int, b: Int) = if (a>b) a else b

/// single-expression fun
fun theAnswer() = 42

// TODO()
fun calcTaxes(): BigDecimal = TODO("waiting for implementation")

// Lambda expression
val fruits = listOf("banana", "avocado", "apple", "kiwifruit")
fruits
    .filter { it.startsWith("a") }
    .sortedBy { it }
    .map { it.toUpperCase() }
    .forEach { println(it) }

// control construct
if (expression) {...}
else if (exp) {...}
else {...}

for (item in items) {
    println(item)
}
// range
for (x in 1..10 step 2) { ... }
for (x in 9 downTo 0 step 3) { ... }
for (x in 1 until 100) {...}	// not include 100

// when: switch/case
when (x) {
    is Foo -> ...
    is Bar -> ...
    else   -> ...
}

when {
    "orange" in items -> println("juicy")
    "apple" in items -> println("apple is fine too")
}

/// labels
loop@ for (i in 1..100) {
    for (j in 1..100) {
	if (...) break@loop
    }
}

/// return to a label
/// for inline lambda exp. return to nearest enclosing function
fun foo() {
    listOf(1, 2, 3, 4, 5).forEach {
	if (it==3) return   // return to foo()
	print(it)
    }
}

fun foo() {
    listOf(1, 2, 3, 4, 5).forEach lit@{
	if (it==3) return@lit   // return to the lambda exp.
	print(it)
    }
}

/// implicit label
fun foo() {
    listOf(1, 2, 3, 4, 5).forEach {
	if (it==3) return@forEach   // return to the lambda exp.
	print(it)
    }
}

// class
class Turtle {
    fun penDown()
    fun penUp()
    fun turn(degree: Double)
    fun forward(pixels: Double)
}

val myTurtle = Turtle()
with(myTurtle) {    // calling multiple methods with 'with'
    penDown()
    for (i in 1..4) {
	forward(100.)
	turn(99)
    }
    penUp()
}

/// apply
val myRectange = Rectangel().apply {
    length = 4
    breadth = 5
    color = 0xFAFAFA
}
// try catch
fun test() {
    val result = try {
	count()
    } catch (e: ArithmeticException) {
	throw IllegalStateException(e)
    }
}
