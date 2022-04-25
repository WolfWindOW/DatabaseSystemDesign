<!DOCTYPE html>
<html>
  
<head>
    <title>Employee View page</title>
</head>
<body>
	<center>
		<?php
			function employeeView(){
				session_start();
				$conn = mysqli_connect("localhost", "root", "", "warehouse_management");
				if($conn === false){
					die("ERROR: Could not connect. " 
						. mysqli_connect_error());
				}
				$SKU =  $_REQUEST['SKU'];
				$select = mysqli_query($conn, "SELECT Location, Pallet_count, Loc_unit_count FROM location WHERE SKU = '".$_POST['SKU']."' ");
				if (mysqli_num_rows($select) > 0) {
				 // output data of each row
				while($row = mysqli_fetch_assoc($select)) {
					echo "Location: " . $row["Location"]. " - Pallet Count: " . $row["Pallet_count"]. " - Location Unit Count: " . $row["Loc_unit_count"]. "<br>";
				}
				} else {
					echo "0 results";
				}
				$conn->close();
			}

			employeeView();
			
		?>
	</center>
</body>
  
</html>