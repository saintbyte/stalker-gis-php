<?php
class CookieFix extends Zend_Controller_Plugin_Abstract {

        public function preDispatch(Zend_Controller_Request_Abstract $request)
        {
                 $this->getResponse()->setHeader('P3P', 'CP="IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT"');

        }

}
