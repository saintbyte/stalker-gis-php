<?php
//------------------------------
$f = fopen('access.log','a');
fwrite($f,time()."\n");
fwrite($f,$_SERVER['REQUEST_URI']."\n");
fwrite($f,$_SERVER['REMOTE_ADDR']."\n");
fwrite($f,"__________________________\n");
fclose($f);
//------------------------------
// Define path to application directory
defined('APPLICATION_PATH')
    || define('APPLICATION_PATH', realpath(dirname(__FILE__) . '/../../stalker-gis-application'));

// Define application environment
defined('APPLICATION_ENV')
    || define('APPLICATION_ENV', (getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'production'));

// Ensure library/ is on include_path
set_include_path(implode(PATH_SEPARATOR, array('/home/sbm',
    realpath(APPLICATION_PATH . '/../../library'),
    get_include_path(),
)));

/** Zend_Application */
require_once 'Zend/Application.php';

// Create application, bootstrap, and run
$application = new Zend_Application(
    APPLICATION_ENV,
    APPLICATION_PATH . '/configs/application.ini'
);
$application->bootstrap()
            ->run();
