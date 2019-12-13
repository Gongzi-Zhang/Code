<?php
echo "Hello PHP\n";
if ($inipath = php_ini_loaded_file()) {
    echo "Loaded php.ini: " . $inipath . "\n";
} else {
    echo "A php.ini file is not loaded\n";
}

if ($filelist = php_ini_scanned_files()) {
    if (strlen($filelist) > 0) {
	$files = explode(',', $filelist);

	foreach ($files as $file) {
	    echo "<li>" . trim($file) . "</li>\n";
	}
    } else {
	echo "No other config file\n";
    }
} else {
    echo "No other config file\n";
}
phpinfo();
?>
