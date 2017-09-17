<?php   
$assistant = $params['assistant'];
$layout = $params['layout'];
$common = $params['common'];
$static = $params['static'];
$dynamic = $params['dynamic'];

if($assistant['cart_count'] <= 0){
		
	$layout['cart_layout'] = '<no_items>'.$common['cart']['N0_ITEMS'].'</no_items>';
}

foreach($dynamic['categories_allow'] as $value){
		$categories_allow .= '<option>'.$value.'</option>';
}

foreach($dynamic['categories_self'] as $value){
	
   if($value == $dynamic['url_category']){
		$categories_self .= '<option selected category='.$value.'>'.$value.'</option>';
	}else{
		$categories_self .= '<option category='.$value.'>'.$value.'</option>';
	}
}

if($dynamic['url_category'] == 'screening'){
    $categories_self .= '<option selected category="screening">'.$static['content']['SCREENING'].'</option>';
}else{
    $categories_self .= '<option category="screening">'.$static['content']['SCREENING'].'</option>';
}

?>

<!DOCTYPE html>
<html>
<head>  
        <meta http-equiv="Cache-control" content="no-cache">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Expires" content="-1">
        
		<meta charset="utf-8">
        <meta name="viewport" content="user-scalable=no">
        <title>Admin</title>
		<link href="../../../../../library/js/data_picker/css/datepicker.min.css" rel="stylesheet" type="text/css">

<style type="text/css">
              
/***********special***********/
#pop_up select{
    
   border: 1px solid #000000;
   color: #000000;
   font-size: inherit;
   overflow: hidden;
   padding: 4px 2px;
   border-radius: 2px;
    white-space: nowrap;
    width: 200px;
    cursor: pointer;
  
}


board input[type="text"] {
    width: 100%;
    font-size: 1.25em;
    margin-bottom: 10px;
}


.item .success_upload_logo{
    text-align: center;
}
.item .success_upload_logo img{
    
     width:60px;
     margin: auto;
   
}
    
    no_items_found{
        display: block;
        text-align: center;
        color: #bfbfbf;
        margin-top: 40px;
    }
/***********content***********/


content{
    display: block;
    width: 1100px;
    margin: auto;
    margin-top: 140px;
	margin-bottom: 40px;
   
}

content static {
    text-align: center;
}

#pop_up{
    display: block;
}

#pop_up item {
    margin: 10px;
}

static prompt{
    
    width: 600px;
    margin: 30px auto; 
    font-size: 1em;
    color: #000000; 
}

static prompt a{
    border-bottom: 1px solid black;
}


/******item*******/

.item{
    display: table; 
    margin: 40px auto;
    width: 100%;
    padding: 30px;
    border: 1px solid #a5a5a5;
}

.item section{
    display: block;
    float: left;
}
.item section item{
    display: block;
   margin-bottom: 20px;
}

.item .photo {
      width:25%;
     text-align: center;
      padding-right: 20px;
}

.item .photo p{
    margin-bottom: 25px;
    font-size: 0.85em;
}
.item .photo button{
    
    height: 40px;
    width: 40px;
    margin-left: 4px;
    padding-top: 6px;
    border-radius: 100%;
    font-size: 1.5em;
    font-family: Times New Roman;

}
    
.item .about .art{
    
    font-size: 0.9em;
} 

.item .about .art static_s{
    
    font-weight: bold;
}    

.item .about {
    width: 60%;
}

.item .about input{
    width: 90%;
   
}

.item .about .line_1 item{
    display: inline-block;
}

.item .about .line_1 .item_name{
    width: 64% !important;
}

.item .about .line_1 .item_data{
    width: 28% !important;
}

.item .about .line_2 item{
    display: inline-block;
    margin-right: 20px;
}

.item .about .line_2 item select{
    width:100%;
}

.item .about textarea{
    width: 80%;
    min-height: 80px;
    font-size: 1em;
    resize: vertical;
}


.item .price{
    width: 15%;
    float: right;
    text-align: center;
}

.item .price input{
    width: 120px;
    text-align: center;
   
}

#add_more {
    display: block;
    text-align: center;
    margin: 10px;
}

#add_more button{
    
    height: 50px;
    width: 50px;
    margin-left: 4px;
    padding-top: 8px;
    border: 1px solid black;
    border-radius: 100%;
    font-size: 1.5em;
    text-align: center;
    font-family: Times New Roman;
}


    

/*******item photo****/

.item .photo .photo-upload {
     position: relative; /* Даем возможность делать позиционирование, внутри данного элемента */
     overflow: hidden; /* Все что выходит за пределы - скрываем */
     width: 80%; /* Задаем ширину кнопки выбора файла */
     height: 32px;/* Задаем высоту кнопки выбора файла */
     margin: auto;
     margin-bottom: 30px;
     border: 1px solid #a5a5a5;
     border-radius: 3px;
    
     color: #5d5d5d;
     text-align: center;
     overflow: visible;
     cursor: pointer;
}

.item .photo .photo-upload label {
     /* Растягиваем label на всю возможную площадь блока .file-upload */
     display: block;
     position: absolute;
     top: 0;
     left: 0;
     width: 100%;
     height: 100%;
     cursor: pointer;
}

.item .photo .photo-upload:hover {
    background: #f4f4f4;
}
.item .photo .photo-upload input[type="file"]{
    display: none; /* Обязательно скрываем настоящий Input File */
}


.item .photo .photo-upload  photo_name{
    display: block;
    margin-top: 4px;
    overflow: hidden;
    text-overflow: ellipsis;
    font-size: 0.7em;
    color: #ff7703;
    
}
.item .photo .photo-upload span {
     line-height: 32px; /* Делаем вертикальное выравнивание текста, который написан на кнопке */
}


.item .photo .photo-change{
    position: relative; /* Даем возможность делать позиционирование, внутри данного элемента */
     overflow: hidden; /* Все что выходит за пределы - скрываем */
     width: 80%; /* Задаем ширину кнопки выбора файла */
     height: 60px;/* Задаем высоту кнопки выбора файла */
     margin: auto;
     margin-bottom: 25px;
     border: 1px solid #ffffff;
     border-radius: 3px;
     padding: 4px 4px;
     color: #fff;
     text-align: center;
     overflow: visible;
     cursor: pointer;
     
}

