<?php

class InfoController {
	
	private $tpl;
	
	private $Model;
	private $Template;
	
	
	public function __construct ( $params ) {

		if(count($params) > 2){
			throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
		}
		
		
		switch ($params[1]){
			
			case 'about':
			
				require ('app/model/info/about_model.php');	
				$this->Model = new AboutModel($params);
				$this->Template = new Template('app/view/info/about/');
				$this->tpl = 'about';
				
				break;
				
				
			case 'customers':
				
				require ('app/model/info/customers_model.php');	
				$this->Model = new CustomersModel($params);
				$this->Template = new Template('app/view/info/customers/');
				$this->tpl = 'customers';
				
				break;
				
			
			case 'stores':
			
				require ('app/model/info/stores_model.php');	
				$this->Model = new StoresModel($params);
				$this->Template = new Template('app/view/info/stores/');
				$this->tpl = 'stores';
				
				break;
				
			case 'policy':
			
				require ('app/model/info/policy_model.php');	
				$this->Model = new PolicyModel($params);
				$this->Template = new Template('app/view/info/policy/');
				$this->tpl = 'policy';
				
				break;

			case 'contacts':
			
				require ('app/model/info/contacts_model.php');	
				$this->Model = new ContactsModel($params);
				$this->Template = new Template('app/view/info/contacts/');
				$this->tpl = 'contacts';
				
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