<?php
if (preg_match('/\.(?:png|jpg|jpeg|gif)$/', $_SERVER["REQUEST_URI"])) {
    return false;   // serve the requested resource as-is
} else {
    echo "<p>Welcome to PHP</p>";
}

// detect server type
if (php_sapi_name() == 'cli-server') {
    echo "<p>This is php cli-server</p>";
    // return false;
}

// handling unsupported ft
$path = pathinfo($_SERVER["SCRIPT_FILENAME"]);
if ($path["extension"] == "el") {
    header("Content-Type: text/x-script.elisp");
    readfile($_SERVER["SCRIPT_FILENAME"]);
} else {
    return FALSE;
}

?>
