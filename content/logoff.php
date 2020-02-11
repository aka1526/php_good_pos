<?php
// Initialize the session.
// If you are using session_name("something"), don't forget it now!
session_start();
   $_SESSION["pos_user"]  = ""; 
 $_SESSION["pos_login"] = false;
 $_SESSION["pos_staff"] = false;
// Finally, destroy the session.
session_destroy();
header("Location: logon.php"); 
?>