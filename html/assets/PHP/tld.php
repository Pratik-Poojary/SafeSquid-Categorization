<?php

require_once('assets/regDomain/effectiveTLDs.inc.php');
require_once('assets/regDomain/regDomain.inc.php');

// TLD for given website
function url () {
    $domain = "";
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // collect value of input field
        $domain = strtolower(htmlspecialchars($_REQUEST['Categories']));
    }
    $registeredDomain = getRegisteredDomain($domain, $tldTree);
    if ( $registeredDomain != NULL ) {
        return $registeredDomain;
    }
}   

?>