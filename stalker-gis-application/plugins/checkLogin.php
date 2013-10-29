<?php
class CheckLogin extends Zend_Controller_Plugin_Abstract {
    private $_auth;
    private $role;
    public function __construct()
    {
        //$this->_auth = Zend_Auth::getInstance();
        //if( $this->_auth->hasIdentity() ) {
        //    $this->role = $this->_auth->getIdentity()->role;
        //}else {
        //    $this->role = 'guest';
       // }
                $controller  = $request->controller;
		$action      = $request->action;
		$module      = $request->module;
		$resource    = $request->controller;
        // die('23423');
    }

    public function preDispatch(Zend_Controller_Request_Abstract $request)
    {
        $auth = Zend_Auth::getInstance();
        //$auth->getStorage()->write($authAdapter->getResultRowObject(array('id', 'login')));
        //$session = new Zend_Session_Namespace('Zend_Auth');
        //Zend_Session::regenerateId();
        //$session->setExpirationSeconds(10*24*3600);
        //Zend_Session::rememberMe();
        
        //$this->getResponse()->appendBody("<p>dispatchLoopStartup() called</p>\n");
        //$this->getResponse()->clearBody();

        //$this->view->content = 'sdfsdf';

        // Идентефицируем пользователя
        //$reader = $auth->getIdentity();
        // Проверяем идентифицировался пользователь
        //if($reader->id) {
            // Инициализируем объект отвечающий за работу с читателями
            //$Readers = new Readers();
            // Перезаписываем данные в сессию
            //$auth->getStorage()->write($Readers->getReaderByIdS($reader->id));
        //}
    }
}