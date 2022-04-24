<!DOCTYPE html>
<html>
  
<head>
    <title>Customer View Page page</title>
</head>
<body>
	<center>
		<?php
			session_start();
			$conn = mysqli_connect("localhost", "root", "", "warehouse_management");
			if($conn === false){
				die("ERROR: Could not connect. " 
					. mysqli_connect_error());
			}
			$select = mysqli_query($conn, "SELECT SKU, Pallet_count, Unit_count FROM product WHERE Customer = '".$_SESSION['username']."' ");
			if (mysqli_num_rows($select) > 0) {
			 // output data of each row
			while($row = mysqli_fetch_assoc($select)) {
				echo "SKU: " . $row["SKU"]. " - Pallet Count: " . $row["Pallet_count"]. " - Unit Count: " . $row["Unit_count"]. "<br>";
			}
			} else {
				echo "0 results";
			}
			$conn->close();
		?>
		
	</center>
</body>
  
</html>