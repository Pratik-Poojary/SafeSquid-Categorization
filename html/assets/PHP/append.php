<?php 
if ($_POST) {
    if(isset($_POST["rrid"])){
        $rrid = $_POST["rrid"];
    }
    if(isset($_POST["TLD"])){
        $TLD = $_POST["TLD"];
    }
    if(isset($_POST["record"])){
        $record = $_POST["record"];
    }if (empty ($record)){
            $record = "www";
        }
    if(isset($_POST["recordvalue"])){
        $list= $_POST["recordvalue"];
    }
    $category_id = implode(', ', $list);
    include_once('connectdatabase.php');

    $sql = "INSERT INTO $soa (origin,ns,mbox,serial)
    VALUES ('$TLD.urlbl.in.','ns.$TLD','mail.$TLD','20220911')"; 

    if ($conn->query($sql) !== TRUE) {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $sql_soa = "SELECT * FROM $soa WHERE origin='$TLD.urlbl.in.'";
    $result_soa = $conn->query($sql_soa);

    if ($result_soa->num_rows > 0) {
        // validate database
        while($row = $result_soa->fetch_assoc()) {
            $id = $row['id'];
            $sql_rr_add = "INSERT INTO $rr (zone,name,type,data,aux) values ('$id','$record','TXT','$category_id','10')";
            $sql_rr_str = "INSERT INTO $rr (zone,name,type,data,aux) values ('$id','*','TXT','$category_id','10')";
            $sql_rr_tdl = "INSERT INTO $rr (zone,name,type,data,aux) values ('$id','$TLD.urlbl.in.','CNAME','$category_id','10')";
            
            if ($conn->query($sql_rr_add) !== TRUE); if ($conn->query($sql_rr_str) !== TRUE); if ($conn->query($sql_rr_tdl) !== TRUE){
                echo "Error: Check SQL Syntax". $conn->error;
            }else {
                header("Cache-Control: no-cache, no-store, must-revalidate"); // HTTP 1.1.
                header("Expires: 0");
                
            }
            
        }
    }
echo "<meta http-equiv='refresh' content='0'>" ;
$conn->close();
}
?> 