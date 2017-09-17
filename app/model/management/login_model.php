<?php

class LoginModel {
	
	private $data;
	
	private $DataBase;
	private $Assistant;
	private $LayoutHelper;
	
	public function __construct($params) {
					
		$this->DataBase = DB::getDBO();
		$this->Assistant = Assistant::getAssistant();
		$this->LayoutHelper = new LayoutHelper();

	}


	private function getStatic(){
		
		$lang = $this->Assistant->getLang();
		$ini = parse_ini_file('langs/'.$lang.'/management/login.ini', true);

		if (!$ini) {
			
			throw new MyExp('Configuration mistake');
		}

		return $ini;

	}

	private function getDynamic(){
		
		
		$lang = $this->Assistant->getLangNumber();
		
		/*******MENU INIT*******/
		
		$id_user = $_SESSION['id'];
		
		$result = $this->DataBase->demand('eF', "SELECT id FROM ".Config::DB_PREFIX."managers WHERE id_user = ? ", array($id_user));
		if ($result->num_rows !== 1){
				throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
			}else{
				$row = $result->fetch_assoc();
				$id_manager = $row['id'];
			}
		
		$result = $this->DataBase->demand('eF', "SELECT name, url_name FROM ".Config::DB_PREFIX."stores WHERE id_manager = ? ", array($id_manager));
			
			if ($result->num_rows <= 0){
				throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
			}else{
				
				while ($row = $result->fetch_assoc()) {
					$data['menu'][] = $row;
				}
				
				$data['menu'] = $this->LayoutHelper->getMenuManagementStore($data['menu']);
				$result->free();
				
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