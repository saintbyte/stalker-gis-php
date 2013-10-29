<?php
abstract class Application_Model_Wiki_Parser_Element
{
        /**
         * Pattern for a wiki element.
         *
         * @access public
         * @var String
         */
        public $pattern = '/^.*$/';
        /**
         * XML node name.
         *
         * @access protected
         * @var String
         */
        protected $name;

        /**
         * This method can be inherited and extended for own purposes.
         *
         * @access public
         * @return void
         * @param Array $v Array of matches.
         */
        public function program(Array $v)
        {
                return '<'.$this->getName().'>'.$v[1].'</'.$this->getName().'>';
        }

        /**
         * Getter of {@see $name}
         *
         * @access protected
         * @return String XML node name.
         */
        protected function getName()
        {
                return $this->name;
        }
}

