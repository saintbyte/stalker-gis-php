<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{
    private function initDb()
    {
       $db = $this->getResource('db');
       //Zend_Db_Table::setDefaultAdapter($db);
       Zend_Registry::set('db', $db);
    }
    private function initView()
    {
        Zend_Layout::startMvc();
    }

    private function initSession()
    {
        Zend_Session::start();
    }

    private function initRoutes()
    {
        return ;
    }
    private function includePlugins()
    {
        $plugins_path = APPLICATION_PATH.'/plugins/';
        require_once  $plugins_path. 'cookieFix.php';
        require_once  $plugins_path. 'TwitterLogin.php';
        require_once  $plugins_path. 'checkLogin.php';
    }

    public function run()
    {
        
 
        
        $this->initDb();         // Инициализируем БД
        $this->initSession();   // Инициализируем сессию




        $this->initView(); // Базовые настройки видов
        $front = Zend_Controller_Front::getInstance();
        $router = $this->initRoutes();
        //$front->setRouter($router);
        

        // Подцепляем плугины
        
        $this->includePlugins();
        //$front->registerPlugin(new FaceBookLogin(), 50);   // будет вызван рано
        //$front->registerPlugin(new VKLogin(), 51); // будет вызван поздно
        $front->registerPlugin(new CookieFix());
        $front->registerPlugin(new TwitterLogin());
        $front->registerPlugin(new CheckLogin()); //,100

        $front->setBaseUrl($this->_config->url->base);
        parent::run();
        //$front->dispatch();
                //->throwexceptions(true);
    }

}

