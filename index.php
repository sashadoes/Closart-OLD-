<?php

define('PUMP', 'Og3');
mb_internal_encoding("UTF-8");
//error_reporting( E_ERROR );
 
try {
	
require ('core/exception.php');
require ('core/config.php');
require ('core/router.php');
require ('core/abstract_coreDB.php');
require ('core/temp_generator.php');
require ('core/assistant.php');
require ('core/layout_helper.php');

/*******test set******/
session_start();

if(!$_SESSION['TESTER'] && empty($_POST)){
	
	require ('TESTER.tpl');
	exit;
	
}
/*******test set******/


    $Router = new Router($_SERVER['REQUEST_URI']);
	$Router->parseUrl();
	
	$controller = $Router->getController();
	$params = $Router->getParams();

	//session_start(); //statistic;
	
	if(empty($_POST)){
				
			require ('app/controller/'.$controller.'_controller.php');
			$controller = (ucfirst($controller).'Controller');
			$Page = new $controller($params);
			$Page->work();
	
	}else{
		
			//SEARCH REQUEST
			//!!!HTTP_REFERER БЕЗОПАСТНОСТЬ!!
			require ('core/validator.php');
			$DataBase = DB::getDBO();
			$Assistant = Assistant::getAssistant();
			$Validator = new Validator();
			require ('ajax/common/common_ajax.php');
	
	}
	
	}catch (MyExp $ex){
		
		$ex->work();
		exit();
		
	}
		
exit();

?>