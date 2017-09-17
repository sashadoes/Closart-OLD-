<?php

$time_stamp = time();
$lang = isset($_COOKIE['lang']) ? $_COOKIE['lang'] : 'ru';
$what = $_POST['what'];



switch ($what){
	/***************SHOP***************/
	
	/***************scroll_load_items***************/
	
	case 'scroll_load_items':
	
		
		$post['offset'] = (int)$Validator->cleanEmptyInput($_POST['offset']); 
		$post['category'] = $Validator->cleanInput($_POST['category']); 
		
		$table= $Assistant->getItemProfTable($post['category']);
		
		$result = $DataBase->demand('eF', 'SELECT art, name, store,  price, discount FROM '.Config::DB_PREFIX.$table.'_items WHERE category = ? AND anti_promo = ? ORDER BY date DESC LIMIT 20 OFFSET '.$post['offset'], 
		array( $post['category'], Config::PROMO_SETUP ));
		
		if($DataBase->affectedRows() <= 0){
			
			$items = false;
			
		}else{
			
			while ($row = $result->fetch_assoc()) {
				
				$items[]=$row;
				
			}
			
			
		}
		
		$currency = $Assistant->getCurrency();
		$rate = $Assistant->getCurrencyRate();
		
		$json['flag'] = 'ok';
		$json['currency'] = $currency;
		$json['rate'] = $rate;
		$json['items'] = $items;
		
		echo json_encode($json);
	
	break;
	
	/***************CART***************/
	
	/***********select_region_cart*********/
	
	case 'select_region_cart':
	
		$post['region'] = (int)$Validator->cleanEmptyInput($_POST['region']); 
		$post['store'] = $Validator->cleanInput($_POST['store']); 
		
		
		$result = $DataBase->demand('eF', "SELECT delivery FROM ".Config::DB_PREFIX."stores WHERE url_name = ? ", 
		array( $post['store']));
		
		if ($result->num_rows !== 1){
			unset ($DataBase);
			throw new MyExp('SOME_PROBLEM', $lang);
		
		}else{
		
			$row = $result->fetch_assoc();
			
			$lang_number = (int)$Assistant->getLangNumber();
			
			$delivery = explode(Config::LANG_SEPARATOR, $row['delivery']);
			
			$delivery = $delivery[$lang_number];
			
			
			$delivery = explode(Config::THIRD_SEPARATOR, $delivery);
			
			
			if(empty($delivery[$post['region']])){
				throw new MyExp('SOME_PROBLEM', $lang);
			}
			
			$delivery = $delivery[$post['region']];
		
		
			$json['flag'] = 'ok';
			$json['store'] = $post['store'];
			$json['delivery'] = $delivery;
			echo json_encode($json);
		}
		
		
		unset ($DataBase);
		
	    break;
		
		
		
	/***********delivery_load_bio*********/
	
	case 'delivery_load_bio':
	
		
		$post['region'] = (int)$Validator->cleanEmptyInput($_POST['region']); 
		$post['store'] = $Validator->cleanInput($_POST['store']); 
		
		
		$result = $DataBase->demand('eF', "SELECT delivery FROM ".Config::DB_PREFIX."stores WHERE url_name = ? ", 
		array( $post['store']));
		
		if ($result->num_rows !== 1){
			unset ($DataBase);
			throw new MyExp('SOME_PROBLEM', $lang);
		
		}else{
		
			$row = $result->fetch_assoc();
			
			$lang_number = (int)$Assistant->getLangNumber();
			
			$delivery = explode(Config::LANG_SEPARATOR, $row['delivery']);
			
			$delivery = $delivery[$lang_number];
			
			
			$delivery = explode(Config::THIRD_SEPARATOR, $delivery);
			
			
			if(empty($delivery[$post['region']])){
				throw new MyExp('SOME_PROBLEM', $lang);
			}
			
			$delivery = $delivery[$post['region']];
		
			$json['flag'] = 'ok';
			$json['delivery'] = $delivery;
			echo json_encode($json);
		}
		
		
		unset ($DataBase);
		
	    break;
		
	default:
		throw new MyExp('No answer');
	
	break;
	
	
}


?>