<?php

/**
 * @author Francisco Suarez
 * @copyright 2011
 */

##DB CONFIG
$runner = basename($_SERVER["SERVER_NAME"],'.net');

switch($runner){
    case 'sugarpad.localhost':
    $env = 'l';
    break;

    case 'bonco':
    $env = 'l';
    break;
    
    case 'projectx.com':
    $env = 'l';
    break;
    
    case 'sugarpad.com':
    $env = '2';
    break;
    
    case 'www.sugarpad.com':
    $env = '2';
    break;
    
    case 'codex73.0fees':
    $env = '';
    break;
    
    default:
    $env = '1';
    break;
    
}


?>
