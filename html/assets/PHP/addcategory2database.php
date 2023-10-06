<?php 
if ($_POST)
{

    // Required field names
    $required = array('Category', 'Description');

    // Loop over field names, make sure each one exists and is not empty
    $error = false;
    foreach($required as $field) {
        if (empty($_POST[$field])) {
            $error = true;
        }
    }


    if ($error) {
    include_once('connectdatabase.php');
    echo "Please Add Category & it's Description.";
    } else {
        include_once('connectdatabase.php');
        $category = $_POST["Category"];
        $Desc = $_POST["Description"];
        $sql = "INSERT IGNORE INTO $wc (Category,Descriptions)  VALUES ('$category', '$Desc')";
        if ($conn->query($sql) !== TRUE){
            echo "Error Adding record: " . $conn->error;
        }
        $conn->close();
    }   
}
?> 