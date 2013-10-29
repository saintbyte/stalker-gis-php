#!/usr/bin/php
<?php
chdir('/home/sbm/stalker-gis-application/');
// Define path to application directory
define('APPLICATION_PATH', '/home/sbm/stalker-gis-application');
//defined(/home/sbm/stalker-gis-application/')
//    || define('APPLICATION_PATH', realpath(dirname(__FILE__) . '/../st-application'));

// Define application environment
defined('APPLICATION_ENV')
    || define('APPLICATION_ENV', (getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'production'));

// Ensure library/ is on include_path
set_include_path(implode(PATH_SEPARATOR, array(
    realpath(APPLICATION_PATH . '/../library'),'Z:','../../../','D:\web\Zend\library','/home/sbm/'.
    get_include_path(),
)));
require_once('Zend/Config/Ini.php');
require_once('Zend/Mail.php');
require_once('Zend/Db.php');
require_once('Zend/Db/Table/Abstract.php');
require_once('Zend/Db/Table.php');
require_once('Zend/Date.php');
require_once(APPLICATION_PATH.'/models/Mailqueue.php');
require_once(APPLICATION_PATH.'/models/Pointtag.php');
require_once(APPLICATION_PATH.'/models/Wiki.php');

$config = new Zend_Config_Ini(APPLICATION_PATH.'/configs/application.ini','production');
//------------------------------------------------------------
$db = Zend_Db::factory($config->resources->db->adapter, array (
    'host'     => $config->resources->db->params->host,
    'username' => $config->resources->db->params->username,
    'password' => $config->resources->db->params->password,
    'dbname'   => $config->resources->db->params->dbname,
    'driver_options' =>  $config->resources->db->params->driver_options,
    'charset' =>  $config->resources->db->params->charset,
));
Zend_Db_Table::setDefaultAdapter($db);
//------------------------------------------------------------
$mq = new Application_Model_Mailqueue();
require('sms_day.php');

