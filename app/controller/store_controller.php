<?php

class StoreController {
	
	private $tpl;
	
	private $Model;
	private $Template;
	
	
	public function __construct ( $params ) {
		
		$Assistant = Assistant::getAssistant();
		
		$count = count($params);

		
			switch ($count){
					
					case 1:
					
						require ('app/model/store/bio_model.php');	
						$this->Model = new BioModel($params);
						$this->Template = new Template('app/view/store/bio/');
						$this->tpl = 'bio';
					
						break;
					
					case 2:
					
						if($params[1] === 'admin'){
							
							$params[2]= 'news';
							$store = $Assistant->isUserStore($params[0]);
							
							if($store){
								
								if($Assistant->isLogedStore($params[0])){
									
									require ('app/model/store/admin/front_model.php');	
									$this->Model = new FrontModel($params);
									$this->Template = new Template('app/view/store/admin/front/');
									$this->tpl = 'front';
									
								}else{
									
									require ('app/model/store/admin/login_model.php');	
									$this->Model = new LoginModel($params);
									$this->Template = new Template('app/view/store/admin/login/');
									$this->tpl = 'login';
									
								}
								
							}else{
								throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
							}
							
						}else{
							
							require ('app/model/store/shop_model.php');	
							$this->Model = new ShopModel($params);
							$this->Template = new Template('app/view/store/shop/');
							$this->tpl = 'shop';
							
						}
						
						break;
					case 3:
						
					
						if($params[1] === 'admin'){
							
							
							$store = $Assistant->isUserStore($params[0]);
							
								if($store){
									
									if($Assistant->isLogedStore($params[0])){
										
										
										switch($params[2]){
											
											case 'news':
								
												require ('app/model/store/admin/front_model.php');	
												$this->Model = new FrontModel($params);
												$this->Template = new Template('app/view/store/admin/front/');
												$this->tpl = 'front';
												break;
											
											case 'orders':
												
												require ('app/model/store/admin/orders_model.php');	
												$this->Model = new OrdersModel($params);
												$this->Template = new Template('app/view/store/admin/orders/');
												$this->tpl = 'orders';
												break;
											
											case 'messages':
												
												require ('app/model/store/admin/messages_model.php');	
												$this->Model = new MessagesModel($params);
												$this->Template = new Template('app/view/store/admin/messages/');
												$this->tpl = 'messages';
												break;
											
											case 'items':
												
												require ('app/model/store/admin/items_model.php');	
												$this->Model = new ItemsModel($params);
												$this->Template = new Template('app/view/store/admin/items/');
												$this->tpl = 'items';
												break;
											
											case 'marketing':
												
												require ('app/model/store/admin/marketing_model.php');	
												$this->Model = new MarketingModel($params);
												$this->Template = new Template('app/view/store/admin/marketing/');
												$this->tpl = 'marketing';
												break;
												
											case 'settings':
												
												require ('app/model/store/admin/settings_model.php');	
												$this->Model = new SettingsModel($params);
												$this->Template = new Template('app/view/store/admin/settings/');
												$this->tpl = 'settings';
												break;
												
											case 'help':
												
												require ('app/model/store/admin/help_model.php');	
												$this->Model = new HelpModel($params);
												$this->Template = new Template('app/view/store/admin/help/');
												$this->tpl = 'help';
												break;
											
											default:
			
												throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
												break;
										}
										
										
									}else{
										
										require ('app/model/store/admin/login_model.php');	
										$this->Model = new LoginModel($params);
										$this->Template = new Template('app/view/store/admin/login/');
										$this->tpl = 'login';
										
										
									}
									
									
								}else{
										throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
								}
								
						}elseif($params[1] === 'item'){
							
							require ('app/model/store/item_model.php');	
							$this->Model = new ItemModel($params);
							$this->Template = new Template('app/view/store/item/');
							$this->tpl = 'item';
						
						
						}else{
							throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
						}
						
						break;
						
					case 4:
						
						if($params[1] === 'admin'){
							
							
							$store = $Assistant->isUserStore($params[0]);
							
								if($store){
									
									if($Assistant->isLogedStore($params[0])){
										
										
										switch($params[2]){
											
											
											case 'items':
												
												require ('app/model/store/admin/items_model.php');	
												$this->Model = new ItemsModel($params);
												$this->Template = new Template('app/view/store/admin/items/');
												$this->tpl = 'items';
												break;
													
											default:
			
												throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
												break;
										}
										
										
									}else{
										
										require ('app/model/store/admin/login_model.php');	
										$this->Model = new LoginModel($params);
										$this->Template = new Template('app/view/store/admin/login/');
										$this->tpl = 'login';
										
										
									}
									
									
								}else{
										throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
								}
								
					
						}else{
							throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
						}
						
					
					   break;
						
					default:
			
						throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
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