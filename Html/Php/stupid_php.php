<!--Stupid PHP-->
<!--2019-06-27-->
<?php
$DAYS = array("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat");
$day = "Tue";
$index = 0;
for ($i=0; $i<7; $i++) {
    if (strcmp($day, $DAYS[$i])) $index = $i;
}
echo $index;	
/* you will get 6 rather than 2, because $index is not assigned value until 
 * the loop returns, when i=6 (the next loop break the check condition), 
 * so $index = 6.
 */

// if you do it another way:
for ($i=0; $i<7; $i++) {
    if (strcmp($day, $DAYS[$i])) {
	$index = $i;
	break;
    }
}
echo $index;	
/* then you will get 0. because break stop the loop, so everything is cleared */

// So to get index in an array, you have to use:
array_search($day, $DAYS);  // this ruturns 2;
?>
