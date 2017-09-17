<?php   
$assistant = $params['assistant'];
$layout = $params['layout'];
$common = $params['common'];
$static = $params['static'];
$dynamic = $params['dynamic'];

if($assistant['cart_count'] <= 0){
		
	$layout['cart_layout'] = '<no_items>'.$common['cart']['N0_ITEMS'].'</no_items>';
}
?>

<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="user-scalable=no">
        <title>Management</title>

<style type="text/css">
/************content************/

.checkbox {
    cursor: pointer;
    font-style: italic;
    color: #696969;
    line-height: 1.3em;
}

content{
    display: block;
    width: 70%;
    margin: auto;
    margin-top: 150px;
   
}

content static {
    text-align: center;
}

#pop_up{
    display: block;
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

#pop_up item{
    display: inline-block;
    margin: 0px 8px;
}

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

dynamic board {
    display: table;
    margin: 40px auto;
    padding: 30px;
    border: 1px solid #a5a5a5;
    
    text-align: center;
}

dynamic board section{
   display: table-cell;
   text-align: center;
}

dynamic board section item{
    display: block;
    margin: 20px;
}
dynamic board section item p{
    margin: 10px;
}
dynamic board section item textarea{
    width: 100%;
    min-width: 400px;
    height: 100px;
    resize: both;
    
}

#bio section{
    text-align: left;
}


.card-wrapper{
    margin:30px;
 
}

board input[type="text"] {
    width: 100%;
	min-width: 360px;
    font-size: 1.25em;
    margin-bottom: 10px;
}




/*******item photo****/

item .photo-upload {
     position: relative; /* Даем возможность делать позиционирование, внутри данного элемента */
     overflow: hidden; /* Все что выходит за пределы - скрываем */
     width: 50%; /* Задаем ширину кнопки выбора файла */
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

item  .photo-upload label {
     /* Растягиваем label на всю возможную площадь блока .file-upload */
     display: block;
     position: absolute;
     top: 0;
     left: 0;
     width: 100%;
     height: 100%;
     cursor: pointer;
}



item  .photo-upload:hover {
     background: #f4f4f4;
}
item .photo-upload input[type="file"]{
    display: none; /* Обязательно скрываем настоящий Input File */
}


item  .photo-upload  photo_name{
    display: block;
    margin-top: 4px;
    overflow: hidden;
    text-overflow: ellipsis;
    font-size: 0.7em;
    color: #ff7703;
    
}
item  .photo-upload span {
      line-height: 32px; 
}


item .photo-change{
    position: relative; /* Даем возможность делать позиционирование, внутри данного элемента */
     overflow: hidden; /* Все что выходит за пределы - скрываем */
     width: 50%; /* Задаем ширину кнопки выбора файла */
     height: 90px;/* Задаем высоту кнопки выбора файла */
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

item  .photo-change label {
     /* Растягиваем label на всю возможную площадь блока .file-upload */
   
     cursor: pointer;
}

item  .photo-change:hover{
    border: 1px solid #b4b4b4;
    
}

item  .photo-change img{
    height:80px;
}



item  .photo-change input[type="file"]{
    display: none;   
}

item  .photo-change  photo_name{
    display: block;
    margin-top: 6px;
    overflow: hidden;
    text-overflow: ellipsis;
    font-size: 0.7em;
    color: #ff7703;
    
}


/*********MOBILE********/

@media screen and (max-width: 1000px) {

button, input[type="submit"]{
    
    padding: 10px 8px;
    border: 1px solid black;
    /*border-radius: 4px;*/
    cursor: pointer;
    background-color: #ffffff;
    font-size: 1em;
    margin-top: 40px;
    
}
  
    
    static #pop_up button{
        width: 140px;
    }

    
    static .pop_up{
        width: 490px;
    }
      
   dynamic board section item {
    display: block;
    margin: 50px;
      
    }
    dynamic board{
        width: 80%;
    }
    
    dynamic board section{
        display: block;
    }

}


@media screen and (max-width: 700px){
    
     #pop_up{
  
    margin-top: 30px;
    
}
    
    static prompt {
        width: 100%;
    }
    
}

                         
</style>
<link rel="stylesheet" href="../../../../static/COMMON/COMMON.CSS">
</head>
	
<body>
                 
