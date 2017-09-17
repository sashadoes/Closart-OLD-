<?php

class ItemsModel {

	private $store;
	private $category;
	
	private $data;
	
	private $DataBase;
	private $Assistant;
	private $LayoutHelper;

	
	public function __construct($params) {
			
		$this->store = $params[0];
		$this->category = $params[3];
			
		$this->DataBase = DB::getDBO();
		$this->Assistant = Assistant::getAssistant();
		$this->LayoutHelper = new LayoutHelper();

	}


	private function getStatic(){
		
		$lang = $this->Assistant->getLang();
		$ini = parse_ini_file('langs/'.$lang.'/store/admin/items.ini', true);

		if (!$ini) {
			
			throw new MyExp('Configuration mistake');
		}

		return $ini;

	}

	private function getDynamic(){
		
		$lang = $this->Assistant->getLangNumber();
		
		$result = $this->DataBase->demand('eF', "SELECT art, name, url_name, categories_allow, categories_self FROM ".Config::DB_PREFIX."stores WHERE url_name = ? ", array($this->store));
			
			if ($result->num_rows != 1){
				throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
			}else{
				
				$data = $result->fetch_assoc();
				
			}
			
		$data['url_category'] = $this->category;
		$data['categories_allow'] = explode(Config::FIRST_SEPARATOR, $data['categories_allow']);
		
		$_SESSION['art'] = $data['art'];
		$_SESSION['categories_allow'] = $data['categories_allow'];
		
		$data['categories_self'] = explode(Config::FIRST_SEPARATOR, $data['categories_self']);	
			
		switch($this->category){
			
			case 'new':
				$data['items'] = 'new';
				break;
			
			case 'all':
				
				$result = $this->DataBase->demand('eF', "SELECT art, name, price, discount, img, category, category_self, description, options, amount, seo, date FROM ".Config::DB_PREFIX.$this->store."_store ORDER BY date DESC", 
				array());
					if ($result->num_rows <= 0){
					$data['items'] = 'n';
					}else{
						while ($row = $result->fetch_assoc()) {
						$data['items'][] = $row;
					}
					}
				break;
				
			default :
				if(!(in_array($this->category, $data['categories_self'])) && ($this->category != 'screening')){
					throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
				}else{
					
					$result = $this->DataBase->demand('eF', "SELECT art, name, price, discount, img, category, category_self, description, options, amount, seo, date FROM ".Config::DB_PREFIX.$this->store."_store WHERE category_self = ? ORDER BY date DESC", 
					array($this->category));
						if ($result->num_rows <= 0){
						$data['items'] = 'n';
						}else{
							while ($row = $result->fetch_assoc()) {
							$data['items'][] = $row;
						}
						}
	
				}

				break;
	
		}	
			
		
		
		unset ($this->DataBase);
		
		
		
	
		return $data;
	
	}
	
	
	private function work(){
	
		$this->data['assistant']['lang'] = $this->Assistant->getLang();
		$this->data['assistant']['currency'] = $this->Assistant->getCurrency();
		$this->data['assistant']['cart_count'] = $this->Assistant->getCartItemCount();
		
		$this->data['layout']['menu_main'] = $this->LayoutHelper->getMenuAdminStore($this->store);
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