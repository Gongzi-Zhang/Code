server related php variables and functions.

<h2>superglobals</h2>

you are using <?php echo $_SERVER['HTTP_USER_AGENT'] ?>

<?php
echo hello world
?>


<h1>Variables from External Sources</h1>

<h2>GET method</h2>
for an example url as: http://www.example.com/test.php?id=3
<?php
echo $_GET['id'];
?>

<h2>data from form</h2>
Assume such form: <br/>
<form action="foo.php"> 
    Name:	<input type="text" name="username" /><br />
    Email:	<input type="text" name="email" /><br />
    Dot and Space:  <input type="text" name="dot.space "><br />
    Valid array syntax:   <input type="text" name="foo[bar]baz"><br />
    <input type="submit" name="submit" value="Submit me!" />
</form>
The two way to access data from HTML form:
<?php
echo $_POST['username'];
echo $_REQUEST['username'];
echo $_REQUEST["dot_space_"];	# dot and space are converted to underscores
echo $_REQUEST['foo']['bar'];	# trailing chars are ignored
?>

<h2>data from submitted image</h2>
<input type="image" src="image.gif" name="sub" />
<?php
echo $_REQUEST[sub_x].$_REQUEST[sub_y];	# the actual variable names sent by the browser are sub.x and sub.y
?>

<h2>Cookies</h2>
Cookies are part of the HTTP header, so the SetCookie function must be called before any output is sent to the browser. 
<?php
setcookie("MyCookie[foo]", 'Testing 1', time()+3600);
setcookie("MyCookie[bar]", 'Testing 2', time()+3600);
?>

<?php
echo $_COOKIE['MyCookie']['foo'];
?>
