<?php

class MessagesModel {

	private $store;
	
	private $data;
	
	private $DataBase;
	private $Assistant;
	private $LayoutHelper;

	
	public function __construct($params) {

	    $this->store = $params[0];
			
		$this->DataBase = DB::getDBO();
		$this->Assistant = Assistant::getAssistant();
		$this->LayoutHelper = new LayoutHelper();

	}


	private function getStatic(){
		
		$lang = $this->Assistant->getLang();
		$ini = parse_ini_file('langs/'.$lang.'/store/admin/messages.ini', true);

		if (!$ini) {
			
			throw new MyExp('Configuration mistake');
		}

		return $ini;

	}

	private function getDynamic(){
		
		$lang = $this->Assistant->getLangNumber();
		
		$result = $this->DataBase->demand('eF', "SELECT name, url_name FROM ".Config::DB_PREFIX."stores WHERE url_name = ? ", 
		array($this->store));
			
			if ($result->num_rows != 1){
				
				throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
				
			}else{
				
				$data = $result->fetch_assoc();
				
				
			}
			
		$result = $this->DataBase->demand('eF', "SELECT id, user, store, art, name, flag, date FROM ".Config::DB_PREFIX."messages WHERE store = ? ORDER BY date DESC LIMIT 20", 
		array($this->store));
			
			if ($result->num_rows < 0){
				
				$data['dilogs'] = false;
				
			}else{
				
				while($row = $result->fetch_assoc()){
					
					$data['dilogs'][] = $row;
				}
				
				/*
				$result = $this->DataBase->demand('eF', "SELECT conversation FROM ".Config::DB_PREFIX."messages WHERE user = ? AND art = ?", 
				array($data['dilogs'][0]['user'], $data['dilogs'][0]['art']));
				$row = $result->fetch_assoc();
				
				$data['first_conversatin'] = $this->parseConversation($row['conversation']);	
				*/
				
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
	
	private function parseConversation($value){
		
		$array = explode(Config::SECOND_SEPARATOR, $value);
		
		for( $i = 1, $amount = count($array)-1 ; $i < $amount; $i++ ){
			$result[] = explode(Config::FIRST_SEPARATOR, $array[$i]);
		}
		
		return $result;
	}
	
	
}


?>