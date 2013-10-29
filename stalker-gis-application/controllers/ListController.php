<?
class ListController extends Zend_Controller_Action
{
    public function indexAction()
    {
        //print_R($this->getRequest()->getParams());
        $lett = $this->getRequest()->getParam('lett');
        $this->page_title = 'Twitter Хеш-таги на букву: '.$lett.' / Twitter Hashtags on letter '.$lett;
        $lett = substr($lett, 0,1);
        $pt = new Application_Model_Pointtag();
        $this->view->data = $pt->getTagsByLetter($lett);
        $this->view->lett = $lett;
    }
}