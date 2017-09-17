<?php

$time_stamp = time();
$lang = isset($_COOKIE['lang']) ? $_COOKIE['lang'] : 'ru';
$what = $_POST['what'];


switch ($what){
	
	/***********LOG_OUT*********/
	
	case 'log_out':
	
		session_start();
		
		unset($_SESSION['id_manager']);
		unset($_SESSION['stores_manage']);
		
		$json['flag'] = 'log_out';
		
		echo json_encode($json);
	    break;
	
	/**************login****************/
	
	case 'login':
	
	if(!$Assistant->isUserManager()){
			throw new MyExp('No answer');
		}
	
	$post['password'] = $Validator->cleanInput($_POST['password']); 
	
	$user_id = 	$Assistant->getUserId();
	
	$result = $DataBase->demand('eF', "SELECT id, password FROM ".Config::DB_PREFIX."managers WHERE id_user = ?", array($user_id));
	
	if ($result->num_rows !== 1){
		unset ($DataBase);
		throw new MyExp('ENTER_ADMIN_DENY', $lang);
	}else{
		
		$row = $result->fetch_assoc();
		$hash = $row['password'];
		$password = md5($post['password'].Config::SECRET).md5(Config::SECRET.$post['password']);
		
				if (password_verify($password, $hash)){
						session_start();
						$_SESSION['id_manager'] = $row['id'];
				
				} else {
						throw new MyExp('ENTER_ADMIN_DENY', $lang);				
				}
	}
	$result->free();
	
	$id_manager = $_SESSION['id_manager'];
	$result = $DataBase->demand('eF', "SELECT name, url_name FROM ".Config::DB_PREFIX."stores WHERE id_manager = ? ", array($id_manager));
					
		while ($row = $result->fetch_assoc()) {
				$_SESSION['stores_manage'][] = $row;
			}
				
			
		$result->free();
			
	unset($DataBase);
	
	$ini = parse_ini_file('langs/'.$lang.'/ajax/success.ini', true);
	$ajax_message = $ini['ajax']['SUCCESS_LOGIN'];
	
	$json['message'] = $ajax_message;
	$json['flag'] = 'login';
	echo json_encode($json);
	break;
	
	/**********configuration***********/
	
	/********configuration_main********/	
		
	case 'main':
	
		if(!$Assistant->isLogedManager()){
			throw new MyExp('No answer');
		}
		
		$post['name'] = $Validator->cleanInput($_POST['name']); 
	    $post['url_name'] = $Validator->cleanInput($_POST['url_name']);
	
		if (!$Validator->nameStoreIsValid($post['name'])){
			throw new MyExp('BAD_STORE_NAME', $lang);
		}
			
		if (!$Validator->url_nameStoreIsValid($post['url_name'])){
			throw new MyExp('BAD_STORE_URL', $lang);
		}
		
		$store = $params[1];
		$id_manager = $_SESSION['id_manager'];
		
		$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX."stores SET name = ?, url_name = ? WHERE url_name = ? AND id_manager = ? ", 
		array( $post['name'], $post['url_name'], $store, $id_manager));
			
		if($store != $post['url_name']){
			 rename('files/stores/'.$store, 'files/stores/'.$post['url_name']);
			 $result = $DataBase->demand('eF', "RENAME TABLE ".Config::DB_PREFIX.$store."_store TO ".Config::DB_PREFIX.$post['url_name']."_store", 
		array());
		}	
	   
		$result = $DataBase->demand('eF', "SELECT name, url_name FROM ".Config::DB_PREFIX."stores WHERE id_manager = ? ", array($id_manager));
		unset($_SESSION['stores_manage']);
		
		while ($row = $result->fetch_assoc()){
				$_SESSION['stores_manage'][] = $row;
			}	
			
		$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX."arts_items SET store = ? WHERE store = ?", 
		array( $store, $post['url_name']));
		
		$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX."exclusive_items SET store = ? WHERE store = ?", 
		array( $store, $post['url_name']));
		
		$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX."woman_items SET store = ? WHERE store = ?", 
		array( $store, $post['url_name']));
		
		$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX."man_items SET store = ? WHERE store = ?", 
		array( $store, $post['url_name']));
			
	    unset($DataBase);
		
		$ini = parse_ini_file('langs/'.$lang.'/ajax/success.ini', true);
	    $ajax_message = $ini['ajax']['SUCCESS_UPDATE'];
		
		$json['message']= $ajax_message;
		$json['new_store']= $post['url_name'];
		echo json_encode($json);
	
		break;
		
	/********set_categories********/		
		
	case 'set_categories':
		
		if(!$Assistant->isLogedManager($params[0])){
			throw new MyExp('No answer');
		}
		
		$post['categories_allow'] = $Validator->cleanInput($_POST['categories_allow']);
		$post['categories_self'] = $Validator->cleanInput($_POST['categories_self']); 
		
		
		if (!$Validator->categoriesIsValid($post['categories_allow'])){
			throw new MyExp('BAD_SYNTAX', $lang);
		}
	    
		if (!$Validator->categoriesIsValid($post['categories_self'])){
			throw new MyExp('BAD_SYNTAX', $lang);
		}
		
		$store = $params[1];
		$id_manager = $_SESSION['id_manager'];
		
		$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX."stores SET categories_allow = ?, categories_self = ? WHERE url_name = ? AND id_manager = ? ", 
		array( $post['categories_allow'], $post['categories_self'], $store, $id_manager));
		unset ($DataBase);
		$ini = parse_ini_file('langs/'.$lang.'/ajax/success.ini', true);
	    $ajax_message = $ini['ajax']['SUCCESS_UPDATE'];
		
		$json['message']= $ajax_message;
		echo json_encode($json);
		
		break;
		
	/********menu_main********/		
		
	case 'menu_main':
		
		if(!$Assistant->isLogedManager($params[0])){
			throw new MyExp('No answer');
		}
		
		$post['menu_ru'] = $Validator->cleanMenuInput($_POST['menu_ru']);
		$post['menu_en'] = $Validator->cleanMenuInput($_POST['menu_en']); 
		
		$store = $params[1];
		$id_manager = $_SESSION['id_manager'];
		$menu = $post['menu_ru'].Config::LANG_SEPARATOR.$post['menu_en'];

		
		$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX."stores SET menu = ? WHERE url_name = ? AND id_manager = ? ", 
		array( $menu, $store, $id_manager));
		unset ($DataBase);
		$ini = parse_ini_file('langs/'.$lang.'/ajax/success.ini', true);
	    $ajax_message = $ini['ajax']['SUCCESS_UPDATE'];
		
		$json['message']= $ajax_message;
		echo json_encode($json);
		
	break;	
	
	case 'delivery':
		
		if(!$Assistant->isLogedManager($params[0])){
			throw new MyExp('No answer');
		}
		
		$post['ua_ru'] = $Validator->cleanInput($_POST['ua_ru']);
		$post['rus_ru'] = $Validator->cleanInput($_POST['rus_ru']); 
		$post['es_ru'] = $Validator->cleanInput($_POST['es_ru']); 
		$post['us_ru'] = $Validator->cleanInput($_POST['us_ru']); 
		
		$post['ua_en'] = $Validator->cleanInput($_POST['ua_en']); 
		$post['rus_en'] = $Validator->cleanInput($_POST['rus_en']); 
		$post['es_en'] = $Validator->cleanInput($_POST['es_en']); 
		$post['us_en'] = $Validator->cleanInput($_POST['us_en']);
		
		
		$store = $params[1];
		$id_manager = $_SESSION['id_manager'];
		$delivery = $post['ua_ru'].Config::THIRD_SEPARATOR.$post['rus_ru'].Config::THIRD_SEPARATOR.$post['es_ru'].Config::THIRD_SEPARATOR.$post['us_ru'].Config::LANG_SEPARATOR.$post['ua_en'].Config::THIRD_SEPARATOR.$post['rus_en'].Config::THIRD_SEPARATOR.$post['es_en'].Config::THIRD_SEPARATOR.$post['us_en'];

		$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX."stores SET delivery = ? WHERE url_name = ? AND id_manager = ? ", 
		array( $delivery, $store, $id_manager));
		unset ($DataBase);
		$ini = parse_ini_file('langs/'.$lang.'/ajax/success.ini', true);
	    $ajax_message = $ini['ajax']['SUCCESS_UPDATE'];
		
		$json['message']= $ajax_message;
		echo json_encode($json);
		
	break;	

	
	case 'bio':

		
		if(!$Assistant->isLogedManager($params[0])){
			throw new MyExp('No answer');
		}
		
			
		$post['year'] = (int)$Validator->cleanInput($_POST['year']);
		$post['country'] = $Validator->cleanInput($_POST['country']); 
		$post['bio_ru'] = $Validator->cleanInput($_POST['bio_ru']); 
		$post['bio_en'] = $Validator->cleanInput($_POST['bio_en']); 
		
		if (!$Validator->isInteger($post['year'])){
			throw new MyExp('BAD_SYNTAX', $lang);
		}
		
		$store = $params[1];
		$id_manager = $_SESSION['id_manager'];
		$bio = $post['bio_ru'].Config::LANG_SEPARATOR.$post['bio_en'];

		$result = $DataBase->demand('eF', "UPDATE ".Config::DB_PREFIX."stores SET year = ?, country = ?, bio = ? WHERE url_name = ? AND id_manager = ? ", 
		array( $post['year'], $post['country'], $bio, $store, $id_manager));
		unset($DataBase);
		
		/********PHOTO*******/
		
		if(is_uploaded_file($_FILES['photo']['tmp_name'])){
			require ('library/php/class_upload.php');
			
			$foo = new upload($_FILES['photo']);
			$foo->allowed = 'image/*';
			$foo->file_new_name_body = 'bio';
			$foo->file_overwrite = true;
			//$foo->image_resize = true;
			//$foo->image_x = 100;
			$foo->image_convert = jpg;
			$foo->image_ratio_y = true;
			$foo->Process('files/stores/'.$store.'/bio_img/');
			if ($foo->processed) {
				
			} else {
				throw new MyExp('BAD_FILE_UPLOAD', $lang);
			}

			$foo_mid = new upload($_FILES['photo']);
			$foo_mid->allowed = 'image/*';
			$foo_mid->file_new_name_body = 'bio_min';
			$foo_mid->file_overwrite = true;
			$foo_mid->image_resize = true;
			$foo_mid->image_x = 350;
			$foo_mid->image_convert = jpg;
			$foo_mid->image_ratio_y = true;
			$foo_mid->Process('files/stores/'.$store.'/bio_img/');
			if ($foo_mid->processed) {
				
			} else {
				throw new MyExp('BAD_FILE_UPLOAD', $lang);
			} 	
			
			$foo_min = new upload($_FILES['photo']);
			$foo_min->allowed = 'image/*';
			$foo_min->file_new_name_body = 'bio_min';
			$foo_min->file_overwrite = true;
			$foo_min->image_resize = true;
			$foo_min->image_x = 100;
			$foo_min->image_convert = jpg;
			$foo_min->image_ratio_y = true;
			$foo_min->Process('files/stores/'.$store.'/bio_img/');
			if ($foo_min->processed) {
				$foo->Clean();
				$foo_mid->Clean();
				$foo_min->Clean();
			} else {
				throw new MyExp('BAD_FILE_UPLOAD', $lang);
			} 	
			
				
		}
		
	
		
		$ini = parse_ini_file('langs/'.$lang.'/ajax/success.ini', true);
	    $ajax_message = $ini['ajax']['SUCCESS_UPDATE'];
		
		$json['message']= $ajax_message;
		echo json_encode($json);
		
	break;
	
	
	default:
	
	throw new MyExp('No answer');
	break;
	
	
}


?>