.item .photo .photo-change label {
     /* Растягиваем label на всю возможную площадь блока .file-upload */
   
     cursor: pointer;
}

.item .photo .photo-change:hover{
    border: 1px solid #b4b4b4;
    
}

.item .photo .photo-change img{
    height:50px;
}



.item .photo .photo-change input[type="file"]{
    display: none;   
}

.item .photo .photo-change  photo_name{
    display: block;
    margin-top: 6px;
    overflow: hidden;
    text-overflow: ellipsis;
    font-size: 0.7em;
    color: #ff7703;
    
}


/*****MOBILE******/


@media screen and (max-width: 1200px) {
     
content{
    width: 900px;
    margin: auto;
    margin-top: 270px;
   
}
    
    #pop_up{
        margin-top: 35px;   
    }


 label {
    display: block;
    font-size: 1em !important;
    margin-bottom: 40px;
}
    

    
    .item .about {
    width:  60%;
  
}
    
    .item .price {
    width: 100%;
    float: none;
    text-align: center;
}
    
.item .price item {
    display: inline-block;
    margin: 30px;
    margin-bottom: 20px;
  
}
    
    .datepicker-here{
        font-size: 0.7em!important;
    }
    
}

@media screen and (max-width: 1000px){
    
content{
    width: 600px;
    min-width: 500px;
   
}
 
.item .about {
    width:  66%;
    padding-left: 80px;
   
}
     .photo label {
    display: block;
    font-size: 0.5em !important;
    margin-bottom: 40px;
}
    
     .item .photo .photo-upload{
        width: 130%;
    }

}
@media screen and (max-width: 720px){
    
   


    
}
@media screen and (max-width: 600px){
    
     
   

}
@media screen and (max-width: 400px){
   
   
    
}

                         
</style>
<link rel="stylesheet" href="../../../../static/COMMON/COMMON.CSS">


</head>
  
	
<body>
                 
<mob>
            <header class="absolute">
                <l_menu><img src="../../../../static/img/menu.svg"></l_menu>
                <tite_mob><?php echo $dynamic['name']; ?></tite_mob>
                <r_menu><img src="../../../../static/img/doots.svg"></r_menu>
            </header>
            
            <search><magnifire><img src="../../../../static/img/magnifire.svg">
			</magnifire><input type="text" placeholder="<?php echo $common['tools']['SEARCH']; ?>"></search>
        </mob>
   
        
<header class="no_mob absolute ">
       
        <tite class="absolute no_mob"><a href="/">CLOSART</a> / <a target="_blank" href="/<?php echo $dynamic['url_name']; ?>"><?php echo mb_strtoupper($dynamic['name']); ?></a></tite>
        
        <tools class="no_mob">
        <search class="child">
            <form class="global_search_form" method="post">
            <input type="text" class="global_search" placeholder="<?php echo $common['tools']['SEARCH_l']; ?>" focus_holder="<?php echo $common['tools']['FOCUS_HOLDER']; ?>" blur_holder="<?php echo $common['tools']['BLUR_HOLDER']; ?>">
            </form>
        </search>
          
          <profile class="child tool_icon"><a href="/profile"><img src="../../../../static/img/user.svg"></a></profile>
          
          <cart class="child tool_icon"><img  src="../../../../static/img/bag.svg"><amount><?php echo $assistant['cart_count']; ?></amount></cart>
        
          <setts class="child tool_icon"><img  src="../../../../static/img/settings.svg">
              
          <div id="setts">
              <board>
                <section>
                    <name><?php echo $common['tools']['LANGUAGE']; ?>:</name>
                    <actions class="set_lang">
                        <item class="<?php echo ($assistant['lang'] == 'ru') ? "on" : ""; ?>" lang="ru" >RU</item>
						<item class="<?php echo ($assistant['lang'] == 'en') ? "on" : ""; ?>" lang="en" >EN</item>
                    </actions>    
               </section>
                <section>
                    <name><?php echo $common['tools']['CURRENCY']; ?>:</name>
                    <actions class="set_currency">
                        <item class="<?php echo ($assistant['currency'] == 'uah') ? "on" : ""; ?>" currency="uah" >UAH</item>
                        <item class="<?php echo ($assistant['currency'] == 'rub') ? "on" : ""; ?>" currency="rub" >RUB</item>
                        <item class="<?php echo ($assistant['currency'] == 'usd') ? "on" : ""; ?>" currency="usd" >USD</item>
                    </actions>
                </section>
            </board>
          </div>
              
          </setts>
        </tools>
        </header>
       
        
<absolute>  
             
    <menu class="absolute no_mob">
      <ul class="main">
	  
         <?php echo $layout['menu_main']; ?> 
		 
      </ul>
   
      <ul class="more">
			
		<?php echo $layout['menu_more']; ?> 
				
      </ul>       
    </menu>
    
