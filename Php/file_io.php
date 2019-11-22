<?php
$data = file("filename.csv"); // the file function open a file and places 
// all the contents in an array, placing each line in its own element of the
// array.
foreach ($data as $line){  
    $lineArray = explode("\t", $line);
    list($fName, $lName, $email, $phone) = $lineArray; /* assign the value 
	of an array to corresponding variable in list, the list() construct 
	works only on numerically indexed arrays and assumes that the array 
	index begins at 0. if you want to use it with associative arrays, 
    surround the array variable with the array_values() function. */
}
?>
