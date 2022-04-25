<?php
$conn = mysqli_connect("localhost", "root", "", "warehouse_management");

$stmt = $conn->prepare("INSERT INTO Product (SKU, Customer, Pallet_count, Unit_count, Unit_type) VALUES (?,?,?,?,?)");
$stmt->bind_param("sssss", $_POST['SKU'], $_POST['customer'], $_POST['pallet_count'],$_POST['unit_count'],$_POST['unit_type']);
if($stmt->execute()) echo "Product added <br>";
else echo "Product Cannot be added <br>";


$conn->close();
?>
<a href="index.php">Return to main page</a>