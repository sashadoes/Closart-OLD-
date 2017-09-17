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
        <title>Admin</title>
        <link href="../../../../library/js/data_picker/css/datepicker.min.css" rel="stylesheet" type="text/css">
<style type="text/css">
    
menu .exit{
	font-weight:100;
	color: rgb(242, 93, 0);
}

    
.art_seccess{
  
    background-color: #c0ffd1;
    color: #069100;
    border-bottom: 1px solid #08d100;
}    
 .art_problem{
  
    background-color: #ffa094;
    color: red;
    border-bottom: 1px solid red;
}  
    
success_letter{
    display: block;
    margin-top: 200px; 
    color: #00a526;
  
}        
              
/************content************/
content{
  
    display: block;
    width: 70%;
    margin: auto;
    margin-top: 140px;
   
}

content static {
    text-align: center;
}

#credits {
	
    display: table;
    margin: 30px auto;
}

#credits item {
    display: inline-block;
    margin-left: 3px;
    padding: 2px;
    
    
}

#credits .amount{
    font-weight: bold;
    font-size: 1.3em;
    border-bottom: 2px solid #0a7b05;
    cursor: pointer;
    color: #0a7b05;
    
}

#credits .amount:hover{
 
    border-bottom: 2px solid #0a7b05;
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
    margin: auto;
    padding: 10px;
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
    min-width: 350px;
    height: 80px;
    
}
    
#promo prompt{
    margin: 20px;
}    

#promo .action{
    display: table;
    width: 340px;
    margin: auto;
    border: 1px solid #a5a5a5; 
    margin-bottom: 20px;
}


#promo .action item {
    display: block;
}
    
#promo item {
    display: block;
}    

#promo item art {
    display: block;
    height: 30px;
} 
    
#promo .promo_art_loader{
    display: block;
    margin: auto;
    padding-top: 10px;
    opacity: 0.5;
}   


#promo .add_action button{
    
    height: 40px;
    width: 40px;
    margin-left: 4px;
    margin-bottom: 20px;
    padding-top: 6px;
    border-radius: 100%;
    font-size: 1.5em;
    font-family: Times New Roman;
}
    
#promo input[type="text"]{
       text-align: center;
}
    
#mailing input[type="text"] , #banner input[type="text"]{
    width: 50%;    
}


dynamic board .forced{
    display: block;
    margin:40px auto;
    
    text-align: center;
}
    
dynamic board .forced item{
    display: inline-block;
    margin: 12px;
    border: 1px solid #a5a5a5;
   
    text-align: center;
}

dynamic board .forced item photo{
    display: block;
    width: 300px;
    height: 300px;
    overflow: hidden;
}

dynamic board .forced item photo img{
    height: 100%;
}

dynamic board .forced item info{
    display: block;
    
     padding: 5px;
}

dynamic board .forced item code {
    display: block;
    padding: 5px;
    
}

dynamic board .forced item period {
    display: block;
    padding: 5px;
    
}
dynamic board .forced item dynamic_s{
    font-size: 1.1em;
    margin-left: 4px;
}

#mailing .action{
    display: table;
   
    margin: auto;
    border: 1px solid #a2a2a2;
    text-align: center;
    padding: 23px;
}

    
#banner .action{
    display: table;
    margin: auto;
    border: 1px solid #a2a2a2;
    text-align: center;
    padding: 23px;
}    


#design{
    display: table;
    width: 60%;
    margin:30px auto;
    border: 1px solid #a2a2a2;
    text-align: center;
    padding: 20px;
}

#design textarea{
    width: 60%;
    height: 120px;
}

menu .exit{
	font-weight:100;
	color: rgb(242, 93, 0);
}

/******radio*****/

.registration .radio_item{
	margin-bottom: 20px;
	
}

