<!DOCTYPE html>
<html>
  
<head>
    <title>Customer View Page page</title>
</head>
<body>
	<center>
		<?php
			session_start();
			$conn = mysqli_connect("localhost", "root", "", "warehouse");
			if($conn === false){
				die("ERROR: Could not connect. " 
					. mysqli_connect_error());
			}
			$select = mysqli_query($conn, "SELECT SKU, Total_count, Piece_count FROM product WHERE Customer_ID = '".$_SESSION['username']."' ");
			if (mysqli_num_rows($select) > 0) {
			 // output data of each row
			while($row = mysqli_fetch_assoc($select)) {
				echo "SKU: " . $row["SKU"]. " - Total Count: " . $row["Total_count"]. " - Piece Count: " . $row["Piece_count"]. "<br>";
			}
			} else {
				echo "0 results";
			}
			$conn->close();
		?>
		
	</center>
</body>
  
</html>