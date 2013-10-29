<?php
class Application_Model_Smsnum2email
{ 
  /*
  79126040062 -> "79126040062" <79126040062@sms.ural.mts.ru>, 
  791260
  79527274099 -> 79527274099@sms.ycc.ru, 
  795272
  */
  private $_num;
  private $_email;
  private $_domain;
  private $fix_arr = array(
                          '7912' => 'sms.ural.mts.ru',
                          '7952' => 'sms.ycc.ru',
                          '7904' => 'sms.ycc.ru',
                          );
  public function __construct($num)
  {
    $this->_num = (string)$num;
    $this->_domain = false;
    $this->_email = 'xxx@xxxx';
    foreach ($this->fix_arr as $k => $v)
    {
      print $k . '=>'.$v.'/['.$this->_num."]\r\n";
      $r = strpos($this->_num,(string)$k);
      print 'result:='.$r . "=\r\n";
      if ($r !== false)
      {
        print '$result !== false';
        if ($result < 3) 
        {
          $this->_domain  = $v;
          $this->_email = $this->_num.'@'.$this->_domain;
          print 'RETURN THIS';
          return $this;
        }
      }
      print "+_____________________________\r\n";
    }
  }
  public function getEmail()
  {
    return $this->_email;
  }
}
