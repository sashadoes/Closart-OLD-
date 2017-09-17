<?php

 class coreDB {
	
	private $mysqli; // объект соединения с базой
	private $sq ;	// хэш или слово . она заменяет каждый запрос своим символом. идея : SELECT * FROM TABLE_NAME WHERE id=$sq. query ПАРСИТ ЭТО!

	private $key ; // c работой get query
	//private $prefix; // Таблицы имеют префикс для безопасности !
	
	protected function __construct($db_host, $db_user, $db_password, $db_name, $sq, $key) { // взято из конфигурации! нужно будет продумать точнее 
		$this->mysqli = @new mysqli($db_host, $db_user, $db_password, $db_name);
		
			if ($this->mysqli->connect_errno) {
				$this->mysqli = @new mysqli($db_host, $db_user, $db_password, $db_name);
				if ($this->mysqli->connect_errno){
					throw new MyExp('SOME_DB_PROBLEM_1');
				}
				
			}
		
		$this->sq = $sq;
		$this->key = $key;
		//$this->prefix = $prefix;
		$this->mysqli->query("SET lc_time_names = 'ru_RU'");  // установка локали. 
		$this->mysqli->set_charset("utf8");                   // кодировка 
	}
	
		
	
	private function getQuery($query, $params){ // $query - строка запроса; $params - array (value , value....) .. контр-сиквел зарос !
		
		if ($params) {
			$offset = 0;
			$len_sq = strlen($this->sq);
			
			for ($i = 0; $i < count($params); $i++) {
				$pos = strpos($query, $this->sq, $offset);
				
				$arg = "'".$this->mysqli->real_escape_string($params[$i])."'";
				$query = substr_replace($query, $arg, $pos, $len_sq);
				$offset = $pos + strlen($arg);
			}
		}
		
	
		/*
		echo $query;
		exit;
		*/
		
		/*	
		$json['message'] = $query; 
		echo json_encode($json);
		exit;
		*/
		return $query; 
	}
	
	
	
	public function demand ( $key, $str, $params=false) { // основная функция для работы. str - строка запроса и нужные параметры через запятую arr/
		
		if ($key === $this->key) {
		$result = $this->query($this->getQuery($str, $params));
		} else {
		throw new MyExp('SOME_DB_PROBLEM_2');
		}  
		
		if (!$result) {
			throw new MyExp('SOME_DB_PROBLEM_3');
		} else {
			return $result;	
		}
		
	} 
	
	public function getLastId(){
		return $this->mysqli->insert_id;
	}
	
	public function affectedRows(){
		return $this->mysqli->affected_rows;
	}

	private function query($query) { 
		
		 $result = $this->mysqli->query($query);
		 
			if ($this->mysqli->errno) {
				throw new MyExp('SOME_DB_PROBLEM_4_'.$this->mysqli->errno.'<br>'.$this->mysqli->error);
			} else {
				
				return $result;
			}
		
	}
	

	public function __destruct() {
		if (($this->mysqli) && (!$this->mysqli->connect_errno)) $this->mysqli->close();
	}
	
}  


 class DB extends CoreDB {
	
	private static $db;
	
	
	public static function getDBO() {
		if (self::$db == null) self::$db = new DB(Config::DB_HOST, Config::DB_USER, Config::DB_PASSWORD, Config::DB_NAME, Config::DB_SYM_QUERY, Config::DB_KEY);
		return self::$db;
	}
	
	
}


?>