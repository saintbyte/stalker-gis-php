<?php
class mapdataController extends Zend_Controller_Action
{
    public function jsonTwitterMarksAction()
    {
        Zend_Layout::getMvcInstance()->disableLayout();
        $this->getResponse()->setHeader('Content-Type', 'application/json; charset=utf-8');
        $session = new Zend_Session_Namespace('Zend_Auth');
        $uid = $session->user_id;
        if (intval($uid) == 0) {
                $result = array();
        } else {
                $bng    = $this->getRequest()->getParam('bng');
                $zoom   = $this->getRequest()->getParam('zoom');
                $bng = strtr($bng,array('('=>'',')'=>'',' '=>''));
                list($top_lat,$top_lng,$bt_lat,$bt_lng) = explode(',',$bng);
                $pt     = new Application_Model_Pointtag();
                $result = $pt->getByBng($top_lat,$top_lng,$bt_lat,$bt_lng,$zoom);
        }
        $this->view->jsondata = Zend_Json_Encoder::encode(array(  'result'   => $result   ));
    }
}
