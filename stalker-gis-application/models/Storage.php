<?php
class Application_Model_Storage extends Zend_Db_Table_Abstract
{
    protected  $_name = 'storages';
    protected  $_primary = 'id';

    public $user_id;

    public function  __construct()  {
        parent::__construct();
    }
}
