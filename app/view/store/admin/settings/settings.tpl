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

<style type="text/css">
              
/************content************/
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
    min-width: 350px;
    height: 80px;
    
}

#bio section{
    text-align: left;
}


.card-wrapper{
    margin:30px;
 
}

board input[type="text"], board input[type="password"]  {
    width: 100%;
    text-align: center;
    font-size: 1.25em;
    margin-bottom: 10px;
}

menu .exit{
	font-weight:100;
	color: rgb(242, 93, 0);
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
                
            <board id="pop_up">
                <item class="no_mob"><?php echo $static['content']['MENU']; ?>:</item>
                 <item class="pop_up">
                     <pop_up>
                        <wrapper>
                            <div class="pop content">
                                <ul>
                                    <li class="active" board="main"><?php echo $static['content']['MAIN']; ?></li>
                                    <li board="credit"><?php echo $static['content']['FINANCE']; ?></li>
                                    <li board="pass"><?php echo $static['content']['CHANGE_PASSWORD']; ?></li>
                                   
                                   
                                </ul>
                            </div>
                            <div class="parent"><dynamic_s><?php echo $static['content']['MAIN']; ?></dynamic_s><static_d>&#8595;</static_d></div>
                         </wrapper>
                     </pop_up>
                 </item>
                    <item><button id="save_button"><?php echo $static['buttons']['SAVE']; ?></button></item>
               
                <prompt><?php echo $static['content']['PROMPT']; ?></prompt>
            </board>
                
        </static>       
             
             
             
        <dynamic> 
                    
             <board id="main" class="on interact">
			    <form what="settings_main" method="post">
                    <section>
                        <item>
                            <label for="name"><?php echo $static['content']['NAME']; ?>:</label>
                            <input type="text" name="name" value="<?php echo ($dynamic['person_name'] !== "n") ? $dynamic['person_name'] : "" ; ?>" maxlength="30" data-rule-valid='[{"key":"regexp","value":"^[а-яА-ЯёЁa-zA-Z]{3,30}$"}]'>
                        </item>
                        <item>
                            <label for="surname"><?php echo $static['content']['SURNAME']; ?>:</label>
                            <input type="text" name="surname" value="<?php echo ($dynamic['person_surname'] !== "n") ? $dynamic['person_surname'] : "" ; ?>" maxlength="30" data-rule-valid='[{"key":"regexp","value":"^[а-яА-ЯёЁa-zA-Z]{3,30}$"}]'>
                        </item>
                        <item>
                            <label for="secondname"><?php echo $static['content']['SECOND_NAME']; ?>:</label>
                            <input type="text" name="secondname" value="<?php echo ($dynamic['person_secondname'] !== "n") ? $dynamic['person_secondname'] : "" ; ?>" maxlength="30" data-rule-valid='[{"key":"regexp","value":"^[а-яА-ЯёЁa-zA-Z]{3,30}$"}]'>
                        </item>
                  </section> 
                  <section>
                         <item>
                            <label for="phone"><?php echo $static['content']['PHONE']; ?>:</label>
                            <input id="phone" type="text" name="phone" value="<?php echo ($dynamic['phone'] !== "n") ? $dynamic['phone'] : "" ; ?>" data-rule-valid='[{"key":"regexp","value":"(?=.{19,19})"}]'>
                        </item>
                        <item>
                            <label for="mail"><?php echo $static['content']['MAIL']; ?>:</label>
                            <input type="text" name="mail" value="<?php echo ($dynamic['mail'] !== "n") ? $dynamic['mail'] : "" ; ?>" maxlength="50" data-rule-valid='[{"key":"regexp","value":"^([a-z0-9_\\.-]+)@([a-z0-9_\\.-]+)\\.([a-z\\.]{2,6})$"}]'>
                        </item>
                        <item>
                            <label for="address"><?php echo $static['content']['ADDRESS']; ?>:</label>
                            <input type="text" name="address" value="<?php echo ($dynamic['address'] !== "n") ? $dynamic['address'] : "" ; ?>" maxlength="200" data-rule-valid='[{"key":"regexp","value":"^[а-яА-ЯёЁa-zA-Z.,/#№0-9_+\\s]{3,200}$"}]'>
                        </item>
                 </section>
                </form>
            </board>
             
               
            <board id="credit" class="d_none">
              <form id="card_settings" what="card_settings" method="post"> 
              <section>
                  <prompt><?php echo $static['content']['CARD_PROMPT']; ?></prompt>
                  <item>
                  <div class='card-wrapper'></div>
                  </item>
                    <item>
                        <input id="credit_card" type="text" name="card" value="<?php echo ($dynamic['card'] !== "n") ? $dynamic['card'] : "" ; ?>" maxlength="19" data-rule-valid='[{"key":"regexp","value":"(?=.{18,19})"}]' placeholder="&#8226&#8226&#8226&#8226 &#8226&#8226&#8226&#8226 &#8226&#8226&#8226&#8226 &#8226&#8226&#8226&#8226">
                        <input type="text" name="card_name" value="<?php echo ($dynamic['card_name'] !== "n") ? $dynamic['card_name'] : "" ; ?>" data-rule-valid='[{"key":"regexp","value":"^[а-яА-ЯёЁa-zA-Z]{3,30}$"}]' placeholder="<?php echo $static['content']['NAME']; ?>"/>
                        <input type="text" name="card_surname" value="<?php echo ($dynamic['card_surname'] !== "n") ? $dynamic['card_surname'] : "" ; ?>" data-rule-valid='[{"key":"regexp","value":"^[а-яА-ЯёЁa-zA-Z]{3,30}$"}]' placeholder="<?php echo $static['content']['SURNAME']; ?>"/>
                    </item>
                </section> 
                </form>
            </board>
             
             
             
            <board id="pass"  class="d_none">
                 <form what="password_settings" method="post"> 
                  <section>
                        <item>
                            <label for="password"><?php echo $static['content']['PASSWORD']; ?>:</label>
                            <input type="password" name="password" data-rule-valid='[{"key":"regexp","value":"^[a-zA-Z0-9_-]{6,30}$"}]' placeholder="&#8226&#8226&#8226&#8226&#8226&#8226&#8226&#8226&#8226">
                        </item>
                        <item>
                            <label for="new_password1"><?php echo $static['content']['PASSWORD_NEW']; ?>:</label>
                            <input type="password" name="new_password1" data-rule-valid='[{"key":"regexp","value":"^[a-zA-Z0-9_-]{6,30}$"}]' placeholder="&#8226&#8226&#8226&#8226&#8226&#8226&#8226&#8226&#8226">
                        </item>
                        <item>
                            <label for="new_password2"><?php echo $static['content']['PASSWORD_REPEAT']; ?>:</label>
                            <input type="password" name="new_password2" data-rule-valid='[{"key":"regexp","value":"^[a-zA-Z0-9_-]{6,30}$"}]' placeholder="&#8226&#8226&#8226&#8226&#8226&#8226&#8226&#8226&#8226">
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
  <script src="../../../../library/js/phone_validator.js"></script>
  <script src="../../../../../library/js/card.js"></script> 
  <script src="../../../../library/js/lemongrab/lemongrab.js"></script> 
  <script src="../../../../static/COMMON/COMMON.js"></script>
      
  <script type="text/javascript">

$(document).ready(function(){


/************Menu show***********************/ 

    function menuShow(){
        $('ul .admin-settings').addClass('show');   
    }
    menuShow();
    
    
/**********AJAX Settings ***********/
    
 $('#save_button').on('click', function(e){
     e.preventDefault();
     
     $this = $(this);
     
     if($this.hasClass('disabled')){
         return false;
     }
     
     var form = $('dynamic .interact form');
     var what = form.attr('what'); 
     
       form.lemongrab();
       if(form.isValid()){   
       $parent = form.parent();
       var data = form.serialize();
       data += '&what='+what; 
     
     switch(what){
             
         case 'settings_main':
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
             
            case 'card_settings':
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
                
                case 'password_settings':
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
         
    
/********Card_init**********/
    var card_init = $('#credit_card').val();
    
    if(card_init.length <= 1){
          var card = new Card({
    // a selector or DOM element for the form where users will
    // be entering their information
    form: '#card_settings', // *required*
    // a selector or DOM element for the container
    // where you want the card to appear
    container: '.card-wrapper', // *required*

     formSelectors: {
        numberInput: 'input[name="card"]', // optional — default input[name="number"]
        nameInput: 'input[name="card_name"], input[name="card_suname"]' // optional - defaults input[name="name"]
    },
    width: 300, // optional — default 350px
    formatting: true, // optional - default true

    // Strings for translation - optional
    messages: {
        validDate: 'valid\ndate', // optional - default 'valid\nthru'
        monthYear: 'mm/yyyy', // optional - default 'month/year'
    },
       
        placeholders: {
        number: '<?php echo ($dynamic['card'] !== "n") ? $dynamic['card'] : "•••• •••• •••• ••••" ; ?>',
        name: '<?php echo ($dynamic['card_name'] !== "n") ? $dynamic['card_name']." ".$dynamic['card_surname']: "Full Name" ; ?>',
        expiry: '••/••',
        cvc: '•••'
    },

    // Default placeholders for rendered fields - optional


    // if true, will log helpful messages for setting up Card
    debug: false // optional - default false
});
    }else{
        
       $('#credit_card').keydown(function(eventObject){ //отлавливаем нажатие клавиш
  var card = new Card({
    // a selector or DOM element for the form where users will
    // be entering their information
    form: '#card_settings', // *required*
    // a selector or DOM element for the container
    // where you want the card to appear
    container: '.card-wrapper', // *required*

     formSelectors: {
        numberInput: 'input[name="card"]', // optional — default input[name="number"]
        nameInput: 'input[name="card_name"], input[name="card_suname"]' // optional - defaults input[name="name"]
    },
    width: 300, // optional — default 350px
    formatting: true, // optional - default true

    // Strings for translation - optional
    messages: {
        validDate: 'valid\ndate', // optional - default 'valid\nthru'
        monthYear: 'mm/yyyy', // optional - default 'month/year'
    },
       
        placeholders: {
        number: '<?php echo ($dynamic['card'] !== "n") ? $dynamic['card'] : "•••• •••• •••• ••••" ; ?>',
        name: '<?php echo ($dynamic['card_name'] !== "n") ? $dynamic['card_name']." ".$dynamic['card_surname']: "Full Name" ; ?>',
        expiry: '••/••',
        cvc: '•••'
    },

    // Default placeholders for rendered fields - optional


    // if true, will log helpful messages for setting up Card
    debug: false // optional - default false
}); 
        

});

 }
 
  

});
      
  </script>

  </body>
  
</html>