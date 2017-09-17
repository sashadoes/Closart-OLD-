<?php

class CoreAssistant {

	private $cookies;
	private $server;
	private $cart_items_arts;
	private $cart_items_data;
	
	private $DataBase;

	protected function __construct($cookies, $server){ 
		
		$this->cookies = $cookies;
 	 	$this->server = $server;
		
		$this->cart_items_arts = json_decode($cookies['cart'], true);
		//print_r($this->cart_items_arts);
		//exit;
		$this->DataBase = DB::getDBO();
	}
	
	public function getCookies(){
		return $this->cookies;
	}
	
	public function getCatItemsArts(){
		return $this->cart_items_arts;
	}
	
	public function getCatItemsData(){
		return $this->cart_items_data;
	}
	
	public function isLogedUser(){ 
	// ВОЗВРАЩАТЬ АЙДИ
		session_start();
		
		if(isset($_SESSION['id'], $_SESSION['login'])){
			return $_SESSION['id'];
		
		}else{
			
			if(isset($this->cookies['l'], $this->cookies['p'])){
				
				$login = base64_decode(stripslashes($this->cookies['l']));
				$password = base64_decode(stripslashes($this->cookies['p']));
				$result = $this->DataBase->demand('eF', "SELECT id, login, password FROM ".Config::DB_PREFIX."users WHERE login = ?", 
				array($login));
    
				if ($result->num_rows !== 1){
					setcookie ( 'l', '', time() - 3600, '/');
					setcookie ( 'p', '', time() - 3600, '/');
					return false;
				}else{
					$row = $result->fetch_assoc();
					$hash = $row['password'];
					if (password_verify($password, $hash)) {
						$_SESSION['id'] = $row['id'];
						$_SESSION['login'] = $row['login'];
						
						return $_SESSION['login'];

					} else {
						setcookie ( 'l', '', time() - 3600, '/');
						setcookie ( 'p', '', time() - 3600, '/');
						return false;	
					}
				}
				
			}else{
				setcookie ( 'l', '', time() - 3600, '/');
				setcookie ( 'p', '', time() - 3600, '/');
				return false;
			}		
		}
	}
	
	public function getUserId(){
		session_start();
		if(isset($_SESSION['id'], $_SESSION['login'])){
			return $_SESSION['id'];
		}else{
			return false;
		}
		
	}
	
	public function isUserStore($store){
		session_start();
		if(isset($_SESSION['id_store'], $_SESSION['url_store'])){
			return true;
		}else{
			
			$id_user = $this->getUserId();
			$result = $this->DataBase->demand('eF', "SELECT id FROM ".Config::DB_PREFIX."stores WHERE id_user = ? AND url_name = ?", 
			array($id_user, $store));	
		
			if ($result->num_rows == 1){
					return true;
				}else{
					return false;
				}			
		}

	}
	
	public function isLogedStore($store){
			
		session_start();
		
		if(isset($_SESSION['id_store'], $_SESSION['url_store']) && $_SESSION['url_store'] == $store){
			return true;
		}else{
			return false;
		}
	
	}
		
	
	public function isUserManager(){ 		
		session_start();
		if(isset($_SESSION['id_manager'])){
			return true;
		}else{
			
			$id_user = $this->getUserId();
			$result = $this->DataBase->demand('eF', "SELECT id FROM ".Config::DB_PREFIX."managers WHERE id_user = ?", array($id_user));	
		
			if ($result->num_rows > 0){
					return true;
				}else{
					return false;
				}			
		}
		
		return true;
	
	}
	
	public function isLogedManager(){ 
		session_start();
		
		if(isset($_SESSION['id_manager'])){
			return true;
		}else{
			return false;
		}
	
	}
	
	public function isUserAdmin(){ 
		session_start();
		
	
	}
	
	public function isLogedAdmin(){ 
		session_start();
		
	
	}

	public function getLang(){ 
		
		if (isset($this->cookies['lang']) && in_array($this->cookies['lang'], Config::LANGS)){	
			return $this->cookies['lang'];
		}else{
			$lang = substr($this->server['HTTP_ACCEPT_LANGUAGE'], 0, 2);
			
				if (in_array($lang, Config::LANGS)) {

					$this->cookies['lang'] = $lang;
					setcookie('lang', $lang, time()+100000000, '/');
					
			}else{

				$this->cookies['lang'] = 'ru';
				setcookie('lang', 'ru', time()+100000000, '/');
			}
			
			return $this->cookies['lang'];
			
		
		}
	}
	
