<?php

class Application_Model_Wiki_Parser
{
        private $parent_wiki;

        public function __construct($parent_wiki_obj)
        {
          $this->parent_wiki = $parent_wiki_obj;
        }
        public function parse($text)
        {

            $text = $text;
            $list_html = '';
            if (strpos($text,'[SUBPAGES]')) {
                // Показать подчиненные страницы списком
                $list = $this->parent_wiki->getChildrens($this->parent_wiki->id);
                if ($list) {
                    $list_html .= '<ul id="subpages">';
                    foreach($list as $item) {                                   // '/'.
                        $list_html .= '<li><a href="'.$item->name.'/">'.$item->title.'</a></li>';
                    }
                    $list_html .= '</ul>';
                    $text = strtr($text,array('[SUBPAGES]' => $list_html));
                }
            }
            
            return $text;
        }


}
