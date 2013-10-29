<?php

class MarkertypeseditController extends Zend_Controller_Action
{
    private $uid;
    private $wiki;
    private $path;
    public function access_v()
    {
       $token = $this->getRequest()->getParam('token');
       if ($token != '') {
        $t = new Application_Model_User_Token();
        $userdata = $t->getByToken($token);
        if ($userdata)
        {
            $u = new Application_Model_User();
            $ud = $u->getById($userdata['userid']);
            $this->view->loged = 'true';
            $this->view->login = $ud->login;
            $this->uid = intval($userdata['userid']);
            $this->view->allow_modify = true;
        } else 
        {
         $this->getResponse()->setHeader('Content-Type', 'application/json; charset=utf-8');
         die('{"result":"ERROR","error":"not_authed"}');
        }
       } else {
       $layout = Zend_Layout::getMvcInstance();
       $layout->setLayout('page');
       $front = Zend_Controller_Front::getInstance();
       $route = $front->getRouter();
       //var_dump($route);

       $session = new Zend_Session_Namespace('Zend_Auth');
       if (!empty($session->login)) {
            $this->view->loged = 'true';
            $this->view->login = $session->login;
            $this->uid = intval($session->user_id);
            $this->view->allow_modify = true;
       } else {
            die('{"result":"ERROR","error":"not_authed"}');
            $this->view->loged = 'false';
            $this->uid = 0;
            $this->view->allow_modify = true;
       }
       }
     }
    public function init()
    {
      $this->access_v();
    }
    //------------------------------------------------------------------------
    public function indexAction()
    {
      $t = new Application_Model_Markertypes();
      $this->view->list = $t->getAll();
    }
    //------------------------------------------------------------------------
    public function addAction()
    {

    }
    //------------------------------------------------------------------------
    public function editAction()
    {
    }
    //------------------------------------------------------------------------
    public function deleteAction()
    {

    }

    
}

