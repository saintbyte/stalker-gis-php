<?php

class GtsController extends Zend_Controller_Action
{
    private $uid;
    public function init()
    {
 
    }
    //------------------------------------------------------------------------

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
    //------------------------------------------------------------------------
    public function indexAction()
    {
	$fl = fopen('access.log','a');
	fwrite($fl,'_________________________'."\r\n");
	foreach($_POST as $k=>$v)
	{
	fwrite($fl,$k.':'.$v."\r\n");
	}
	fwrite($fl,'---'."\r\n");
	foreach($_GET as $k=>$v)
	{
	fwrite($fl,$k.':'.$v."\r\n");
	}
	fwrite($fl,'---'."\r\n");
	foreach($_REQUEST as $k=>$v)
	{
	fwrite($fl,$k.':'.$v."\r\n");
	}
	fwrite($fl,'---'."\r\n");
	fwrite($fl,$HTTP_RAW_POST_DATA."\r\n");
	fwrite($fl,'_________________________'."\r\n");
	$deviceid      =  $this->getRequest()->getParam('id');
	$gprmc         =  $this->getRequest()->getParam('gprmc');
	$alt           =  $this->getRequest()->getParam('alt');
	$code          =  $this->getRequest()->getParam('code');
	$myloc   = new Application_Model_Mylocation();
	$tracker = new Application_Model_Trackers();
	$nmea    = new Application_Model_Nmea();
	$ndata = $nmea->parseNmea($gprmc);
	$tracker_user = $tracker->getUidByName($deviceid);
	if (!$tracker_user) { 
	  //var_dump($tracker_user );
	  fwrite($fl,'deviceid not found:'.$deviceid."\r\n");
	  die('deviceid not found:'.$deviceid); 
	}
	$myloc->save($ndata['latitude'],$ndata['longitude'],$alt,20,30,0,$ndata['speed'],'gpslogger_gts'.$ndata['src'][3].' '.$ndata['src'][4].' '.$ndata['src'][5].' '.$ndata['src'][6],$deviceid,$tracker_user);
	die('OK');
	fclose($fl);
	//--------------------
	//$near = $myloc->getNear($latitude,$longitude);
	//--------------------
       //$this->view->callback      =  $this->getRequest()->getParam('callback');
       //Zend_Layout::getMvcInstance()->disableLayout();
       //$this->getResponse()->setHeader('Content-Type', 'application/json; charset=utf-8');
       //$this->view->jsondata = Zend_Json_Encoder::encode(array(
       //'result'   => 'OK',
       //'text'     => 'Saved'
       //));
    }
    public function addmydeviceAction()
    {
      $this->access_v();
      $tracker = new Application_Model_Trackers();
    }
    public function listmydeviceAction()
    {
      $this->access_v();
      $tracker = new Application_Model_Trackers();
      if ($this->getRequest()->isPost()) 
      {
	$this->view->msg = 'Сохранено';
	$name = $this->getRequest()->getParam('name');
	if(preg_match('|^[A-Z0-9]+$|i', $name))
	{
	  if ($tracker->save($name,$this->uid)) 
	  {
	  }
	  else
	  {
	  $this->view->msg = 'Ошибка сохранения';
	  }
	}
	else
	{
	$this->view->msg = 'Ошибка в имени';
	}
      }
      $this->view->devices = $tracker->getMy($this->uid);

    }  
    public function listlocationsAction()
    {
       $this->access_v();
       $this->view->callback      =  $this->getRequest()->getParam('callback');
       Zend_Layout::getMvcInstance()->disableLayout();
       //var_dump($db);
       $this->getResponse()->setHeader('Content-Type', 'application/json; charset=utf-8');
       $myloc = new Application_Model_Mylocation();
       $sql = 'SELECT * FROM  mylocation  GROUP BY uid ORDER BY `created_on` DESC LIMIT 0 , 30';
       $select = $myloc->select();
       $select->group(array('uid'));
       $select->order(array('created_on DESC'));
       $select->limit(30,0);
       $result =$myloc->fetchAll($select);  
       if ($result)
       {
	$result = $result->toArray();
       }  
       $this->view->jsondata = Zend_Json_Encoder::encode(array(
       'result'   => 'OK',
       'text'     => 'Saved',
       'data'     => $result
       ));
    }
    
    public function viewAction()
    {
      $this->access_v();
      $layout = Zend_Layout::getMvcInstance();
      $layout->setLayout('page');
    }
    
    public function mobileviewAction()
    {
      $this->access_v();
      $layout = Zend_Layout::getMvcInstance();
      $layout->setLayout('mobile');
    }

}

