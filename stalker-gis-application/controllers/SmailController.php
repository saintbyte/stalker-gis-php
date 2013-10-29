<?php
class SmailController extends Zend_Controller_Action
{
    public function init()
    {
       $layout = Zend_Layout::getMvcInstance();
       $layout->setLayout('none');
    }

    public function indexAction()
    {
      $this->page_title = 'О сайте';
      $key = $this->getRequest()->getParam('key');
      $mq = new Application_Model_Mailqueue();
      $data = $mq->getByKey($key);
      $this->view->cnt = $data['body'];
      $this->view->t = $data['subject'];
    }
}

