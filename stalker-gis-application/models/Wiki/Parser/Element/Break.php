<?php
class Application_Model_Wiki_Parser_Element_Break extends Application_Model_Wiki_Parser_Element
{
        public $pattern = '/(.+)\r\n/';
        //public $pattern = '/(.+)\n/';
        protected $name = 'br';

        public function program(Array $v)
        {
                //return $v[1].'<'.$this->getName().'/>';
                //return nl2br($v);
                return $v[1].'<'.$this->getName().'/>';
        }

}

