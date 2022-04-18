<!DOCTYPE html>
<html>
  
<head>
    <title>Insert Page page</title>
</head>
  
<body>
    <center>
        <?php
  
        // servername => localhost
        // username => root
        // password => empty
        // database name => staff
        $conn = mysqli_connect("localhost", "root", "", "warehouse");
          
        // Check connection
        if($conn === false){
            die("ERROR: Could not connect. " 
                . mysqli_connect_error());
        }
          
        // Taking all 5 values from the form data(input)
        $username =  $_REQUEST['username'];
        $password = $_REQUEST['password'];
          
        // Performing insert query execution
        // here our table name is college
        $select = mysqli_query($conn, "SELECT * FROM users WHERE username = '".$_POST['username']."' AND password = '".$_POST['password']."'");
        
        if(mysqli_num_rows($select)) {
            echo "This username already exists";
        }
        else {
            echo "No credentials matching input";
        }
        // Close connection
        mysqli_close($conn);
        ?>
    </center>
</body>
  
</html>