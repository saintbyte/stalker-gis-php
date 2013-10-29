<?
class Application_Model_Kmlstore extends Zend_Db_Table_Abstract
{
    protected  $_name = 'kmlstore';
    protected  $_primary = 'id';

    public $user_id;

    public function  __construct()  {
        parent::__construct();
    }

    public function getAll()
    {
        return $this->fetchAll($this->Select())->toArray();
    }

}