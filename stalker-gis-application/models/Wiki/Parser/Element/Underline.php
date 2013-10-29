<?php
class Application_Model_Wiki_Parser_Element_Underline extends Application_Model_Wiki_Parser_Element
{
        public $pattern = '/_{2}\s*([^_{2}]+)\s*_{2}/';
        protected $name = 'u';

        public function program(Array $v)
        {
                return '<'.$this->getName().'>'.$v[1].'</'.$this->getName().'>';
        }
}

