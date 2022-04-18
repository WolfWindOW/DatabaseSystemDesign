<?php

// Grab User submitted information
$username = $_POST["user"];
$password = $_POST["pass"];
$servername = "localhost";
$dbname = "warehouse";



// Create connection #servername, username, password, db 
$conn = mysqli_connect($servername, "root", "", $dbname);
// Check connection
if (!$conn) {
   die("Connection failed: " . mysqli_connect_error());
}
$sql = "SELECT username, password  FROM user_info where username=? and password=? and password != null";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $username, $password);
$stmt->execute();


$result = $stmt->get_result();
$check = $result->fetch_assoc();


if(isset($check)){
	
	echo 'success';
}

else
{
	echo 'failure';
}


?>