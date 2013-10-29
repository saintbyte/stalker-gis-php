<?php
class TagController extends Zend_Controller_Action
{

    public function init()
    {
        //$this->layout->viewRenderer->setNoRender();
        //$this->layout->disableLayout();
    }
    public function showAction()
    {
        print_R($this->getRequest()->getParams());
        $tag = $this->getRequest()->getParam('tag');
        $this->view->tag = $tag;
    }
    public function showidAction()
    {
        //print_R($this->getRequest()->getParams());
        $tag = $this->getRequest()->getParam('tag');
        $id = $this->getRequest()->getParam('id');
        $tg = new Application_Model_Pointtag();
        $tag_data = $tg->getTagById($id);
        //var_dump($tag_data);
        //print '['.$tag_data->descr.']';
        $this->view->tag = $tag;
        $this->view->lat = $tag_data[0]["lat"];
        $this->view->lng = $tag_data[0]["lng"];
        $this->view->z = $tag_data[0]["z"];
        $this->view->created_on  = $tag_data[0]["created_on"];
        $this->view->src_url     = $tag_data[0]["src_url"];
        $this->view->descr = $tag_data[0]["descr"];
    }
    public function newrssAction()
    {
       $layout = Zend_Layout::getMvcInstance();
       $layout->setLayout('rss');
       $this->getResponse()->setHeader('Content-type', 'text/xml; charset=utf-8');
       // Дата последней сборки фида
       $this->view->lastBuildDate=date(DATE_FORMAT_RFC822);
       $this->view->pubDate=date(DATE_FORMAT_RFC822);
       $tg = new Application_Model_Pointtag();
       $this->view->lastTags = $tg->getLast20Tags();
    }

}
