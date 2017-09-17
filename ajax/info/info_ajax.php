<?php

$time_stamp = time();
$lang = isset($_COOKIE['lang']) ? $_COOKIE['lang'] : 'ru';
$what = $_POST['what'];



switch ($what){

	
	/***********store_deal_letter*********/
	
	case 'store_deal_letter':
	
		$post['name'] = $Validator->cleanInput($_POST['name']); 
		$post['mail'] = $Validator->cleanInput($_POST['mail']); 
		$post['phone'] = $Validator->cleanInput($_POST['phone']); 
		$post['social'] = $Validator->cleanEmptyInput($_POST['social']); 
		$post['photo'] = $Validator->cleanEmptyInput($_POST['photo']); 
		$post['message'] = $Validator->cleanInput($_POST['message']); 
		
		
		
		
		// send message
		
		
			$json['flag'] = 'ok';
			
			echo json_encode($json);
		
			$filename = "static/basa/letters.txt";
			$file = @fopen($filename, 'r+');
		
		if(!$file){
			
			
			
		}else{
			
			
			$content = fread($file, filesize($filename));
			$content++;
			rewind($file);
			fwrite($file, $content);
			
			
		}
		fclose($file);
		

		
	    break;
		
	
	
	default:
		throw new MyExp('No answer');
	
	break;

	
	
}


?>