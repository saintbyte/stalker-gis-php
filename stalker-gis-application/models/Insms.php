<?php
class Application_Model_Insms extends Zend_Db_Table_Abstract
{
    protected  $_name = 'insms';
    protected  $_primary = 'id';
    public function  __construct()  {
        parent::__construct();
    }
    public function add($reqdate, $msg, $msg_trans,$clear_msg, $operator_id, $user_id, $smsid, $cost_rur, $cost, $test, $num, $skey, $sign, $ran, $answer,$uid)
	{
		$this->insert(array(
									'date' => new Zend_Db_Expr(' NOW() '),
									'reqdate' =>$reqdate,
									'msg' =>$msg,
									'msg_trans' =>$msg_trans,
									'clear_msg' =>$clear_msg,
									'operator_id' =>$operator_id,
									'user_id' =>$user_id,
									'smsid' =>$smsid,
									'cost_rur' =>$cost_rur,
									'cost' =>$cost,
									'test' =>$test,
									'num' =>$num,
									'skey' =>$skey,
									'sign' =>$sign,
									'ran' =>$ran,
									'answer' =>$answer,
									'uid' =>$uid
							));
	//`id`, `date`, `reqdate`, `msg`, `msg_trans`, `operator_id`, `user_id`, `smsid`, `cost_rur`, `cost`, `test`, `num`, `skey`, `sign`, `ran`, `answer`
	
	}
}