<mob>
            <header class="absolute">
                <l_menu><img src="../../../../static/img/menu.svg"></l_menu>
                <tite_mob>Management</tite_mob>
                <r_menu><img src="../../../../static/img/doots.svg"></r_menu>
            </header>
            
            <search><magnifire><img src="../../../../static/img/magnifire.svg">
			</magnifire><input type="text" placeholder="<?php echo $common['tools']['SEARCH']; ?>"></search>
        </mob>
   
        
<header class="no_mob absolute ">
       
        <tite class="absolute no_mob"><a href="/">CLOSART</a> / <a href="">MANAGEMENT</a></tite>
        
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
	  
        <?php echo $dynamic['menu']; ?> 
		 
      </ul>
   
      <ul class="more">
			
		<?php echo $layout['menu_more']; ?> 
				
      </ul>       
    </menu>
    
</absolute>
     

<content>

  <static> 
                
            <board id="pop_up">
                <item class="no_mob"><?php echo $static['content']['MENU']; ?>:</item>
                 <item class="pop_up">
                     <pop_up>
                        <wrapper>
                            <div class="pop content">
                                <ul>
                                    <li class="active" board="main"><?php echo $static['content']['MAIN']; ?></li>
                                    <li board="set_categories"><?php echo $static['content']['CATEGORIES']; ?></li>
                                    <li board="delete_category"><?php echo $static['content']['DELETE_CATEGORY']; ?></li>
                                    <li board="menu_main"><?php echo $static['content']['MENU']; ?></li>
                                    <li board="delivery"><?php echo $static['content']['DELIVERY']; ?></li>
                                    <li board="bio"><?php echo $static['content']['BIO']; ?></li>
                                   
                                   
                                </ul>
                            </div>
                            <div class="parent"><dynamic_s><?php echo $static['content']['MAIN']; ?></dynamic_s><static_d>&#8595;</static_d></div>
                         </wrapper>
                     </pop_up>
                 </item>
                    <item><button id="save_button"><?php echo $static['buttons']['SAVE']; ?></button></item>
               
                <prompt><?php echo $static['content']['PROMPT_OWNER']; ?>: <?php echo $dynamic['store']['person_name']; ?>  <?php echo $dynamic['store']['person_surname']; ?><br>
                        <?php echo $static['content']['PROMPT_PHONE']; ?>: <?php echo $dynamic['store']['phone']; ?> <br>
                         <?php echo $static['content']['PROMPT_MAIL']; ?>: <?php echo $dynamic['store']['mail']; ?>
				</prompt>
            </board>
                
        </static>       
             
             
             
        <dynamic> 
            
             <board id="main" class="on interact">
                 <form what="main" method="post">
                    <section>
                        <item>
                            <label for="name"><?php echo $static['content']['NAME']; ?>:</label>
                            <input type="text" name="name" value="<?php echo $dynamic['store']['name']; ?>" maxlength="30" data-rule-valid='[{"key":"regexp","value":"^[a-zA-Z0-9\\s]{1,30}$"}]'>
                        </item>
                        <item>
                            <label for="url_name"><?php echo $static['content']['URL_NAME']; ?>:</label>
                            <input type="text" name="url_name" value="<?php echo $dynamic['store']['url_name']; ?>" maxlength="25" data-rule-valid='[{"key":"regexp","value":"^[a-z0-9]{1,25}$"}]'>
                        </item>
                        
                    
                  </section> 
               </form> 
            </board>
            
        <board id="set_categories" class="d_none">
            <form what="set_categories" method="post"> 
              <section>
				<item>
					<label for="categories_allow"><?php echo $static['content']['ALLOWED_CATEGORIES']; ?>:</label>
                    <textarea name="categories_allow" data-rule-valid='[{"key":"regexp","value":"^[a-z0-9-,]+$"}]'><?php echo $dynamic['store']['categories_allow']; ?></textarea>
                </item> 
				<item>
					<label for="categories_self"><?php echo $static['content']['SELF_CATEGORIES']; ?>:</label>
                    <textarea name="categories_self" data-rule-valid='[{"key":"regexp","value":"^[a-z0-9-,]+$"}]'><?php echo $dynamic['store']['categories_self']; ?></textarea>
                 </item> 	
                </section> 
                </form>
           </board>
            
            
                 
        <board id="delete_category" class="d_none">
            <form what="delete_category" method="post"> 
              <section>
				<item>
					<label for="delete"><?php echo $static['content']['SET_DELETE_CATEGORY']; ?>:</label>
                     <input type="text" name="delete" value="" maxlength="30" data-rule-valid='[{"key":"regexp","value":"^[a-z0-9-]+$"}]'>
                </item> 	
                </section> 
                </form>
           </board>
            
             
             
            <board id="menu_main"  class="d_none">
                 <form what="menu_main" method="post"> 
                  <section>
                    <item>
						<label for="menu_ru"><?php echo $static['content']['MENU_RU']; ?>:</label>
						<textarea name="menu_ru" value="" data-rule-valid='[{"key":"regexp","value":"(?=.{19,19})"}]'><?php echo $dynamic['store']['menu']['ru']; ?></textarea>
					</item>
					<item>
						<label for="menu_en"><?php echo $static['content']['MENU_EN']; ?>:</label>
						<textarea name="menu_en" value="" data-rule-valid='[{"key":"regexp","value":"(?=.{19,19})"}]'><?php echo $dynamic['store']['menu']['en']; ?></textarea>
					</item>
                 </section>
               </form>
            </board>
			
			
			 <board id="delivery" class="d_none">
                <form what="delivery" method="post"> 
                 <section>
                     <item>
                         <label for="ua_ru"><?php echo $static['content']['DELIVERY_UA_RU']; ?>:</label>
                         <textarea name="ua_ru" data-rule-valid='[{"key":"regexp","value":"(?=.{2,19})"}]'><?php echo $dynamic['store']['delivery']['ru'][0]; ?></textarea>
                     </item>
                     <item>
                         <label for="rus_ru"><?php echo $static['content']['DELIVERY_RU_RU']; ?>:</label>
                         <textarea name="rus_ru" data-rule-valid='[{"key":"regexp","value":"(?=.{2,19})"}]'><?php echo $dynamic['store']['delivery']['ru'][1]; ?></textarea>
                     </item>
                     <item>
                         <label for="es_ru"><?php echo $static['content']['DELIVERY_ES_RU']; ?>:</label>
                         <textarea name="es_ru" data-rule-valid='[{"key":"regexp","value":"(?=.{2,19})"}]'><?php echo $dynamic['store']['delivery']['ru'][2]; ?></textarea>
                     </item>
                     <item>
                         <label for="us_ru"><?php echo $static['content']['DELIVERY_US_RU']; ?>:</label>
                         <textarea name="us_ru" data-rule-valid='[{"key":"regexp","value":"(?=.{2,19})"}]'><?php echo $dynamic['store']['delivery']['ru'][3]; ?></textarea>
                     </item>
                   </section>
                 
                  <section>
                      <item>
                         <label for="ua_en"><?php echo $static['content']['DELIVERY_UA_EN']; ?>:</label>
                         <textarea name="ua_en" data-rule-valid='[{"key":"regexp","value":"(?=.{2,19})"}]'><?php echo $dynamic['store']['delivery']['en'][0]; ?></textarea>
                     </item>
                     <item>
                         <label for="rus_en"><?php echo $static['content']['DELIVERY_RU_EN']; ?>:</label>
                         <textarea name="rus_en" data-rule-valid='[{"key":"regexp","value":"(?=.{2,19})"}]'><?php echo $dynamic['store']['delivery']['en'][1]; ?></textarea>
                     </item>
                     <item>
                         <label for="es_en"><?php echo $static['content']['DELIVERY_ES_EN']; ?>:</label>
                         <textarea name="es_en" data-rule-valid='[{"key":"regexp","value":"(?=.{2,19})"}]'><?php echo $dynamic['store']['delivery']['en'][2]; ?></textarea>
                     </item>
                     <item>
                         <label for="us_en"><?php echo $static['content']['DELIVERY_US_EN']; ?>:</label>
                         <textarea name="us_en" data-rule-valid='[{"key":"regexp","value":"(?=.{2,19})"}]'><?php echo $dynamic['store']['delivery']['en'][3]; ?></textarea>
                     </item>
                </section>
               </form>
            </board>
			
         
             <board id="bio" class="d_none" name="bio">
                 <form what="bio" method="post"> 
                  <section>
                       <item>
                             <input hidden type="text" name="what" value="bio">
                        </item>
						<item>
                             <div class="photo-change">
                                <label>
                                    <input type="file" name="photo" accept="image/*">
                                    <img id="bio_img" src="/files/stores/<?php echo $dynamic['store']['url_name']; ?>/bio_img/bio.jpg">
                                    <photo_name></photo_name>
                               </label>
                             </div>
                        </item>
                        <item>
                             <label for="year"><?php echo $static['content']['YEAR_FOUND']; ?>:</label>
                             <input type="text" name="year" data-rule-valid='[{"key":"regexp","value":"\\d"}]' value="<?php echo $dynamic['store']['year']; ?>">
                        </item>
                        <item>
                            <label for="country"><?php echo $static['content']['COUNTRY']; ?>:</label>
                            <input type="text" name="country" data-rule-valid='[{"key":"regexp","value":"(?=.{8,50})"}]' value="<?php echo $dynamic['store']['country']; ?>">
                        </item>
                       <item>
                            <label for="bio_ru"><?php echo $static['content']['DESCRIPTION_RU']; ?>:</label>
                             <textarea name="bio_ru" data-rule-valid='[{"key":"regexp","value":"(?=.{8,1000})"}]'><?php echo $dynamic['store']['bio']['ru']; ?></textarea>
                        </item>
                       <item>
                            <label for="bio_en"><?php echo $static['content']['DESCRIPTION_EN']; ?>:</label>
                            <textarea name="bio_en" data-rule-valid='[{"key":"regexp","value":"(?=.{8,1000})"}]'><?php echo $dynamic['store']['bio']['en']; ?></textarea>
                        </item>
                 </section>
                </form>
            </board>
    

            
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
        
