<?php

class WikijsonController extends Zend_Controller_Action
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
       $this->path  =  $this->getRequest()->getParam('urlToParse');
       $this->wiki  = new Application_Model_Wiki($this->path);
       $this->view->pathItems     =  $this->wiki->getPathItems();
       $this->view->pathItemsData =  $this->wiki->getPathItemsData();
       
    }
    //------------------------------------------------------------------------
    public function indexAction()
    {

       $this->view->pathItems     =  $this->wiki->getPathItems();
       $this->view->pathItemsData =  $this->wiki->getPathItemsData();
       $this->view->wikiData      =  $this->wiki->getHtml();
       $this->view->callback      =  $this->getRequest()->getParam('callback');
       Zend_Layout::getMvcInstance()->disableLayout();
       $this->getResponse()->setHeader('Content-Type', 'application/json; charset=utf-8');
       $this->view->uri = $path;
       if ($this->view->wikiData) {
        // Есть что-тож
        $this->view->jsondata = Zend_Json_Encoder::encode(array(
	  //'res'   => '1',
	  'wiki'     => $this->view->wikiData->toArray()
	));
	//var_dump();
       } else {
        // Not found
       $this->view->jsondata = Zend_Json_Encoder::encode(array(
       'result'   => 'NOT_FOUND',
       'wiki'     => array()
       ));
        
       }

    }
    //------------------------------------------------------------------------
    public function addAction()
    {

        
        if ($this->getRequest()->isPost()) {
                $title  =  $this->getRequest()->getParam('title');
                $text   =  $this->getRequest()->getParam('text');
                if (empty($title) || empty($text)) {

                }
                else {
                 if ($this->wiki->add($title,$text,$this->uid)) {
                        // Получилось сохранить
                        print 'Получилось сохранить';

                 } else {
                  // Не получилось сохранить
                        print 'Не получилось сохранить';
                        $this->view->error = 'Не удалось добавить';
                 }
                }

        }
    }
    //------------------------------------------------------------------------
    public function editAction()
    {

            $this->view->wikiData  =  $this->wiki->get();
            if ($this->getRequest()->isPost()) {
                $text   =  $this->getRequest()->getParam('text');
                $title   =  $this->getRequest()->getParam('title');
                if ($this->wiki->store($title,$text,$this->uid)) {
                        // Получилось сохранить
                        $this->view->error = 'Удалось добавить';
                        $response = $this->getResponse();
                        $response->setRedirect($url, $code);

                 } else {
                         // Не получилось сохранить
                         $this->view->error = 'Не удалось добавить';
                 }
            }
    }
    //------------------------------------------------------------------------
    public function deleteAction()
    {
        if ($this->getRequest()->isPost()) {
                $this->wiki->delete();
                $response = $this->getResponse();
                $response->setRedirect($url, $code);
         //Удаляем
        } else {
                // Требуем подтверждения
        }
        
    }

    
}

