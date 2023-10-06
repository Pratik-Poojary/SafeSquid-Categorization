<?php
include_once('connectdatabase.php');

$sql = "SELECT * FROM wc ORDER by Category_id";
$result = $conn->query($sql);

while($row = $result->fetch_assoc()){
    echo "<tr>";
    echo "<td>".$row['Category_id']."</td>";
    echo "<td>".$row['Category']."</td>";
    echo "<td>".$row['Descriptions']."</td>";
    echo "</tr>";
}
?>  
