<?php
class AuthController extends Zend_Controller_Action
{

    public function init()
    {
        //$this->layout->viewRenderer->setNoRender();
        //$this->layout->disableLayout();
    }

    public function indexAction()
    {
        print 'LLLL';
    }
    private function register()
    {
                if ($this->_request->isPost ()) {
                        if ($form->isValid ( $this->_getAllParams () )) {

                                        $table = new Model_Users ( );
                                        $data = array ('username' => $form->getValue ( 'name' ), 'password' => md5 ( $form->getValue ( 'password' ) ), 'jid' => $form->getValue ( 'jit' ) );
                                        $table->insert ( $data );
                                        $this->_redirector->gotoSimple ( 'index', 'tasks' );
                                        }
                        }
    }

    private function login()
    {
                $data = array ('username' => $form->getValue ( 'name' ), 'password' => md5 ( $form->getValue ( 'password' ) ) );
                                $authAdapter = new Zend_Auth_Adapter_DbTable(Zend_Db_Table::getDefaultAdapter());
                                $authAdapter->setTableName('users');
                                $authAdapter->setIdentityColumn('username');
                                $authAdapter->setCredentialColumn('password');
                                $authAdapter->setIdentity($form->getValue('name'));
                                $authAdapter->setCredential(hash('md5', $form->getValue('password')));
                                $result = $this->auth->authenticate ( $authAdapter );
                                if (!$result->isValid()) { // Invalid credentials
                                        $form->setDescription('Invalid credentials provided');
                                        $this->view->form = $form;
                                    $this->render('users'); // re-render the login form
                                }
                                $currentUser = $authAdapter->getResultRowObject ();
                                $this->auth->getStorage()->write ( $currentUser ); //записали юзера в auth, теперь он везде доступен - только для чтения
                                $this->_redirector->gotoSimple ( 'index', 'tasks' );
    }

    public function jsonloginAction()
    {
        Zend_Layout::getMvcInstance()->disableLayout();
        $this->view->callback      =  $this->getRequest()->getParam('callback');
        $this->getResponse()->setHeader('Content-Type', 'application/json; charset=utf-8');

        $login    = $this->getRequest()->getParam('login');
        $password = $this->getRequest()->getParam('password');
        $app_id   = intval($this->getRequest()->getParam('app_id'));
        $us = new Application_Model_User();
        $t  = new Application_Model_User_Token();
        $result = $us->login($login,$password);
        if ($result) { 
          $token = $t->setForUser($us->user_id,$app_id);
          $result_str = 'OK'; 
        } else {
          $result_str = 'Bad auth';
          $token = '';
        }
        Zend_Layout::getMvcInstance()->disableLayout();
        $this->getResponse()->setHeader('Content-Type', 'application/json; charset=utf-8');
        $this->view->jsondata = Zend_Json_Encoder::encode(array(  'result'   => $result_str, 'token' => $token   ));
    }
    public function jsonregisterAction()
    {
    //Zend_Layout::getMvcInstance()->setLayout('none');
        Zend_Layout::getMvcInstance()->disableLayout();
        $this->getResponse()->setHeader('Content-Type', 'application/json; charset=utf-8');
        //$this->view->jsondata =
        $us = new Application_Model_User();
        $login    = $this->getRequest()->getParam('login');
        $password = $this->getRequest()->getParam('password');
        $email    = $this->getRequest()->getParam('email');
        $result   = $us->register($login, $password, $email);
        $this->view->jsondata = Zend_Json_Encoder::encode(array(  'result'   => $result   ));
    }
    public function ajaxloginformAction()
    {
        Zend_Layout::getMvcInstance()->disableLayout();
        if ($this->getRequest()->isPost) {
        
        }
    }
    public function ajaxregisterformAction()
    {
        Zend_Layout::getMvcInstance()->disableLayout();
    }
    
    public function ajaxregisterformcompleteAction()
    {
        Zend_Layout::getMvcInstance()->disableLayout();
    }
    public function verftokenAction()
    {
        Zend_Layout::getMvcInstance()->disableLayout();
        $this->getResponse()->setHeader('Content-Type', 'application/json; charset=utf-8');
        $token    = $this->getRequest()->getParam('token');
        $t  = new Application_Model_User_Token();
        $u =$t->getByToken($token);
        if ($u)
        {
	  $result_str = 'OK';
        }
        else
        {
	  $result_str = 'ERR';
        }
        $this->view->jsondata = Zend_Json_Encoder::encode(array(  'result'   => $result_str, 'token' => $token   ));
    }
    public function changePasswordAction()
    {
       $layout = Zend_Layout::getMvcInstance();
       $layout->setLayout('page');
       if ($this->getRequest()->isPost ()) {
                $oldPassword    = $this->getRequest()->getParam('oldPassword');
                $password1    = $this->getRequest()->getParam('password1');
                $password2    = $this->getRequest()->getParam('password2');
                $session = new Zend_Session_Namespace('Zend_Auth');
                $uid = $session->user_id;
                if ((empty($password1)) || ($password1 != $password2)) {
                        $this->view->error = 'Пароль и подтверждение не совпадают';
                } else {
                        $us = new Application_Model_User();
                        if ($us->changePassword($uid,$oldPassword,$Password)) {
                                $this->view->ok = true;
                        } else {
                                $this->view->ok = false;
                               $this->view->error = 'Не удалось сменить пароль';
                        }
                        
                }
       }
    }

}

