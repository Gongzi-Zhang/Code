<?php
    /* four ways to extract data from a MySQL result */
    mysql_fetch_row();   // this creates an ordinary (numeric index) array from
    // the current row

    mysql_fetch_assoc();  // creates an associative array 

    mysql_fetch_object();  // can be used to get numeric or associative arrays,
    // based on a parameter.

    mysql_fetch_object();  // returns a PHP object corresponding to the current
    // row. Each field in the row is a property of the object.
?>
