<?php

class SettingsModel {

	private $params;
	
	private $data;
	
	private $DataBase;
	private $Assistant;
	private $LayoutHelper;

	
	public function __construct($params) {
		
		$this->params = $params;
		
		$this->DataBase = DB::getDBO();
		$this->Assistant = Assistant::getAssistant();
		$this->LayoutHelper = new LayoutHelper();

	}


	private function getStatic(){
		
		$lang = $this->Assistant->getLang();
		$ini = parse_ini_file('langs/'.$lang.'/profile/settings.ini', true);

		if (!$ini) {
			
			throw new MyExp('Configuration mistake');
		}
		

		return $ini;



	}

	private function getDynamic(){
		
		$id = $_SESSION['id'];
		$login = $_SESSION['login'];
		
		$result = $this->DataBase->demand('eF', "SELECT name, surname,  mail, phone, mailing, card, card_name, card_surname FROM ".Config::DB_PREFIX."users WHERE id = ? AND login = ? ", 
		array($id, $login));
			
			if ($result->num_rows != 1){
				
				throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
				
			}else{
				
				$data = $result->fetch_assoc();
				$result->free();
				unset ($this->DataBase);
			}
			
		
	
		return $data;
		
	}
	
	private function getAssistant(){
		
		
	}

	
	private function work(){
	
		$this->data['assistant']['lang'] = $this->Assistant->getLang();
		$this->data['assistant']['currency'] = $this->Assistant->getCurrency();
		$this->data['assistant']['cart_count'] = $this->Assistant->getCartItemCount();
		
		$this->data['layout']['menu_main'] = $this->LayoutHelper->getMenuProfile();
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