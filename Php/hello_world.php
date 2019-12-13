#!/usr/bin/php
<?php
// show all errors
error_reporting(E_ALL);
?>

* new features: tag
use the short echo tag <?= 'print this string' ?>
which is enbaled in PHP 5.4 and later, and is equivalent to
<?php echo 'print this string' ?> closing tags automatically implies a semicolon, so we don't need to have a semicolon terminating the last line of s PHP block.

<? echo 'short tags will only work when short_open_tag is enabled'; ?>

<script language="php"> 
    echo 'script tag';
    // not supported in PHP7
</script>

<% 
echo 'You may optionally use ASP-style tags (when enabled vis the asp_tags in php.ini)';
%>
This syntax is removed in PHP7

<h1>hello world</h1>
<?php
echo "Hello World!".PHP_EOL;
print "Hello World!\n";
echo $argc, "\n";
echo $argv[0], "\n";
var_dump($argv);
// echo $argv[1], "\n";

// echo $SERVER['argv'];
echo getcwd(), "\n";

$a = "hello world";
?>

<h1>Types</h1>
<?php
    echo gettype($_bool);
    echo is_bool($_bool) ? "boolean" : "non-boolean";
    echo is_string($_str) ? "string" : "non-string";
    echo is_nan($_var) ? "Non A Number" : "Number";
?>

<h2>Primitive Types</h2>

<h3>boolean</h3>
<?php
    $_bool = TRUE || FALSE;
    $_bool = True || False;    // case insensitive

    // converting to boolean
    (bool) 1; (boolean) 1;
    var_dump((bool) "");    // bool(false)
    if (1 && -2 && 2.3e4 && "any_non_empty_str" && "false" && array(12)) {
	echo "all these are true";
    }
    if (0 || -0 || 0.0 || -0.0 || "" || "0" || array() || NULL) {}
    else { 
	echo "all this converted to false"; 
    }
?>

<h3>integar</h3>
<?php
    $_int = 255;
    $_int = 0b11111111;	// binary
    $_int = 0377;	// octal
    $_int = 0xFF;	// hexadecimal

    // a number beyond the int range (platform-sepcific: 32-bit / 64-bit) will be regarded as float
    # bool -> int 
    (int) true;	// 1
    (integer) false; // 0
    # float -> int (note numbers beyond the bound of int)
    (int) 92233720368547758089866966;	// 0
    (int) NAN;	// 0
    (int) INF;	// 0
    # string -> int: if the string doesn't contain '.', 'e', or 'E'
    $_int = 1 + "10 pigs";  // 11
    $_int = 1 + "bob3";  // 1

    # others
    (int) NULL;	// 0

    $large_number = 9223372036854775808;
    var_dump($large_number);   // float(9223372036854775808)
?>
<h3>float/double</h3>
Consider double the same as float; the two names exist only for historic reasons.
<?php
    $_float = 1.234;
    $_float = 1.2e3;
    $_float = 1E-10;

    // convertion
    # string -> float: if the string contains: '.', 'e' or 'E'
    $_float = 1 + "10.5";
    $_float = 1 + "-1.3e3";
    $_int = 1 + "bob-1.3e3";
    $_float = 1 + "10.2 pigs";	// 11.2

    # others -> float: others -> int -> float
?>
<h3>string</h3>
<?php
    $_str = "foo";
    $_var = "var";
    $_str = 'single quoted string, will not expand $_var';
    $_str = 'multi-lines 
	string';
    $_str = "double quoted string, will expand $_var";

    $_str = <<<EOS
here docs (only ; is allowed after the ending identifier)
it also can expand $_var
EOS;

    $_str = <<<'EOS'
nowdoc: similar to here docs, but no parsing is done inside a newdoc: $_str
EOS;

    // conversion
    # bool -> string
    (string) True;  // "1"
    (string) False;  // ""

    # special type
    (string) NULL;  // ""
    # array -> string
    (string) array();	// "Array": arrays are always converted to the string "Array"
    (string) $arr['foo'];   // to show a single element of an array

    # resource -> string

?>

<h4>string methods</h4>
<?php
    $_str = "string";
    echo $_str[0];  // indexing, 0 based
    echo "{$_str[-1]} == {$_str[strlen($_str) - 1]}";  // 'g': negative-index
    echo $_str{2};  // curly brace also work
    strlen($_str);  
?>

<h2>Special Types</h2>
<h3>resource</h3>
<h3>NULL</h3>

<h2>Compound Types</h2>

<h3>array</h3>
<?php in_array($argv[1], array('--help', '-help', '-h', '-?')); ?>

<h3>object</h3>
<h3>callable</h3>
<h3>iterable</h3>


<h1>Expression</h1>
<h2>variables</h2>
<h3>simple syntax</h3>
<?php
    $_var = "variable";
    echo "$_var or ${_var}s"
?>

<h3>complex (curly) syntax</h3>
<?php
    $_var = "variable";
    echo "{$_var}s"
?>


// io stream
<?php
$stdin = fopen('php://stdin', 'r');
$stdout = fopen('php://stdout', 'w');
$stderr = fopen('php://stderr', 'w');

$line = trim(fgets(STDIN));	    // read one line from STDIN
fscanf(STDIN, "%d\n", $number); // read a number from STDIN
fwrite(STDERR, "stderr\n");
?>



// control flow

// if 
<?php if ($expression == true): ?>
    This will show if the expression is true.
<?php else: ?>
    If the condition is true, this block will be skipped even though it is outside of the PHP open/close tags.
    Otherwiser this will show.
<?php endif: ?>


<?php

/// loop
$books =  array("creating the XHTML Foundation",
    "Styling with CSS",
    "Using Positional CSS for layout",
    "CLient-Side Programming with Javascript",
    "Server-side Programming with PHP",
    "Database with MySQL",
    "Into the Future with AJAX",
    "Moving From Pages to Web Sites");
// use the foreach machanism to simplify printing out the elements
print "<p> \n";
foreach ($books as $book){
    print $book . "<br />\n";
} // end foreach
print "</p> \n";
?>
