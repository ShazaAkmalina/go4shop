<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Dating Coach</title>
</head>
<body>
<?php

//session_start();
//require("config.php");
//if(isset($_SESSION['SESS_ADMINLOGGEDIN'])) {
//header("Location: " . $config_basedir."adminorders.php");
//}
//if(isset($_POST['submit']))
//{
//$loginsql = "SELECT * FROM admin WHERE username = '" . $_POST['username'] . "' AND password = '" . sha1($_POST['password']). "'";
//$loginres = mysql_query($loginsql) or die(mysql_error());
//$numrows = mysql_num_rows($loginres);
//if($numrows == 1)
//{
//$loginrow = mysql_fetch_assoc($loginres);
//$_SESSION['SESS_ADMINLOGGEDIN'] = 1;
//header("Location: " . $config_basedir . "adminorders.php");
//}
//else
//{
//header("Location: " . $config_basedir . "adminlogin.php?error=1");
//}
//}
//else
//{
//
//echo "<h1>Admin Login</h1>";
//if(@$_GET['error'] == 1) {
//echo "<strong>Incorrect username/password!</strong>";
//}
//}

require('config.php');
session_start();
if (isset($_POST['username'])){
    $username = $_POST['username'];
    $password = $_POST['password'];
    $username = stripslashes($username);
    $username = mysql_real_escape_string($username);
    $password = stripslashes($password);
    $password = mysql_real_escape_string($password);
    $query = "SELECT * FROM logins WHERE username='$username' and password='".md5($password)."'";
	$result = mysql_query($query) or die(mysql_error());
	$rows = mysql_num_rows($result);
    if($rows==1){
    	$_SESSION['username'] = $username;
    	header("Location: index.php");
        $_SESSION['SESS_LOGGEDIN'] = 1;
        $_SESSION['SESS_USERNAME'] = $rows['username'];
        $_SESSION['SESS_USERID'] = $rows['id'];
        $ordersql = "SELECT id FROM orders WHERE customer_id = " . $_SESSION['SESS_USERID'] . " AND status < 2";
        $orderres = mysql_query($ordersql);
        $orderrow = mysql_fetch_assoc($orderres);
        $_SESSION['SESS_ORDERNUM'] = $orderrow['id'];
        header("Location: " . $config_basedir);
    }else{
        require('header.php');
    	echo "<div class='form'><h3>Username/password is incorrect.</h3><br/>Click here to <a href='login.php'>Login</a></div>";
    }
}else{
    require("header.php");
?> 
<h1>Login</h1>
<form action="" method="post" name="login">
    <table>
    <tr>
        <td>Username</td>
            <td><input type="text" name="username" required/>
    </tr>
    <tr>
        <td>Password</td>
            <td><input type="password" name="password" required/>
    </tr>
    <tr>
        <td></td>    
            <td><input name="submit" type="submit" value="Login"/>
    </tr>
</form>
<p>Not registered yet? <a href='register.php'>Register Here</a></p>
</div>
<?php } ?>
</body>
</html>

