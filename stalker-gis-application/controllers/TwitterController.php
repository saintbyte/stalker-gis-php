<?
/*
Consumer key
ZNRZYwbnDz0ZiSuSJmK1w
Consumer secret
0O5JtdBpXmY7rKcjyjgCrU9iMscUDMmRfnR1qR5lvE
Request token URL
http://twitter.com/oauth/request_token
Access token URL
http://twitter.com/oauth/access_token
Authorize URL
http://twitter.com/oauth/authorize
*/
class TwitterController extends Zend_Controller_Action
{
    private $_config;
    public function init()
    {
        $this->_config = array(
                'version'         => '1.0', // there is no other version...
                'requestScheme'   => Zend_Oauth::REQUEST_SCHEME_HEADER,
                'signatureMethod' => 'HMAC-SHA1',
                'callbackUrl'     => 'http://twmap.ru/twitter/callback',
                'requestTokenUrl' => 'http://twitter.com/oauth/request_token',
                'authorizeUrl'    => 'http://twitter.com/oauth/authorize',
                'accessTokenUrl'  => 'http://twitter.com/oauth/access_token',
                'consumerKey'     => 'XXXX',
                'consumerSecret'  => 'XXXXXX'
        );
    }

   private function tryLogin()
    {
        $rnd = rand(0,99999);
        exit('ERROR. Ошибка, попробуйте повторить <a href="/twitter/go?'.$rnd.'">вход через Twitter</a> возможно поможет');
    }
    public function indexAction()
    {
        $this->tryLogin();
    }
    public function goAction()
    {
        $consumer = new Zend_Oauth_Consumer($this->_config);
        $token = $consumer->getRequestToken();
        $session = new Zend_Session_Namespace('twitter');
        $session->TWITTER_REQUEST_TOKEN =  Zend_Serializer::serialize($token);
        //$_SESSION['TWITTER_REQUEST_TOKEN'] = serialize($token);
        Zend_Session::rememberMe();
        $consumer->redirect();
    }
    public function callbackAction()
    {
        $session = new Zend_Session_Namespace('twitter');
        $consumer = new Zend_Oauth_Consumer($this->_config);
        $GET = $this->getRequest()->getParams();
        if ((!empty($GET)) && (!empty($session->TWITTER_REQUEST_TOKEN))) {
            try {
                $token = $consumer->getAccessToken($this->getRequest()->getParams(),
                                                Zend_Serializer::unserialize($session->TWITTER_REQUEST_TOKEN));
                $session->TWITTER_ACCESS_TOKEN = serialize($token);
                $oauth_token    = $this->getRequest()->getParam('oauth_token');
                $oauth_verifier = $this->getRequest()->getParam('oauth_verifier');

            }
            catch(Exception $e) {
                //$this->view->jsondata = 'Error Invalid Token';
                $this->tryLogin();
                return;
            }

            $client = $token->getHttpClient($this->_config);
            $client->setUri('http://api.twitter.com/1/account/verify_credentials.json');
            $client->setMethod(Zend_Http_Client::GET);
            //$client->setParameterPost('status', 'LSD LSD');
            $resp  = $client->request('GET');
            $bodydata = $resp->getBody();
            if (!empty($bodydata)) {
                $tw_data = Zend_Json::decode($bodydata);
                $this->view->tw_data = $tw_data;

                $us = new Application_Model_User();
                $user_local_data = $us->findByTwitter($tw_data['id']);
                //$this->view->tw_data = $user_local_data;
                if (empty($user_local_data->id)) {
                    // Твиттеровчский юзер зашел к нам первый раз
                    $this->view->jsondata = 'Твиттеровчский юзер зашел к нам первый раз';
                    $login     = 'twi'.$tw_data['id'];
                    $password  = rand(0, 9999);
                    $email     = $login.'@twitter.com';
                    $view_name = $tw_data['name'];
                    $tw_id     = $tw_data['id'];
                    $tw_screen_name  = $tw_data['screen_name'];
                    $us->register($login, $password, $email, $view_name, $tw_id,0,$tw_screen_name);
                    $us->setSessionData($us->user_id,$login);

                } else {
                    // Твиттеровский юзер уже бывал
                    $this->view->jsondata = 'Твиттеровский юзер уже бывал';
                    $us->setSessionData($user_local_data->id,'twi'.$tw_data['id']);
                }
                $this->_redirect('/');
            } else {
                //$this->view->jsondata = 'Cant get twitter data';
            }

        } else {
            $this->tryLogin();
        }

    }

}

