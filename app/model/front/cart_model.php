<?php

class CartModel {

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
		$ini = parse_ini_file('langs/'.$lang.'/front/cart.ini', true);

		if (!$ini) {
			
			throw new MyExp('Configuration mistake');
		}

		return $ini;

	}

	private function getDynamic(){
		
		$cart_items_arts = $this->Assistant->getCatItemsArts();
		$cookies = $this->Assistant->getCookies();
		
		
		if(count($cart_items_arts)<=0){
			$data['items'] = false;
			return $data;
			
		}
		
		
		for( $i = count($cart_items_arts)-1, $new_cart ; $i>=0 ; $i-- ){
			
			$format = ($cookies[$cart_items_arts[$i]]);
			$item = json_decode($format, true);
					
			$result = $this->DataBase->demand('eF', 'SELECT art, name, price, discount FROM '.Config::DB_PREFIX.$item['store'].'_store WHERE art = ? AND category_self != ?', 
			array( $item['art'], Config::DB_SCREENING ));
			
			if($this->DataBase->affectedRows() < 1){
				
				$product = array(
							"art" => $item['art'],
							"store" => $item['store'],
							"name" => $item['name'],
							"price" => $item['price'],
							"discount" => $item['discount'],
							"options" =>$item['options'],
							"out" => true,
						);
						
				setcookie($cart_items_arts[$i], '', (time() - 3600), '/');	
				
				$product['alias'] = $cart_items_arts[$i];
				$data['items'][] = $product;				
				
			}else{
				
				$row = $result->fetch_assoc();
		
				$product = array(
							"art" => $row['art'],
							"store" => $item['store'],
							"name" => $row['name'],
							"price" => $row['price'],
							"discount" => $row['discount'],
							"options" =>$item['options'],
						);
				
				
				$new_cart[$i] = $cart_items_arts[$i];
				setcookie($cart_items_arts[$i], json_encode($product), time() + (3600 * 96), '/');
				
				$product['alias'] = $cart_items_arts[$i];
				$data['items'][] = $product;
		
			}
		
		
		}
		
		setcookie( 'cart', json_encode($new_cart), time() + (3600 * 96), '/');
		
		return $data;
		
	}
	
	
	private function work(){
	
		$this->data['assistant']['lang'] = $this->Assistant->getLang();
		$this->data['assistant']['currency'] = $this->Assistant->getCurrency();
		$this->data['assistant']['rate'] = $this->Assistant->getCurrencyRate();
		$this->data['assistant']['cart_count'] = $this->Assistant->getCartItemCount();
		$this->data['assistant']['login'] = $this->Assistant->isLogedUser();
		
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