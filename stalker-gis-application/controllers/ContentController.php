<?php
class ContentController extends Zend_Controller_Action
{
    public function init()
    {
       $layout = Zend_Layout::getMvcInstance();
       $layout->setLayout('page');
    }

    public function aboutAction()
    {
      $this->page_title = 'О сайте';
    }
    public function howAction()
    {
       $this->page_title = 'Как пользоваться';
    }
    public function contactsAction()
    {
        $this->page_title = 'Контакты';
    }
}
