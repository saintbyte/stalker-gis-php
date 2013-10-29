<?
class Application_Model_User extends Zend_Db_Table_Abstract
{
    protected  $_name = 'users';
    protected  $_primary = 'id';

    public $user_id;

    public function  __construct()  {
        parent::__construct();
    }

    private function validateLogin($login)
    {
        return true;
    }


    private function validatePassword($password)
    {
        return true;
    }


    private function validateEmail($email)
    {
        return true;
    }

    private function hashPassword($password)
    {
        $password = md5($password);
        return $password;
    }


    public function register($login,$password,$email,$view_name = '',$tw_id = '', $vk_id = '',$screen_name = '')
    {
        if (!$this->validateLogin($login)) return $this->validateLogin($login);
        if (!$this->validatePassword($password)) return $this->validatePassword($password);
        if (!$this->validateEmail($password)) return $this->validateEmail($email);
        if (empty($view_name)) $view_name = $login;
        $data = array(
                      'login'     => $login,
                      'password'  => $this->hashPassword($password),
                      'view_name' => $view_name,
                      'email'     => $email,
                      'tw_id'     => $tw_id,
                      'vk_id'     => $vk_id,
                      'fb_id'     => '',
                      'tw_name'   => $screen_name
                     );

        try {
        $pkdata = intval(parent::insert($data));

        } catch( Exception $e ) {
            $code = $e->getCode();
            if ($code == '23000') return 'Такой пользователь уже существует';
            return $e->getCode(); //$e->getCode();
        }
        $this->user_id = $pkdata;
        //return '['.$this->user_id;
        return 'OK';

    }
    public function setSessionData($uid,$login)
    {
            $session = new Zend_Session_Namespace('Zend_Auth');
            $session->user_id = $uid;
            $session->login   = $login;
            $session->setExpirationSeconds(10*24*3600);
            Zend_Session::rememberMe();
    }
    
    public function getById($id)
    {
      $id = intval($id);
        //$sl = $this->select();
        try {
        $data = $this->fetchRow('`id` = "'. $id.'"');
        } catch (Zend_Db_Table_RowException $e) {
            //echo $e->getMessage();
            return false;
        }
        return $data;
    }
    
    public function login($login,$password)
    {
        $authAdapter = new Zend_Auth_Adapter_DbTable(Zend_Db_Table::getDefaultAdapter());
        $authAdapter->setTableName('users');
        $authAdapter->setIdentityColumn('login');
        $authAdapter->setCredentialColumn('password');

        $authAdapter->setIdentity($login);
        $authAdapter->setCredential($this->hashPassword($password));

        $auth = Zend_Auth::getInstance();
        $result = $auth->authenticate($authAdapter);
        if ($result->isValid()) {
            $data = $authAdapter->getResultRowObject(array('id', 'login'));
            //$auth->getStorage()->write());
            $this->user_id = $data->id;
            $this->setSessionData($data->id,$data->login);
            return true;
        } else {
            return false;
        }
    }
    public function findByTwitter($tw_id)
    {
        $tw_id = intval($tw_id);
        //$sl = $this->select();
        try {
        $data = $this->fetchRow('`tw_id` = "'. $tw_id.'"');
        } catch (Zend_Db_Table_RowException $e) {
            //echo $e->getMessage();
            return false;
        }
        return $data;
    }
    public function changePassword($uid,$oldPassword,$newPassword)
    {
        $oldPassword = $this->hashPassword($oldPassword);
        $newPassword= $this->hashPassword($newPassword);
        try {
             $data = $this->fetchRow('`password` = "'. $oldPassword.'" AND `id`="'.$uid.'"');
             if ($data) {
                parent::update(
                               array('password'=>$newPassword),
                               $this->getAdapter()->quoteInto('id = ?', $uid)
                              );
                return true;
             }
        } catch (Zend_Db_Table_RowException $e) {
            //echo $e->getMessage();
            return false;
        }
        
    }
}
