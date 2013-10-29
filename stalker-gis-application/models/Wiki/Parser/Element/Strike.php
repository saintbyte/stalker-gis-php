<?php
class Application_Model_Wiki_Parser_Element_Strike extends Application_Model_Wiki_Parser_Element
{
        public $pattern = '/-{2}\s*([^-{2}]+)\s*-{2}/';
        protected $name = 's';

        public function program(Array $v)
        {
                return '<'.$this->getName().'>'.$v[1].'</'.$this->getName().'>';
        }
}

