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
		
		$store = $params[0];
		
		$result = $DataBase->demand('eF', 'SELECT art, name, price, discount FROM '.Config::DB_PREFIX.$store.'_store WHERE category_self = ? ORDER BY date DESC LIMIT 20 OFFSET '.$post['offset'], 
		array( $post['category']));
		
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
	
	
	/************USER************/
	/********ASK QUESTION**********/
	
	case 'ask_question':
	
	if(!$Assistant->isLogedUser()){
			throw new MyExp('No answer');
		}
		
	if($_POST['store'] != $params[0]){
			throw new MyExp('No answer');
		}	
		
	$post['art'] = $Validator->cleanInput($_POST['art']);
	$post['name'] = $Validator->cleanInput($_POST['name']);
	$post['store'] = $Validator->cleanInput($_POST['store']);
	$post['message'] = $Validator->cleanInput($_POST['message']);
	
	
	$post['message'] = $Validator->sendMessagePretty($post['message']);
	
	$post['message'] = Config::THIRD_SEPARATOR.$post['message'].Config::SECOND_SEPARATOR.'u'.Config::SECOND_SEPARATOR.$time_stamp;
	
	$user = $_SESSION['login'];
	
	
	$result = $DataBase->demand('eF', "SELECT flag FROM ".Config::DB_PREFIX."messages WHERE user = ? AND art = ? ", 
	array($user, $post['art']));
	
	
	if ($result->num_rows <= 0){
		
		$DataBase->demand('eF', "INSERT INTO ".Config::DB_PREFIX."messages (user, store, art, name, conversation, date, flag) VALUES (?, ?, ?, ?, ?, ?, ?)", 
		array($user, $post['store'], $post['art'], $post['name'], $post['message'], $time_stamp, 'u'));
		
	
	}else{
		
		$DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX."messages SET conversation = CONCAT( ?, conversation ), date = ?, flag = ? WHERE user = ? AND store = ? AND art = ? ", 
		array($post['message'], $time_stamp, 'u', $user, $post['store'], $post['art']));
		
	}
	
	unset ($DataBase);
	
	$ini = parse_ini_file('langs/'.$lang.'/ajax/success.ini', true);
	$ajax_message = $ini['ajax']['ASK_QUESTION_RESPONSE'];
	
	$json['message'] = $ajax_message;
	$json['flag'] = 'login';
	echo json_encode($json);
	break;	
	
	/************buy_product*********/
	
	case 'buy_product':
	
	
		$post['art'] = $Validator->cleanInput($_POST['art']);
		$post['name'] = $Validator->cleanInput($_POST['name']);
		$post['price'] = $Validator->cleanInput($_POST['price']);
		$post['discount'] = $Validator->cleanEmptyInput($_POST['discount']);
		
		$opt = 1;
		while($_POST['op_'.$opt]){
			$op_name = $Validator->cleanInput($_POST['name_op_'.$opt]);
			$op = $Validator->cleanInput($_POST['op_'.$opt]);
			$opt++;
			$options .=  $op_name.' - '.$op.'; ';
		}
		

		$string = $Assistant->getRandomString(10);
		
		$cart_array = $Assistant->getCatItemsArts();
		
		if($cart_array){
			while(in_array($string, $cart_array)){
				$string = $Assistant->getRandomString(10);	
			}
		}
		
		
		$cart_array[] = $string;
		
		setcookie('cart', json_encode($cart_array), time() + (3600 * 96), '/');
		
		$store = $params[0];
		//$photo = 'http://'.$_SERVER['SERVER_NAME'].'/files/stores/'.$store.'/items_img_min/'.$post['art'].'/p_1.jpg'; //полный адресс;
	
		setcookie($string, json_encode(array(
		"art" => $post['art'],
		"store" => $store,
		//"photo" => $photo,
		"name" => $post['name'],
		"price" => $post['price'],
		"discount" => $post['discount'],
		"options" =>$options,
		)), time() + (3600 * 96), '/');

			
		
		$json['flag'] = 'ok';
		
		echo json_encode($json);
	
		
		
		
		
	break;
	
	/**************ADMIN****************/
	
	/***********LOG_OUT*********/
	
	case 'log_out':
	
		session_start();
		
		unset($_SESSION['id_store']);
		unset($_SESSION['url_store']);
		
		$json['flag'] = 'log_out';
		
		echo json_encode($json);
	    break;
	
	/**************login****************/
	
	case 'login':
	
	if(!$Assistant->isUserStore($params[0])){
			throw new MyExp('No answer');
		}
	
	$post['password'] = $Validator->cleanInput($_POST['password']); 
	
	$user_id = 	$Assistant->getUserId();
	$store = $params[0];

	
	$result = $DataBase->demand('eF', "SELECT id, url_name, password FROM ".Config::DB_PREFIX."stores WHERE id_user = ? AND url_name = ? ", array($user_id, $store));
	
	if ($result->num_rows !== 1){
		unset ($DataBase);
		throw new MyExp('ENTER_ADMIN_DENY', $lang);
	}else{
		
		$row = $result->fetch_assoc();
		$hash = $row['password'];
		$password = md5($post['password'].Config::SECRET).md5(Config::SECRET.$post['password']);
		
				if (password_verify($password, $hash)){
						session_start();
						$_SESSION['id_store'] = $row['id'];
						$_SESSION['url_store'] = $row['url_name'];
				
				} else {
						throw new MyExp('ENTER_ADMIN_DENY', $lang);				
				}
	}	
	unset($DataBase);
	
	$ini = parse_ini_file('langs/'.$lang.'/ajax/success.ini', true);
	$ajax_message = $ini['ajax']['SUCCESS_LOGIN'];
	
	$json['message'] = $ajax_message;
	$json['flag'] = 'login';
	echo json_encode($json);
	break;
	
	/**********settings***********/
	
	/********settings_main********/	
		
	case 'settings_main':
	
		if(!$Assistant->isLogedStore($params[0])){
			throw new MyExp('No answer');
		}
		
		$post['name'] = $Validator->cleanInput($_POST['name']); 
	    $post['surname'] = $Validator->cleanInput($_POST['surname']);
	    $post['secondname'] = $Validator->cleanInput($_POST['secondname']);
	    $post['phone'] = $Validator->cleanInput($_POST['phone']);
	    $post['mail'] = $Validator->cleanInput($_POST['mail']);
	    $post['address'] = $Validator->cleanInput($_POST['address']);
	
		if (!$Validator->nameIsValid($post['name'])){
			throw new MyExp('BAD_NAME', $lang);
		}
			
		if (!$Validator->nameIsValid($post['surname'])) { 
			throw new MyExp('BAD_SURNAME', $lang);
		}
		
		if (!$Validator->nameIsValid($post['secondname'])) { 
			throw new MyExp('BAD_SECONDNAME', $lang);
		}

		if (!$Validator->mailIsValid($post['mail'])){
			throw new MyExp('BAD_MAIL', $lang);
		}
		
		$post['name'] = $Validator->namePretty($post['name']); 
	    $post['surname'] = $Validator->namePretty($post['surname']);
	    $post['secondname'] = $Validator->namePretty($post['secondname']);
		$id_store = $_SESSION['id_store'];
		$store = $_SESSION['url_store'];
		
		$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX."stores SET person_name = ?, person_surname = ?, person_secondname = ?, mail = ?, phone = ?, address = ? WHERE id = ? AND url_name = ? ", 
		array( $post['name'], $post['surname'], $post['secondname'], $post['mail'], $post['phone'], $post['address'], $id_store, $store));
		unset ($DataBase);
		$ini = parse_ini_file('langs/'.$lang.'/ajax/success.ini', true);
	    $ajax_message = $ini['ajax']['SUCCESS_UPDATE'];
		
		$json['message']= $ajax_message;
		echo json_encode($json);
	
		break;
		
	/********card_settings********/		
		
	case 'card_settings':
		
		if(!$Assistant->isLogedStore($params[0])){
			throw new MyExp('No answer');
		}
		
		$post['card'] = $Validator->cleanInput($_POST['card']);
		$post['card_name'] = $Validator->cleanInput($_POST['card_name']); 
	    $post['card_surname'] = $Validator->cleanInput($_POST['card_surname']);
		
		if (!$Validator->cardIsValid($post['card'])){
			throw new MyExp('BAD_CARD', $lang);
		}
	    
		if (!$Validator->nameIsValid($post['card_name'])){
			throw new MyExp('BAD_NAME', $lang);
		}
		
		if (!$Validator->nameIsValid($post['card_surname'])){
			throw new MyExp('BAD_SURNAME', $lang);
		}
		
		$post['card_name'] = $Validator->namePretty($post['card_name']); 
	    $post['card_surname'] = $Validator->namePretty($post['card_surname']);
		$id_store = $_SESSION['id_store'];
		$store = $_SESSION['url_store'];
		
		$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX."stores SET card = ?, card_name = ?, card_surname = ? WHERE id = ? AND url_name = ? ", 
		array( $post['card'], $post['card_name'], $post['card_surname'], $id_store, $store));
		unset ($DataBase);
		$ini = parse_ini_file('langs/'.$lang.'/ajax/success.ini', true);
	    $ajax_message = $ini['ajax']['SUCCESS_UPDATE'];
		
		$json['message']= $ajax_message;
		echo json_encode($json);
		
		break;
		
	/********password_settings********/		
		
	case 'password_settings':
		
		if(!$Assistant->isLogedStore($params[0])){
			throw new MyExp('No answer');
		}
		
		$post['password'] = $Validator->cleanInput($_POST['password']);
		$post['new_password1'] = $Validator->cleanInput($_POST['new_password1']); 
	    $post['new_password2'] = $Validator->cleanInput($_POST['new_password2']);
		
		if (!$Validator->passIsValid($post['password'])){
			throw new MyExp('BAD_PASSWORD', $lang);
		}	    
		if (!$Validator->passIsValid($post['new_password1'])){
			throw new MyExp('BAD_PASSWORD', $lang);
		}		
		if($post['new_password1'] !== $post['new_password2']){
			throw new MyExp('NO_SAME_PASSWORD', $lang);
		}
		
		$id_store = $_SESSION['id_store'];
		$store = $_SESSION['url_store'];	
		
		$result = $DataBase->demand('eF', "SELECT password FROM ".Config::DB_PREFIX."stores WHERE id = ? AND url_name = ?",
		array($id_store, $store));
		if ($result->num_rows !== 1){
			unset ($DataBase);
			throw new MyExp('SOME_PROBLEM', $lang);
		}else{
			$row = $result->fetch_assoc();
			$hash = $row['password'];
			$password = md5($post['password'].Config::SECRET).md5(Config::SECRET.$post['password']);
			
				if (password_verify($password, $hash)) {
					
					$new_password = md5($post['new_password1'].Config::SECRET).md5(Config::SECRET.$post['new_password1']);
					$password = password_hash($new_password, PASSWORD_DEFAULT);
					$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX."stores SET password = ? WHERE id = ? AND url_name = ?", 
					array( $password, $id_store, $store));
					unset ($DataBase);	
					$ini = parse_ini_file('langs/'.$lang.'/ajax/success.ini', true);
					$ajax_message = $ini['ajax']['SUCCESS_UPDATE'];
					$json['message']= $ajax_message;
					echo json_encode($json);					
				} else {
					unset ($DataBase);
					throw new MyExp('WRONG_PASSWORD', $lang);
				}			
	}	

		break;	
		
	/**********messages**********/
	
	/**********load_dialog*******/

	case 'load_dialog':	
	
		if(!$Assistant->isLogedStore($params[0])){
			throw new MyExp('No answer');
		}
		
		$post['id_dialod'] = (int)$Validator->cleanInput($_POST['id_dialod']);
		$store = $_SESSION['url_store'];
		
		if($_POST['new_message']){
			
			$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX."messages SET flag = ? WHERE id = ? AND store = ? ", 
			array( 'n', $post['id_dialod'], $store));
			
			$_SESSION['messages_flag_store']--;
			
			if($_SESSION['messages_flag_store'] <= 0){
				unset($_SESSION['messages_flag_store']);
			}
			
		}
		
		
			$result = $DataBase->demand('eF', "SELECT id, user, store, conversation FROM ".Config::DB_PREFIX."messages WHERE id = ? AND store = ?",
			array($post['id_dialod'], $store));
			
			$row = $result->fetch_assoc();
			
			unset ($DataBase);
			
			
		
		
		$json = $row;
		$json['status']= 'ok';
		echo json_encode($json);		
		
			
	break;	
	
	
	/**********send_message**********/
	
	case 'send_message':
	
		if(!$Assistant->isLogedStore($params[0])){
			throw new MyExp('No answer');
		}
		
		 
		$post['id_dialod'] = (int)$Validator->cleanInput($_POST['id_dialog']);
		$post['message'] = $Validator->cleanInput($_POST['message']);
		
		$post['message'] = $Validator->sendMessagePretty($post['message']);
	
		$post['message'] = Config::THIRD_SEPARATOR.$post['message'].Config::SECOND_SEPARATOR.'s'.Config::SECOND_SEPARATOR.$time_stamp;
	
		$store = $_SESSION['url_store'];
		
		
		$DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX."messages SET conversation = CONCAT( ?, conversation ), date = ?, flag = ? WHERE id = ? AND store = ?", 
		array($post['message'], $time_stamp, 's', $post['id_dialod'], $store));
		
		unset($DataBase);
		
		$json['message'] = 'ok';
		echo json_encode($json);
	
	break;
	
	/**********scroll_load_dilogs**********/
	
	case 'scroll_load_dilogs':
	
		if(!$Assistant->isLogedStore($params[0])){
			throw new MyExp('No answer');
		}
		
		session_start();

		$post['offset'] = (int)$Validator->cleanInput($_POST['offset']);
		
	
		$store = $_SESSION['url_store'];
	
		$result = $DataBase->demand('eF', "SELECT id, user, art, name, flag, date FROM ".Config::DB_PREFIX."messages WHERE store = ? ORDER BY date DESC LIMIT 20 OFFSET ".$post['offset'], 
		array($store));
		
		$i = 0;
		
		while($row = $result->fetch_assoc()){
			
			$dilogs[$i]['id']= $row['id'];
			
			$dilogs[$i]['user']= $row['user'];
			$dilogs[$i]['name']= $row['name'];
			$dilogs[$i]['img']= 'http://'.$_SERVER['HTTP_HOST'].'/files/stores/'.$store.'/items_img_min/'.$row['art'].'/'.$row['art'].'_p_1.jpg';
			
			$dilogs[$i]['class'] = ($row['flag']== 'u') ?  'new_message' : '';
			
			
			$i++;
			
		}
		
		unset($DataBase);
		
		$json['flag'] = 'ok';
		$json['dilogs'] = $dilogs;
		echo json_encode($json);
	
	break;
	
	
	/**********ITEM ULOAD**********/
	/*********item_new**********/
	
	case 'item_new':
		
		if(!$Assistant->isLogedStore($params[0])){
			throw new MyExp('No answer');
		}
		
		$post['name'] = $Validator->cleanInput($_POST['name']);
		$post['seo'] = $Validator->cleanInput($_POST['seo']); 
	    $post['date'] = $Validator->cleanInput($_POST['date']);
	    $post['category'] = $Validator->cleanInput($_POST['category']);
	    $post['category_self'] = $Validator->cleanInput($_POST['category_self']);
	    $post['options'] = $Validator->cleanEmptyInput($_POST['options']);
	    $post['description'] = $Validator->cleanEmptyInput($_POST['description']);
	    $post['price'] = $Validator->cleanInput($_POST['price']);
	    $post['discount'] = (int)$Validator->cleanEmptyInput($_POST['discount']);
	    $post['amount'] = $Validator->cleanInput($_POST['amount']);
		

		if (!$Validator->isCheckdate($post['date'])){
			throw new MyExp('BAD_DATE', $lang);
		}
		
		if (!$Validator->isValidCategory($post['category'])){
			throw new MyExp('BAD_CATEGORY', $lang);
		}
		
		if (!$Validator->isNumeric($post['price'])){
			throw new MyExp('BAD_PRICE', $lang);
		}
		
		if ($post['price'] <= 0.1){
			throw new MyExp('BAD_PRICE', $lang);
		}
		
		$post['options'] = $Validator->itemOptionProceed($post['options']);
		 
		if($post['options'] === false){
			throw new MyExp('BAD_OPTIONS', $lang); 
		}
	   
		if (!$Validator->isNumeric($post['discount'])){
			throw new MyExp('BAD_DISCOUNT', $lang);
		}
		
		if (!$Validator->isNumeric($post['amount'])){
			throw new MyExp('BAD_AMOUNT', $lang);
		}
	  
	  if(is_uploaded_file($_FILES['p_1']['tmp_name']) && is_uploaded_file($_FILES['p_2']['tmp_name'])){
		  
			$art = $_SESSION['art'];
			$store = $_SESSION['url_store'];
			$date_arr = explode('.',$post['date']);
			$post['date'] = mktime( 0, 0, 0, $date_arr[1], $date_arr[0], $date_arr[2] );
			//$post['date'] = mktime($post['date']);
			
			 $chars = 'abdefhiknrstyzABDEFGHKNQRSTYZ23456789';
			 $numChars = strlen($chars);
		     $string = '';
			 for ($i = 0; $i < 14; $i++) {
			 $string .= substr($chars, rand(1, $numChars) - 1, 1);
		    }
			 
			$DataBase->demand('eF', "INSERT INTO ".Config::DB_PREFIX.$store."_store (art, name, price, discount, category, category_self, description, options, amount, seo, date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 
			array($string, $post['name'], $post['price'], $post['discount'], $post['category'], $post['category_self'], $post['description'], $post['options'], $post['amount'], $post['seo'], $post['date']));
			
			$inserted_id =$DataBase->getLastId();

			require ('library/php/class_upload.php');
			//mkdir('files/stores/'.$store.'/items_img/'.$inserted_id.$art);
			//mkdir('files/stores/'.$store.'/items_img_min/'.$inserted_id.$art);
			
			
		for($i = 1, $ph = 0 ; $i<=6 ; $i++ ){
			
			 if(is_uploaded_file($_FILES['p_'.$i]['tmp_name'])){
				$ph++;
				
				$foo = new upload($_FILES['p_'.$i]);
				$foo->allowed = 'image/*';
				$foo->file_new_name_body = $inserted_id.$art.'_p_'.$ph;
				$foo->file_overwrite = true;
				//$foo->image_resize = true;
				//$foo->image_x = 100;
				$foo->image_convert = jpg;
				$foo->image_ratio_y = true;
				$foo->Process('files/stores/'.$store.'/items_img/'.$inserted_id.$art);
						if ($foo->processed) {
							
							} else {
							throw new MyExp('BAD_FILE_UPLOAD', $lang);
						} 					
						
				$foo_mid = new upload($_FILES['p_'.$i]);
				$foo_mid->allowed = 'image/*';
				$foo_mid->file_new_name_body = $inserted_id.$art.'_p_'.$ph;
				$foo_mid->file_overwrite = true;
				$foo_mid->image_resize = true;
				$foo_mid->image_x = 350;
				$foo_mid->image_convert = jpg;
				$foo_mid->image_ratio_y = true;
				$foo_mid->Process('files/stores/'.$store.'/items_img_mid/'.$inserted_id.$art);
						if ($foo_mid->processed) {
							
							
						} else {
							throw new MyExp('BAD_FILE_UPLOAD', $lang);
						} 
						
				$foo_min = new upload($_FILES['p_'.$i]);
				$foo_min->allowed = 'image/*';
				$foo_min->file_new_name_body = $inserted_id.$art.'_p_'.$ph;
				$foo_min->file_overwrite = true;
				$foo_min->image_resize = true;
				$foo_min->image_x = 100;
				$foo_min->image_convert = jpg;
				$foo_min->image_ratio_y = true;
				$foo_min->Process('files/stores/'.$store.'/items_img_min/'.$inserted_id.$art);
						if ($foo_min->processed) {
							$foo->Clean();
							$foo_mid->Clean(); 
							$foo_min->Clean(); 
						} else {
							throw new MyExp('BAD_FILE_UPLOAD', $lang);
						}		
			
				}
			
	
			}	
				
		}else{
			throw new MyExp('NO_ITEM_PHOTO_MAIN', $lang);
		}
		
		$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX.$store."_store SET art = ?, img = ? WHERE id = ?", 
		array( $inserted_id.$art, $ph, $inserted_id));
		
		
		$table = $Assistant->getItemProfTable($post['category']);
		
		if($post['category_self'] != Config::DB_SCREENING){
				
		
				$DataBase->demand('eF', "INSERT INTO ".Config::DB_PREFIX.$table."_items (art, store, name, price, discount, category, date, anti_promo) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", 
				array($inserted_id.$art, $store, $post['name'], $post['price'], $post['discount'], $post['category'], $time_stamp, Config::PROMO_SETUP));
		
		}else{
			
				$DataBase->demand('eF', "INSERT INTO ".Config::DB_PREFIX.$table."_items (art, store, name, price, discount, category, date, anti_promo) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", 
				array($inserted_id.$art, $store, $post['name'], $post['price'], $post['discount'], $post['category'], $time_stamp, Config::PROMO_SCREENING));
			
		}
		
			
	   	unset($DataBase);
		
		$json['message'] = 'ok';
		echo json_encode($json);

		break;
		
	/**********item_update*******/
		
	case 'item_update':
		
		if(!$Assistant->isLogedStore($params[0])){
			throw new MyExp('No answer');
		}
		//throw new MyExp($_POST['img']);
		$post['art'] = $Validator->cleanInput($_POST['art']);
		
		$post['name'] = $Validator->cleanInput($_POST['name']);
		$post['seo'] = $Validator->cleanInput($_POST['seo']); 
	    $post['date'] = $Validator->cleanInput($_POST['date']);
	    $post['category'] = $Validator->cleanInput($_POST['category']);
	    $post['category_self'] = $Validator->cleanInput($_POST['category_self']);
	    $post['category_self_old'] = $Validator->cleanInput($_POST['category_self_old']);
	    $post['options'] = $Validator->cleanEmptyInput($_POST['options']);
	    $post['description'] = $Validator->cleanEmptyInput($_POST['description']);
	    $post['price'] = $Validator->cleanInput($_POST['price']);
	    $post['discount'] = (int)$Validator->cleanEmptyInput($_POST['discount']);
	    $post['amount'] = $Validator->cleanInput($_POST['amount']);
		
		$post['img'] = (int)$Validator->cleanEmptyInput($_POST['img']);

		if (!$Validator->isCheckdate($post['date'])){
			throw new MyExp('BAD_DATE', $lang);
		}
		
		
		if (!$Validator->isValidCategory($post['category'])){
			throw new MyExp('BAD_CATEGORY', $lang);
		}
		
		if (!$Validator->isNumeric($post['price'])){
			throw new MyExp('BAD_PRICE', $lang);
		}
		
		if ($post['price'] <= 0.1){
			throw new MyExp('BAD_PRICE', $lang);
		}
		
		$post['options'] = $Validator->itemOptionProceed($post['options']);
		 
		if($post['options'] === false){
			throw new MyExp('BAD_OPTIONS', $lang); 
		}
	   
		if (!$Validator->isNumeric($post['discount'])){
			throw new MyExp('BAD_DISCOUNT', $lang);
		}
		
		if (!$Validator->isNumeric($post['amount'])){
			throw new MyExp('BAD_AMOUNT', $lang);
		}
		
		$post['name'] = $Validator->nameItemPretty($post['name']);
		
		
		$date_arr = explode('.',$post['date']);
		$post['date'] = mktime( 0, 0, 0, $date_arr[1], $date_arr[0], $date_arr[2] );
		
		$store = $_SESSION['url_store'];
		
			
		switch($post['category_self']){
			
			case 'screening':
			
				$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX.$store."_store SET name = ?, price = ?, discount = ?, category_self = ?, description = ?, options = ?, amount = ?, seo = ?, date = ? WHERE art = ? AND category = ?", 
				array( $post['name'], $post['price'], $post['discount'], $post['category_self'], $post['description'], $post['options'], $post['amount'], $post['seo'], $post['date'], $post['art'], $post['category']));
		
			/*
				if( $DataBase->affectedRows() != 1 ){
					throw new MyExp('BAD_CATEGORY', $lang);
				}
			*/
				$table = $Assistant->getItemProfTable($post['category']);
				
				$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX.$table."_items SET name = ?, price = ?, discount = ?, anti_promo = ? WHERE art = ? AND category = ?", 
				array( $post['name'], $post['price'], $post['discount'], Config::PROMO_SCREENING, $post['art'], $post['category']));
		
			
			break;
			
			case 'd':
			
				$result = $DataBase->demand('eF', "DELETE FROM ".Config::DB_PREFIX.$store."_store  WHERE art = ? AND category = ?", 
				array( $post['art'], $post['category']));
			/*	
		
				if( $DataBase->affectedRows() != 1 ){
					throw new MyExp('BAD_CATEGORY', $lang);
				}
			*/	
				$table = $Assistant->getItemProfTable($post['category']);
	
				$result = $DataBase->demand('eF', "DELETE FROM ".Config::DB_PREFIX.$table."_items  WHERE art = ? AND category = ?", 
				array( $post['art'], $post['category']));
				
				for($i=2 ; $i<=6 ; $i++){
					@unlink('files/stores/'.$store.'/items_img/'.$post['art'].'/'.$post['art'].'_p_'.$i.'.jpg');
					@unlink('files/stores/'.$store.'/items_img_mid/'.$post['art'].'/'.$post['art'].'_p_'.$i.'.jpg');
					@unlink('files/stores/'.$store.'/items_img_min/'.$post['art'].'/'.$post['art'].'_p_'.$i.'.jpg');
				}
						
			break;
			
			default:
			
				$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX.$store."_store SET name = ?, price = ?, discount = ?, category_self = ?, description = ?, options = ?, amount = ?, seo = ?, date = ? WHERE art = ? AND category = ?", 
				array( $post['name'], $post['price'], $post['discount'], $post['category_self'], $post['description'], $post['options'], $post['amount'], $post['seo'], $post['date'], $post['art'], $post['category']));
			
			/*	
				if( $DataBase->affectedRows() != 1 ){
					throw new MyExp('BAD_CATEGORY', $lang);
				}
			*/	
				$table = $Assistant->getItemProfTable($post['category']);
				
			//	if($post['category_self_old'] != 'screening'){
				
					$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX.$table."_items SET name = ?, price = ?, discount = ?, anti_promo = ? WHERE art = ? AND category = ?", 
					array( $post['name'], $post['price'], $post['discount'], Config::PROMO_SETUP, $post['art'], $post['category']));
			/*		
				}else{
					$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX.$table."_items SET name = ?, price = ?, discount = ?, anti_promo = ? WHERE art = ? AND category = ?", 
					array( $post['name'], $post['price'], $post['discount'], Config::PROMO_SCREENING, $post['art'], $post['category']));
				}
			*/
			break;
			
		}	
		
			
		require('library/php/class_upload.php');	
		for($i = 1, $ph = $post['img'], $img_new = 0, $ph_control = 0, $kicker = true; $i<=6 ; $i++ ){
		/*	
			if(file_exists('files/stores/'.$store.'/items_img/'.$post['art'].'/'.'p_'.$i.'.jpg')){
				$ph++;//5
			}
		*/	
			if(is_uploaded_file($_FILES['p_'.$i]['tmp_name'])){
			
			if(file_exists('files/stores/'.$store.'/items_img/'.$post['art'].'/'.$post['art'].'_p_'.$i.'.jpg') && $kicker){
				$ph_control = $i;

			}else{
				$ph_control = ++$ph;
				$img_new++;
				$kicker = false;
			}	
				$foo = new upload($_FILES['p_'.$i]);
				$foo->allowed = 'image/*';
				$foo->file_new_name_body = $post['art'].'_p_'.$ph_control;
				$foo->file_overwrite = true;
				//$foo->image_resize = true;
				//$foo->image_x = 100;
				$foo->image_convert = jpg;
				$foo->image_ratio_y = true;
				$foo->Process('files/stores/'.$store.'/items_img/'.$post['art']);
						if ($foo->processed){
							
						} else {
							throw new MyExp('BAD_FILE_UPLOAD', $lang);
						} 
						
				$foo_mid = new upload($_FILES['p_'.$i]);
				$foo_mid->allowed = 'image/*';
				$foo_mid->file_new_name_body = $post['art'].'_p_'.$ph_control;
				$foo_mid->file_overwrite = true;
				$foo_mid->image_resize = true;
				$foo_mid->image_x = 350;
				$foo_mid->image_convert = jpg;
				$foo_mid->image_ratio_y = true;
				$foo_mid->Process('files/stores/'.$store.'/items_img_mid/'.$post['art']);
						if ($foo_mid->processed) {
							
							
						} else {
							throw new MyExp('BAD_FILE_UPLOAD', $lang);
						}
						
				$foo_min = new upload($_FILES['p_'.$i]);
				$foo_min->allowed = 'image/*';
				$foo_min->file_new_name_body = $post['art'].'_p_'.$ph_control;
				$foo_min->file_overwrite = true;
				$foo_min->image_resize = true;
				$foo_min->image_x = 100;
				$foo_min->image_convert = jpg;
				$foo_min->image_ratio_y = true;
				$foo_min->Process('files/stores/'.$store.'/items_img_min/'.$post['art']);
						if ($foo_min->processed) {
							
							$foo->Clean();
							$foo_mid->Clean(); 
							$foo_min->Clean(); 
							
						} else {
							throw new MyExp('BAD_FILE_UPLOAD', $lang);
						} 			
			
				}
			
	
		}	
	
		if($img_new){
			
			$img_amount = 0;
			for($i=1 ; $i<=6 ; $i++){
				if(file_exists('files/stores/'.$store.'/items_img/'.$post['art'].'/'.$post['art'].'_p_'.$i.'.jpg')){
					$img_amount++;
				}else{
					break;
				}
			}
			
			$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX.$store."_store SET img = ?WHERE art = ? AND category = ?", 
			array($img_amount , $post['art'], $post['category']));
			
			
			$json['img_new'] = $img_amount;
		}else{
			$json['img_new'] = $post['img'];
		}
		
		unset($DataBase);
		
		if($post['category_self'] == 'd' || ($post['category_self'] != $post['category_self_old'])){
			
			$json['img'] = $post['img'];
			$json['message'] = 'remove';
			echo json_encode($json);
			
		}else{
			$json['img'] = $post['img'];
			$json['message'] = 'ok';
			echo json_encode($json);
		}
		
		
		
		
		break;
		
		
	/**********MANAGEMENT**********/
	/*********marketing_arts_suggestions**********/
	
	case 'marketing_arts_suggestions':
	
		$post['query'] = $Validator->cleanEmptyInput($_POST['query']);
		
		session_start();
		
		$store = $_SESSION['url_store'];
		
		$result = $DataBase->demand('eF', "SELECT art FROM ".Config::DB_PREFIX.$store."_store WHERE art LIKE ?",
		array( $post['query'].'%'));
		
		while($row = $result->fetch_assoc()){
			$suggestions[] = $row['art']; 
		}
		
		$json['suggestions'] = $suggestions;
		echo json_encode($json);
		
		
		break;
		
	/*********art_to_promo**********/	
		
	case 'art_to_promo':
		
		if(!$Assistant->isLogedStore($params[0])){
			throw new MyExp('No answer');
		}
	
		$post['art'] = $Validator->cleanInput($_POST['art']);
		
		session_start();
		
		$store = $_SESSION['url_store'];
		
		$result = $DataBase->demand('eF', "SELECT category FROM ".Config::DB_PREFIX.$store."_store WHERE art =  ?",
		array($post['art']));
		
		if($DataBase->affectedRows() != 1){
			throw new MyExp('NO_ART_FOUND', $lang);
		}
		
		while($row = $result->fetch_assoc()){
			$category = $row['category']; 
		}
		
		$table = $Assistant->getItemProfTable($category);
		
		$result = $DataBase->demand('eF', "SELECT credits FROM ".Config::DB_PREFIX."stores WHERE url_name =  ?",
		array($store));
		
		while($row = $result->fetch_assoc()){
			$credits = (int)$row['credits']; 
		}
		
		if($credits < Config::PRICE_PROMO_TOP){
			throw new MyExp('NO_CREDITS_ENAUGH', $lang);
		}else{
			
		
			$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX.$table."_items SET date = ? WHERE art = ?", 
			array( $time_stamp + 31536000, $post['art']));
			
			$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX."stores SET credits = ? WHERE url_name = ?", 
			array( $credits - Config::PRICE_PROMO_TOP, $store));
	
		}
		
		$json['flag'] = 'ok';
		$json['credits'] = $credits - Config::PRICE_PROMO_TOP;
		echo json_encode($json);
		
		
		break;	
		
	/*********mailing_cron**********/	
		
	case 'mailing_cron':
	
		if(!$Assistant->isLogedStore($params[0])){
			throw new MyExp('No answer');
		}
	
		if(empty($_POST['sex'])){
			throw new MyExp('NO_SEX_APPLIED', $lang);
		}
	
		$post['sex'] = $Validator->cleanInput($_POST['sex']);
		$post['url'] = $Validator->cleanInput($_POST['url']);
		
		if (!$Validator->isClosartURL($post['url'])){
			throw new MyExp('BAD_CLOSART_URL', $lang);
		}
		
		session_start();
		
		$store = $_SESSION['url_store'];
		

		$result = $DataBase->demand('eF', "SELECT credits FROM ".Config::DB_PREFIX."stores WHERE url_name =  ?",
		array($store));
		
		while($row = $result->fetch_assoc()){
			$credits = (int)$row['credits']; 
		}
		
		switch($post['sex']){
			
			case 'M': 
			case 'W': 
				$cost = Config::PRICE_MAILING_W_M;
				break;
			default:
				$cost = Config::PRICE_MAILING_A;
				break;
		}
		
		
		if($credits < $cost){
			
			throw new MyExp('NO_CREDITS_ENAUGH', $lang);
			
		}else{
			
			if(!is_uploaded_file($_FILES['banner']['tmp_name'])){
				throw new MyExp('NO_BANNER_UPLOAD', $lang);
			}
		
				$result = $DataBase->demand('eF', "INSERT INTO ".Config::DB_PREFIX."marketing (type, url ,info, store, status, date) VALUES( ?, ?, ?, ?, ?, ? )",
				array( Config::BANNER_M_TYPE, $post['url'], $post['sex'], $store, Config::JUST_STATUS, $time_stamp ));
			
				$inserted_id =$DataBase->getLastId();
		
				require ('library/php/class_upload.php');
			
				$foo = new upload($_FILES['banner']);
				$foo->allowed = 'image/*';
				$foo->file_new_name_body = 'banner_'.$inserted_id;
				$foo->file_overwrite = true;
				//$foo->image_resize = true;
				$foo->image_x = 600;
				$foo->image_convert = jpg;
				$foo->image_ratio_y = true;
				$foo->Process('files/marketing/mailing_img');
				
						if ($foo->processed){
							
						} else {
							throw new MyExp('BAD_FILE_UPLOAD', $lang);
						}


				$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX."stores SET credits = ? WHERE url_name = ?", 
				array( $credits - $cost, $store));			
			
			
		}
		
		$json['flag'] = 'ok';
		$json['banner'] = 'http://'.$_SERVER['HTTP_HOST'].'/files/marketing/mailing_img/banner_'.$inserted_id.'.jpg';
		$json['credits'] = $credits - $cost;
		echo json_encode($json);
		
		
		break;		
		
		
	/*********mailing_dynamic_boards**********/	
	
	case 'mailing_dynamic_boards':
	
		if(!$Assistant->isLogedStore($params[0])){
			throw new MyExp('No answer');
		}
	
		
		session_start();
		
		$store = $_SESSION['url_store'];

		$result = $DataBase->demand('eF', "SELECT id, status FROM ".Config::DB_PREFIX."marketing WHERE store =  ? AND type = ? ORDER BY date DESC LIMIT 30",
		array($store, Config::BANNER_M_TYPE, ));
		$i = 0 ;
		while($row = $result->fetch_assoc()){
			$banners[$i]['status'] = $row['status']; 
			$banners[$i]['banner'] = 'http://'.$_SERVER['HTTP_HOST'].'/files/marketing/mailing_img/banner_'.$row['id'].'.jpg';
			$i++;
		}
	
		$json['flag'] = 'ok';
		$json['banners'] = $banners;
		echo json_encode($json);
		
		
		break;
		
		
		
	/*********banner_dynamic_boards	**********/	
	
	case 'banner_dynamic_boards':
	
		if(!$Assistant->isLogedStore($params[0])){
			throw new MyExp('No answer');
		}
	
		
		session_start();
		
		$store = $_SESSION['url_store'];

		$result = $DataBase->demand('eF', "SELECT id, status FROM ".Config::DB_PREFIX."marketing WHERE store =  ? AND type = ? ORDER BY date DESC LIMIT 30",
		array($store, Config::BANNER_F_TYPE, ));
		$i = 0 ;
		while($row = $result->fetch_assoc()){
			$banners[$i]['status'] = $row['status']; 
			$banners[$i]['banner'] = 'http://'.$_SERVER['HTTP_HOST'].'/files/marketing/banner_img/banner_'.$row['id'].'.jpg';
			$i++;
		}
	
		$json['flag'] = 'ok';
		$json['banners'] = $banners;
		echo json_encode($json);
		
		
		break;
	
	
	
	/*********banner_front**********/	
		
	case 'banner_front':
	
		if(!$Assistant->isLogedStore($params[0])){
			throw new MyExp('No answer');
		}
	
		if(empty($_POST['plan'])){
			throw new MyExp('NO_PLAN_APPLIED', $lang);
		}
	
		$post['plan'] = $Validator->cleanInput($_POST['plan']);
		$post['date'] = $Validator->cleanInput($_POST['date']);
		$post['url'] = $Validator->cleanInput($_POST['url']);
		
		if (!$Validator->isClosartURL($post['url'])){
			throw new MyExp('BAD_CLOSART_URL', $lang);
		}
		
		session_start();
		
		$store = $_SESSION['url_store'];
		
		$result = $DataBase->demand('eF', "SELECT credits FROM ".Config::DB_PREFIX."stores WHERE url_name =  ?",
		array($store));
		
		while($row = $result->fetch_assoc()){
			$credits = (int)$row['credits']; 
		}
		
		switch($post['plan']){
			
			case 'plan3': 
				$cost = Config::PRICE_BANNER_P3;
				break;
			case 'plan15': 
				$cost = Config::PRICE_BANNER_P15;
				break;
			default:
				$cost = Config::PRICE_BANNER_P30;
				break;
		}
	
		
		if($credits < $cost){
			
			throw new MyExp('NO_CREDITS_ENAUGH', $lang);
			
		}else{
			
			if(!is_uploaded_file($_FILES['banner']['tmp_name'])){
				throw new MyExp('NO_BANNER_UPLOAD', $lang);
			}
		
				$result = $DataBase->demand('eF', "INSERT INTO ".Config::DB_PREFIX."marketing (type, url ,info, store, status, date) VALUES( ?, ?, ?, ?, ?, ? )",
				array( Config::BANNER_F_TYPE, $post['url'], $post['plan'].'_'.$post['date'], $store, Config::JUST_STATUS, $time_stamp ));
			
				$inserted_id =$DataBase->getLastId();
		
				require ('library/php/class_upload.php');
			
				$foo = new upload($_FILES['banner']);
				$foo->allowed = 'image/*';
				$foo->file_new_name_body = 'banner_'.$inserted_id;
				$foo->file_overwrite = true;
				//$foo->image_resize = true;
				//$foo->image_x = 100;
				$foo->image_convert = jpg;
				$foo->image_ratio_y = true;
				$foo->Process('files/marketing/banner_img');
				
						if ($foo->processed){
							
						} else {
							throw new MyExp('BAD_FILE_UPLOAD', $lang);
						}


				$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX."stores SET credits = ? WHERE url_name = ?", 
				array( $credits - $cost, $store));			
			
			
		}
		
		$json['flag'] = 'ok';
		$json['banner'] = 'http://'.$_SERVER['HTTP_HOST'].'/files/marketing/banner_img/banner_'.$inserted_id.'.jpg';
		$json['credits'] = $credits - $cost;
		echo json_encode($json);
		
		
		break;	
		
		
		


	/*********design_order**********/	
		
	case 'design_order':		
	
		$json['flag'] = 'ok';
		echo json_encode($json);
		
	break;	
	
	
	default:
	throw new MyExp('No answer');
	break;
	
	
}


?>