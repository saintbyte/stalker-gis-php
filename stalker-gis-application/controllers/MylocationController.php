<?php

class MylocationController extends Zend_Controller_Action
{
    private $uid;
    private $wiki;
    private $path;
    public function init()
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
            $this->uid = intval($session->uid);
            $this->view->allow_modify = true;
       } else {
            die('{"result":"ERROR","error":"not_authed"}');
            $this->view->loged = 'false';
            $this->uid = 0;
            $this->view->allow_modify = true;
       }
       }
    }
    //------------------------------------------------------------------------
    public function indexAction()
    {
	$version = $this->getRequest()->getParam('version');
	$latitude = $this->getRequest()->getParam('latitude');
	$longitude = $this->getRequest()->getParam('longitude');
	$altitude = $this->getRequest()->getParam('altitude');
	$accuracy = $this->getRequest()->getParam('accuracy');
	$altitudeAccuracy = $this->getRequest()->getParam('altitudeAccuracy');
	$heading = $this->getRequest()->getParam('heading');
	$speed = $this->getRequest()->getParam('speed');
	$tag = '';
	$descr = '';
	$myloc = new Application_Model_Mylocation();
	$myloc->save($latitude,$longitude,$altitude,$accuracy,$altitudeAccuracy,$heading,$speed,$tag,$descr,$this->uid);
	//--------------------
	$near = $myloc->getNear($latitude,$longitude);
	//--------------------
       $this->view->callback      =  $this->getRequest()->getParam('callback');
       Zend_Layout::getMvcInstance()->disableLayout();
       $this->getResponse()->setHeader('Content-Type', 'application/json; charset=utf-8');
       $this->view->jsondata = Zend_Json_Encoder::encode(array(
       'result'   => 'OK',
       'text'     => 'Saved'
       ));
    }
   
    
}

