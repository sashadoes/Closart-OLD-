<?php

class ItemModel {

	private $store;
	private $art;
	
	private $data;
	
	private $DataBase;
	private $Assistant;
	private $LayoutHelper;

	
	public function __construct($params) {
		
		$this->store = $params[0];
		$this->art = $params[2];	
		
		$this->DataBase = DB::getDBO();
		$this->Assistant = Assistant::getAssistant();
		$this->LayoutHelper = new LayoutHelper();

	}


	private function getStatic(){
		
		$lang = $this->Assistant->getLang();
		$ini = parse_ini_file('langs/'.$lang.'/store/item.ini', true);

		if (!$ini) {
			
			throw new MyExp('Configuration mistake');
		}

		return $ini;

	}

	private function getDynamic(){
		
		$lang = $this->Assistant->getLangNumber();
		
		$result = $this->DataBase->demand('eF', "SELECT name, url_name, menu, year, country, followers, bio FROM ".Config::DB_PREFIX."stores WHERE url_name = ? ", array($this->store));
			
			if ($result->num_rows != 1){
				throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
			}else{
				
				$data = $result->fetch_assoc();
				
			}
			
		$result = $this->DataBase->demand('eF', 'SELECT art, name, price, discount, img, category_self, description, options, seo FROM '.Config::DB_PREFIX.$this->store.'_store WHERE art = ?', 
		array( $this->art ));	
			
			if ($result->num_rows != 1){
				throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
			}else{
				
				$data['item'] = $result->fetch_assoc();
			}
			
		unset ($this->DataBase);	
			
		$menu =	explode(Config::LANG_SEPARATOR, $data['menu']);
		$bio =	explode(Config::LANG_SEPARATOR, $data['bio']);
		$country =	explode(Config::LANG_SEPARATOR, $data['country']);
		
		$data['item']['options'] = $this->LayoutHelper->getItemOptions($data['item']['options']);
		$data['menu'] = $menu[$lang];
		$data['bio'] = $bio[$lang];
		$data['country'] = $country[$lang];

		return $data;
	
	}
	
	
	private function work(){
	
		$this->data['assistant']['lang'] = $this->Assistant->getLang();
		$this->data['assistant']['currency'] = $this->Assistant->getCurrency();
		$this->data['assistant']['cart_count'] = $this->Assistant->getCartItemCount();
		$this->data['assistant']['rate'] = $this->Assistant->getCurrencyRate();
		$this->data['assistant']['login'] = $this->Assistant->isLogedUser();
		
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