</absolute>    
   
     
<content show="" offset="" >

   <static>
        
    
          <board id="pop_up">
                <item class="no_mob"><?php echo $static['content']['CATEGORY']; ?>:</item>
                 <item class="pop_up">
                    <select>
                        <option <?php echo ($dynamic['url_category'] == 'new') ? 'selected' : ''; ?> category="new"><?php echo $static['content']['ADD_NEW']; ?></option>
					    <?php echo $categories_self;?>
                    </select>
                 </item>
                    <item><button id="save_button"><?php echo $static['buttons']['SAVE_ALL']; ?></button></item>
               
                <prompt><?php echo $static['content']['PROMPT']; ?> <a href="<?php echo $dynamic['name']; ?>/admin/help"> <?php echo $static['content']['help']; ?></a>.</prompt>
            </board>
    
            
            
    </static>
    
    <dynamic what="<?php echo ($dynamic['items'] == 'new') ? 'item_new' : 'item_update' ?>">
           
			<?php if($dynamic['items'] == 'new'){ ?>
            <new_boards>
             <board class="item">
             <form class="ready_to_go" method="post">
                <input hidden type="text" name="what" value="item_new">
                 <section class="photo">
                     <important>
                         <p><?php echo $static['content']['MAIN_PHOTO']; ?>:</p>
                         <item>
                            <div class="photo-upload">
                                <label>
                                    <input type="file" name="p_1" accept="image/*">
                                    <span><?php echo $static['content']['CHOOSE_FILE']; ?></span>
                                    <photo_name></photo_name>
                                </label>
                             </div>
                         </item>
                         <item>
                            <div class="photo-upload">
                               <label>
                                    <input type="file" name="p_2" accept="image/*">
                                    <span><?php echo $static['content']['CHOOSE_FILE']; ?></span>
                                    <photo_name></photo_name>
                                </label>
                             </div>
                         </item>
       
                     </important>
                    
                     <additional> 
                         <p><?php echo $static['content']['SECONDARY']; ?>:</p>
                         <item>
                            <div class="photo-upload">
                                <label>
                                    <input type="file" name="p_3" accept="image/*">
                                    <span><?php echo $static['content']['CHOOSE_FILE']; ?></span>
                                    <photo_name></photo_name>
                                </label>
                             </div>
                         </item>
                     </additional>
               
                     <item><button class="add_new_photo">+</button></item>
                    
                 </section>
                 
                    <section class="about">
                         <item>
                            <label for="name"><?php echo $static['content']['NAME']; ?>:</label>
                            <input type="text" name="name" value="" maxlength="100" data-rule-valid='[{"key":"regexp","value":"^[а-яА-ЯёЁa-zA-Z0-9№*-_,#)(\"\\s]{3,100}$"}]'  >
                        </item>
                  <div class="line_1">
                        <item class="item_name">
                            <label for="seo"><?php echo $static['content']['KEYWORDS']; ?>:</label>
                            <input type="text" name="seo" value="" maxlength="100" data-rule-valid='[{"key":"regexp","value":"^[а-яА-ЯёЁa-zA-Z0-9,-\\s]{3,100}$"}]' >
                        </item>
                        <item class="item_data">
                            <label for="date"><?php echo $static['content']['DATE']; ?>:</label>
                            <input type='text' name="date" class='datepick' value="<?php echo date("d.m.Y"); ?>" maxlength="0" data-rule-valid='[{"key":"regexp","value":"^[0-9\\.]{10,10}$"}]' />
                        </item>
                  </div>
                       
                 <div class="line_2">       
                    <item>
                    <label for="category"><?php echo $static['content']['CATEGORY_SYSTEM']; ?>:</label>
                     <select class="category_choose">
						<option category="n">-</option>
                        <?php echo $categories_allow;?> 
                    </select>  
                    <input hidden type="text" name="category" value="-">    
                    </item>
                        
                       <item>
                     <label for="category_self"><?php echo $static['content']['CATEGORY_SELF']; ?>:</label>
                     <select  class="category_self_choose">
                        <option category="screening">-</option>
                        <?php echo $categories_self;?>
                    </select>
                     <input hidden type="text" name="category_self" value="screening">
                    </item>
                </div>   
                     <item>
                            <label for="options"><?php echo $static['content']['OPTIONS']; ?>:</label>
                             <textarea name="options" data-rule-valid='[{"key":"regexp","value":"(?=.{0,1000})"}]' placeholder="<?php echo $static['content']['OPTIONS_TEMPLATE']; ?>"></textarea> 
                        </item>
            
                     <item>
                            <label for="description"><?php echo $static['content']['DESCRIPTION']; ?>:</label>
                            <textarea name="description" data-rule-valid='[{"key":"regexp","value":"(?=.{0,5000})"}]'></textarea> 
                        </item>
       
                 </section>

                 
                    <section class="price"> 
                        <item>
                            <label for="price"><?php echo $static['content']['PRICE']; ?> $:</label>
                            <input class="item_price" type="text" name="price" value="0.00"  data-rule-valid='[{"key":"regexp","value":"^[0-9\\.]{1,10}$"}]'>
                        </item>
                         <item>
                            <label for="profit"><?php echo $static['content']['PROFIT']; ?>:</label>
                            <input class="item_profit" type="text" name="profit" value="0.00"  data-rule-valid='[{"key":"regexp","value":"^[0-9\\.]{1,10}$"}]'>
                        </item>
                         <item>
                            <label for="discount"><?php echo $static['content']['DISCOUNT']; ?> %:</label>
                            <input class="item_discount" type="text" name="discount" value="0" maxlength="2" data-rule-valid='[{"key":"regexp","value":"^[0-9]{1,2}$"}]'>
                        </item>
                        <item>
                            <label for="amount"><?php echo $static['content']['AMOUNT']; ?>:</label>
                            <input type="text" name="amount" value="100"  data-rule-valid='[{"key":"regexp","value":"^[0-9]{1,9}$"}]'>
                        </item>
                   
                 </section>
            </form>      
        </board>
        </new_boards>              
                <board id="add_more">
                    <section >
                        <button class="add_new_board">+</button>
                   </section>
                 
            </board>
        
			<?php }else{  
			
				if($dynamic['items'] == 'n'){
					echo '<no_items_found>'.$static['content']['NO_ITEMS_FOUND'].'</no_items_found>';
				}else{
					
					foreach($dynamic['items'] as $item){
								
			?>
			
						
 
           <board class="item">
             <form class="" method="post">
                <input hidden type="text" name="what" value="item_update">
                <input hidden type="text" name="art" value="<?php echo  $item['art']; ?>">
                <input hidden class="img_controller" type="text" name="img" value="<?php echo  $item['img']; ?>">
                 <section class="photo">
                     <important>
                         <p><?php echo $static['content']['MAIN_PHOTO']; ?>:</p>
                        <item>
                           <div class="photo-change">
                                <label>
                                    <input type="file" name="p_1" accept="image/*">
                                    <img src="<?php echo '../../../../files/stores/'.$dynamic['url_name'].'/items_img_min/'.$item['art'].'/'.$item['art'].'_p_1.jpg'; ?>">
                                    <photo_name></photo_name>
                               </label>
                             </div>
                         </item>
                         <item>
                           <div class="photo-change">
                                <label>
                                    <input type="file" name="p_2" accept="image/*">
                                    <img src="<?php echo '../../../../files/stores/'.$dynamic['url_name'].'/items_img_min/'.$item['art'].'/'.$item['art'].'_p_2.jpg'; ?>">
                                    <photo_name></photo_name>
                               </label>
                             </div>
                         </item>
       
                     </important>
                    
                     <additional> 
                         <p><?php echo $static['content']['SECONDARY']; ?>:</p>
						 <?php for($i=3 ; $i <= $item['img'] ; $i++){ ?>
                       <item>
                           <div class="photo-change">
                                <label>
                                    <input type="file" name="p_<?php echo  $i; ?>" accept="image/*">
                                    <img src="<?php echo '../../../../files/stores/'.$dynamic['url_name'].'/items_img_min/'.$item['art'].'/'.$item['art'].'_p_'.$i.'.jpg'; ?>">
                                    <photo_name></photo_name>
                               </label>
                             </div>
                         </item>
						 <?php } ?>
                     </additional>
               
                     <item><button <?php echo ($item['img'] >= 6) ? 'class="d_none"' : '' ?> class="add_new_photo">+</button></item>
                    
                 </section>
                 
                    <section class="about">
                         <item class="art">
                             <static_s><?php echo $static['content']['ART']; ?>: </static_s>
                             <dynamic_s><?php echo  $item['art']; ?></dynamic_s>
                        </item>
                         <item>
                            <label for="name"><?php echo $static['content']['NAME']; ?>:</label>
                            <input type="text" name="name" value="<?php echo  $item['name']; ?>" maxlength="100"  data-rule-valid='[{"key":"regexp","value":"^[а-яА-ЯёЁa-zA-Z0-9№*-_,#)(\"\\s]{3,100}$"}]' >
                        </item>
                  <div class="line_1">
                        <item class="item_name">
                            <label for="seo"><?php echo $static['content']['KEYWORDS']; ?>:</label>
                            <input type="text" name="seo" value="<?php echo  $item['seo']; ?>" maxlength="300" data-rule-valid='[{"key":"regexp","value":"^[а-яА-ЯёЁa-zA-Z0-9,-\\s]{3,100}$"}]' >
                        </item>
                        <item class="item_data">
                            <label for="date"><?php echo $static['content']['DATE']; ?>:</label>
                            <input type='text' name="date" class='datepicker-here' value="<?php echo date('d.m.Y', $item['date']); ?>" maxlength="10" data-rule-valid='[{"key":"regexp","value":"^[0-9\\.]{10,10}$"}]' />
                        </item>
                  </div>
                       
                 <div class="line_2">       
                    <item>
                    <label for="category"><?php echo $static['content']['CATEGORY_SYSTEM']; ?>:</label>
                     <dynamic_s><?php echo  $item['category']; ?></dynamic_s>  
					 <input hidden type="text" name="category" value="<?php echo $item['category']; ?>">
                    </item>
                    <item>
                     <label for="category_self"><?php echo $static['content']['CATEGORY_SELF']; ?>:</label>
                     <select  class="category_self_choose">
                        <option category="screening">-</option>
                        <?php echo $categories_self;?>
						<option category = "d"><?php echo $static['content']['DELETE']; ?></option>
                    </select>
                     <input hidden type="text" name="category_self" value="<?php echo $item['category_self']; ?>">
                     <input hidden type="text" name="category_self_old" value="<?php echo $item['category_self']; ?>">
                    </item>
                </div>   
                     <item>
                            <label for="options"><?php echo $static['content']['OPTIONS']; ?>:</label>
                             <textarea name="options" data-rule-valid='[{"key":"regexp","value":"(?=.{0,1000})"}]' placeholder="<?php echo $static['content']['OPTIONS_TEMPLATE']; ?>"><?php echo  $item['options']; ?></textarea> 
                        </item>
            
                     <item>
                            <label for="description"><?php echo $static['content']['DESCRIPTION']; ?>:</label>
                            <textarea name="description" data-rule-valid='[{"key":"regexp","value":"(?=.{0,5000})"}]'><?php echo  $item['description']; ?></textarea> 
                        </item>
       
                 </section>

                 
                    <section class="price"> 
                        <item>
                            <label for="price"><?php echo $static['content']['PRICE']; ?> $:</label>
                            <input class="item_price" type="text" name="price" value="<?php echo  number_format( $item['price'], 2, '.', ''); ?>"  data-rule-valid='[{"key":"regexp","value":"^[0-9\\.]{1,10}$"}]'>
                        </item>
                         <item>
                            <label for="profit"><?php echo $static['content']['PROFIT']; ?>:</label>
                            <input class="item_profit" type="text" name="profit" value="<?php echo number_format( $item['price']-($item['price']/100*15), 2, '.', '') ; ?>"  data-rule-valid='[{"key":"regexp","value":"^[0-9\\.]{1,10}$"}]'>
                        </item>
                         <item>
                            <label for="discount"><?php echo $static['content']['DISCOUNT']; ?> %:</label>
                            <input class="item_discount" type="text" name="discount" value="<?php echo  $item['discount']; ?>" maxlength="2" data-rule-valid='[{"key":"regexp","value":"^[0-9]{1,2}$"}]'>
                        </item>
                        <item>
                            <label for="amount"><?php echo $static['content']['AMOUNT']; ?>:</label>
                            <input type="text" name="amount" value="<?php echo  $item['amount']; ?>"  data-rule-valid='[{"key":"regexp","value":"^[0-9]{1,9}$"}]'>
                        </item>
						 <item>
                            <button class="save_board" ><?php echo $static['buttons']['SAVE']; ?></button>
                        </item>
                   
                 </section>
            </form>      
        </board>
        	<?php }}} ?>  
    </dynamic>
        
   
