<?php

class Validator{
	 
	public function cleanInput($value){
		
	if (empty($value)){
		throw new MyExp('NOT VALID'.$value);
	}
	$value = trim($value);
    $value = stripslashes($value);
    $value = strip_tags($value);
    $value = htmlspecialchars($value);
	return $value;
}	

	public function cleanEmptyInput($value){
		
	$value = trim($value);
    $value = stripslashes($value);
    $value = strip_tags($value);
    $value = htmlspecialchars($value);
	return $value;
}	
	
	
	public function cleanMenuInput($value){
		
	if (empty($value)){
		throw new MyExp('NOT VALID');
	}
	$value = trim($value);
    $value = stripslashes($value);
    $value = strip_tags($value, '<ul><li><a>');
    $value = htmlspecialchars($value);
	return $value;
    }
	
	public function itemOptionProceed($value){
		
		if($value == '-' || $value == ''){
			return '';
		}else{
		
			$options = explode(Config::OPTION_SEPARATOR_END, $value);
		
			for($i = 0, $leng = (count($options)-1) ; $i < $leng ; $i++ ){
				
				$option = explode(Config::OPTION_SEPARATOR, $options[$i]);
				
				if(count($option) < 2){
					
					return false;
				}else{
					$name = array_shift($option);
	
					$result .= trim($name).":";

					$array = explode(Config::FIRST_SEPARATOR, $option[0]);
					
					foreach($array as $j){
						$result .= trim($j).",";
					}
					$result = substr($result, 0, -1);
				}
				$result .= Config::OPTION_SEPARATOR_END."\n";
			}
			
				
			}
			
			//$result = substr($result, 0, -1*strlen(Config::OPTION_SEPARATOR_END));
			
			return $result;
		
	}
	
	public function isCheckdate($value){
		$date = explode('.',$value);
		
		if ($date[2] > Config::PROMO_YEAR){
			return false;
		}
		
		if (!checkdate($date[1], $date[0], $date[2])){
		return false;
		}
		return true;
	}
		
	
	public function isValidCategory($value){
		if (!in_array($value, Config::MAIN_CATEGORIES)){
		return false;
	}
		return true;
	}
		
	
	public function isNumeric($value){	
		
	if (!is_numeric($value)){
		return false;
	}
		return true;
	}
	
	public function isInteger($value){	
		
	if (!is_int($value)){
		return false;
	}
		return true;
	}

	public function logIsValid($value){	
		
	if ((!preg_match('/^[a-zA-Z0-9_-]{3,30}$/si', $value))){
		return false;
	}
		return true;
	}
	 
	public function mailIsValid($value){
	if ((!preg_match('/^[-0-9a-z_\.]+@[-0-9a-z_^\.]+\.[a-z]{2,6}$/si', $value)) || (strlen($value) > 50)){
		return false;
	}
		return true;
	}
	
	public function passIsValid($value){
	if (!preg_match('/^[a-zA-Z0-9_-]{6,30}$/si', $value)){
		return false;
	}
		return true;
	}
	
	public function nameIsValid($value){
	if (!preg_match('/^[а-яА-ЯёЁa-zA-Z]{3,30}$/u', $value)){
		return false;
	}
		return true;	
	}
	
	public function cardIsValid($value){
	if (!preg_match('/^[\d\s]{3,30}$/u', $value)){
		return false;
	}
		return true;	
	}
	
	public function nameStoreIsValid($value){
	if (!preg_match('/^[a-zA-Z0-9\s]{1,30}$/u', $value)){
		return false;
	}
		return true;	
	}
	
	public function url_nameStoreIsValid($value){
	if (!preg_match('/^[a-z0-9]{1,25}$/u', $value)){
		return false;
	}
		return true;	
	}
	
	public function categoriesIsValid($value){
	if (!preg_match('/^[a-z0-9-,]+$/u', $value)){
		return false;
	}
		return true;	
	}

	
	public function namePretty($value){
		$name = mb_strtolower($value);
		$name = mb_strtoupper(mb_substr($name, 0, 1)).mb_substr($name, 1);
		
		return $name;
		
	}

	public function nameItemPretty($value){
		
		$result = str_replace('"', '\"', $value); 
		
		return $result;
		
	}
	

	public function sendMessagePretty($value){
		
		$result = str_replace(Config::SECOND_SEPARATOR, '***', $value); 
		$result = str_replace(Config::THIRD_SEPARATOR, '****', $result); 
		$result = str_replace('"', '\"', $result); 

		return $result;
		
	}
	
	public function isClosartURL($value){
		
		if (!preg_match('/^(https?:\\/\\/)?(www\\.)?(closart)\\.([a-z\\.]{2,6})([\\/\\w \\.-]*)*\\/?$/', $value)){
		return false;
	}
		return true;
		
	}

	
	 
 }


























?>