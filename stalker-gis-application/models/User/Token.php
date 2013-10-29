<?php
/*
CREATE TABLE IF NOT EXISTS `userstoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  app_id   int(11) NOT NULL,
  `token` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
*/
class Application_Model_User_Token extends Zend_Db_Table 
{

  protected  $_name = 'userstoken';
  protected  $_primary = 'id';

  public $user_id;
  public $app_id;
  public $acode;
  public function  __construct()  {
        parent::__construct();
  }
  public function setForUser($user_id,$app_id=1)
  {
    $this->user_id = $user_id;
    $this->app_id = $app_id;
    if ($this->app_id == 0)
    {
        $token = $user_id.'_'.md5(uniqid(''));
    } else
    {
        $token = $user_id.'_'.$app_id.'_'.md5(uniqid(''));
    }
    $dt = $this->getByUserId($this->user_id,$this->app_id);
    //var_dump($dt);
    if (!$dt) {
      $this->insert(array(
                      'userid' => $this->user_id,
                      'app_id' => $this->app_id,
                      'token'  => $token
                   )
                   );
    } else {
            $where = $this->getAdapter()->quoteInto('userid ='.intval($this->user_id).' AND app_id='.intval($this->app_id),'');
            $this->update(array(
                      'token'  => $token,
                      'userid' => $this->user_id,
                      'app_id' => $this->app_id,
                      ),
                      $where
                   );
    }
    return $token;
  }
  public function getByUserId($user_id,$app_id=0)
  {
      ///die($user_id.','.intval($app_id));
      $sl = $this->Select()->where('userid ='.intval($user_id).' AND app_id='.intval($app_id));
      //print '<pre>'; var_dump($sl); print '</pre>';
      $dt = $this->fetchRow($sl);
      return $dt;

  }
  public function getByToken($token)
  {
    $arr = explode('_',$token);
    //die($arr[0]);
    $user_id = $arr[0];
    if (count($arr) == 2)
    {
        $user_id = $arr[0];
        $app_id = 0;
    }
    else
    {
        $user_id = $arr[0];
        $app_id = $arr[1];
    }
    $dt = $this->getByUserId($user_id,$app_id);
    $dt = $dt->toArray();
    if ($dt['token'] == $token) { return $dt; }
    else { return false; }
  }
}