</content>  
  
        
<footer>
            <credits>
                <item><img src="../../../../static/img/visa.png"></item>
                <item><img src="../../../../static/img/mastercard.png"></item>
            </credits>
            <rights>CLOSART 2016</rights>
</footer>
        
<board  id="cart" class="d_none no_mob">
        
		    <?php echo $layout['cart_layout']; ?>
		 
            <button class="<?php echo ($assistant['cart_count'] > 0) ? "" : "d_none"; ?>"><?php echo $common['buttons']['PROCEED']; ?></button>
         </order>
</board>  
        
<board id="l_menu" class="d_none on_mob">
        
<tite class=""><a href="/">CLOSART</a></tite>        
	  <ul class="main">
	  
         <?php echo $layout['menu_main']; ?> 
		 
      </ul>
   
      <ul class="more">
			
			<?php echo $layout['menu_more']; ?> 
				
      </ul>           
</board>
		
        
<board id="r_menu" class="d_none on_mob">
             
        <bar>
                 
            <item class="mob_cart active" board_id="mob_cart"><img  src="../../../../static/img/bag.svg"><amount><?php echo $assistant['cart_count']; ?></amount></item>
            <item class="mob_setts " board_id="mob_setts"><img  src="../../../../static/img/settings.svg"></item>
        </bar> 
             
        <board id="mob_cart" class="">

		<?php echo $layout['cart_layout']; ?>
		<button class="<?php echo ($assistant['cart_count'] > 0) ? "" : "d_none"; ?>"><?php echo $common['buttons']['PROCEED']; ?></button>
         </order>
        
		</board>
             
