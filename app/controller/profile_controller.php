<?php

class ProfileController {
	
	private $tpl;
	
	private $Model;
	private $Template;
	
	
	public function __construct ( $params ) {

		if( (count($params)>2)){
			throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
		}
		
		if(count($params)<2){
			$params[1]='login';
		}
		
		
		$Assistant = Assistant::getAssistant();
		$user_id = $Assistant->isLogedUser();
		
		
		if($user_id){
			
			switch ($params[1]){
					
					case 'login':
					case 'news':
					
						require ('app/model/profile/front_model.php');	
						$this->Model = new FrontModel($user_id);
						$this->Template = new Template('app/view/profile/front/');
						$this->tpl = 'front';
					
						break;
					
					case 'orders':
					
						require ('app/model/profile/orders_model.php');	
						$this->Model = new OrdersModel($user_id);
						$this->Template = new Template('app/view/profile/orders/');
						$this->tpl = 'orders';
				
						break;
					
					case 'messages':
					
						require ('app/model/profile/messages_model.php');	
						$this->Model = new MessagesModel($user_id);
						$this->Template = new Template('app/view/profile/messages/');
						$this->tpl = 'messages';
				
						break;
					
					case 'settings':
					
						require ('app/model/profile/settings_model.php');	
						$this->Model = new SettingsModel($user_id);
						$this->Template = new Template('app/view/profile/settings/');
						$this->tpl = 'settings';
				
						break;
					
					default:
			
						throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
				
						break;
			
				}
			
			
		}else{
			
			switch ($params[1]){
				
				case 'login':
				case 'news':
				case 'orders':
				case 'messages':
				case 'settings':
				
					require ('app/model/profile/login_model.php');	
					$this->Model = new LoginModel($user_id);
					$this->Template = new Template('app/view/profile/login/');
					$this->tpl = 'login';
					
					break;	
					
				default:
			
						throw new MyExp("<code>404</code><mess>Not</mess>", 404);
						break;	
				
			}
			
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