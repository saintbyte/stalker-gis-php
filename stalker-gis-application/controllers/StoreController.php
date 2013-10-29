<?php
class storeController extends Zend_Controller_Action
{
    public function formAction()
    {
        Zend_Layout::getMvcInstance()->disableLayout();
    }

    public function saveAction()
    {
        $pt = new Application_Model_Pointtag();

    }

    public function jsonsaveAction()
    {
        $lat = $this->getRequest()->getParam('lat');
        $lng = $this->getRequest()->getParam('lng');
        $z   = $this->getRequest()->getParam('z');
        $tag = $this->getRequest()->getParam('tag');
        $descr = $this->getRequest()->getParam('descr');
        $src_url = $this->getRequest()->getParam('src_url');
        $session = new Zend_Session_Namespace('Zend_Auth');
        $uid = $session->user_id;
        if (intval($uid) == 0) {die('ERROR 945');}
        $pt = new Application_Model_Pointtag();
        $pt->save($lat,$lng,$z,$tag,$descr,$uid,$src_url);
        Zend_Layout::getMvcInstance()->disableLayout();
        $this->view->jsondata = Zend_Json_Encoder::encode(array('result' => 'OK'));
    }
}