<board id="mob_setts" class="d_none">
             
               
                <section>
                    <name><?php echo $common['tools']['LANGUAGE']; ?>:</name>
                    <actions class="set_lang">
                        <item class="<?php echo ($assistant['lang'] == 'ru') ? "on" : ""; ?>" lang="ru" >RU</item>
						<item class="<?php echo ($assistant['lang'] == 'en') ? "on" : ""; ?>" lang="en" >EN</item>
                    </actions>    
               </section>
                <section>
                    <name><?php echo $common['tools']['CURRENCY']; ?>:</name>
                    <actions class="set_currency">
                        <item class="<?php echo ($assistant['currency'] == 'uah') ? "on" : ""; ?>" currency="uah" >UAH</item>
                        <item class="<?php echo ($assistant['currency'] == 'rub') ? "on" : ""; ?>" currency="rub" >RUB</item>
                        <item class="<?php echo ($assistant['currency'] == 'usd') ? "on" : ""; ?>" currency="usd" >USD</item>
                    </actions>
                </section>
</board>

</board>
        
   
   <div id="greenBoard"></div>
   <curtain style="display:none;"></curtain>  
        
  
 
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="../../../../library/js/jquery.slimscroll.min.js"></script> 
  <script src="../../../../../library/js/data_picker/js/datepicker.min.js"></script>
  <script src="../../../../library/js/lemongrab/lemongrab.js"></script> 
  <script src="../../../../static/COMMON/COMMON.js"></script>
  
        
  <script type="text/javascript">

