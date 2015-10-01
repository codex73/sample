<?php

/**
 * @author Francisco Suarez
 * @copyright 2011
 */

/* This is where you would inject your sql into the database 
but we're just going to format it and send it back 
*/

include('clue_class.php');
$pros = new BaseByte();
$pros->connectdb();

foreach ($_GET['post'] as $position => $item) : 
  $sql = "UPDATE posts SET ordered = '$position' WHERE id = '$item'";
  mysql_query($sql);  
endforeach;
//print_r ($sql); 

?>