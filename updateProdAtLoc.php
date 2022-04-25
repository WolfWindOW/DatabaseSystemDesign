<?php

$conn = mysqli_connect("localhost", "root", "", "warehouse_management");

$stmt = $conn->prepare("UPDATE location SET location.Pallet_count = location.Pallet_count + ? WHERE location.SKU = ? AND location.Location = ?");
$stmt->bind_param("sss", $_POST['pallets_added'], $_POST['SKU'], $_POST['Loc']);
$stmt->execute();


$conn->close();
?>

<html>
   <body>
      
      <form action = "<?php $_PHP_SELF ?>" method = "POST">
         SKU: <input type = "text" name = "SKU" />
         Location: <input type = "text" name = "Loc" />
         Pallets Added: <input type = "number" name = "pallets_added" />
         <input type = "submit" />
      </form>
      
   </body>
</html>

<a href="index.php">Return to main page</a>