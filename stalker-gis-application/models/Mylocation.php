<?php
class Application_Model_Mylocation extends Zend_Db_Table_Abstract
{
    protected  $_name = 'mylocation';
    protected  $_primary = 'id';
 
    public function  __construct()  {
        parent::__construct();
    }
    public function save($lat,$lng,$z,$accuracy,$altitudeAccuracy,$heading,$speed,$tag,$descr,$uid)
    {
       $z = intval($z);
       $accuracy = intval($accuracy);
       $altitudeAccuracy= intval($altitudeAccuracy);
       $heading =  intval($heading);
       $speed = intval($speed);
        $data = array(
                    'lat' => $lat,
                    'lng' => $lng,
                    'z'   => $z,
                    'accuracy' => $accuracy,
		    'altitudea' => $altitudeAccuracy,
		    'heading' => $heading ,
		    'speed'  => $speed  ,
                    'tag' => $tag,
                    'uid'  => $uid,
                    'created_on' => new Zend_Db_Expr('NOW()')
                    );
        parent::insert($data);
    }
    public function getNear($lat,$lng)
    {
        $result = $this->fetchAll(
                                  $this->select()
                                       ->limit(1, 0)
                                 );
        $rowCount = count($result);
        if ($rowCount > 100) return array('too_many'=>'1');
        return $result->toArray();   
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
   public function getTagsByLetter($lett)
   {
        $lett=mysql_escape_string($lett);
        $result = $this->fetchAll(
                                    $this->select()
                                         ->where('`tag` LIKE "'.$lett.'%"', '')
                );
        return $result->toArray();

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
