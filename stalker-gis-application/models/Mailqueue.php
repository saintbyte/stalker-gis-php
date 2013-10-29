<?php
class Application_Model_Mailqueue  extends Zend_Db_Table_Abstract
{
    protected  $_name = 'mailqueue';
    protected  $_primary = 'id';
    private $_URL = 'www.stalker-gis.ru/smail/';
    public function  __construct()  {
        parent::__construct();
    }
    
    public function getforSend($count)
    {
    $sl = $this->Select();
    $sl->where('sended= 0');
    $sl->order('create_datetime');
    $sl->order('prior DESC');
    $sl->limit($count);
    $data = $this->fetchAll($sl);
    if ($data) {
        return $data->toArray();
    } else {
        return false;
    }
    }
    public function getByKey($key)
    {
        $key = mysql_escape_string($key);
        $sl = $this->Select();
        $sl->where('unkey=?',$key);
        $sl->limit(1);
        $data = $this->fetchRow($sl);
        if ($data) {
          return $data->toArray();
        } else {
          return false;
        }
    }
    public function setSendResult($id,$result)
    {
        $this->update( array(
                            'send_datetime' => new Zend_Db_Expr(' NOW() '),
                            'sended'        => 1,
                            'result'        => intval($result)
                     ),
                     'id='.$id
                     );
    }   
    public function AddtoQueue($to,$subject,$body,$prior=0,$ishtml=true,$header='',$from='')
    {
        $this->insert( array(
            'to' => $to,
            'from' => $from,
            'header' => $header,
            'subject' => $subject,
            'body' => $body,
            'sended' => 0,
            'create_datetime' => new Zend_Db_Expr(' NOW() '),
            'result' => 0,
            'ishtml' =>$ishtml,
            'msgtype' => 0,
            'prior' => $prior
        ) );
    }   
    public function AddsmstoQueue($to,$body,$prior=0,$ishtml=true,$header='',$from='')
    {
        $key = md5(uniqid(''));
        $fix_arr = array('%link%'=>$this->_URL.$key);
        $subject = ' ';
        $body = strtr($body,$fix_arr);
        $this->insert( array(
            'to' => $to,
            'from' => $from,
            'header' => $header,
            'subject' => $subject,
            'body' => $body,
            'sended' => 0,
            'create_datetime' => new Zend_Db_Expr(' NOW() '),
            'result' => 0,
            'ishtml' =>$ishtml,
            'msgtype' => 1,
            'unkey' => $key,
            'prior' => $prior
        ) );
    }   
    public function AddG2SMtoQueue($to,$subject,$body,$prior=0,$ishtml=true,$header='',$from='')
    {
        $key = md5(uniqid(''));
        $fix_arr = array('%link%'=>$this->_URL.$key);
        $body = strtr($body,$fix_arr);
        $this->insert( array(
            'to' => $to,
            'from' => $from,
            'header' => $header,
            'subject' => $subject,
            'body' => $body,
            'sended' => 0,
            'create_datetime' => new Zend_Db_Expr(' NOW() '),
            'result' => 0,
            'ishtml' =>$ishtml,
            'msgtype' => 2,
            'unkey' => $key,
            'prior' => $prior
        ) );
    }        
    public function AddSmsOverMailtoQueue($to,$subject,$body,$prior=0,$header='',$from='')
    {
        $key = md5(uniqid(''));
        $fix_arr = array('%link%'=>$this->_URL.$key);
        $body = strtr($body,$fix_arr);
        $this->insert( array(
            'to' => $to,
            'from' => $from,
            'header' => $header,
            'subject' => $subject,
            'body' => $body,
            'sended' => 0,
            'create_datetime' => new Zend_Db_Expr(' NOW() '),
            'result' => 0,
            'ishtml' => false,
            'msgtype' => 3,
            'unkey' => $key,
            'prior' => $prior
        ) );
    }   
}
