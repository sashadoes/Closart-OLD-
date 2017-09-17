<?php

class FrontModel {

	private $params;
	
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
		$ini = parse_ini_file('langs/'.$lang.'/management/front.ini', true);

		if (!$ini) {
			
			throw new MyExp('Configuration mistake');
		}
		
		return $ini;

	}

	private function getDynamic(){
		
		$lang = $this->Assistant->getLangNumber();
		$id_manager = $_SESSION['id_manager'];
		
		/*******MENU INIT*******/
		$stores = $_SESSION['stores_manage'];
		$data['menu'] = $this->LayoutHelper->getMenuManagementStore($stores);
	
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