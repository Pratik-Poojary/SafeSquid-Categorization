<?php 
if ($_POST) {
$rrid = $_POST["rrid"];
$TLD = $_POST["TLD"];
$record = $_POST["record"];
$list = $_POST["recordvalue"];
$category_id = implode(', ', $list);
include_once('connectdatabase.php');

$sql_rec = "UPDATE $rr SET name='$record' WHERE id=$rrid";
echo "\n";
$sql_cat = "UPDATE $rr SET data='$category_id' WHERE id=$rrid";


echo $sql_cat;
echo $sql_rec;

if ($conn->query($sql_rec) !== TRUE); if ($conn->query($sql_cat) !== TRUE) {
  echo "Error updating record: " . $conn->error;
}
}
?>