	public function getLangNumber(){
		
		$lang = $this->getLang();
		
		switch($lang){
			case 'ru':
				$lang = 0;
				break;
			case 'en':
				$lang = 1;
				break;
			default:
				$lang = 0;
				break;
		}
		
		return $lang;
		
	}

	public function getCurrency(){ 

		if (isset($this->cookies['currency']) && in_array($this->cookies['currency'], Config::CURRENCYS)){
			
			return $this->cookies['currency'];
			
		}else{
			$lang = $this->getLang();
			if (in_array($lang, Config::LANGS)) {
				switch ($lang) {
						case 'ru':
							$this->cookies['currency'] = 'uah';
							setcookie('currency', 'uah', time()+100000000, '/');
							break;
						case 'en':
							$this->cookies['currency'] = 'usd';
							setcookie('currency', 'usd', time()+100000000, '/');
							break;
						default:
							$this->cookies['currency'] = 'usd';
							setcookie('currency', 'usd', time()+100000000, '/');
							break;
					}	
			
			} 
			return $this->cookies['currency'];
		}
	
	}
	
	public function getCurrencyRate(){ 

	$currency = $this->getCurrency();
		switch ($currency){
				
				case 'uah':
					$rate = Config::UAH_RATE;
					break;
					
				case 'rub':
					$rate = Config::RUB_RATE;
					break;
					
				case 'usd':
					$rate = Config::USD_RATE;
					break;
				
				default:
					throw new MyExp("<code>Ups...</code><mess>Something is going wrong</mess>", 404);
			}
			
			return $rate;
	
	}
	
	public function getCartItemCount(){
		
		return count($this->cart_items_arts);
		
	}
	
	public function getItemProfTable($value){
		
		$category = explode('-', $value);
		$category = $category[0];
		
		switch($category){
			case 'exclusive': return 'exclusive'; break;
			case 'woman': return 'woman'; break;
			case 'man': return 'man'; break;
			case 'arts': return 'arts'; break;
			default: return false; break;
		}
		
	}
	
	public function getMessagesFlags($what){
			
			switch($what){
			
			case 'user':
			/*
				if(isset($_SESSION['messages_flag_user'])){
			
					return $_SESSION['messages_flag_user'];
			
				}else{
			*/	
				$user = $_SESSION['login'];
				$result = $this->DataBase->demand('eF', "SELECT COUNT(*) FROM ".Config::DB_PREFIX."messages WHERE user = ? AND flag = ?", 
				array($user, 's'));
				
					$row = $result->fetch_assoc();
					$_SESSION['messages_flag_user'] = $row['COUNT(*)'];
					return $_SESSION['messages_flag_user'];
				
			//	}
				break;
				
				
			case 'store':
			/*
				if(isset($_SESSION['messages_flag_store'])){
			
					return $_SESSION['messages_flag_store'];
			
				}else{
			*/
				$store = $_SESSION['url_store'];
				$result = $this->DataBase->demand('eF', "SELECT COUNT(*) FROM ".Config::DB_PREFIX."messages WHERE user = ? AND flag = ?", 
				array($store, 'u'));
				
				$row = $result->fetch_assoc();
				$_SESSION['messages_flag_store'] = $row['COUNT(*)'];
				return $_SESSION['messages_flag_store'];
			
			//	}
				break;
				
			default:
				return 0;
				break;
			
			
			
			}
		
		
			
		}
	
	public function getRandomString($length = false){
		
		if(!$length){
			$length = 6;
		}
		
		$chars = 'abdefhiknrstyzABDEFGHKNQRSTYZ23456789';
		 $numChars = strlen($chars);
		 $string = '';
			for ($i = 0; $i < $length ; $i++) {
			$string .= substr($chars, rand(1, $numChars) - 1, 1);
		}
		
		return $string;
	}
		
}


class Assistant extends CoreAssistant {
	
	private static $Assistant;
	
	public static function getAssistant() {
		if (self::$Assistant == null) self::$Assistant = new Assistant($_COOKIE, $_SERVER);
		return self::$Assistant;
	}
}

?>