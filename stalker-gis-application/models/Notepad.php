<?php
class Application_Model_Notepad extends Zend_Db_Table_Abstract
{
    protected  $_name = 'notepad';
    protected  $_primary = 'id';


    public function  __construct()  {
        parent::__construct();
    }
}
