<?php

$time_stamp = time();
$lang = isset($_COOKIE['lang']) ? $_COOKIE['lang'] : 'ru';
$what = $_POST['what'];

switch ($what){
	
	/***********LOG_OUT*********/
	
	case 'log_out':
	
		session_start();
		session_unset();
		session_destroy();
		
		setcookie ( 'l', '', time() - 3600, '/');
		setcookie ( 'p', '', time() - 3600, '/');
		
		$json['flag'] = 'log_out';
		
		echo json_encode($json);
	    break;
	
	/**************registration****************/
	
	case 'registration':
	
		$post['login'] = $Validator->cleanInput($_POST['login']); 
		$post['mail'] = $Validator->cleanInput($_POST['mail']); 
		$post['password'] = $Validator->cleanInput($_POST['password']);

		if (!$Validator->logIsValid($post['login'])){
			throw new MyExp('BAD_LOGIN', $lang);
		}
			
		if (!$Validator->mailIsValid($post['mail'])) { 
			throw new MyExp('BAD_MAIL', $lang);
		}

		if (!$Validator->passIsValid($post['password'])){
			throw new MyExp('BAD_PASSWORD', $lang);
		} 
		
	$result = $DataBase->demand('eF', "SELECT * FROM ".Config::DB_PREFIX."users WHERE login = ?", array( $post['login']));

	if ($result->num_rows > 0){
		unset ($DataBase);
		throw new MyExp('LOGIN_ALREADY_EXIST', $lang);
	}
	
	
	$result = $DataBase->demand('eF', "SELECT * FROM ".Config::DB_PREFIX."users WHERE mail = ?", array( $post['mail']));
	if ($result->num_rows > 0){
		unset ($DataBase);
		throw new MyExp('MAIL_ALREADY_EXIST', $lang);
	}
	
	$password = password_hash($post['password'], PASSWORD_DEFAULT);
	
	$DataBase->demand('eF', "INSERT INTO ".Config::DB_PREFIX."users (login, password, mail, name, surname, phone, mailing, card, card_name, card_surname, date_visit, following) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 
	array($post['login'], $password, $post['mail'], 'n', 'n', 'n', 'y', 'n', 'n', 'n', $time_stamp, 'n' ));
	$inserted_id =$DataBase->getLastId();
	unset($DataBase);
	
	session_start();
	$_SESSION['id'] = $inserted_id;
	$_SESSION['login'] = $post['login'];
	
	setcookie('l', base64_encode($post['login']), time() + (3600 * 24), '/');
	setcookie('p', base64_encode($post['password']), time() + (3600 * 24), '/');

	$ini = parse_ini_file('langs/'.$lang.'/ajax/success.ini', true);
	$ajax_message = $ini['ajax']['SUCCESS_REGISTRATION'];
	
	//mail($to, $subject, $message, $headers); отправляем письмо !!
	
	$json['message'] = $ajax_message;
	$json['flag'] = 'registration';
	echo json_encode($json);
	break;
	
	
	/**************login****************/
	
	case 'login':
	
	$post['login'] = $Validator->cleanInput($_POST['login']); 
	$post['password'] = $Validator->cleanInput($_POST['password']); 

	$result = $DataBase->demand('eF', "SELECT id, login, password FROM ".Config::DB_PREFIX."users WHERE login = ? ", array($post['login']));
	if ($result->num_rows != 1){
		unset ($DataBase);
		throw new MyExp('ENTER_DENY', $lang);
	}else{
		
		$row = $result->fetch_assoc();
		$hash = $row['password'];
		
				if (password_verify($post['password'], $hash)) {
						session_start();
						$_SESSION['id'] = $row['id'];
						$_SESSION['login'] = $row['login'];
				
							if($_POST['keep_in']){
								setcookie('l', base64_encode($post['login']), time() + (3600 * 196), '/');
								setcookie('p', base64_encode($post['password']), time() + (3600 * 196), '/');
							}
				} else {
						throw new MyExp('ENTER_DENY', $lang);
						
				}
	}	
	unset($DataBase);
	
	$ini = parse_ini_file('langs/'.$lang.'/ajax/success.ini', true);
	$ajax_message = $ini['ajax']['SUCCESS_LOGIN'];
	
	$json['message'] = $ajax_message;
	$json['flag'] = 'login';
	echo json_encode($json);
	break;
	
	/*************forgot*************/
	
	case 'forgot':
	
	$post['login'] = $Validator->cleanInput($_POST['login']); 
	$post['mail'] = $Validator->cleanInput($_POST['mail']); 
	
    $result = $DataBase->demand('eF', "SELECT password FROM ".Config::DB_PREFIX."users WHERE mail = ? AND login = ?", array( $post['mail'], $post['login']) );
    
	if ($result->num_rows != 1){
		
		unset ($DataBase);
		throw new MyExp('NO_USER', $lang);
		
	}else{
		
		 $chars = 'abdefhiknrstyzABDEFGHKNQRSTYZ23456789';
		 $numChars = strlen($chars);
		 $string = '';
			for ($i = 0; $i < 8; $i++) {
			$string .= substr($chars, rand(1, $numChars) - 1, 1);
		}
		
		$password = password_hash($string, PASSWORD_DEFAULT);
		
		$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX."users SET password = ? WHERE mail = ? AND login = ?", array( $password, $post['mail'], $post['login']));
		//mail password $string
	}

	// отправляем письмо !!
	
	$ini = parse_ini_file('langs/'.$lang.'/ajax/success.ini', true);
	$ajax_message = $ini['ajax']['SUCCESS_FORGOT'];
	
    $json['message']= $string;
	$json['flag'] = 'forgot';
	echo json_encode($json);
	break;
	
	
		
	/**********SETTINGS**********/	
		
	/********settings_main********/	
		
	case 'settings_main':
		
		if(!$Assistant->isLogedUser()){
			throw new MyExp('No answer');
		}
		
		$post['name'] = $Validator->cleanInput($_POST['name']); 
	    $post['surname'] = $Validator->cleanInput($_POST['surname']);
	    $post['phone'] = $Validator->cleanInput($_POST['phone']);
	    $post['mail'] = $Validator->cleanInput($_POST['mail']);
	
		if (!$Validator->nameIsValid($post['name'])){
			throw new MyExp('BAD_NAME', $lang);
		}
			
		if (!$Validator->nameIsValid($post['surname'])) { 
			throw new MyExp('BAD_SURNAME', $lang);
		}

		if (!$Validator->mailIsValid($post['mail'])){
			throw new MyExp('BAD_MAIL', $lang);
		}
		
		
		$post['name'] = $Validator->namePretty($post['name']); 
	    $post['surname'] = $Validator->namePretty($post['surname']);
		$id = $_SESSION['id'];
		$login = $_SESSION['login'];
		$mailing = $_POST['mailing'] ? 'y' : 'n';
		
		$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX."users SET mail = ?, name = ?, surname = ?, phone = ?, mailing = ? WHERE id = ? AND login = ? ", 
		array( $post['mail'], $post['name'], $post['surname'], $post['phone'], $mailing, $id, $login));
		unset ($DataBase);
		$ini = parse_ini_file('langs/'.$lang.'/ajax/success.ini', true);
	    $ajax_message = $ini['ajax']['SUCCESS_UPDATE'];
		
		$json['message']= $ajax_message;
		echo json_encode($json);
	
		break;
		
	/********card_settings********/		
		
	case 'card_settings':
		
		if(!$Assistant->isLogedUser()){
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
		$id = $_SESSION['id'];
		$login = $_SESSION['login'];
		
		$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX."users SET card = ?, card_name = ?, card_surname = ? WHERE id = ? AND login = ? ", 
		array( $post['card'], $post['card_name'], $post['card_surname'], $id, $login));
		unset ($DataBase);
		$ini = parse_ini_file('langs/'.$lang.'/ajax/success.ini', true);
	    $ajax_message = $ini['ajax']['SUCCESS_UPDATE'];
		
		$json['message']= $ajax_message;
		echo json_encode($json);
		
		break;
		
	/********password_settings********/		
		
	case 'password_settings':
		
		if(!$Assistant->isLogedUser()){
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
		$id = $_SESSION['id'];
		$login = $_SESSION['login'];		
		$result = $DataBase->demand('eF', "SELECT password FROM ".Config::DB_PREFIX."users WHERE id = ? AND login = ?", array($id, $login));
		if ($result->num_rows != 1){
			unset ($DataBase);
			throw new MyExp('SOME_PROBLEM', $lang);
		}else{
			$row = $result->fetch_assoc();
			$hash = $row['password'];
				if (password_verify($post['password'], $hash)) {
	
					$password = password_hash($post['new_password1'], PASSWORD_DEFAULT);
					$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX."users SET password = ? WHERE id = ? AND login = ?", 
					array( $password, $id, $login));
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
	
		if(!$Assistant->isLogedUser()){
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
	
		if(!$Assistant->isLogedUser()){
			throw new MyExp('No answer');
		}

		$post['id_dialod'] = (int)$Validator->cleanInput($_POST['id_dialog']);
		$post['message'] = $Validator->cleanInput($_POST['message']);
		
		$post['message'] = $Validator->sendMessagePretty($post['message']);
	
		$post['message'] = Config::THIRD_SEPARATOR.$post['message'].Config::SECOND_SEPARATOR.'u'.Config::SECOND_SEPARATOR.$time_stamp;
	
		$user = $_SESSION['login'];
		
		
		$DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX."messages SET conversation = CONCAT( ?, conversation ), date = ?, flag = ? WHERE id = ? AND user = ?", 
		array($post['message'], $time_stamp, 's', $post['id_dialod'], $user));
		
		unset($DataBase);
		
		$json['message'] = 'ok';
		echo json_encode($json);
	
	break;
	
	/**********scroll_load_dilogs**********/
	
	case 'scroll_load_dilogs':
	
		if(!$Assistant->isLogedUser()){
			throw new MyExp('No answer');
		}
		
		session_start();

		$post['offset'] = (int)$Validator->cleanInput($_POST['offset']);
		
	
		$user = $_SESSION['login'];
	
		$result = $DataBase->demand('eF', "SELECT id, store, art, name, flag, date FROM ".Config::DB_PREFIX."messages WHERE user = ? ORDER BY date DESC LIMIT 20 OFFSET ".$post['offset'], 
		array($user));
		
		$i = 0;
		
		while($row = $result->fetch_assoc()){
			
			$dilogs[$i]['id']= $row['id'];
			
			$dilogs[$i]['store']= $row['store'];
			$dilogs[$i]['name']= $row['name'];
			$dilogs[$i]['img']= 'http://'.$_SERVER['HTTP_HOST'].'/files/stores/'.$row['store'].'/items_img_min/'.$row['art'].'/'.$row['art'].'_p_1.jpg';
			
			$dilogs[$i]['class'] = ($row['flag']== 's') ?  'new_message' : '';
			
			
			$i++;
			
		}
		
		unset($DataBase);
		
		$json['flag'] = 'ok';
		$json['dilogs'] = $dilogs;
		echo json_encode($json);
	
	break;
		
	
	default:
	throw new MyExp('No answer');
	break;
	
	
}


?>