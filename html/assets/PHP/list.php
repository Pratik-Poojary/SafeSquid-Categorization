<?php

require_once("tld.php");

function checkCategory ($TLD) {
    // return empty if $TLD is not found.
    if (empty($TLD)) {
        return;
    }

    $errorHandler = "error:";
    // Test if string contains the word 
    if(strpos($TLD, $errorHandler) !== false){
        return;
    }

    include_once('connectdatabase.php');
    $sql_soa = "SELECT * FROM soa WHERE origin='$TLD.urlbl.in.'";
    $result_soa = $conn->query($sql_soa);

    if ($result_soa->num_rows > 0) {
        // validate database
        while($row = $result_soa->fetch_assoc()) {
            $id = $row['id'];

            $sql_rr = "SELECT * FROM rr WHERE zone='$id'";
            $result_rr = $conn->query($sql_rr);
            //get data number
                if ($result_rr->num_rows > 0) {
                // zone out
                $n = 0;
                echo "<div id='magicsuggest' class='MasterRecord'>";
                $rows = array();
                $zone = "";
                while($row = $result_rr->fetch_assoc()) {
                    $rows[] = ($row);
                    $n++;
                    $formid="formcat$n";
                    $btnid="btnid$n";
                    $zone = "$row[zone]";
                    echo "<div class=record>";
                        echo "<form class='form' id='$formid'>";
                            echo "<div class='form-record'>";
                                echo "<input type='text' class='recordname' name='record' value='$row[name]' />";
                                echo "<input type='hidden' name='TLD' value='$TLD'>";
                                echo "<input type='hidden' name='rrid' value='$row[id]'>";
                            echo "</div>";
                            echo "<div class='form-record-value'>";
                                echo "<input type='text' class='recordvalue' name='recordvalue' value='[ $row[data] ]' />";
                            echo "</div>";
                            echo "<button type='button' id='$btnid' onclick='updatecat(this.id)'>Update</button>";
                        echo "</form>";
                    echo "</div>";                   
                }  echo "</div>";
            } echo "<button value='$zone' onclick='loadForm(this.value)'> <i class='fa fa-plus-square'> </i></button>";
        }

    } else {
            echo "<div id='magicsuggest'>";
            echo "Zone Not Found!";
            echo "<br>";
            echo "<div class=addrecord>";
            echo "<form class='form' id='formid'>";
            echo "<div class='form-record'>";
                    echo "<input type='text' class='recordname' name='record'>";
                    echo "<input type='hidden' name='TLD' value='$TLD'>";
                echo "</div>";
                echo "<div class='form-record-value'>";
                    echo "<input type='text' class='recordvalue' name='recordvalue'>";
                echo "</div>";
                echo "<button type='button' id='btnid' onclick='addzone(this.id)'>Add</button>";
            echo "</form>";
        echo "</div>";  
    }   echo "</div>";
    
}
?>
