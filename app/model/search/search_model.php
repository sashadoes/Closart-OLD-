<?php

class SearchModel {

	private $query;
	
	private $data;
	
	private $DataBase;
	private $Assistant;
	private $LayoutHelper;

	
	public function __construct($params) {
		
		$query = $_GET['s'];

		if (empty($query)){
			
			throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
		}
		$query = trim($query);
		$query = stripslashes($query);
		$query = strip_tags($query);
		$query = htmlspecialchars($query);	
		
		$this->query = $query;

		$this->DataBase = DB::getDBO();
		$this->Assistant = Assistant::getAssistant();
		$this->LayoutHelper = new LayoutHelper();

	}


	private function getStatic(){
		
		
		$lang = $this->Assistant->getLang();
		$ini = parse_ini_file('langs/'.$lang.'/search/search.ini', true);

		if (!$ini) {
			
			throw new MyExp('Configuration mistake');
		}

		return $ini;
		

	}

	private function getDynamic(){
		
		
		$result = $this->DataBase->demand('eF', "SELECT name, url_name FROM ".Config::DB_PREFIX."stores WHERE name LIKE ?",
		array( '%'.$this->query.'%'));
		
		while($row = $result->fetch_assoc()){
			
			$stores[] = array(
				
				'type' => 'store',
				'name' => $row['name'],
				'url_name' => $row['url_name'],
			
			);
		}
		
		
		$result = $this->DataBase->demand('eF', "SELECT art, name, store, price, discount FROM ".Config::DB_PREFIX."exclusive_items WHERE anti_promo = ? AND name LIKE ? ORDER BY date DESC LIMIT 15",
		array(Config::PROMO_SETUP, '%'.$this->query.'%'));
		
		$offset_exclusive = $this->DataBase->affectedRows();
		
		while($row = $result->fetch_assoc()){
			
			$items[] = array(
				
				'type' => 'item',
				'art' => $row['art'],
				'name' => $row['name'],
				'store' => $row['store'],
				'price' => $row['price'],
				'discount' => $row['discount'],
			
			);
		}
		
		$result = $this->DataBase->demand('eF', "SELECT art, name, store, price, discount FROM ".Config::DB_PREFIX."man_items WHERE anti_promo = ? AND name LIKE ? ORDER BY date DESC LIMIT 15",
		array(Config::PROMO_SETUP, '%'.$this->query.'%'));
		
		$offset_man = $this->DataBase->affectedRows();
		
		while($row = $result->fetch_assoc()){
			
			$items[] = array(
				
				'type' => 'item',
				'art' => $row['art'],
				'name' => $row['name'],
				'store' => $row['store'],
				'price' => $row['price'],
				'discount' => $row['discount'],
			
			);
		}
		
		$result = $this->DataBase->demand('eF', "SELECT art, name, store, price, discount FROM ".Config::DB_PREFIX."woman_items WHERE anti_promo = ? AND name LIKE ? ORDER BY date DESC LIMIT 15",
		array(Config::PROMO_SETUP, '%'.$this->query.'%'));
		
		$offset_woman = $this->DataBase->affectedRows();
		
		while($row = $result->fetch_assoc()){
			
			$items[] = array(
				
				'type' => 'item',
				'art' => $row['art'],
				'name' => $row['name'],
				'store' => $row['store'],
				'price' => $row['price'],
				'discount' => $row['discount'],
			
			);
		}
		
		
		$result = $this->DataBase->demand('eF', "SELECT art, name, store, price, discount FROM ".Config::DB_PREFIX."arts_items WHERE anti_promo = ? AND name LIKE ? ORDER BY date DESC LIMIT 15",
		array(Config::PROMO_SETUP, '%'.$this->query.'%'));
		
		$offset_arts = $this->DataBase->affectedRows();
		
		while($row = $result->fetch_assoc()){
			
			$items[] = array(
				
				'type' => 'item',
				'art' => $row['art'],
				'name' => $row['name'],
				'store' => $row['store'],
				'price' => $row['price'],
				'discount' => $row['discount'],
			
			);
		}
			
		if((count($stores) <= 0) && (count($items) <= 0)){
			
			$data['search'] = false;
			
		}else{
			
			shuffle($items);
			$data['search'] = array_merge( $stores, $items);
		}
		
		$data['offset']['exclusive'] = $offset_exclusive;
		$data['offset']['man'] = $offset_man;
		$data['offset']['woman'] = $offset_woman;
		$data['offset']['arts'] = $offset_arts;
		
		return $data;
		
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