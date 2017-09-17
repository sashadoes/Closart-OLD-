<?php

class ShopModel {

	private $category;
	
	private $data;
	
	private $DataBase;
	private $Assistant;
	private $LayoutHelper;

	
	public function __construct($params) {
		
		
		$this->category = $params[1];
			

		$this->DataBase = DB::getDBO();
		$this->Assistant = Assistant::getAssistant();
		$this->LayoutHelper = new LayoutHelper();

	}


	private function getStatic(){
		
		/*
		
		$lang = $this->Assistant->getLang();
		$ini = parse_ini_file('langs/'.$lang.'/front/shop.ini', true);

		if (!$ini) {
			
			throw new MyExp('Configuration mistake');
		}

		return $ini;
		*/

	}

	private function getDynamic(){
		
		
		if(!in_array($this->category, Config::MAIN_CATEGORIES)){
			throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
		}
		
		$table = $this->Assistant->getItemProfTable($this->category);
		
		$result = $this->DataBase->demand('eF', 'SELECT art, name, store,  price, discount FROM '.Config::DB_PREFIX.$table.'_items WHERE category = ? AND anti_promo = ? ORDER BY date DESC LIMIT 20', 
		array( $this->category, Config::PROMO_SETUP ));
		
		if($this->DataBase->affectedRows() <= 0){
			throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
		}
		
		while ($row = $result->fetch_assoc()) {
				
					$data['items'][]=$row;
				}
			
	
		return $data;
		
	}
	
	private function getAssistant(){
		
		
	}

	
	private function work(){
	
		$this->data['assistant']['lang'] = $this->Assistant->getLang();
		$this->data['assistant']['currency'] = $this->Assistant->getCurrency();
		$this->data['assistant']['cart_count'] = $this->Assistant->getCartItemCount();
		$this->data['assistant']['rate'] = $this->Assistant->getCurrencyRate();
		
		$this->data['layout']['menu_main'] = $this->LayoutHelper->getMenuMain();
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