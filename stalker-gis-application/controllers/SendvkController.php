<?php

class SendvkController extends Zend_Controller_Action
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
        //$this->access_v();
        $this->view->callback      =  $this->getRequest()->getParam('callback');
        Zend_Layout::getMvcInstance()->disableLayout();
        $this->getResponse()->setHeader('Content-Type', 'application/json; charset=utf-8');
        $lat = $this->getRequest()->getParam('lat');
        $lon = $this->getRequest()->getParam('lon');
        $ad  ='';
        $msg = $this->getRequest()->getParam('msg');
        touch('httpdebug.log');
        $fl = fopen('httpdebug.log','a');
        fwrite($fl,'_______________________'."\r\n");
        fwrite($fl,$msg."\r\n");
        fwrite($fl,'_______________________'."\r\n");
        fclose($fl);
        mail('admin@dotsb.net.ru','SendVk',$msg);
        //$msg = iconv('UTF-8','cp1251',$msg);
        if ((intval($lat) != 0 && intval($lon) != 0))
        {
                $ad  .= '&lat='.$lat.'&long='.$lon;  //&lon=
        }
        $url = 'https://api.vk.com/method/wall.post?owner_id=-123456789&from_group=1&message='.urlencode($msg).''.$ad.'&access_token=XXXXXXXXXXXXXXXX';
        $aswer = file_get_contents($url);
        $result = 'OK';  
        $this->view->result = Zend_Json_Encoder::encode(array(
           'result'   => 'OK',
        ));
    }

}

