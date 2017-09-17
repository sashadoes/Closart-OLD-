<?php

class ManagementController {
	
	private $tpl;
	
	private $Model;
	private $Template;
	
	
	public function __construct ( $params ) {

		if(count($params)<2){
			$params[1]='login';
		}
		
		$Assistant = Assistant::getAssistant();
		$count = count($params);
		
		$user = $Assistant->isUserManager();
		$manager = $Assistant->isLogedManager();
		
		
		if($user){
			
				if($manager){
					
					switch($count){
					case 2:			
						switch($params[1]){
							case 'login':
							case 'orders':
									require ('app/model/management/front_model.php');	
									$this->Model = new FrontModel($params);
									$this->Template = new Template('app/view/management/front/');
									$this->tpl = 'front';
							
								break;			
							default:
								throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
								break;
							
						}
					
						break;
					case 3:
						switch($params[2]){
							case 'configuration':
									
									require ('app/model/management/configuration_model.php');	
									$this->Model = new ConfigurationModel($params);
									$this->Template = new Template('app/view/management/configuration/');
									$this->tpl = 'configuration';
									break;	
									
							case 'orders':
									require ('app/model/management/orders_model.php');	
									$this->Model = new OrdersModel($params);
									$this->Template = new Template('app/view/management/orders/');
									$this->tpl = 'orders';
									break;
										
							default:
								throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
								break;
							
						}
						break;
					default:
						throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
						break;
					
					}
				
				}else{
					
					switch($count){
					case 2:			
						switch($params[1]){
							case 'login':
							case 'orders':
									require ('app/model/management/login_model.php');	
									$this->Model = new LoginModel($params);
									$this->Template = new Template('app/view/management/login/');
									$this->tpl = 'login';
							
								break;			
							default:
								throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
								break;
							
						}
					
						break;
					case 3:
						switch($params[2]){
							case 'configuration':
							case 'orders':
									require ('app/model/management/login_model.php');	
									$this->Model = new LoginModel($params);
									$this->Template = new Template('app/view/management/login/');
									$this->tpl = 'login';
							
								break;			
							default:
								throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
								break;
							
						}
						break;
					default:
						throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
						break;
					
					}
					
				}
			
		}else{
			
			throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
				
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