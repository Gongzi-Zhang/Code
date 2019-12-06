// modifiers
public || protected || private || internal
expect || actual
final || open || abstract || sealed || const
external
override
lateinit
tailrec
vararg
suspend
inner
enum || annotation
companion
inline
operator
data

// annotations
@Named("Foo")
private val foo: Foo

@Target(AnnotationTarget.PROPERTY)
annotation class JsonExclude

@JsonExclude @JvmField
var x: String

@Test fun foo() {...}

@file:JvmName("FooBar")

package foo.bar
