<?php

class StoresModel {

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
		$ini = parse_ini_file('langs/'.$lang.'/info/stores.ini', true);

		if (!$ini) {
			
			throw new MyExp('Configuration mistake');
		}
		

		return $ini;



	}

	private function getDynamic(){
		
		/****файл с кол-во отправаленных писем*/
		
		$filename = "static/basa/letters.txt";
		$file = @fopen($filename, 'r');
		
		if(!$file){
			
			$data['letters'] = '';
			
		}else{
			
			
			$content = fread($file, filesize($filename));
			$data['letters'] = (int)$content;
			
		}
		fclose($file);
		
		return $data;
		
		
	}
	
	private function getAssistant(){
		
		
	}

	
	private function work(){
	
		$this->data['assistant']['lang'] = $this->Assistant->getLang();
		$this->data['assistant']['currency'] = $this->Assistant->getCurrency();
		$this->data['assistant']['cart_count'] = $this->Assistant->getCartItemCount();
		
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