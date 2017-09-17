<?php

class Template{

  private $dir_tmpl; // Директория с tpl-файлами
  private $data = array(); // Данные для вывода
 // private $default_data = false;
 
	
  public function __construct($dir_tmpl) {
    $this->dir_tmpl = $dir_tmpl;
    $this->default_data = $default_data;
  }

  /* Метод для добавления новых значений в данные для вывода */ 
  public function setData($list) { // 1- данные 2-блог
	/*
	foreach ( $list as $key => $value){
		$this->data[$key] = $value;
		}
		
	*/	
	$this->data = $list;
	
  }
  
  public function cleanData () {
	  $this->data = array();
	  
  }

  /* Метод для удаления значений из данных для вывода 
  public function delete($name) {
    unset($this->data[$name]);
  } */ 

  /* При обращении, например, к $this->title будет выводиться $this->data["title"] 
  public function __get($name) {
    if (isset($this->data[$name])) return $this->data[$name];
    return "";
  } */ 

  /* Вывод tpl-файла, в который подставляются все данные для вывода */ 
  public function display ($tpl) {
    $template = $this->dir_tmpl.$tpl.'.tpl';
    $params = $this->data;
	ob_start();
	include ($template);
    echo ob_get_clean();
  }
  
}

?>
