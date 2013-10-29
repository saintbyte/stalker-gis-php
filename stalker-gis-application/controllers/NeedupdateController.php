<?php

class NeedupdateController extends Zend_Controller_Action
{
    private $uid;
    private $wiki;
    private $path;
    public function init()
    {
    }
    //------------------------------------------------------------------------
    public function indexAction()
    {
	$version = $this->getRequest()->getParam('version');
       $this->view->callback      =  $this->getRequest()->getParam('callback');
       Zend_Layout::getMvcInstance()->disableLayout();
       $this->getResponse()->setHeader('Content-Type', 'application/json; charset=utf-8');
       $this->view->jsondata = Zend_Json_Encoder::encode(array(
       'result'   => 'OK',
       'text'     => 'Нормальная текущая версия. Welcome'
       ));
    }
   
    
}

