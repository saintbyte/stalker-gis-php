<?php
/*
CREATE TABLE IF NOT EXISTS `quotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `cur` int(11) NOT NULL,
  `quote` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

*/
class Application_Model_User_Quotes extends Zend_Db_Table 
{

  protected  $_name = 'quotes';
  protected  $_primary = 'id';

  public $user_id;
  public $app_id;
  public $acode;
  public function  __construct()  {
        parent::__construct();
  }
  public function verfQuote($uid,$plus_bytes)
  {
    return true;
  }
  
  public function addToQuote($uid,$plus_bytes)
  {
    $cur = $this->getCur($uid);
    $cur = $cur + $plus_bytes;
    $this->setCur($uid,$cur);
  }
  
  public function setCur($uid,$bytes)
  {
  
  }
  public function getCur($uid)
  {
  
  }
}