.radio {
  vertical-align: top;
  width: 0px;
  height: 0px;
  margin: 0 5px 0 0;
}
.radio + label {
   display: inline-block;
   text-align: left;
   cursor: pointer;
   margin: 0px 4px;
}
.radio:not(checked) {
  position: absolute;
  opacity: 0;
}
.radio:not(checked) + label {
  position: relative;
  padding: 1px 0 0 24px;
}
.radio:not(checked) + label:before {
  content: '';
  position: absolute;
  top: -3px;
  left: 0;
  width: 16px;
  height: 16px;
  border: 1px solid #CDD1DA;
  border-radius: 100%;
  background: #FFF;
}
.radio:not(checked) + label:after {
  content: '';
  position: absolute;
  top: 0px;
  left: 3px;
  width: 12px;
  height: 12px;
  border-radius: 100%;
  background: #ff9300;
  opacity: 0;
  transition: all .2s;
}
.radio:checked + label:after {
  opacity: 1;
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

item  .photo-change label {
     /* Растягиваем label на всю возможную площадь блока .file-upload */
   
     cursor: pointer;
}

item  .photo-change:hover{
    border: 1px solid #b4b4b4;
    
}

item  .photo-change img{
    height:50px;
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
    
/************autocomplete*********/


art_suggest .autocomplete-suggestion { 
    position: relative; 
    height: 50px;
    padding: 5px;
    cursor: pointer;
    border-bottom: 1px solid #818181;
  }

art_suggest .autocomplete-suggestion  img{
    display: block;
    float: left;
    height: 40px;
}

art_suggest .autocomplete-suggestion  str{
    display: block;
    padding-top: 12px;
    text-align: right;
    white-space: nowrap; overflow: hidden; text-overflow: ellipsis; font-size: 1em; color: #000000;
}

art_suggest .autocomplete-suggestion  b { font-weight: normal; color: #ff9300; }
art_suggest .autocomplete-suggestion  .selected { background: #f0f0f0; }    


/*********MOBILE********/

@media screen and (max-width: 1000px) {
  

#credits button {
    height: 50px;
    width: 50px;
   
}

#promo .add_action button {
    height: 80px;
    width: 80px;
   
}
    
content button, content input[type="submit"]{
    
    padding: 10px 8px;
    border: 1px solid black;
    /*border-radius: 4px;*/
    cursor: pointer;
    background-color: #ffffff;
    font-size: 1em;
    margin-top: 40px;
    
}
  content  input[type="text"]{
        width: 100%;
    }
    
    static #pop_up button{
        width: 140px;
    }

    
    static .pop_up{
        width: 490px;
    }
    
    static prompt {
        font-size: 1.2em;
    }
    

    
   dynamic board section item {
    display: block !important;
    margin: 50px!important;
      
    }
    
    
    dynamic board{
        width: 80%!important;
    }
    
    dynamic board section{
        display: block!important;
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
@media screen and (max-width: 600px){
    
      mob tite_mob{
        font-size: 3.2em;
        padding-top:16px;
         
    }
     mob l_menu img, mob r_menu img{
     
     width: 42px;
         margin-top: 2px;
     
    }
    
    #l_menu tite{
        font-size: 2em;
        padding-top: 30px;
    }
    
    #l_menu .menu{
        font-size: 1.5em;
    }
   

}
@media screen and (max-width: 400px){
     mob l_menu img, mob r_menu img{
     width: 36px; 
    }
  
    mob tite_mob{
          font-size: 2.6em;
          padding-top:20px;
    }
    
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
			</magnifire><input type="text" placeholder="<?php echo $static['tools']['SEARCH']; ?>"></search>
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
   
     
<content>

  <static>  
           
             <board id="credits">
                 <item><?php echo $static['content']['CREDITS_BALANCE']; ?>:</item>
                 <item class="amount"><?php echo $dynamic['credits']; ?></item>
                
           </board>
           
            <board id="pop_up">
                <item class="no_mob"><?php echo $static['content']['MENU']; ?>:</item>
                 <item class="pop_up">
                     <pop_up>
                        <wrapper>
                            <div class="pop content">
                                <ul>
                                    <li class="active" board="promo"><?php echo $static['content']['PROMO']; ?></li>
                                    <li board="mailing" class="mailing_dynamic"><?php echo $static['content']['MAILING']; ?></li>
                                    <li board="banner" class="banner_dynamic"><?php echo $static['content']['BANNER']; ?></li>
                                    <li board="design"><?php echo $static['content']['DESIGN']; ?></li>
                                   
                                   
                                </ul>
                            </div>
                            <div class="parent"><dynamic_s><?php echo $static['content']['PROMO']; ?></dynamic_s><static_d>&#8595;</static_d></div>
                         </wrapper>
                     </pop_up>
                 </item>
                    <item><button id="save_button"><?php echo $static['buttons']['SAVE']; ?></button></item>
               
                <prompt><?php echo $static['content']['PROMPT']; ?> <a href="/<?php echo $dynamic['url_name']; ?>/admin/help"> <?php echo $static['content']['help']; ?></a>.</prompt>
            </board>
        </static>       
                
      
<dynamic>
      
    
             <board id="promo" class="on interact">
                 <adding>
                 <section class="action">
                     
                     <prompt><?php echo $static['content']['PROMO_PLAN']; ?></prompt>
                     
                     <form what="art_to_promo" class="promo_form" method="post" >
                      <item>
                            <label for="art"><?php echo $static['content']['ART']; ?>:</label>
                            <art><input class="art_to_promo" type="text" name="art" value=""></art>
                        </item>                       
                     
                         </form>
                     
                       <section class="add_action">
                        <button>+</button>
                   </section>
                         
                    </section>
                 </adding> 
                  
                 
                  <section class="forced"></section>
                  </board>
                
                
                <board id="mailing" class="d_none">

                        <section class="action">
                            
                             <form what="mailing_cron" method="post"> 
                           
                            <input hidden type="text" name="what" value="mailing_cron">
                            <prompt><?php echo $static['content']['MAILING_PROMPT']; ?>.</prompt><br>
                            <prompt><?php echo $static['content']['MAILING_SEX']; ?>:</prompt>
                            
                           
                            <item>
                                  <input type="radio" class="radio" id="radio_W" name="sex" value="W"/>
		                          <label for="radio_W"><?php echo $static['content']['MAILING_WOMAN']; ?></label>
                            </item>
                              <item>
                                  <input type="radio" class="radio" id="radio_M" name="sex" value="M" />
		                          <label for="radio_M"><?php echo $static['content']['MAILING_MAN']; ?></label>
                            </item>
                             <item>
                                  <input type="radio" class="radio" id="radio_A" name="sex" value="A"/>
		                          <label for="radio_A"><?php echo $static['content']['MAILING_ALL']; ?></label>
                            </item>
                             <item>
                                  <input type="text"  name="url"  placeholder="<?php echo $static['content']['URL']; ?>" data-rule-valid='[{"key":"regexp","value":"^(https?:\\/\\/)?(www\\.)?(closart)\\.([a-z\\.]{2,6})([\\/\\w \\.-]*)*\\/?$"}]' /> 
                            </item>
                             <item>
                                <div class="photo-upload">
                                <label>
                                    <input type="file" name="banner" accept="image/*">
                                    <span><?php echo $static['content']['CHOOSE_FILE']; ?></span>
                                    <photo_name></photo_name>
                                </label>
                             </div>
                            </item>
                            
                            
                            <prompt>( <?php echo $static['content']['MAILING_ADVICE']; ?> )</prompt>
                             
                             </form> 
                        
                    </section>
                            

                   <section class="forced">
                       
                
                    
                 </section>

             </board>    
                
                
              <board id="banner" class="d_none">
                  
                  
                     <section class="action">
                         
                          <form what="banner_front" method="post"> 
                          <input hidden type="text" name="what" value="banner_front">
                            <prompt><?php echo $static['content']['BANNER_PROMPT']; ?>.</prompt><br>
                            <prompt><?php echo $static['content']['BANNER_PLAN']; ?>:</prompt>
                            <item>
                                  <input type="radio" class="radio" id="plan1" name="plan" value="plan3"/>
		                          <label for="plan1"><?php echo $static['content']['BANNER_PLAN3']; ?></label>
                            </item>
                              <item>
                                  <input type="radio" class="radio" id="plan2" name="plan" value="plan15" />
		                          <label for="plan2"><?php echo $static['content']['BANNER_PLAN15']; ?></label>
                            </item>
                             <item>
                                  <input type="radio" class="radio" id="plan3" name="plan" value="plan30"/>
		                          <label for="plan3"><?php echo $static['content']['BANNER_PLAN30']; ?></label>
                            </item>
                            <item>
                                  <input type="text"  name="date" class='datepicker-here'  placeholder="<?php echo $static['content']['DATE_BANNER']; ?>" data-rule-valid='[{"key":"regexp","value":"^[0-9\\.]{10,10}$"}]'/> 
                            </item>
                             <item>
                                  <input type="text"  name="url"  placeholder="<?php echo $static['content']['URL']; ?>" data-rule-valid='[{"key":"regexp","value":"^(https?:\\/\\/)?(www\\.)?(closart)\\.([a-z\\.]{2,6})([\\/\\w \\.-]*)*\\/?$"}]'/> 
                            </item>
                             <item>
                                <div class="photo-upload">
                                <label>
                                    <input type="file" name="banner" accept="image/*">
                                    <span><?php echo $static['content']['CHOOSE_FILE']; ?></span>
                                    <photo_name></photo_name>
                                </label>
                             </div>
                            </item>
                           
                            <prompt>( <?php echo $static['content']['BANNER_ADVICE']; ?> )</prompt>
                         </form>
                   </section>
                  
                  
                   <section class="forced">
                      
                     
                    
                 </section>
                
                    </board>
                  
                  
                  
                  <board id="design" class="d_none">
                  
                      <section class="action">
                      <form what="design_order" method="post"> 
                         <prompt><?php echo $static['content']['DESIGN_PROMO']; ?>.</prompt><br>
                         <prompt><?php echo $static['content']['DESIGN_PLAN']; ?>.</prompt><br>
                          
                             <div class="answer">
                                 <textarea name="order" maxlength="5000" data-rule-valid='[{"key":"regexp","value":"(?=.{1,5000})"}]'></textarea>
                             </div>
                          </form>       
                          
                      </section>
                      
                      
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
  <script src="../../../../library/js/lemongrab/lemongrab.js"></script>
  <script src="../../../../library/js/data_picker/js/datepicker.min.js"></script>
  <script src="../../../../static/COMMON/COMMON.js"></script>
  
        
  <script type="text/javascript">

$(document).ready(function(){
	
/************Menu show***********************/ 

    function menuShow(){
        $('ul .admin-marketing').addClass('show');   
    }
    menuShow();	
    
/****PROMO********/
    
    $('.art_problem').on('change', function(){
        $(this).removeClass('art_problem');
    });
    
    
    /*******/
    
    $('#promo .add_action button').on('click', function(){
        

        var $form = $('#promo').find('.promo_form');
        var items = Number($form.attr('items'));
       
        $form.attr('items', items);
       
        var el = $('<item>\n\
                            <label for="art"><?php echo $static['content']['ART']; ?>:</label>\n\
                            <art><input class="art_to_promo" type="text" name="art" value=""></art>\n\
                        </item>');
        $form.append(el);
        
        $form.find('.art_to_promo').autoComplete({
     minChars: 1,
     cache:true,
     source: function(term, suggest){
                    term = term.toLowerCase();
                    var data = 'what=marketing_arts_suggestions&query='+term;
                    var suggestions = [];
                    $.ajax({
                                url:  window.location.href,
                                type: 'POST',
                                dataType: 'json', 
                                data: data, 
                                cache: false,
                                beforeSend: function(data) {
                                  
                                },
                                success: function(data){ 
                                    if (data['error']){ 
                                        Assistant.greenBoard('<div>'+data['error']+'</div>', 'red');
		       		                 } else { 
                                        suggestions = data['suggestions'];
                                        suggest(suggestions);
                                     }
                                },
                                error: function (xhr, ajaxOptions, thrownError) { 
                                   
                                },
                                complete: function(data) {
                                  
                                }
                            });      
         
                    
         
                   
                },
    renderItem: function (item, search){
       
        var store = '<?php echo $dynamic['url_name'] ?>';
       search = search.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
        var re = new RegExp("(" + search.split(' ').join('|') + ")", "gi");
        return '<div class="autocomplete-suggestion" style="height: 50px;padding: 5px;cursor: pointer;border-bottom: 1px solid #818181;" data-val="'+item+'"><img src="../../../../files/stores/'+store+'/items_img_min/'+item+'/'+item+'_p_1.jpg" style="display: block;float: left;height: 40px;"><str style="display: block;padding-top: 12px;text-align: right;white-space: nowrap; overflow: hidden; text-overflow: ellipsis; font-size: 1em; color: #000000;"> '+item.replace(re, "<b style=\"font-weight: normal; color: #ff9300;\">$1</b>")+'</str></div>';
    }

        
            });
        
    });
    
    
    /**art suggestion***/
    
    
       
    $('.art_to_promo').autoComplete({
     minChars: 1,
     cache:true,
     source: function(term, suggest){
                    term = term.toLowerCase();
                    var data = 'what=marketing_arts_suggestions&query='+term;
                    var suggestions = [];
                    $.ajax({
                                url:  window.location.href,
                                type: 'POST',
                                dataType: 'json', 
                                data: data, 
                                cache: false,
                                beforeSend: function(data) {
                                  
                                },
                                success: function(data){ 
                                    if (data['error']){ 
                                        Assistant.greenBoard('<div>'+data['error']+'</div>', 'red');
		       		                 } else { 
                                        suggestions = data['suggestions'];
                                        suggest(suggestions);
                                     }
                                },
                                error: function (xhr, ajaxOptions, thrownError) { 
                                   
                                },
                                complete: function(data) {
                                  
                                }
                            });      
         
                    
         
                   
                },
    renderItem: function (item, search){
       
        var store = '<?php echo $dynamic['url_name'] ?>';
       search = search.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
        var re = new RegExp("(" + search.split(' ').join('|') + ")", "gi");
        return '<art_suggest><div class="autocomplete-suggestion" data-val="'+item+'"><img src="../../../../files/stores/'+store+'/items_img_min/'+item+'/'+item+'_p_1.jpg"><str> '+item.replace(re, "<b>$1</b>")+'</str></div></art_suggest>';
    }
        
 });

 

/**********AJAX Marketing ***********/
    
 $('#save_button').on('click', function(e){
     e.preventDefault();
     
     $this = $(this);
     
     if($this.hasClass('disabled')){
         return false;
     }
     
     var $form = $('dynamic .interact form');
     var what = $form.attr('what'); 
 
     $form.lemongrab();
   
       if($form.isValid()){   
     
        switch(what){
             
         case 'art_to_promo':
             
                     var arts = $form.find('.art_to_promo');
  
                    $.each(arts, function(index, value){
                        
                           var $art = $(this);
                           var art = $art.val();
                        
                          if(art.length <=0 ){
                              $art.parent().parent().slideUp();
                             
                            }else{
                                
                                
                                var data = 'what=art_to_promo&art='+art;
                           
             
                    $.ajax({
                                url:  window.location.href,
                                type: 'POST',
                                dataType: 'json', 
                                data: data, 
                                cache: false,
                                beforeSend: function(data) {
                                     $this.addClass('disabled');
                                     var loader = '<img class="promo_art_loader" src="../../../../static/img/ajax_loader.gif">';                                    Assistant.switchContent($art.parent(),loader);
                                },
                                success: function(data){ 
                                    if (data['error']){ 
                                        $art.addClass('art_problem').on('change', function(){
                                          $(this).removeClass('art_problem');  
                                        });
                                       // Assistant.greenBoard('<div>'+data['error']+'</div>', 'red');

		       		                 } else { 
                                         
                                         $art.addClass('art_seccess');
                                        
                                         setTimeout(function(){
                                            $art.parent().parent().slideUp(1000);
                                         } ,1500);
                                         $('#credits .amount').html(data['credits']);
                     
                                     }
                                },
                                error: function (xhr, ajaxOptions, thrownError) { 
                                    Assistant.greenBoard('<div><?php echo $common['js']['BACKEND_MISTAKE']; ?></div>', 'red');
                                 
                                   
                                },
                                complete: function(data) {
                                     setTimeout(function(){
                                             Assistant.switchContent($art.parent(),'back');
                                         } ,500);
                                    setTimeout(function(){ $this.removeClass('disabled');}, 1000);  
                                    
                                }
                            });  
                                
                            }    
                        
                    
                    });   
                break;
             
            case 'mailing_cron':
             
                            var data = new FormData($form[0]);         
                            var $parent = $form.parent();
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
                                        Assistant.goLoad( $parent, 'off', 1000);   
		       		                 } else { 
                                        var element = '<success_letter style="opacity:0"><?php echo $static['js']['SUCCESS_MAILING'] ?></success_letter>';
                                        $parent.html(element).find('success_letter').animate({marginTop: '0px', opacity: '1'}, 400);
                                         
                                         $('#credits .amount').html(data['credits']); 
                                         
                                         var banner = '<item>\n\
                          <photo><img src="'+data['banner']+'"></photo>\n\
                          <info>\n\
                          <code><?php echo $static['content']['CHECKING']; ?></code>\n\
                          </info>\n\
                            </item>';
                                         
                                         $parent.parent().find('.forced').prepend($(banner));
                                         
                                     }
                                },
                                error: function (xhr, ajaxOptions, thrownError) { 
                                    Assistant.greenBoard('<div><?php echo $common['js']['BACKEND_MISTAKE']; ?></div>', 'red');
                                    Assistant.goLoad( $parent, 'off', 1000);   
                                },
                                complete: function(data) {
                                    setTimeout(function(){ $this.removeClass('disabled');}, 1000);  
                                    Assistant.goLoad( $parent, 'off', 1000);  
                                }
                            });  
     
                break;
                
                
                 case 'banner_front':
             
                            var data = new FormData($form[0]);         
                            var $parent = $form.parent();
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
                                        Assistant.goLoad( $parent, 'off', 1000);   
		       		                 } else { 
                                        var element = '<success_letter style="opacity:0"><?php echo $static['js']['SUCCESS_BANNER'] ?></success_letter>';
                                        $parent.html(element).find('success_letter').animate({marginTop: '0px', opacity: '1'}, 400);
                                         
                                         $('#credits .amount').html(data['credits']); 
                                         
                                         var banner = '<item>\n\
                          <photo><img src="'+data['banner']+'"></photo>\n\
                          <info>\n\
                          <code><?php echo $static['content']['CHECKING']; ?></code>\n\
                          </info>\n\
                            </item>';
                                         
                                         $parent.parent().find('.forced').prepend($(banner));
                                         
                                     }
                                },
                                error: function (xhr, ajaxOptions, thrownError) { 
                                    Assistant.greenBoard('<div><?php echo $common['js']['BACKEND_MISTAKE']; ?></div>', 'red');
                                    Assistant.goLoad( $parent, 'off', 1000);   
                                },
                                complete: function(data) {
                                    setTimeout(function(){ $this.removeClass('disabled');}, 1000);  
                                    Assistant.goLoad( $parent, 'off', 1000);  
                                }
                            });  
     
                break;
                
                case 'design_order':
                    
                            var data = 'what=design_order';  
                            var $parent = $form.parent();
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
                                        Assistant.goLoad( $parent, 'off', 1000);   
		       		                 } else { 
                                         
                                    setTimeout(function(){
                                        var element = '<success_letter style="opacity:0"><?php echo $static['js']['SUCCESS_DESIGN_ORDER'] ?></success_letter>';
                                        $parent.html(element).find('success_letter').animate({marginTop: '0px', opacity: '1'}, 400); 
                                    },1000); 
                                       
                                         
                                     }
                                },
                                error: function (xhr, ajaxOptions, thrownError) {
                                    alert(thrownError);
                                    Assistant.greenBoard('<div><?php echo $common['js']['BACKEND_MISTAKE']; ?></div>', 'red');
                                    Assistant.goLoad( $parent, 'off', 1000);   
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
    

/*******dynamic load******/
    

$('.mailing_dynamic').one('click', function(){
   
                            var data = 'what=mailing_dynamic_boards';  
                           
                            $.ajax({
                                url:  window.location.href,
                                type: 'POST',
                                dataType: 'json', 
                                data: data, 
                                cache: false,
                                beforeSend: function(data) {
                                    var loader = '<scroll_loader style="" loading="false"><img src="../../../../static/img/ring-alt.svg"></scroll_loader> ';
                                    $('#mailing .forced').html(loader);
                                },
                                success: function(data){ 
                                    if (data['error']){ 
                                        Assistant.greenBoard('<div>'+data['error']+'</div>', 'red');
                                        
		       		                 } else { 
                                         var banners = data['banners'];
                                         $('#mailing .forced scroll_loader').fadeOut(400, function(){
                                             
                                        for(var i = 0, length = banners.length ;  i< length ; i++){
                                     
                                             var el = '<item style="opacity:0"><photo><img src="'+banners[i]['banner']+'"></photo><info>';
                                            
                                             switch(banners[i]['status']){
                                                 
                                                 case '<?php echo Config::JUST_STATUS ?>':  el += '<code><?php echo $static['content']['CHECKING']; ?></code>';
                                                     break;
                                                     
                                                 case '<?php echo Config::APPROVED_STATUS ?>':  el += '<code><?php echo $static['content']['APPROVED']; ?></code>';
                                                     break; 
                                                     
                                                case '<?php echo Config::EXECUTED_STATUS ?>':  el += '<code><?php echo $static['content']['PUBLISHED']; ?></code>';
                                                     break;      
                                                     
                                                 default:
                                                     break;
                                                     
                                             }

                                               el += '</info></item>';
                                             $('#mailing .forced').append($(el).animate({opacity:'1'}, 300));
                                             
                                        }

                                         });  
                                         
                                     }
                                },
                                error: function (xhr, ajaxOptions, thrownError) {
                                    alert(thrownError);
                                    Assistant.greenBoard('<div><?php echo $common['js']['BACKEND_MISTAKE']; ?></div>', 'red');
                                },
                                complete: function(data) {
                                    
                                    
                                }
                            });  
     
    
});
    
    
$('.banner_dynamic').one('click', function(){
   
                            var data = 'what=banner_dynamic_boards';  
                           
                            $.ajax({
                                url:  window.location.href,
                                type: 'POST',
                                dataType: 'json', 
                                data: data, 
                                cache: false,
                                beforeSend: function(data) {
                                    var loader = '<scroll_loader style="" loading="false"><img src="../../../../static/img/ring-alt.svg"></scroll_loader> ';
                                    $('#banner .forced').html(loader);
                                },
                                success: function(data){ 
                                    if (data['error']){ 
                                        Assistant.greenBoard('<div>'+data['error']+'</div>', 'red');
                                        
		       		                 } else { 
                                         var banners = data['banners'];
                                         $('#banner .forced scroll_loader').fadeOut(400, function(){
                                             
                                        for(var i = 0, length = banners.length ;  i< length ; i++){
                                     
                                             var el = '<item style="opacity:0"><photo><img src="'+banners[i]['banner']+'"></photo><info>';
                                            
                                             switch(banners[i]['status']){
                                                 
                                                 case '<?php echo Config::JUST_STATUS ?>':  el += '<code><?php echo $static['content']['CHECKING']; ?></code>';
                                                     break;
                                                     
                                                 case '<?php echo Config::APPROVED_STATUS ?>':  el += '<code><?php echo $static['content']['APPROVED']; ?></code>';
                                                     break; 
                                                     
                                                case '<?php echo Config::EXECUTED_STATUS ?>':  el += '<code><?php echo $static['content']['PUBLISHED']; ?></code>';
                                                     break;      
                                                     
                                                 default:
                                                     break;
                                                     
                                             }

                                               el += '</info></item>';
                                             $('#banner .forced').append($(el).animate({opacity:'1'}, 300));
                                             
                                        }

                                         });  
                                         
                                     }
                                },
                                error: function (xhr, ajaxOptions, thrownError) {
                                    alert(thrownError);
                                    Assistant.greenBoard('<div><?php echo $common['js']['BACKEND_MISTAKE']; ?></div>', 'red');
                                },
                                complete: function(data) {
                                    
                                    
                                }
                            });  
     
    
});    
    
     
 $('form').on('submit', function(e){
     e.preventDefault();
 });
    
$('.datepicker-here').on('click', function(){
    $(this).removeClass('UNACCEPTABLE');
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