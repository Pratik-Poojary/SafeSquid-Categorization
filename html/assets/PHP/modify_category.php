<?php
require_once('../regDomain/effectiveTLDs.inc.php');
require_once('../regDomain/regDomain.inc.php');
include_once('connectdatabase.php');


//Get data from to modify category textarea be added or bluk updated to the category database, 
$data = json_decode(file_get_contents('php://input'), true);
$categoryId = $data["webCategory"][0];
$web = $data["website"];

function addToDatabase ($conn,$TLD,$category_id,$record) {


    $sql_soa = "SELECT * FROM soa WHERE origin='$TLD.urlbl.in.'";
    $result_soa = $conn->query($sql_soa);

    if ($result_soa->num_rows === 0) {
        $sql = "INSERT IGNORE INTO soa (origin,ns,mbox,serial)
        VALUES ('$TLD.urlbl.in.','ns.$TLD','mail.$TLD','20220911')"; 

        if ($conn->query($sql) !== TRUE) {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }

    $sql_soa = "SELECT * FROM soa WHERE origin='$TLD.urlbl.in.'";
    $result_soa = $conn->query($sql_soa);
    
    if ($result_soa->num_rows > 0) {
        // validate database
        while($row = $result_soa->fetch_assoc()) {
            $id = $row['id'];
            echo $id;
            $sql_rr_add = "INSERT IGNORE INTO rr (zone,name,type,data,aux) values ('$id','$record','TXT','$category_id','10')";
            $sql_rr_str = "INSERT IGNORE INTO rr (zone,name,type,data,aux) values ('$id','*','TXT','$category_id','10')";
            $sql_rr_tdl = "INSERT IGNORE INTO rr (zone,name,type,data,aux) values ('$id','$TLD.urlbl.in.','CNAME','$category_id','10')";
            
            if ($conn->query($sql_rr_add) !== TRUE); if ($conn->query($sql_rr_str) !== TRUE); if ($conn->query($sql_rr_tdl) !== TRUE){
                echo "Error: Check SQL Syntax". $conn->error;
            }else {
                header("Cache-Control: no-cache, no-store, must-revalidate"); // HTTP 1.1.
                header("Expires: 0");
                
            }
            
        }
    
    }
}

if (!empty($web)) {
    foreach($web as $key => $website) {

        $registeredDomain = getRegisteredDomain($website, $tldTree);
        if ( $registeredDomain === $website ) {
            $record = "www";
            addToDatabase($conn,$registeredDomain,$categoryId,$record);
        } else {
            $record = rtrim(str_replace($registeredDomain, "", $website), '.');
            addToDatabase($conn,$registeredDomain,$categoryId,$record);
        }
    }
    $conn->close();
} else {
    echo "No data received.";
}
?>