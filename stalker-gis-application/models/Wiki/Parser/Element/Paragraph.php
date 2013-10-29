<?php
class Application_Model_Wiki_Parser_Element_Paragraph extends Application_Model_Wiki_Parser_Element
{
//        public $pattern = '/(?:(?:[\r\n]{1,}){2,})?\s*(.+)/';
        public $pattern = '/(?:[\r\n]{2})\s*(.+)/';
        protected $name = 'p';
}
