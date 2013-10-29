<?php
class Application_Model_Markertypes extends Zend_Db_Table_Abstract
{
/*
 `marker_id` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `descr` text COLLATE utf8_unicode_ci NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `visible` int(11) NOT NULL,
  PRIMARY KEY (`marker_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=724 ;
*/
    protected  $_name = 'marker_types';
    protected  $_primary = 'marker_id';

    public function  __construct()  {
        parent::__construct();
    }
    public function save($name,$uid)
    {
            return true;
    }
    public function getVisible($uid)
    {
      $result = $this->fetchAll(
                                  $this->select()->where('visible =1')
                               );
     
     if ($result)
     {
     $result = $result->toArray();
     return $result;
     }
     return false;
    }
    public function getAll()
    {
       $result = $this->fetchAll(
                                  $this->select()
                                 );

        return $result->toArray();

    }
    public function getTagById($id)
    {
                $result = $this->fetchAll(
                                     $this->select()->where('marker_id =?', $id)
                                   );
                return $result->toArray();
    }
 
}
