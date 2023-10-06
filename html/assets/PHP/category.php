<?php
    require_once('connectdatabase.php');
    
    $sql = isset($_POST['query']) ? $conn->real_escape_string($_POST['query']) : '';

    $result = $conn->query("select * from wc where category like '%" . $sql ."%'");
    $rows = array();
    while($row = $result->fetch_assoc()) {
        $rows[] = ($row);
    }
    echo json_encode($rows);
    $result->close();
    $conn->close();
?>
