<?php

$time_stamp = time();
$lang = isset($_COOKIE['lang']) ? $_COOKIE['lang'] : 'ru';
$what = $_POST['what'];



switch ($what){

	
	/***********scroll_load_items*********/
	
	case 'scroll_load_items':
	
		$post['query'] = $Validator->cleanInput($_POST['query']); 
		
		$post['offset_exclusive'] = (int)$Validator->cleanEmptyInput($_POST['offset_exclusive']); 
		$post['offset_woman'] = (int)$Validator->cleanEmptyInput($_POST['offset_woman']); 
		$post['offset_man'] = (int)$Validator->cleanEmptyInput($_POST['offset_man']); 
		$post['offset_arts'] = (int)$Validator->cleanEmptyInput($_POST['offset_arts']); 
		
     
		
		$result = $DataBase->demand('eF', "SELECT art, name, store, price, discount FROM ".Config::DB_PREFIX."exclusive_items WHERE anti_promo = ? AND name LIKE ? ORDER BY date DESC LIMIT 15 OFFSET ".$post['offset_exclusive'],
		array(Config::PROMO_SETUP, '%'.$post['query'].'%'));
		
		$offset_exclusive = $DataBase->affectedRows();
		
		while($row = $result->fetch_assoc()){
			
			$items[] = array(
				
				'art' => $row['art'],
				'name' => $row['name'],
				'store' => $row['store'],
				'price' => $row['price'],
				'discount' => $row['discount'],
			
			);
		}
		
		$result = $DataBase->demand('eF', "SELECT art, name, store, price, discount FROM ".Config::DB_PREFIX."man_items WHERE anti_promo = ? AND name LIKE ? ORDER BY date DESC LIMIT 15 OFFSET ".$post['offset_man'],
		array(Config::PROMO_SETUP, '%'.$post['query'].'%'));
		
		$offset_man = $DataBase->affectedRows();
		
		while($row = $result->fetch_assoc()){
			
			$items[] = array(
				
				'art' => $row['art'],
				'name' => $row['name'],
				'store' => $row['store'],
				'price' => $row['price'],
				'discount' => $row['discount'],
			
			);
		}
		
		$result = $DataBase->demand('eF', "SELECT art, name, store, price, discount FROM ".Config::DB_PREFIX."woman_items WHERE anti_promo = ? AND name LIKE ? ORDER BY date DESC LIMIT 15 OFFSET ".$post['offset_woman'],
		array(Config::PROMO_SETUP, '%'.$post['query'].'%'));
		
		$offset_woman = $DataBase->affectedRows();
		
		while($row = $result->fetch_assoc()){
			
			$items[] = array(
				
				'art' => $row['art'],
				'name' => $row['name'],
				'store' => $row['store'],
				'price' => $row['price'],
				'discount' => $row['discount'],
			
			);
		}
		
		
		$result = $DataBase->demand('eF', "SELECT art, name, store, price, discount FROM ".Config::DB_PREFIX."arts_items WHERE anti_promo = ? AND name LIKE ? ORDER BY date DESC LIMIT 15 OFFSET ".$post['offset_arts'],
		array(Config::PROMO_SETUP, '%'.$post['query'].'%'));
		
		$offset_arts = $DataBase->affectedRows();
		
		while($row = $result->fetch_assoc()){
			
			$items[] = array(
				
				'art' => $row['art'],
				'name' => $row['name'],
				'store' => $row['store'],
				'price' => $row['price'],
				'discount' => $row['discount'],
			
			);
		}
			
		if((count($stores) <= 0) && (count($items) <= 0)){
			
			$items = false;
			
		}else{
			
			shuffle($items);
		}
		

		
		$currency = $Assistant->getCurrency();
		$rate = $Assistant->getCurrencyRate();
		
		$json['offset']['exclusive'] = $offset_exclusive;
		$json['offset']['man'] = $offset_man;
		$json['offset']['woman'] = $offset_woman;
		$json['offset']['arts'] = $offset_arts;
		
		$json['flag'] = 'ok';
		$json['currency'] = $currency;
		$json['rate'] = $rate;
		$json['items'] = $items;
		
		echo json_encode($json);
	

		
	    break;
		
	
	
	default:
	
		throw new MyExp('No answer');
	
	break;

	
	
}


?>