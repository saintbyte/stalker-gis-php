<?php

class FilesController extends Zend_Controller_Action
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
            $this->login = $ud->login;
            $this->uid = intval($userdata['userid']);
            $this->view->allow_modify = true;
	} else 
	{
	 $this->getResponse()->setHeader('Content-Type', 'application/json; charset=utf-8');
	 die('{"result":"ERROR","error":"not_authed"}');
	}
       } else {
       $layout = Zend_Layout::getMvcInstance();
       $layout->setLayout('none');
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
       $this->files = new Application_Model_Files();
       
    }
    //------------------------------------------------------------------------
    public function indexAction()
    {
       $this->view->callback      =  $this->getRequest()->getParam('callback');
       Zend_Layout::getMvcInstance()->disableLayout();
       $this->getResponse()->setHeader('Content-Type', 'application/json; charset=utf-8');
       if ($this->view->wikiData) {
        // Есть что-тож
        $this->view->jsondata = Zend_Json_Encoder::encode(array(
	  //'res'   => '1',
	  'wiki'     => $this->view->wikiData->toArray()
	));
       } else {
        // Not found
       $this->view->jsondata = Zend_Json_Encoder::encode(array(
       'result'   => 'NOT_FOUND',
       ));
        
       }
    }
    public function receiveAction()
    {
       $this->view->callback      =  $this->getRequest()->getParam('callback');
       $this->view->devid      =  $this->getRequest()->getParam('devid');
       $this->view->path      =  $this->getRequest()->getParam('path');
       Zend_Layout::getMvcInstance()->disableLayout();
       $this->getResponse()->setHeader('Content-Type', 'application/json; charset=utf-8');
       $adapter = new Zend_File_Transfer_Adapter_Http();
       $this->store_path = 'files/'.$this->login;
       
       @mkdir($this->store_path,0777);
       @chmod($this->store_path, 0777);
       $ispost = $this->getRequest()->isPost();
       var_dump($ispost);
       if ($ispost)
       {
         $name = $this->getRequest()->getParam('name');
	 $upload = new Zend_File_Transfer();
   	 $upload->setDestination($this->store_path);
	//$upload->addValidator('isImage', false, 'image');//валидатор
	//$filterFileRename = new Zend_Filter_File_Rename(array('target' => $fullFilePath, 'overwrite' => false));
	 do {
	     $filename = md5(uniqid('file'));
	  } while(file_exists($this->store_path.'/'.$filename));
	 print $this->store_path.'/'.$filename;  
         $upload->addFilter('Rename', $this->store_path.'/'.$filename);
         if ($upload->isValid()) {	
	    $upload->receive();   
            if ($this->files->add($this->uid ,$this->view->devid,$this->view->path,$this->store_path.'/'.$filename)) 
            {
             $result = 'OK';
            }
            else
            {
            $result = 'ERROR';
            }
         }
         //$this->files->save();
       }
       $this->view->jsondata = Zend_Json_Encoder::encode(array(
	    'result'   => $result,
       ));
    }
    public function listAction()
    {
	   $this->view->callback      =  $this->getRequest()->getParam('callback');
	   $this->view->devid         =  $this->getRequest()->getParam('devid');
	   $this->view->viewdevid     =  $this->getRequest()->getParam('viewdevid');
	   $this->view->offset        =  intval($this->getRequest()->getParam('offset'));
	   $this->view->size          =  intval($this->getRequest()->getParam('size'));
	   if ($this->view->size == 0)
	   {
	      $this->view->size = 50;
	   }
	   if ($this->view->viewdevid == '')  
	   {
	    $this->view->viewdevid = $this->view->devid;
	   }
	   Zend_Layout::getMvcInstance()->disableLayout();
	   $this->getResponse()->setHeader('Content-Type', 'application/json; charset=utf-8');
	   $sl = $this->files->Select();
	   $sl->where("uid = ?", $this->uid);
	   $sl->where("dev_id = ?", $this->view->viewdevid);
           $sl->limit($this->view->size, $this->view->offset );
           try {
                                $files =  $this->files->fetchAll($sl)->toArray();
           } catch(Zend_Db_Exception $se) {
                         $files = array();
           }
           $this->view->jsondata = Zend_Json_Encoder::encode(array(
	    'result'   => $result,
	    'offest'   => $this->view->offset,
	    'size'   => $this->view->size,
	    'files'    => $files
	   ));
    }
}