<tite class="d_none"><a href="/">CLOSART</a></tite>        
	  <ul class="main">
	  
        <?php echo $dynamic['menu']; ?>  
		 
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
   <script src="../../../../library/js/phone_validator.js"></script>
   <script src="../../../../library/js/lemongrab/lemongrab.js"></script>
   <script src="../../../../static/COMMON/COMMON.js"></script>
        
   <script type="text/javascript">

$(document).ready(function(){
	

/************Menu show***********************/ 
    function menuShow(){
        var url = location.pathname ;
        var array = url.split('/');
        var query = '.'+array[1]+'-'+array[2]+'-'+array[3];
		
        $(query).addClass('show').parents('ul').removeClass('d_none');   
    }
    menuShow();

/**********AJAX Configuration ***********/
    
 $('#save_button').on('click', function(){
     $this = $(this);
     
     if($this.hasClass('disabled')){
         return false;
     }
     
     var $form = $('dynamic .interact form');
     var what = $form.attr('what'); 
     
       $form.lemongrab();
       if($form.isValid()){   
       $parent = $form.parent();
       var data = $form.serialize();
       data += '&what='+what; 
     
     switch(what){
             
         case 'main':
                            $.ajax({
                                url:  window.location.href,
                                type: 'POST',
                                dataType: 'json', 
                                data: data, 
                                cache: false,
                                beforeSend: function(data) {
                                    $this.addClass('disabled');
                                    Assistant.goLoad( $parent, 'on', 1000);
                                },
                                success: function(data){ 
                                    if (data['error']){ 
                                        Assistant.greenBoard('<div>'+data['error']+'</div>', 'red');
		       		                 } else { 
                                         Assistant.greenBoard('<div>'+data['message']+'</div>', 'green');
                                         Assistant.setTimeout( function(){window.location.href = '/management/'+data['new_store']+'/configuration';}, 300);
                                     }
                                },
                                error: function (xhr, ajaxOptions, thrownError) { 
                                    Assistant.greenBoard('<div><?php echo $common['js']['BACKEND_MISTAKE']; ?></div>', 'red');
                                },
                                complete: function(data) {
                                    setTimeout(function(){ $this.removeClass('disabled');}, 1000);  
                                    Assistant.goLoad( $parent, 'off', 1000);   
                                }
                            });      
                break;
             
            case 'set_categories':
                            $.ajax({
                                url:  window.location.href,
                                type: 'POST',
                                dataType: 'json', 
                                data: data, 
                                cache: false,
                                beforeSend: function(data) {
                                    $this.addClass('disabled');
                                    Assistant.goLoad( $parent, 'on', 1000);
                                },
                                success: function(data){ 
                                    if (data['error']){ 
                                        Assistant.greenBoard('<div>'+data['error']+'</div>', 'red');
		       		                 } else { 
                                         Assistant.greenBoard('<div>'+data['message']+'</div>', 'green');  
                                     }
                                },
                                error: function (xhr, ajaxOptions, thrownError) { 
                                     Assistant.greenBoard('<div><?php echo $common['js']['BACKEND_MISTAKE']; ?></div>', 'red');
                                },
                                complete: function(data) {
                                    setTimeout(function(){ $this.removeClass('disabled');}, 1000);  
                                    Assistant.goLoad( $parent, 'off', 1000);   
                                }
                            });  
     
                break;
                
                case 'delete_category':
                            $.ajax({
                                url:  window.location.href,
                                type: 'POST',
                                dataType: 'json', 
                                data: data, 
                                cache: false,
                                beforeSend: function(data) {
                                    $this.addClass('disabled');
                                    Assistant.goLoad( $parent, 'on', 1000);
                                },
                                success: function(data){ 
                                    if (data['error']){ 
                                        Assistant.greenBoard('<div>'+data['error']+'</div>', 'red');
		       		                 } else { 
                                        Assistant.greenBoard('<div>'+data['message']+'</div>', 'green');  
                                     }
                                },
                                error: function (xhr, ajaxOptions, thrownError) { 
                                    Assistant.greenBoard('<div><?php echo $common['js']['BACKEND_MISTAKE']; ?></div>', 'red');
                                },
                                complete: function(data) {
                                    setTimeout(function(){ $this.removeClass('disabled');}, 1000);  
                                    Assistant.goLoad( $parent, 'off', 1000);   
                                }
                            });  
                
                break;
             
                case 'menu_main':
                            $.ajax({
                                url:  window.location.href,
                                type: 'POST',
                                dataType: 'json', 
                                data: data, 
                                cache: false,
                                beforeSend: function(data) {
                                    $this.addClass('disabled');
                                    Assistant.goLoad( $parent, 'on', 1000);
                                },
                                success: function(data){ 
                                    if (data['error']){ 
                                        Assistant.greenBoard('<div>'+data['error']+'</div>', 'red');  
		       		                 } else { 
                                         Assistant.greenBoard('<div>'+data['message']+'</div>', 'green');  
                                     }
                                },
                                error: function (xhr, ajaxOptions, thrownError) { 
                                     Assistant.greenBoard('<div><?php echo $common['js']['BACKEND_MISTAKE']; ?></div>', 'red');
                                },
                                complete: function(data) {
                                    setTimeout(function(){ $this.removeClass('disabled');}, 1000);  
                                    Assistant.goLoad( $parent, 'off', 1000);   
                                }
                            });  
     
                break;
             
                case 'delivery':
                            $.ajax({
                                url:  window.location.href,
                                type: 'POST',
                                dataType: 'json', 
                                data: data, 
                                cache: false,
                                beforeSend: function(data) {
                                    $this.addClass('disabled');
                                    Assistant.goLoad( $parent, 'on', 1000);
                                },
                                success: function(data){ 
                                    if (data['error']){ 
                                        Assistant.greenBoard('<div>'+data['error']+'</div>', 'red');
		       		                 } else { 
                                         Assistant.greenBoard('<div>'+data['message']+'</div>', 'green');  
                                     }
                                },
                                error: function (xhr, ajaxOptions, thrownError) { 
                                     Assistant.greenBoard('<div><?php echo $common['js']['BACKEND_MISTAKE']; ?></div>', 'red');
                                },
                                complete: function(data) {
                                    setTimeout(function(){ $this.removeClass('disabled');}, 1000);  
                                    Assistant.goLoad( $parent, 'off', 1000);   
                                }
                            });  
     
                 break;
             
                 case 'bio':
                 
                             data = new FormData($form[0]); 
                            
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
		       		                 } else { 
                                         var src = $('#bio_img').attr('src');
                                         $('#bio_img').removeAttr('src').attr('src', src+'?new'+Math.random().toString(2));
                                         Assistant.greenBoard('<div>'+data['message']+'</div>', 'green');  
                                     }
                                },
                                error: function (xhr, ajaxOptions, thrownError) { 
                                     Assistant.greenBoard('<div><?php echo $common['js']['BACKEND_MISTAKE']; ?></div>', 'red');
                                },
                                complete: function(data) {
                                    setTimeout(function(){ $this.removeClass('disabled');}, 1000);  
                                    Assistant.goLoad( $parent, 'off', 1000);   
                                }
                            });  
  
                break;
            
            default :
                Assistant.greenBoard('<div>Bad request</div>', 'red');
                break;
    
     }
    }
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
    
 /****** phone mask *****/ 
$("#phone").on('focus', function(){
$(this).removeClass('UNACCEPTABLE');
});  
$("#phone").mask("+999 (99) 999 99 99",{placeholder:" "});    
    
  

   



});
      
  </script>

  </body>
  
</html>