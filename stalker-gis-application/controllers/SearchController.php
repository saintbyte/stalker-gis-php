<?php
class SearchController extends Zend_Controller_Action
{
    public function init()
    {
        $session = new Zend_Session_Namespace('Zend_Auth');
        $uid = $session->user_id;
        if (intval($uid) == 0) {die('ERROR 945');}
    }    
    public function indexAction()
    {
        $q = $this->getRequest()->getParam('q');
        $t = intval($this->getRequest()->getParam('t'));
        if (empty($q)) {
            // Нет запроса
            $this->view->simple = true;
        } else {
            // Запрос есть =)
            $this->view->simple = false;
            $this->view->q = $q;
            $this->view->t = $t;
            $pt = new Application_Model_Pointtag();
            if ($t == '1') {
                // Поиск по хештаегам
                $rs = $pt->searchInTag($q);
            } elseif ($t == '2') {
                // поиск по описанию
                $rs = $pt->searchInDescr($q);
            }
            $this->view->result_cnt = count($rs);
            $paginator = new Zend_Paginator(new Zend_Paginator_Adapter_Array($rs));
            $paginator->setCurrentPageNumber($this->getRequest()->getParam('page'));
            //$paginator->setView($this->view);
            $this->view->paginator = $paginator;
            $this->view->data = $rs;
        }

    }
}