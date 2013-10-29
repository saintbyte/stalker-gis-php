<?php
class KmlstoreController extends Zend_Controller_Action
{
       private $store_path; 


	public function init()
	{
       $this->store_path = 'kmlstore';
       $layout = Zend_Layout::getMvcInstance();
       $layout->setLayout('page');
       $front = Zend_Controller_Front::getInstance();
       $route = $front->getRouter();
       //var_dump($route);
       $this->kml = new Application_Model_Kmlstore();
       $this->session = new Zend_Session_Namespace('Zend_Auth');
       if (!empty($this->session->login)) {
            $this->view->loged = 'true';
            $this->view->login = $this->session->login;
            $this->uid = intval($this->session->uid);
            $this->view->allow_modify = true;
       } else {
            die('ERROR 543');
            $this->view->loged = 'false';
            $this->uid = 0;
            $this->view->allow_modify = true;
       }
	}
	
	public function indexAction()
	{
	//name	varchar(255)	utf8_unicode_ci		Нет	Нет		 	 	 	 	 	 	 
	//src_filename	varchar(255)	utf8_unicode_ci		Нет	Нет		 	 	 	 	 	 	 
	//filename	varchar(255)	utf8_unicode_ci		Нет	Нет		 	 	 	 	 	 	 
	//uid	int(11)			Нет	Нет		 	 	 	 	 	 	
	//datetime	datetime			Нет	Нет		 	 	 	 	 	 	
		$this->view->store_path = $this->store_path;	
		if ($this->getRequest()->isPost())
		{
			$name = $this->getRequest()->getParam('name');
			$upload = new Zend_File_Transfer();
   		       $upload->setDestination($this->store_path);
			//$upload->addValidator('isImage', false, 'image');//валидатор
			//$filterFileRename = new Zend_Filter_File_Rename(array('target' => $fullFilePath, 'overwrite' => false));
			do {
				$filename = uniqid('kml').'.kml';
			} while(file_exists($this->store_path.'/'.$filename));

                     $upload->addFilter('Rename', $this->store_path.'/'.$filename);
			if ($upload->isValid()) {
					//print '<pre>'; print_r($this->session); print '</pre>';
					$upload->receive();//сохраняем картинку на сервере
					$this->kml->insert(array(
									'name' => $name,
									'filename' => $filename,
								       'uid'      => $this->uid,
									'datetime' => new Zend_Db_Expr('NOW()')
								   ));
					$upload->getFileName();
                     }
		}
		$this->view->kml_list = $this->kml->getAll();
	}
}