#!/usr/bin/php


// hello world
<?php
echo "Hello World!\n";
print "Hello World!\n";
echo $argc, "\n";
echo $argv[0], "\n";
var_dump($argv);
// echo $argv[1], "\n";

// echo $SERVER['argv'];
echo getcwd(), "\n";

$a = "hello world";
?>



// array
<?php
in_array($argv[1], array('--help', '-help', '-h', '-?'));
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
