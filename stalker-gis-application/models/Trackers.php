<?php
class Application_Model_Trackers extends Zend_Db_Table_Abstract
{
/*
id	int(11)			No	None	AUTO_INCREMENT	  
uid	int(11)			No	
name	varchar(128)	utf8_unicode_ci		No	
active	int(11)
*/
    protected  $_name = 'trackers';
    protected  $_primary = 'id';

    public function  __construct()  {
        parent::__construct();
    }
    public function save($name,$uid)
    {
        $data = array(
                    'uid' => $uid,
                    'name' => $name,
                    'active'   => 1,

                    );
        try
        {
        parent::insert($data);
        }
        catch (Zend_Exception $e) {
        return false;
        }
        return true;
    }
    public function getMy($uid)
    {
      $result = $this->fetchAll(
                                  $this->select()->where('uid ='. $uid)
                               );
     
     if ($result)
     {
     $result = $result->toArray();
     return $result;
     }
     return false;
    }
    public function getByBng($top_lat,$top_lng,$bt_lat,$bt_lng,$zoom)
    {
        // Зум тут надо чтоб более интелектуально выбирать данные
        // К тому же тут надо немного разруливать чего отдавать с таким зумом 
        $result = $this->fetchAll(
                                  $this->select()
                                       ->where('lat > ?', $top_lat)
                                       ->where('lng > ?', $top_lng)
                                       ->where('lat < ?', $bt_lat)
                                       ->where('lng < ?', $bt_lng)
                                       ->from($this->_name,array('lat','lng','tag','id'))
                                       ->limit(101, 0)
                                 );
        $rowCount = count($result);
        if ($rowCount > 100) return array('too_many'=>'1');
        return $result->toArray();
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
                                     $this->select()->where('id =?', $id)
                                   );
                return $result->toArray();
    }
    public function getLast20Tags()
    {
        $result = $this->fetchAll(
                                    $this->select()
                                         ->order('created_on DESC')
                                         ->limit(20, 0)

                );
        return $result->toArray();
   }
   public function getUidByName($name)
   {
        $name=mysql_escape_string($name);
        $result = $this->fetchAll($this->select()->where('name=?',$name));
        //var_dump($result);
        if ($result)
        {
	  $arr =  $result->toArray();
	  return $arr[0]['uid'];
        } else
        {
	  return false;  
        }
        

   }

   public function searchInTag($key)
   {
        $key = mysql_escape_string($key);
        $result = $this->fetchAll(
                                    $this->select()
                                         ->where('`tag` LIKE "%'.$key.'%"', '')
                );
        return $result->toArray();
        
   }

   public function searchInDescr($key)
   {
        $key = mysql_escape_string($key);
        $result = $this->fetchAll(
                                    $this->select()
                                         ->where('`descr` LIKE "%'.$key.'%"', '')
                );
        return $result->toArray();

   }
}
