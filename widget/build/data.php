<?php

$host = $_SERVER['HTTP_HOST'];

switch ($host) {
	case 'localhost':

		$cta_url 	= '/prueba-tu-metabolismo/';
		$cta_url_b 	= '/evaluacion-gratis/';
		break;

	case 'www.rebajar.com':

		$cta_url 	= '/prueba-tu-metabolismo/';
		$cta_url_b 	= '/evaluacion-gratis/';
		break;

	case 'www.metabolismotv.com':

		$cta_url 	= 'http://www.rebajar.com/prueba-tu-metabolismo/';
		$cta_url_b 	= 'http://www.rebajar.com/evaluacion-gratis/';
		break;

	case 'diabetessinproblemas.com':

		$cta_url 	= '/prueba-tu-metabolismo/';
		$cta_url_b 	= '/evaluacion-gratis/';
		break;
	
	default:
		$cta_url 	= 'http://www.rebajar.com/prueba-tu-metabolismo/';
		$cta_url_b 	= 'http://www.rebajar.com/evaluacion-gratis/';
		break;
}



$widget_content = <<<ETE
    <a class="nat-widget-close"></a>
    <div class="the_lead-content">

        <h2>&iquest;Interesa una <br/><span class="item-call">Prueba de<br/>Metabolismo</span> 
        <br/>online gratís?</h2>
        <div id="nw-engage"><a href="$cta_url" >COMENZAR PRUEBA</a></div>
        <div id="nw-sec-cta">
        <a href="$cta_url_b" id="nw-sec-cta-b">Evaluación Gratís</a></div>

    </div>
ETE;

if ($_GET['callback']) {
	$caller = $_GET['callback'];
	echo $caller . "({'html': '" . urlencode(trim($widget_content)) . "' })";
}

?>