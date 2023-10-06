<?php
    $servername = "127.0.0.1";
    $username = "mydns_admin";
    $password = "GHTKevUK7NSSSf75Qp";
    $dbname = "mydns";
    global $soa;
    $soa = "soa";
    global $rr;
    $rr = "rr";
    global $wc;
    $wc = "wc";
    // Create connection
    global $conn;
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
?>

    
