<?php
class Application_Model_Wiki extends Zend_Db_Table_Abstract
{
        private $_pathItems;
        private $_pathItemsData;
        public $_path;
        public $id;
        protected  $_name    = 'wiki';
        protected  $_primary = 'id';
        protected  $_reserved_words = array('add','edit','delete','versions','sub');
        public function __construct($path)
        {
                parent::__construct();
                $this->_pathItemsData = array();
                //if ($path == '') $path = '/'; // Это тупо зеливает баг с адресами на хом паге
                $this->_path = $path;
                
                $this->parsePath();
                $this->getPathData();

        }
        
        private function parsePath()
        {
                $this->_pathItems[] = '';
                if (empty($this->_path)) {
                        // Главная страница
                } else {
                  if (strpos($this->_path,'/') === false) {
                        $this->_pathItems[] = $this->_path;
                  } else {
                        $tmp = explode('/',$this->_path);
                        foreach($tmp as $item) {
                                $this->_pathItems[] = $item;
                        }
                  }
                }
        }
        private function getPathData()
        {
                $tmpItems = $this->getPathItems();

                $parent_id = 0;
                foreach($tmpItems as $item)
                {
                        $sl = $this->Select();
                        $sl->where("`name` = ?", $item);
                        $sl->where("`parent_id`=?",$parent_id);
                        $sl->where("`deleted`=?",0);
                        try {
                                $row = $this->fetchRow($sl);
                        } catch(Zend_Db_Exception $se) {
                          break;
                        }
                        $path = $path.'/'.$item;
                        $row == NULL ? $not_found = true : $not_found = false;
                        /*
                        print $item .'<br />';
                        print $path .'<br />';
                        print $row->id .'<br />';
                        print $row->title .'<br />';
                        print $not_found .'<br />';
                        print '_____________________________<br />';
                        */
                        $this->_pathItemsData[] = array(
                                                        'name' => $item,
                                                        'path' => $path ,
                                                        'id'   => $row->id,
                                                        'title'=> $row->title,
                                                        'not_found' => $not_found
                                                       );
                        
                        $parent_id = $row->id;

                        if ($row == NULL)  break;
                }

        }
        public function add($title,$text,$uid)
        {
                $rus2lat = new Application_Model_Rus2Lat();
                $title   = trim($title);
                $tmp     = strtolower($rus2lat->toUrlTraslite($title));
                if (empty($title)) return false;                            // Если пусто титле - то возращаем фалс
                if (empty($tmp))   return false;                            // Если после всего пустой адрес - то возращаем фалс
                if (empty($text))  return false;                            // Как бы не даем сохранить пустой текст =)
                if (in_array($tmp,$this->_reserved_words)) return false;    //Если попадает в служебные адреса
                
                $tmp_arr = $this->getPathItemsData();
                $last_arr_item_num = count($tmp_arr);
                $last_arr_item_num--;
                if ($tmp_arr[$last_arr_item_num]['not_found']) return false;
                $childrens = $this->getChildrens($tmp_arr[$last_arr_item_num]['id']);
                foreach($childrens as $item) { if ($item['name'] == $tmp) return false; } // Проверяем наличие такого елемента
                
                $ins_data = array(
                                        'parent_id' => $tmp_arr[$last_arr_item_num]['id'],
                                        'name'      => $tmp,
                                        'title'     => $title,
                                        'text'      => $text,
                                        'owner_uid' => $uid,
                                        'datetime'  => new Zend_Db_Expr("NOW()"),
                                        'deleted'   => '0',
                                        
                                 );
                //print $ins_data;
                try {
                        parent::insert($ins_data);
                } catch( Exception $e ) {
                        $code = $e->getCode();
                        if ($code == '23000') return false;
                }
                return true;
        }
        public function get()
        {
                $tmp_arr = $this->getPathItemsData();
                $last_arr_item_num = count($tmp_arr);
                $last_arr_item_num--;
                if ($tmp_arr[$last_arr_item_num]['not_found']) return false;
                $this->id = $tmp_arr[$last_arr_item_num]['id'];
                $sl = $this->Select();
                $sl->where("`id`=?",$this->id);
                $sl->where("`deleted`=?",0);
                $row = $this->fetchRow($sl);
                return $row;
                
        }
        public function store($title,$text,$uid)
        {
                $title = trim($title);
                if (empty($title)) return false;
                $tmp_arr = $this->getPathItemsData();
                $last_arr_item_num = count($tmp_arr);
                $last_arr_item_num--;
                if ($tmp_arr[$last_arr_item_num]['not_found']) return false;
                $id = $tmp_arr[$last_arr_item_num]['id'];
                //---------------------------------------------------------
                // Here делаем версию
                $wiki_version = new  Application_Model_Wiki_Version();
                $old_data  = $this->get();
                $wiki_version->make($old_data->id,
                                    $old_data->parent_id,
                                    $old_data->name,
                                    $old_data->title,
                                    $old_data->text,
                                    $old_data->owner_uid,
                                    $old_data->datetime,
                                    $old_data->deleted);
                //---------------------------------------------------------
                $where = $this->getAdapter()->quoteInto('`id` = ?', $id);
                $update_date = array(
                                        'title'     => $title,
                                        'text'      => $text,
                                        'owner_uid' => $uid,
                                        'datetime'  => new Zend_Db_Expr("NOW()")
                                    );
                parent::update($update_date,$where);
                
                return true;
        }
        public function getHtml()
        {
         $data  =  $this->get();
         $parser = new Application_Model_Wiki_Parser($this);
         $data->text = $parser->parse($data->text);
         return $data;
        }
        public function getChildrens($id)
        {
                $sl = $this->Select();
                $sl->where("`parent_id`=?",$id);
                $sl->where("`deleted`=?",0);
                $row = $this->fetchAll($sl);
                return $row;
        }
        public function renderHTML($wikiText)
        {

        }
        public function getById($id)
        {

        }
        /*
         *
         */
        public function getPathItems() {return $this->_pathItems;}
        public function getPathItemsData() {return $this->_pathItemsData;}
        
        
}
