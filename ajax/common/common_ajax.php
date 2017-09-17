<?php

$what = $_POST['what'];


switch ($what){
	
	case 'TESTER':
		
		$post['password'] = $Validator->cleanInput($_POST['password']); 
		
		session_start();
		
			switch($post['password']){
				
				case 'sas13':
				
					$_SESSION['TESTER'] = 'ok';
					
					$json['flag'] = 'ok';
					$json['message'] = 'Здравствуйте, Александр!';
					echo json_encode($json);
					break;
					
				case 'SymonZ':
				
					$_SESSION['TESTER'] = 'ok';
					
					$json['flag'] = 'ok';
					$json['message'] = 'Здравствуйте, Семен!';
					echo json_encode($json);
					break;	
				
				default:
				throw new MyExp('В доступе отказано! <br><br> ( Access denied )');
				
			}
	
		
	
	break;
	/*******setts**********/
	
	case 'set_lang':
		
		
		$post['lang'] = $Validator->cleanInput($_POST['lang']); 
		
		setcookie('lang', $post['lang'], time()+100000000, '/');
		
		$json['flag'] = 'ok';
		echo json_encode($json);
	
	break;
	
	
	case 'set_currency':
		
		
		$post['currency'] = $Validator->cleanInput($_POST['currency']); 
		
		setcookie('currency', $post['currency'], time()+100000000, '/');
		
		$json['flag'] = 'ok';
		echo json_encode($json);
	
	break;
	
	
	/***********delete_cart_item*********/
	
	case 'delete_cart_item':
	
		$post['alias'] = $Validator->cleanInput($_POST['alias']); 
		
		$cart_array = $Assistant->getCatItemsArts();
		
		$index = (int)array_search($post['alias'], $cart_array);
		
		if(!isset($index)){
			throw new MyExp('No answer');
		}
		
		unset($cart_array[$index]);
		
		foreach($cart_array as $item){
			$cart[] = $item;
		}
		
		setcookie('cart', json_encode($cart), time() + (3600 * 96), '/');
		setcookie ( $post['alias'], '', time() - 3600, '/'); 
	
		$json['flag'] = 'ok';
		echo json_encode($json);
	
	    break;
		
	/***********global_search*********/
	
	case 'global_search':
	
		$post['query'] = $Validator->cleanEmptyInput($_POST['query']);
		
		$result = $DataBase->demand('eF', "SELECT name, url_name FROM ".Config::DB_PREFIX."stores WHERE name LIKE ?",
		array( '%'.$post['query'].'%'));
		
		while($row = $result->fetch_assoc()){
			
			$stores[] = array(
				
				'type' => 'store',
				'name' => $row['name'],
				'url_name' => $row['url_name'],
			
			);
		}
		
		$result = $DataBase->demand('eF', "SELECT art, name, store FROM ".Config::DB_PREFIX."exclusive_items WHERE anti_promo = ? AND name LIKE ? ORDER BY date DESC LIMIT 15",
		array(Config::PROMO_SETUP, '%'.$post['query'].'%'));
		
		while($row = $result->fetch_assoc()){
			
			$items[] = array(
				
				'type' => 'item',
				'art' => $row['art'],
				'name' => $row['name'],
				'store' => $row['store'],
			
			);
		}
		
		$result = $DataBase->demand('eF', "SELECT art, name, store FROM ".Config::DB_PREFIX."man_items WHERE anti_promo = ? AND name LIKE ? ORDER BY date DESC LIMIT 15",
		array(Config::PROMO_SETUP, '%'.$post['query'].'%'));
		
		while($row = $result->fetch_assoc()){
			
			$items[] = array(
				
				'type' => 'item',
				'art' => $row['art'],
				'name' => $row['name'],
				'store' => $row['store'],
			
			);
		}
		
		$result = $DataBase->demand('eF', "SELECT art, name, store FROM ".Config::DB_PREFIX."woman_items WHERE anti_promo = ? AND name LIKE ? ORDER BY date DESC LIMIT 15",
		array(Config::PROMO_SETUP, '%'.$post['query'].'%'));
		
		while($row = $result->fetch_assoc()){
			
			$items[] = array(
				
				'type' => 'item',
				'art' => $row['art'],
				'name' => $row['name'],
				'store' => $row['store'],
			
			);
		}
		
		
		$result = $DataBase->demand('eF', "SELECT art, name, store FROM ".Config::DB_PREFIX."arts_items WHERE anti_promo = ? AND name LIKE ? ORDER BY date DESC LIMIT 15",
		array(Config::PROMO_SETUP, '%'.$post['query'].'%'));
		
		while($row = $result->fetch_assoc()){
			
			$items[] = array(
				
				'type' => 'item',
				'art' => $row['art'],
				'name' => $row['name'],
				'store' => $row['store'],
			
			);
		}
		
		
		shuffle($items);
		$json['suggestions'] = array_merge( $stores, $items);
		echo json_encode($json);
	
	    break;	
	
	default:
	
		require ('ajax/'.$controller.'/'.$controller.'_ajax.php');
	
	break;
	
	
}


?>