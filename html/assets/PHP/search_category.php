<?php
if ($_POST) {
    if(isset($_POST["recordvalue"])){
        $list= $_POST["recordvalue"];
    }
    $category_id = implode(', ', $list);

    require_once('connectdatabase.php');
    
    $sql = isset($_POST['query']) ? $conn->real_escape_string($_POST['query']) : '';
    $result = $conn->query("SELECT DISTINCT ZONE,name FROM rr WHERE data='51' and type='TXT' and name!='*'");

    //Create an simple array with zone number. 
    while( $arr = mysqli_fetch_assoc($result)){
        $zone_array[] = $arr['ZONE']; // Inside while loop
        $sub_array[] = $arr['name']; // Inside while loop
    }

    //create an array with the list of websites who has same category.
    $emparray = array();
    foreach($zone_array as $key => $zone) {

        $sql = isset($_POST['query']) ? $conn->real_escape_string($_POST['query']) : '';
        $result = $conn->query("SELECT origin FROM soa WHERE id='$zone'");

        while($row =mysqli_fetch_assoc($result))
        {
            $emparray[] = $row;
        }
    }
    //json array with the websites
    echo json_encode($emparray);

    //close the db connection
    mysqli_close($conn);
}
?>