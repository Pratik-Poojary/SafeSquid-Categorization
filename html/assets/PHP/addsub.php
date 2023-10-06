<?php 
if ($_POST) {
include_once('connectdatabase.php');
$zone = $_POST["zone"];
$record = $_POST["record"];
$list= $_POST["recordvalue"];
$category_id = implode(', ', $list);

$sql = "INSERT INTO $rr (zone,name,type,data,aux) VALUES ('$zone','$record','TXT','$category_id','10');";

if ($conn->query($sql) !== TRUE) {
  echo "Error updating record: " . $conn->error;
}
}
?>