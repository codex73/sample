<?php
/**
 * @author Francis Suarez
 * @copyright 2011
 * 
 */
error_reporting(E_ALL ^ E_WARNING ^ E_NOTICE);
session_start();
include ('clue_class.php');
$listz = new BaseByte();
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" itemscope itemtype="http://schema.org/Product">
<!-- Good old - Made IN USA by Francis Suarez -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta itemprop="name" content="Sugarpad - micro notes">
<meta itemprop="description" content="Clean and simple concept to help you make quick note or snippets you could use in many ways.">
<meta itemprop="image" content="http://sugarpad.com/img/sugarpad.jpg">
<title>SugarPad - micro notes</title>
<link href='http://fonts.googleapis.com/css?family=Nunito:300,400,700' rel='stylesheet' type='text/css' />
<link href="/css/sheet.css" rel="stylesheet" type="text/css" />
<!--[if IE]> 
<link href="/css/ie.css" rel="stylesheet" type="text/css" />
<![endif]--> 
<script src="/js/jquery-1.6.2.min.js"></script>
<script src="/js/jquery.cookie.js"></script>
<script src="/js/bx.js"></script>
<script src="/js/jquery-ui-1.8.16.custom.min.js"></script>
</head>
<body>

    
	<div id="title_text">
		<form id="postentry" method="post" name="postentry">
		<span id="ltitle_display"><?php echo $listz->ltitle($listz->sid); ?></span><span id="leditlink"> <a href="javascript:void(0)" id="tedit">Edit</a></span>              
		<input type="text" id="list_title" name="ltittle" class="normal" value="<?php echo $listz->ltitle($listz->sid); ?>" />        
		<input id="lbut" type="button" value="Save" /><span id="action_load"><img src="/img/ajax-loader.gif" /></span>
	</div>

	<div id="inputer">
		<div id="tittle">            
			<div id="tittle_in">
				<input type="text" id="tittle_ent" name="tittle" class="normal" />
				<input type="hidden" name="nextinline" id="nextinline" value="rr" />
				<input type="hidden" name="sid" value="<?php echo $listz->sid; ?>" />
				<input type="hidden" name="nonroot" value="<?php echo $listz->nonroot; ?>" />
			</div>
			<div id="fire">
				<input id="firebut" type="submit" value="ADD IT!" />
				<?php if ($listz->nonroot <> true) { ?>
				<input id="savebut" type="button" value="SAVE" />
				<?php } ?>                
				</form>
			</div>
		</div>           
	</div>

	<div id="boxer">
		<?php $listz->return_boxees(); ?>
        <?php $listz->return_lists(); ?>

	</div>
	<div style="clear:both;"></div>
	<div style="float: left; width: 500px; position: absolute; bottom: 0;" id="info"><span id="updatemsg"></span><span id="thoughts"></span><span id="deletemsg"></span></div>
	<div style="float: left; width: 100px; position: absolute; left: 560px; bottom: 0;" id="foot1"><span id="hidetop">+Canvas</span></div>
	<div style="float: left; position: absolute; left: 700px; bottom: 5px;" id="foot2">

	</div>
	<div style="clear:both"></div>
    <!--
<div id="footer">Feedback?</div>
    <div id="feed1">
    <iframe src="https://spreadsheets.google.com/spreadsheet/embeddedform?formkey=dHgyWUM1TWthell2VWhyYVJrd2pCNkE6MQ" width="760" height="623" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>
    </div> 
-->

<?php
//echo 'cookie: '.$_COOKIE['sid'].'<br>';
//echo 'sidurl: '.$listz->sid.'<br>';
//print_r($_SESSION);

?>


</body>


</html>