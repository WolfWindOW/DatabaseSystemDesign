<?php
//missing connection to db for now
$sku_question = $_GET["sku"];
$total_count_question = $_GET["total_count"];
$piece_count_question = $_GET["piece_count"];
$pallet_type_question = $_GET["pallet_type"];
//$customer_id_question = $_GET["customer_id"];

//Test for inputing variables
//echo "<h2>you inputed: $sku_question $total_count_question $piece_count_question $pallet_type_question</h2>";

$sql = "INSERT INTO Product (SKU, Total_count, Piece_count, Pallet_type) VALUES ('sku', 'total_count', 'piece_count', 'pallet_type')";
$result = $mysqli->query($sql);


?>
<a href="index.php">Return to main page</a>
