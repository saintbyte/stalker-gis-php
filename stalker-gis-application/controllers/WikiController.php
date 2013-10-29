<?php

class WikiController extends Zend_Controller_Action
{
    private $uid;
    private $wiki;
    private $path;
    public function init()
    {
    

       $layout = Zend_Layout::getMvcInstance();
       $layout->setLayout('page');
       $front = Zend_Controller_Front::getInstance();
       $route = $front->getRouter();
       //var_dump($route);
       $this->token   =  $this->getRequest()->getParam('token');
       if ($this->token != '') {
        $t = new Application_Model_User_Token();
        $userdata = $t->getByToken($this->token);
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
         die('ERROR IN TOKEN');
                     $this->view->loged = 'false';
            $this->uid = 0;
            $this->view->allow_modify = true;
        }
       } else {
       $session = new Zend_Session_Namespace('Zend_Auth');
       if (!empty($session->login)) {
            $this->view->loged = 'true';
            $this->view->login = $session->login;
            $this->uid = intval($session->uid);
            $this->view->allow_modify = true;
       } else {
            die('ERROR 543');
            $this->view->loged = 'false';
            $this->uid = 0;
            $this->view->allow_modify = true;
       }
       }
        $this->path  =  $this->getRequest()->getParam('urlToParse');
        $this->typ   =  $this->getRequest()->getParam('typ');
        $data = $this->getRequest()->getParams();

        if ($this->typ == 'mobile')
        {
        $layout->setLayout('mobile');
        }
        $this->token   =  $this->getRequest()->getParam('token');
        $this->wiki = new Application_Model_Wiki($this->path);
        $this->view->pathItems     =  $this->wiki->getPathItems();
        $this->view->pathItemsData =  $this->wiki->getPathItemsData();
       
    }
    //------------------------------------------------------------------------
    public function indexAction()
    {
       $this->view->pathItems     =  $this->wiki->getPathItems();
       $this->view->pathItemsData =  $this->wiki->getPathItemsData();
       $this->view->wikiData      =  $this->wiki->getHtml();
       if ($this->view->wikiData) {
        // Есть что-тож
        
       } else {
        // Not found
         die('NOT FOUND');
       }
       
       $this->view->uri = $path;
    }
    //------------------------------------------------------------------------
    public function addAction()
    {
        $this->view->error = '';
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
                        $this->view->error = '!!!!!НЕ удалось добавить';
                 }
                }

        }
    }
    //------------------------------------------------------------------------
    public function editAction()
    {
	    $this->view->error = '';
            if ($this->getRequest()->isPost()) {
                $text   =  $this->getRequest()->getParam('text');
                $title   =  $this->getRequest()->getParam('title');
                if ($this->wiki->store($title,$text,$this->uid)) {
                        // Получилось сохранить
                        $this->view->error = 'Удалось сохранить';

                 } else {
                         // Не получилось сохранить
                         $this->view->error = '!!!!НЕ удалось добавить';
                 }
            }
            $this->view->wikiData  =  $this->wiki->get();
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

