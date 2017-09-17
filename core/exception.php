<?php

class MyExp extends Exception {
	
	protected $mess;
	protected $code;
	
	private $Template;
	private $Assistant;
	private $LayoutHelper;
	
	public function __construct ($mess, $code = false){
		
			$this->mess = $mess;
			$this->code = $code;
			$this->Template = new Template('app/view/error/');
			$this->Assistant = Assistant::getAssistant();
			$this->LayoutHelper = new LayoutHelper();

	} 
	
	public function work() {
 
	if (!empty($_POST)){ 
	
		if($this->code !== false){
			$ini = parse_ini_file('langs/'.$this->code.'/ajax/error.ini', true);
			$json['error'] = $ini['errors'][$this->mess];
			echo json_encode($json);
		}else{
			$json['error'] = $this->mess;
			echo json_encode($json);
			
		}
	

	} else {
	
		header($_SERVER['SERVER_PROTOCOL'].$this->code);
		
		$data['assistant']['lang'] = $this->Assistant->getLang();
		$ini = parse_ini_file('langs/'.$data['assistant']['lang'].'/error/error.ini', true);
		
		$data['assistant']['currency'] = $this->Assistant->getCurrency();
		$data['assistant']['cart_count'] = $this->Assistant->getCartItemCount();

		$data['layout']['menu_main'] = $this->LayoutHelper->getMenuMain();
		$data['layout']['menu_more'] = $this->LayoutHelper->getMenuMore();
		$data['layout']['cart_layout'] = $this->LayoutHelper->getCart();
		
		$data['common'] = $this->LayoutHelper->getCommonIni();
		
		$data['static'] = $ini;
	    $data['static']['mess'] = $this->mess;
	    $data['static']['code'] = $this->code;
	    
        $this->Template->setData($data);
		$this->Template->display('error');
		
		}

	}
}


?>