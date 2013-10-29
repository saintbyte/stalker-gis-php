<?php
class Application_Model_Mailaddmessage extends Zend_Db_Table_Abstract
{
    protected  $_name = 'mailaddmessages';
    protected  $_primary = 'id';
    private $cur_id = 0;

    public function  __construct()  {
        parent::__construct();
    }
    public function get()
    {
    $sl = $this->Select();
    $sl->where('sended=0');
    $sl->order('create_date DESC');
    $sl->limit(1);
    $data = $this->fetchRow($sl);
    if ($data)
    {
      $data = $data->toArray();
      $this->cur_id = $data['id'];
      return array(
                    'text' => $data['text'],
                    'html' => $data['html']
                  );
    }
    else
    {
      return false;
    }
    }
    public function setAsSended()
    {
    if (intval($this->cur_id) > 0) {
	$this->update( array(
                            'send_datetime' => new Zend_Db_Expr(' NOW() '),
                            'sended'        => 1,
                     ),
                     'id='.$this->cur_id
                     );
      return true;               
    }else {
      return false;
    }
    }
}
