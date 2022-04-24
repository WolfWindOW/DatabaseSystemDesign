<!DOCTYPE html>
<html>
  
<head>
    <title>Insert Page page</title>
</head>
  
<body>
    <center>
        <?php
        session_start();
        // servername => localhost
        // username => root
        // password => empty
        // database name => staff
        $conn = mysqli_connect("localhost", "root", "", "warehouse_management");
          
        // Check connection
        if($conn === false){
            die("ERROR: Could not connect. " 
                . mysqli_connect_error());
        }
          
        // Taking all values from the form data(input)
        $username =  $_REQUEST['username'];
        $password = $_REQUEST['password'];
          
        // Performing insert query execution
        // here our table name is college
        $select = mysqli_query($conn, "SELECT * FROM customer WHERE CUSTOMER = '".$_POST['username']."' AND Cust_pass = '".$_POST['password']."'");
        if(mysqli_num_rows($select)) {
            ob_start();
	    header("Location: /test/customerView.php");
	    ob_end_flush();
	    exit;
        }
        else {
	    $select = mysqli_query($conn, "SELECT * FROM emp_information WHERE Emp_ID = '".$_POST['username']."' AND Emp_pass = '".$_POST['password']."'");
            if(mysqli_num_rows($select)) {
            	echo "Hello Employee!";
            }
	    else echo "No credentials matching input";
        }
        // Close connection
        mysqli_close($conn);
        ?>
    </center>
</body>
  
</html>