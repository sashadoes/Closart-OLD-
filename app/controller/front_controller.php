<?php

class FrontController {
	
	private $tpl;
	
	private $Model;
	private $Template;
	
	
	public function __construct ($params) {
		
		if(count($params) > 2){
			throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
		}
		
		if(count($params)< 1){
			
			$params[0] = 'front';
		}

			
		switch ($params[0]){
			
			case 'front':
			case 'news':
			
				if(count($params) > 1){
					throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
				}
						
				require ('app/model/front/front_model.php');	
				$this->Model = new FrontModel($params);
				$this->Template = new Template('app/view/front/front/');
				$this->tpl = 'front';
				
				break;
				
				
			case 'shop':
						
				require ('app/model/front/shop_model.php');	
				$this->Model = new ShopModel($params);
				$this->Template = new Template('app/view/front/shop/');
				$this->tpl = 'shop';
				
				break;
				
			
			case 'cart':
				
				if(count($params) > 1){
					throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
				}
			
				require ('app/model/front/cart_model.php');	
				$this->Model = new CartModel($params);
				$this->Template = new Template('app/view/front/cart/');
				$this->tpl = 'cart';
				
				break;
				
				
			default:
			
				throw new MyExp("<code>404</code><mess>Not</mess>", 404);
				
				break;
		}
		
		
	}
	
	public function work (){
		
		$data = $this->Model->getData();
		$tpl = $this->tpl;
		
		$this->Template->setData($data);
		$this->Template->display($tpl);
		
	}
		
	
}





?>