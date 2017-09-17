<?php

 class Router {
	
	private $current_URL;
	private $controller;
	private $params = false;
	
	public function __construct ($url){
		
		

		if ($url === '' || $url === '/' ){
			
			$this->current_URL = '/front';
			
		}else{
			
			$this->current_URL = $url;
		}	
	}

	
	public function parseUrl () {
		
		$data =  explode( '/', $this->current_URL);
		array_shift($data);
		$check = $data[0];
		
		
		switch($check){
			
			case 'news':
			case 'front':
			case 'shop':
			case 'cart':
			
				$this->controller = 'front';
				break;
			
			case 'profile':
			
				$this->controller = 'profile';
				break;
				
			case 'info':

				$this->controller = 'info';
				break;
				
			case 'search':

				$this->controller = 'search';
				break;
			
			case 'management':

				$this->controller = 'management';
				break;
			
			case Config::ADMIN_URL :

				$this->controller = 'admin';
				
				break;	
			
			default:
				
				$this->controller = 'store';
				break;
		}
		
		$this->params = $data;
	}
		
	
	
	public function getController(){
		return $this->controller;
	}
	
		
	public function getParams(){
		return $this->params;
	}	
 }

?>