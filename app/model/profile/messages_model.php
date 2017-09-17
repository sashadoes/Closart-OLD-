<?php

class MessagesModel {

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
		$ini = parse_ini_file('langs/'.$lang.'/profile/messages.ini', true);

		if (!$ini) {
			
			throw new MyExp('Configuration mistake');
		}
		

		return $ini;



	}

	private function getDynamic(){
		
		$user = $_SESSION['login'];
		
		$result = $this->DataBase->demand('eF', "SELECT id, user, store, art, name, flag FROM ".Config::DB_PREFIX."messages WHERE user = ? ORDER BY date DESC LIMIT 20", 
		array($user));
			
			if ($result->num_rows < 0){
				
				$data['dilogs'] = false;
				
			}else{
				
				while($row = $result->fetch_assoc()){
					
					$data['dilogs'][] = $row;
				}
				
				
			}
			
		unset ($this->DataBase);	
		
		
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