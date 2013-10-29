<?php
class Application_Model_Wiki_Parser_Element_Anchor extends Application_Model_Wiki_Parser_Element
{
        public $pattern = '/\[\[([^\]\]]+)\]\]/';
        protected $name = 'anchor';

        public function program(Array $v)
        {
                $external = false;
                $value = (count($array = explode('|', $v[1])) > 1 ? $array[1] : $array[0]);
                if(preg_match('/http:\/\/(.+)/', $array[0]))
                {
                        $href = $array[0];
                        $external = true;
                }
                else
                {
                        if($GLOBALS['filesystem']->isFile($array[0]))
                        {
                                $href = sprintf($GLOBALS['pathformat'], $GLOBALS['linkprefix'], $array[0], $GLOBALS['media']);
                        }
                        else
                        {
                                return '';
                        }
                }
                return '<'.$this->getName().' href="'.$href.'" '.($external ? ' location="external"':'').'>'.$value.'</'.$this->getName().'>';
        }
}

