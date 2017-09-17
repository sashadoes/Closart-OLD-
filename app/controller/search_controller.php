<?php

class SearchController {
	
	private $tpl;
	
	private $Model;
	private $Template;
	
	
	public function __construct ( $params ) {

		if(count($params) > 2){
			throw new MyExp("<code>404</code><mess>Not Found</mess>", 404);
		}
		

				require ('app/model/search/search_model.php');	
				$this->Model = new SearchModel($params);
				$this->Template = new Template('app/view/search/');
				$this->tpl = 'search';

		
	}
	
	public function work (){
		
		$data = $this->Model->getData();
		$tpl = $this->tpl;
		
		$this->Template->setData($data);
		$this->Template->display($tpl);
		
	}
		
	
}





?>