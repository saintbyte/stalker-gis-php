<?php
/*
CREATE TABLE IF NOT EXISTS `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `dev_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `version` int(11) NOT NULL,
  `md5` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `path` text COLLATE utf8_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

*/
class Application_Model_Files extends Zend_Db_Table_Abstract
{
    protected  $_name = 'files';
    protected  $_primary = 'id';
    private    $_quote;
    public     $last_error;
    public function  __construct()  {
        parent::__construct();
        $this->_quote = new Application_Model_User_Quotes();
    }
    public function add($uid,$dev_id,$path,$local_file_path)
    {
      $this->last_error = '';
      $md5 =md5_file($local_file_path);
      $size = filesize($local_file_path);
      if ($this->_quote->verfQuote($uid,$size)) 
      {
	$this->insert(array(
		    'uid' => $uid,
		    'dev_id' => $dev_id,
		    'md5' => $md5,
		    'path' => $path,
		    'data' => $local_file_path
                   ));
        return true;
      }
      else 
      {
	$this->last_error = 'Over Quote';
	return false;
      }
    }
}
