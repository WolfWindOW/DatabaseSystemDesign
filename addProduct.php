<?php
session_start();
$conn = mysqli_connect("localhost", "root", "", "warehouse_management");

$sku_question = $_GET["sku"];
$customer_question = $_GET["customer"];
$pallet_count_question = $_GET["pallet_count"];
$unit_count_question = $_GET["unit_count"];
$unit_type_question = $_GET["unit_type"];

//Test for inputing variables
//echo "<h2>you inputed: $sku_question $customer_question $pallet_count_question $unit_count_question $unit_type_question</h2>";

$sql = "INSERT INTO Product (SKU, Customer, Pallet_count, Unit_count, Unit_type) VALUES ('$sku_question','$customer_question',$pallet_count_question,$unit_count_question,'$unit_type_question')";
$result = mysqli_query($conn, $sql);

$conn->close();

?>
<a href="index.php">Return to main page</a>
