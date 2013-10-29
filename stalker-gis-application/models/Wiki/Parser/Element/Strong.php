<?php
class Application_Model_Wiki_Parser_Element_Strong extends Application_Model_Wiki_Parser_Element
{
        public $pattern = '/\'{3}\s*([^\'{3}]+)\s*\'{3}/';
        protected $name = 'b';

        public function program(Array $v)
        {
                return '<'.$this->getName().'>'.$v[1].'</'.$this->getName().'>';
        }
}