$(document).ready(function(){

/************Menu show***********************/ 

    function menuShow(){
        $('ul .admin-items').addClass('show');   
    }
    menuShow();	

/**********POP_UP Select *************/
   
 $('.pop_up select').on( "change", function(){
     
     var str = $( ".pop_up select option:selected" ).attr('category');
     var store = location.href.split('/')[3];
   
     location.href = '/'+store+'/admin/items/'+str;
     
 });  

/***********SCROLL FUNCTION*******/
 function scrollTo(element) {
        var destination = element.offset().top;
        if ($.browser.safari) {
            $('body').animate({ scrollTop: destination }, 1100); //1100 - скорость
        } else {
            $('html').animate({ scrollTop: destination }, 1100);
        }
        return false; 
    }
    
/************ITEM AJAX****************/
    
 $('#save_button').on('click', function(){
     $this = $(this);
     
     if($this.hasClass('disabled')){
         return false;
     }
     
     var $forms = $('dynamic .ready_to_go:first');
     
     if($forms.length <= 0){
          return false;
     }
     
     var what = $('content dynamic').attr('what'); 
     
       $forms.lemongrab();
       if(!$forms.isValid()){  
               var destination = $('.UNACCEPTABLE').first().offset().top;
               $('body').animate({ scrollTop: destination-160 }, 300);
               return false;
        }
           
        switch(what){
             
         case 'item_new':
                             
                                var $form = $forms;
                                var $parent = $form.parent(); 
                                var data = new FormData($form[0]); 
                              
                            $.ajax({
                                url:  window.location.href,
                                type: 'POST',
                                dataType: 'json', 
                                data: data, 
                                cache: false,
                                processData: false,
                                contentType: false,
                                beforeSend: function(data) {
                                    $this.addClass('disabled');
                                    Assistant.goLoad( $parent, 'on', 1000);
                                    var destination = $('dynamic .ready_to_go').first().offset().top;
                                    $('body').animate({ scrollTop: destination-180 }, 300);
                                },
                                success: function(data){ 
                                    if (data['error']){ 
                                        Assistant.greenBoard('<div>'+data['error']+'</div>', 'red');
		       		                 } 
                                    if (data['message'] == 'ok'){
                                        $form.removeClass('ready_to_go');
                                        Assistant.goItemSuccess($parent);
                                        $parent.css('border-color', '#3efa61');
                                        $parent.slideToggle(500, function(){$(this).remove(); });
                                        setTimeout(function(){ $this.removeClass('disabled').trigger('click'); }, 1000); 
                                        var remain = $('new_boards form').length;
                                        
                                        if(remain <= 1){
                                        $('.add_new_board').trigger('click');
                                           
                                        }
                                        }else{ 
                                            Assistant.greenBoard('<div>'+data['message']+'</div>', 'green');
                                        
                                        }
                                    
                                },
                                error: function (xhr, ajaxOptions, thrownError) { 
                                        Assistant.greenBoard('<div><?php echo $common['js']['BACKEND_MISTAKE']; ?></div>', 'red');
                                },
                                complete: function(data) {
                                        setTimeout(function(){ $this.removeClass('disabled'); }, 1000);  
                                        Assistant.goLoad( $parent, 'off', 1000);
                                        
                                }
                            });   
                    
                break;
            
            case 'item_update':
                
                    var $form = $forms;
                    var $parent = $form.parent(); 
                    var data = new FormData($form[0]); 
              
                    var destination = $form.offset().top;
                    $('body').animate({ scrollTop: destination-180 }, 300);
                
                     $.ajax({
                                url:  window.location.href,
                                type: 'POST',
                                dataType: 'json', 
                                data: data, 
                                cache: false,
                                processData: false,
                                contentType: false,
                                beforeSend: function(data) {
                                    $this.addClass('disabled');
                                    Assistant.goLoad( $parent, 'on', 1000);
                                },
                                success: function(data){
                                    if (data['error']){ 
                                        Assistant.greenBoard('<div>'+data['error']+'</div>', 'red');
		       		                 } 
                                    if (data['message'] == 'remove'){
                                        $form.removeClass('ready_to_go');
                                        Assistant.goItemSuccess($parent);
                                        $parent.css('border-color', '#3efa61');
                                        $parent.slideToggle(500, function(){$(this).remove(); });
                                        setTimeout(function(){ $this.removeClass('disabled').trigger('click'); }, 1000); 
                                        
                                        }
                                    if (data['message'] == 'ok'){
                                        $form.removeClass('ready_to_go');
                                        $parent.css('border-color', '#3efa61');
                                       
                                        $this.removeClass('disabled').trigger('click');
                                        
                                        $form.find('img').each( function(){
                                            var src = $(this).attr('src');
                                            $(this).removeAttr('src').attr('src', src+'?new'+Math.random().toString(2));
                                        });
                                         
                                        $form.find('.photo .photo-upload').remove();  
                                        $form.find('.img_controller').val(Number(data['img_new']));  
                                      
                                        for(var i =  Number(data['img']) ; i < Number(data['img_new']) ; i++){
                                            var p = i+1;
                                            
                                            var element = $('<item>\n\
                                <div class="photo-change">\n\
                                    <label>\n\
                                        <input type="file" name="p_1" accept="image/*">\n\
                                        <img src="../../../../files/stores/<?php echo $dynamic['url_name']; ?>/items_img_min/<?php echo $item['art'].'/'.$item['art']; ?>_p_'+p+'.jpg'+'?new'+Math.random().toString(2)+'">\n\
                                        <photo_name>P_'+p+'.jpg</photo_name>\n\
                                    </label>\n\
                                </div>\n\
                                </item>');
                                          $form.find('.photo additional').append(element);  
                                         
                                        }
                                        
                                        if(Number(data['img_new']) >= 6){
                                            $form.find('.add_new_photo').addClass('d_none');
                                        }else{
                                            $form.find('.add_new_photo').removeClass('d_none');
                                        }
   
                                        }   
                                       Assistant.greenBoard('<div>'+data['message']+'</div>', 'green');
                                },
                                error: function (xhr, ajaxOptions, thrownError) { 
                                        Assistant.greenBoard('<div><?php echo $common['js']['BACKEND_MISTAKE']; ?></div>', 'red');
                                },
                                complete: function(data) {
                                        setTimeout(function(){ $this.removeClass('disabled'); }, 1000);  
                                        Assistant.goLoad( $parent, 'off', 1000);
                                       
                                        
                                }
                            });
                    
           
                break;
            default :
                Assistant.greenBoard('<div>Bad request</div>', 'red');
                break;
    
     }

 }); 
    
    
/********item  update shugar****/

 $('dynamic form').on('change', function(){
        $(this).addClass('ready_to_go');
    });
    
 $('.item .datepicker-here').on('click', function(){
     $(this).closest('form').addClass('ready_to_go');
 });    
    
/*******SELECT SHUGAR*******/
    
$('.category_choose').on('change', function(){
    var val = $(this).val();
    $(this).next('input').val(val);
});    
    
$('.category_self_choose').on('change', function(){
    var val = $(this).find('option:selected').attr('category');
    $(this).next('input').val(val);
});    

    
/*************Counters - DISCOUNT - PTROFIT *******/ 
function isValute(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
     if (charCode == 46) {
        return true;
    }
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}
function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}
    
function itemPriceSet(){
        $this = $(this);
        $parent = $this.parent().parent();  
        var val =  Number($this.val()); 
        var discount = $parent.find('.item_discount').val();
        var profit = (val - ((val/100)*15)); //- ((val/100)*discount) ;
        $parent.find('.item_profit').val(profit.toFixed(2));
    }   
function itemProfitSet(){
        $this = $(this);
        $parent = $this.parent().parent();       
        var val =  Number($this.val());
        var price = Number($parent.find('.item_price').val());
        var discount = $parent.find('.item_discount').val();
        var price = (val*100/(100-15));// - (val/100)*discount;
        $parent.find('.item_price').val(price.toFixed(2));
        //$parent.find('.item_price').trigger('keypress');
    }
function itemDiscountSet(){
        $this = $(this);
        $parent = $this.parent().parent();
        var prev =  $this.data('prev') || 0;
        var val =  Number($this.val());
        var price = Number($parent.find('.item_price').val());
        var profit = Number($parent.find('.item_profit').val());
         
         if( parseInt(prev) == parseInt(val)){
             $this.data('prev', val);
             return false ;
         }else{  
             if(parseInt(prev) < parseInt(val)){
                 var n_price = price-(price/100*val);
                 var n_profit = profit-(profit/100*val);
       
             }else{
                 var n_price = price*100/(100-parseInt(prev));
                 var n_profit = profit*100/(100-parseInt(prev));
                 n_price = n_price-(n_price/100*val);
                 n_profit = n_profit-(n_profit/100*val);
             }
                 $parent.find('.item_price').val(n_price.toFixed(2));
                 $parent.find('.item_profit').val(n_profit.toFixed(2)); 
                 $this.data('prev', val);
         }
       
       
    }    
    
   $('.item_price').on('keypress', isValute); 
   $('.item_profit').on('keypress', isValute); 
   $('.item_discount').on('keypress', isNumber); 
   $('.item_amount').on('keypress', isNumber); 
  
   $('.item_price').on('keyup', itemPriceSet);
    
   $('.item_profit').on('keyup', itemProfitSet);
    
   $('.item_discount').on('blur', itemDiscountSet);
    
  /********DATE PIKER STOP********/
    
   $('new_boards .datepick').on('keypress', function(){
       return false;
   })
    
/**********ADD MORE NEW BOARD / ADD MORE PHOTO******/
function addNewPhoto(e){
      e.preventDefault();
      var amount = $(this).parent().parent().find('photo_name').length;
      
      var element = $('<item>\n<div class="photo-upload">\n<label>\n<input type="file" name="p_'+(++amount)+'" accept="image/*">\n<span><?php echo $static['content']['CHOOSE_FILE']; ?></span>\n<photo_name></photo_name>\n</label>\n</div>\n</item>');
       
       $(this).parent().parent().find('additional').append(element);
       element.find(".photo-upload input[type='file']").change(function(){
         var filename = $(this).val().replace(/.*\\/, "");
         $(this).parent().find("photo_name").html(filename);
       });
      if(amount>5){
          $(this).addClass('d_none');
       }
      return false;
      
  }
    
  $('.add_new_photo').on('click',addNewPhoto);
    
  $('.add_new_board').on('click', function(){
 
      var board = $('<board class="item">\n\
             <form class="" method="post">\n\
                <input hidden type="text" name="what" value="item_new">\n\
                 <section class="photo">\n\
                     <important>\n\
                         <p><?php echo $static['content']['MAIN_PHOTO']; ?>:</p>\n\
                         <item>\n\
                            <div class="photo-upload">\n\
                                <label>\n\
                                    <input type="file" name="p_1" accept="image/*">\n\
                                    <span><?php echo $static['content']['CHOOSE_FILE']; ?></span>\n\
                                    <photo_name></photo_name>\n\
                                </label>\n\
                             </div>\n\
                         </item>\n\
                         <item>\n\
                            <div class="photo-upload">\n\
                               <label>\n\
                                    <input type="file" name="p_2" accept="image/*">\n\
                                    <span><?php echo $static['content']['CHOOSE_FILE']; ?></span>\n\
                                    <photo_name></photo_name>\n\
                                </label>\n\
                             </div>\n\
                         </item>\n\
       \n\
                     </important>\n\
                    \n\
                     <additional> \n\
                         <p><?php echo $static['content']['SECONDARY']; ?>:</p>\n\
                         <item>\n\
                            <div class="photo-upload">\n\
                                <label>\n\
                                    <input type="file" name="p_3" accept="image/*">\n\
                                    <span><?php echo $static['content']['CHOOSE_FILE']; ?></span>\n\
                                    <photo_name></photo_name>\n\
                                </label>\n\
                             </div>\n\
                         </item>\n\
                     </additional>\n\
               \n\
                     <item><button class="add_new_photo">+</button></item>\n\
                    \n\
                 </section>\n\
                 \n\
                    <section class="about">\n\
                         <item>\n\
                            <label for="name"><?php echo $static['content']['NAME']; ?>:</label>\n\
                            <input type="text" name="name" value="" maxlength="100" data-rule-valid=\'[{"key":"regexp","value":"^[а-яА-ЯёЁa-zA-Z0-9)(\\\\s]{3,100}$"}]\' >\n\
                        </item>\n\
                  <div class="line_1">\n\
                        <item class="item_name">\n\
                            <label for="seo"><?php echo $static['content']['KEYWORDS']; ?>:</label>\n\
                            <input type="text" name="seo" value="" maxlength="300" data-rule-valid=\'[{"key":"regexp","value":"^[а-яА-ЯёЁa-zA-Z0-9,\\\\s]{3,100}$"}]\' >\n\
                        </item>\n\
                        <item class="item_data">\n\
                            <label for="date"><?php echo $static['content']['DATE']; ?>:</label>\n\
                            <input type=\'text\' name="date" class=\'datepick\' value="<?php echo date("d.m.Y"); ?>" maxlength="0" data-rule-valid=\'[{"key":"regexp","value":"^[0-9\\\\.]{10,10}$"}]\' />\n\
                        </item>\n\
                  </div>\n\
                       \n\
                <div class="line_2">       \n\
                    <item>\n\
                    <label for="category"><?php echo $static['content']['CATEGORY_SYSTEM']; ?>:</label>\n\
                     <select class="category_choose">\n\
						<option category="n">-</option>\n\
                        <?php echo $categories_allow;?> \n\
                    </select>  \n\
                    <input hidden type="text" name="category" value="-">    \n\
                    </item>\n\
                        \n\
                       <item>\n\
                     <label for="category_self"><?php echo $static['content']['CATEGORY_SELF']; ?>:</label>\n\
                     <select  class="category_self_choose">\n\
                        <option category="screening">-</option>\n\
                        <?php echo $categories_self;?>\n\
						<option category = "d"><?php echo $static['content']['DELETE']; ?></option>\n\
                    </select>\n\
                     <input hidden type="text" name="category_self" value="screening">\n\
                    </item>\n\
                </div> \n\
                     <item>\n\
                            <label for="options"><?php echo $static['content']['OPTIONS']; ?>:</label>\n\
                             <textarea name="options" data-rule-valid=\'[{"key":"regexp","value":"(?=.{0,1000})"}]\'></textarea> \n\
                        </item>\n\
            \n\
                     <item>\n\
                            <label for="desc'+"ription\"><?php echo $static['content']['DESCRIPTION']; ?>:</label>\n\
                             <textarea name=\"desc"+'ription" data-rule-valid=\'[{"key":"regexp","value":"(?=.{0,5000})"}]\'></textarea> \n\
                        </item>\n\
       \n\
                 </section>\n\
\n\
                 \n\
                    <section class="price"> \n\
                        <item>\n\
                            <label for="price"><?php echo $static['content']['PRICE']; ?> $:</label>\n\
                            <input class="item_price" type="text" name="price" value="0.00"  data-rule-valid=\'[{"key":"regexp","value":"^[0-9\\\\.]{1,10}$"}]\'>\n\
                        </item>\n\
                         <item>\n\
                            <label for="profit"><?php echo $static['content']['PROFIT']; ?>:</label>\n\
                            <input class="item_profit" type="text" name="profit" value="0.00"  data-rule-valid=\'[{"key":"regexp","value":"^[0-9\\\\.]{1,10}$"}]\'>\n\
                        </item>\n\
                         <item>\n\
                            <label for="discount"><?php echo $static['content']['DISCOUNT']; ?> %:</label>\n\
                            <input class="item_discount" type="text" name="discount" value="0" maxlength="2" data-rule-valid=\'[{"key":"regexp","value":"^[0-9]{1,2}$"}]\'>\n\
                        </item>\n\
                        <item>\n\
                            <label for="amount"><?php echo $static['content']['AMOUNT']; ?>:</label>\n\
                            <input type="text" name="amount" value="100"  data-rule-valid=\'[{"key":"regexp","value":"^[0-9]{1,9}$"}]\'>\n\
                        </item>\n\
                   \n\
                 </section>\n\
            </form>      \n\
        </board>');
                    
        $('content dynamic new_boards').append(board);
      
        board.find('.add_new_photo').on('click', addNewPhoto);    
      
        board.find('.item_price').on('keypress', isValute); 
        board.find('.item_profit').on('keypress', isValute); 
        board.find('.item_discount').on('keypress', isNumber); 
        board.find('.item_amount').on('keypress', isNumber); 
    
        board.find('.item_price').on('keyup', itemPriceSet);
    
        board.find('.item_profit').on('keyup', itemProfitSet);
    
        board.find('.item_discount').on('blur', itemDiscountSet);
      
        board.find(".photo-upload input[type='file']").change(function(){
         var filename = $(this).val().replace(/.*\\/, "");
         $(this).parent().find("photo_name").html(filename);
    });
      
        board.find('.category_choose').on('change', function(){
        var val = $(this).val();
        $(this).next('input').val(val);
    });    
    
        board.find('.category_self_choose').on('change', function(){
        var val = $(this).find('option:selected').attr('category');
        $(this).next('input').val(val);
    });  
      
       board.find('form').on('change', function(){
           $(this).addClass('ready_to_go');
       });
  });  
    
/******save board button********/
    
    $('.item .save_board').on('click', function(e){
         e.preventDefault();   
         $this = $(this);
     
     if($this.hasClass('disabled')){
         return false;
     }
    
     var $form = $this.closest('form');
     
     if(!$form.hasClass('ready_to_go')){
          return false;
     }

     
       $form.lemongrab();
        
       if(!$form.isValid()){  
               var destination = $('.UNACCEPTABLE').first().offset().top;
               $('body').animate({ scrollTop: destination-160 }, 300);
               return false;
        }

     
       
        var $parent = $form.parent(); 
        var data = new FormData($form[0]); 
   
                     $.ajax({
                                url:  window.location.href,
                                type: 'POST',
                                dataType: 'json', 
                                data: data, 
                                cache: false,
                                processData: false,
                                contentType: false,
                                beforeSend: function(data) {
                                    $this.addClass('disabled');
                                    Assistant.goLoad( $parent, 'on', 1000);
                                },
                                success: function(data){
                                    if (data['error']){ 
                                        Assistant.greenBoard('<div>'+data['error']+'</div>', 'red');
		       		                 } 
                                    if (data['message'] == 'remove'){
                                        $form.removeClass('ready_to_go');
                                        Assistant.goItemSuccess($parent);
                                        $parent.css('border-color', '#3efa61');
                                        $parent.slideToggle(500, function(){$(this).remove(); });
                                        setTimeout(function(){ $this.removeClass('disabled').trigger('click'); }, 1000); 
                                        
                                        }
                                    if (data['message'] == 'ok'){
                                        $form.removeClass('ready_to_go');
                                        $parent.css('border-color', '#3efa61');
                                       
                                        $this.removeClass('disabled').trigger('click');
                                        
                                        $form.find('img').each( function(){
                                            var src = $(this).attr('src');
                                            $(this).removeAttr('src').attr('src', src+'?new'+Math.random().toString(2));
                                        });
                                         
                                        $form.find('.photo .photo-upload').remove();  
                                        $form.find('.img_controller').val(Number(data['img_new']));  
                                      
                                        for(var i =  Number(data['img']) ; i < Number(data['img_new']) ; i++){
                                            var p = i+1;
                                            
                                            var element = $('<item>\n\
                                <div class="photo-change">\n\
                                    <label>\n\
                                        <input type="file" name="p_1" accept="image/*">\n\
                                        <img src="../../../../files/stores/<?php echo $dynamic['url_name']; ?>/items_img_min/<?php echo $item['art']; ?>/p_'+p+'.jpg'+'?new'+Math.random().toString(2)+'">\n\
                                        <photo_name>P_'+p+'.gif</photo_name>\n\
                                    </label>\n\
                                </div>\n\
                                </item>');
                                          $form.find('.photo additional').append(element);  
                                         
                                        }
                                        
                                        if(Number(data['img_new']) >= 6){
                                            $form.find('.add_new_photo').addClass('d_none');
                                        }else{
                                            $form.find('.add_new_photo').removeClass('d_none');
                                        }
   
                                        }   
                                       Assistant.greenBoard('<div>'+data['message']+'</div>', 'green');
                                },
                                error: function (xhr, ajaxOptions, thrownError) { 
                                        Assistant.greenBoard('<div><?php echo $common['js']['BACKEND_MISTAKE']; ?></div>', 'red');
                                },
                                complete: function(data) {
                                        setTimeout(function(){ $this.removeClass('disabled'); }, 1000);  
                                        Assistant.goLoad( $parent, 'off', 1000);
                                       
                                        
                                }
                            });
                    
     
    });
    
  

/********* AJAX log_out ************/

$('.log_out').on('click', function(){
 $this = $(this); 
   
 var data ='&what='+$this.attr('what');    
    $.ajax({
               url:  window.location.href,
			   type: 'POST',
			   dataType: 'json', 
			   data: data, 
               cache: false,
		       beforeSend: function(data) {  
		          },
		       success: function(data){ 
				      Assistant.setTimeout( function(){window.location.href = '/'}, 200);
		         },
		       error: function (xhr, ajaxOptions, thrownError) { 
		              Assistant.greenBoard('<div><?php echo $common['js']['BACKEND_MISTAKE']; ?></div>', 'red');
		         },
		       complete: function(data) {
		             
		         }}); 
    
});     

});
      
  </script>

  </body>
  
</html>