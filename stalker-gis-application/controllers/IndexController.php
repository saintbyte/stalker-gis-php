<?php

class IndexController extends Zend_Controller_Action
{

    public function init()
    {

    }

    public function indexAction()
    {
       $layout = Zend_Layout::getMvcInstance();
       $layout->setLayout('index');
       $session = new Zend_Session_Namespace('Zend_Auth');
       if (!empty($session->login)) {
            $this->view->loged = 'true';
            $this->view->login = $session->login;
            $this->view->setting = '""';
       } else {
            $this->view->loged = 'false';
            $this->view->setting = '""';
       }
       $tb = new Application_Model_Pointtag();
       $result = $tb->getLast20Tags();
       $this->view->last20 = $result ;
       //$this->view->all_markers = Zend_Json_Encoder::encode(array(  'result'   => $result   ));
       //
    }


}

