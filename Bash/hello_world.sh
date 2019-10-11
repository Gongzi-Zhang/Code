#!/bin/bash

# primitive type
## bash has only one primitive type: string, everything is a string
echo hello world

a=hello
a+=world
a=true	# these are also string, but can be converted to boolean when needed
a=false
a=1	# also string, but can be converted to numbers by mathematical expression

## expression
a=b
b=c
echo $a		# b
echo ${!a}	# c, ${b}: indirect reference

## conversion: but it does can do limited math and logical operation when needed using proper conversion.
### let [$(())]: integer only, expects only one parameter
a=1
let 'a = a + 1'

let bin=2#11;	let oct=017;	let hex=0xff; let b32=32#77;	let b64=64#@_
# scientific expression is not supported
let a++;    let a--
let ++a;    let --a
let b=+a;   let b=-a
let b='!a'; let b=~a;	# logical and bitwise negation
let b=a**2
let b*=a;   let b/=a;	let b%=a;
let b+=a;   let b-=a
let 'a<<=2';	let 'a>>=2';	# bitwise shift
let "b = b>a";	let 'b = b<a';	let 'b = b>=a';	let 'b = b<= a'
let 'b = b==a';	let 'b = b!= a';
let b&=a    # bitwise and
let b^=a
let b|=a
let 'b = b && a'    # logical and
let 'b = b || a'   
let 'b = b>a ? b : a'	# conditional operator

### boolean: string will be converted to boolean when necessary
a=true
if $a; then echo "true"; fi
a=false
if $a; then echo "false"; fi

### comparison
[ z > a ] && [ a > Z ] && [ Z > A ] && [ A > 9 ] && [ 9 > 1 ] && [ 1 > 0 ] 

# array
declare -a a=( hello world )
a+=( good )
echo ${a[0]} ${a[0+1]}
echo $a	    # "hello"
a=( [0]="hello" [11]="$word" [20]="world" )
a[25-2]="hello world"

IFS=. read -a ip <<< "127.0.0.1"    # read in an array; separated by .

## associate array
declare -A a=( [a]=hello [b]=world )
a[c]='hello world'
echo ${a[a]}


# flow control
if command; then    # when command returns 0, then conditional body will be executed; two exceptions are true/false
    ...
elif command; then
    ...
else
    ...
fi

case var in
    pattern1 | pattern2)
	command;;
    pattern3)
	command;;
    defautl)
	command;;
esac

select var in values; do
    ...
done

for (( local i=0; i<${#var}; i++ )); do
    ...
done

for var in values; do
    ...
done

while command; do
    ...
done

until conmmand; do
    ...
done


# func
function fun{
    ...
}

fun() {
    ...
}
