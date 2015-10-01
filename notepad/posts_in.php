<?php
/**
 * @author Francis Suarez
 * @copyright 2011
 */
error_reporting(E_WARNING);
session_start();
$referer = parse_url($_SERVER['HTTP_REFERER'], PHP_URL_HOST);
include ('config.php');
include('clue_class.php');
$ajj_obj = new BaseByte();

mysql_connect($dbhost,$dbuser,$dbpass);
mysql_select_db($dbname) or die(mysql_error());

/**
 * foreach($_POST as $k=>$v){
 * 			$$k=$v;
 * 		}
 */

if($_SERVER['REQUEST_METHOD'] <> "POST"&&$_SERVER['REQUEST_METHOD'] <> "GET"){
    header('Location: /');
    ob_end_flush();
    exit();

}elseif($referer <> 'sugarpad.localhost'&&$referer <> 'sugarpad.com'&&$referer <> 'www.sugarpad.com'){
    //echo 'here' . $referer;
    //die("What are you doing?");
    
}    
else
{

$tittle = strip_tags($_POST['tittle']); //Item Content
$ltitle = strip_tags($_POST['ltitle']); //List Title
$sid = $_GET['sid'];
$sid = $_POST['sid'];
$parsed_sid = $ajj_obj->extract_list_id($req_uri,3);//picks the listid from referer
//var_dump($parsed_sid);
$save = $_POST['save']; //Save?
$nonroot = $_POST['nonroot'];
//$ajr = isset($_GET['ajr']);//determines if auto refresh get request by js

/**Refresh Display Ajax Every ____ */
if($ajr){

    !empty($parsed_sid) ? $ajj_obj->sid = $parsed_sid : $ajj_obj->sid = $_SESSION['sid'];
    $ajj_obj->return_boxees();
    exit();
}
/** Update List Title */
if($ltitle){   
    
    
    if($ltitle=='clear'){//clear if empty
        $result = mysql_query("delete from posts_h where lid = '".$sid."';");

    }else{
        $result = mysql_query("update posts_h set name = '".strip_tags($ltitle)."' where lid = '".$sid."';");
    }
    	 
    if (mysql_affected_rows()==0) {
        
    	$result = mysql_query("insert into posts_h (lid, name) values ('".$sid."','".strip_tags($ltitle)."');");
    }   
    
    header("Content-type: application/json");  
    echo json_encode(array('hello'=>'test'));
    exit();
}


/** Save List(activate), Flag = 1 */
if($save){    
    $sql = "update posts set flag = '1' where sid = '$sid';";
    mysql_query($sql);
    $php_array_result = array($sid,$count_return);    
    //Delete Cookie
    setcookie ("sid", "", time() - 3600);
    // Send the correct MIME header and echo out the JSON string
    header("Content-type: application/json");
    echo json_encode($php_array_result);    
    exit();
}

//Normal Posts from Input Box
if(!empty($_POST['tittle'])){    
    if($nonroot==true){ $setflag = '1';}  
    $tittle = $_POST['tittle'];
    $sid = $_POST['sid'];
    unset($_SESSION['msg']);
    $insert=true;
    
    //Find out what is the next note order number for a note in the database.
    $nextinline = $_POST['nextinline'];    
    
    $tittle = mysql_real_escape_string($tittle);
    $sql = "INSERT INTO `posts` (`id`, `tittle`, `rw`, `sid`, `flag`, `date`, `ordered`) VALUES (NULL, '".$tittle."', '10', '".$sid."', '".$setflag."', CURDATE(), '".$nextinline."');";
    if($insert){
    mysql_query($sql);
    }
    $id = mysql_insert_id();
    $php_array_result = array($tittle,$id);
    // Send the correct MIME header and echo out the JSON string
    header("Content-type: application/json");
    echo json_encode($php_array_result);
    exit();
    //echo $tittle.$namee;    
    //header("Location: posts.php");
}elseif (!$_GET['q']){
    //$_SESSION['msg'] = '<font color=\'red\'>enter something!</font><br/>';
    //header("Location: posts.php");
}
//Ajax Request Delete
if(!empty($_GET['q'])){    
    $q = $_GET['q'];
    $sql = "UPDATE posts set flag = '2' where id = '".$q."';";
    mysql_query($sql);
    //echo 'no!';
}

}
?>