<?php

class ConfigurationModel {

	private $store;
	
	private $data;
	
	private $DataBase;
	private $Assistant;
	private $LayoutHelper;

	
	public function __construct($params) {
		
	
		$this->store = $params[1];
			
		$this->DataBase = DB::getDBO();
		$this->Assistant = Assistant::getAssistant();
		$this->LayoutHelper = new LayoutHelper();
		
	}


	private function getStatic(){
		
		
		
		$lang = $this->Assistant->getLang();
		$ini = parse_ini_file('langs/'.$lang.'/management/configuration.ini', true);

		if (!$ini) {
			
			throw new MyExp('Configuration mistake');
		}
		

		return $ini;



	}

	private function getDynamic(){
		
		
		$lang = $this->Assistant->getLangNumber();
		
		/*******MENU INIT*******/
		$stores = $_SESSION['stores_manage'];
		$data['menu'] = $this->LayoutHelper->getMenuManagementStore($stores);
		
		/********DATA**********/
		
		$id_manager = $_SESSION['id_manager'];
		
		$result = $this->DataBase->demand('eF', "SELECT name, url_name, categories_allow, categories_self, menu, year, country, bio, person_name, person_surname, mail, phone, delivery FROM ".Config::DB_PREFIX."stores WHERE url_name = ? AND id_manager = ? ", 
		array($this->store, $id_manager));
		
			if ($result->num_rows !== 1){
				throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
			}else{
				
				$row = $result->fetch_assoc();
				
				$data['store'] = $row;
				$data['store']['menu'] = explode( Config::LANG_SEPARATOR, $row['menu']);
				$data['store']['menu']['ru'] = $data['store']['menu'][0];
				$data['store']['menu']['en'] = $data['store']['menu'][1];
				
				$data['store']['delivery'] = explode( Config::LANG_SEPARATOR, $row['delivery']);
				$data['store']['delivery']['ru'] = explode( Config::THIRD_SEPARATOR, $data['store']['delivery'][0] );
				$data['store']['delivery']['en'] = explode( Config::THIRD_SEPARATOR, $data['store']['delivery'][1] );
				
				$data['store']['bio'] = explode( Config::LANG_SEPARATOR, $row['bio']);
				$data['store']['bio']['ru'] = $data['store']['bio'][0];
				$data['store']['bio']['en'] = $data['store']['bio'][1];
				
				
			}
	
		unset ($this->DataBase);
		return $data;

	}
	
	
	private function work(){
	
		$this->data['assistant']['lang'] = $this->Assistant->getLang();
		$this->data['assistant']['currency'] = $this->Assistant->getCurrency();
		$this->data['assistant']['cart_count'] = $this->Assistant->getCartItemCount();
		
		$this->data['layout']['menu_more'] = $this->LayoutHelper->getMenuMore();
		$this->data['layout']['cart_layout'] = $this->LayoutHelper->getCart();
		
		$this->data['common'] = $this->LayoutHelper->getCommonIni();
		
	    $this->data['static'] = $this->getStatic();
		$this->data['dynamic'] = $this->getDynamic();

	}

	
	public function getData(){
		$this->work();
		return $this->data;
	}
	
	
}






?>