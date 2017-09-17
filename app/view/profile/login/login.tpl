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
        <title>Profile</title>

<style type="text/css">
    
/*******special******/
@import url('https://fonts.googleapis.com/css?family=Arsenal');
    
header{
    background-color: rgba(255, 255, 255, 0) !important;
}    
    
body{
    overflow: hidden;
    background: url(../../../../static/img/login_background.jpg) no-repeat center top fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
     background-size: cover;
    
}

#prompt{
    
    position: absolute;
    z-index: 10000;
    width: 600px;
    left: 50%;
    bottom: 15%;
    margin-left: -300px;
    text-align: center;
     color: #000000;
     opacity: 0;
     font-size: 4em;
     font-weight: bold;
     font-family: 'Arsenal', sans-serif;
  
}


#user_board {
    
    position: absolute;
    z-index: 3000;
    left: 50%;
    top: 88%;
    margin-left: -85px;
    opacity: 0;
}

#user_board .dave {

    height: 30px;
    width: 170px;
    margin-bottom: 10px;
    border: 1px solid #868686;
    cursor: pointer;
    color: rgb(114, 114, 114);
    font-size: 16px;
    font-weight: bold;
    background-color: rgba(255, 255, 255, 0.35);
    text-align: right;

}


.dave_active {
    color: rgb(0, 0, 0)!important;
  
}

#login{
  padding: 7px ; 
  padding-right: 67px;
}

#registration{
  padding: 7px ; 
  padding-right: 34px ;
}

#forgot{
  padding: 7px ; 
  padding-right: 16px ;
}

.r_active { 
    display: block;
    width: 230px;
    margin-top: -142px;
    margin-left: -44px;
	
}

form item {
    
    display: block;
    margin-top: 10px;
    margin-bottom: 40px;
    overflow: visible;
    
}
form item input[type="text"],form item input[type="password"]{
     text-align: center;
    background-color: rgba(255, 255, 255, 0) !important;
    font-size: 1.1em;
}

form item input[type="submit"]{
    margin-top: 24px;
    min-width: 80px;
}

.registration, .login, .forgot  {
  
    display: none;
    width: 255px;
    min-height: 200px;
    padding:13px;
    font-weight: 500;
    border: 1px solid #808080;
    background-color: rgba(255, 255, 255, 0.45);
    text-decoration: none;
    vertical-align: middle; 
    text-align: center; 
}

.login .problem{
    
    text-align: center;
    padding-top: 2px;
    margin-top: 18px;
    font-size: 1.1em;
    margin-bottom: 6px;
    cursor: pointer;
}
           
.login .problem label{
  display: block;
  margin-top: 5px;
  color: #000000;
  cursor: pointer;
}

.login .problem #check1  {
  display: block;
  width: 16px;
  height: 16px;
  margin-left: 23px;
  margin-right: -21px;
  cursor: pointer;
  float: left;
}

hand {
    display: block;
    height: 2px;
    width: 200px;
    margin:  -40px 0px 0px 255px;
    padding-top: 20px;
    font-size: 14px;
    color: #ff6c00;
    overflow: visible;
	text-align: left;
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
   display:inline-block!important;
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
  padding: 0 0 0 24px;
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



@media screen and (max-width: 1600px){

#prompt{
   top: 16%;
   
}



    
}
    
    
@media screen and (max-width: 1150px){
    
    
#prompt{
   display: none;
   
} 
}

@media screen and (max-width: 1020px){
    
 header{
    background-color: rgb(255, 255, 255) !important;
}    
    
body{
    overflow: hidden;
    background: none;
    background-color: #ffffff;
    
}   
    

     #mobile_log{
        display: block;
        width: 90%;
        margin: 20% auto;
        padding: 30px;
    }
    
    #mobile_log item{
        display: block;
        width: 100%;
        text-align: center;
        margin-bottom: 60px;
    }
    
    #mobile_log .problem{
  
    padding-top: 2px;
    padding-left: 10px;
    margin-top: 18px;
    font-size: 1.1em;
    margin-bottom: -1px;
    }
    
#mobile_log input[type="checkbox"]  {

  width: 20px;
  height: 20px;
  margin-left: 4px;
  margin-right: 8px;
  cursor: pointer;
   
 }
 
 hand {
    display: block;
    height: 2px;
    padding-top: 10px;
    font-size: 14px;
    color: #ff6c00;
    overflow: visible;
	text-align: right;
	margin:0px;
	float: right;
	
}
 
.loading{
	text-align: center;
} 
    
    #mobile_log input[type="text"],  #mobile_log input[type="password"]{
        width: 100%;
        font-size: 2em;
      
    }
    
    #mobile_log input[type="submit"]{
        width: 40%;
        padding: 20px;
        margin-top: 60px;
        font-size: 1.6em;
    }

}


                         
</style>
<link rel="stylesheet" href="../../../../static/COMMON/COMMON.CSS">
</head>
	
<body>
 <img class="d_none"src="http://localhost/static/img/ring-alt.svg">                
<mob>
            <header class="absolute">
                <l_menu><img src="../../../../static/img/menu.svg"></l_menu>
                <tite_mob>Login</tite_mob>
                <r_menu><img src="../../../../static/img/doots.svg"></r_menu>
            </header>
            
            <search><magnifire><img src="../../../../static/img/magnifire.svg">
			</magnifire><input type="text" placeholder="<?php echo $static['tools']['SEARCH']; ?>"></search>
        </mob>
   
        
<header class="no_mob absolute ">
       
        <tite class="absolute no_mob"><a href="/">CLOSART</a></tite>
    
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


<div id="prompt" class="no_mob"><?php echo $static['content']['WELCOME_MESSAGE']; ?></div>

<div id="user_board" class="no_mob">
<div class="dave_board" fade="off">
<div id="login" class="dave"><?php echo $static['content']['ENTER']; ?></div>
<div id="registration"  class="dave"><?php echo $static['content']['REGISTRATION']; ?></div>
<div id="forgot"  class="dave"><?php echo $static['content']['FORGOT']; ?></div>
</div>
<div class="r_active">
</div>
</div>
  

  
   <div class="registration" >
       
    <form val="false" class="reg" what="registration" method="post" >
        
        <item>
    <input type="text" name="login" value="" val="false" maxlength="30" placeholder="<?php echo $static['content']['UNIQUE_LOGIN']; ?>"> 
    <hand></hand>
        </item>
        
        <item>
    <input type="text" name="mail" value="" val="false"  maxlength="30" placeholder="<?php echo $static['content']['MAIL']; ?>">
    <hand></hand>
        </item>
        
        <item>
    <input type="password" name="password" value="" val="false"  maxlength="30" placeholder="<?php echo $static['content']['PASSWORD_ENTER']; ?>">
        <hand></hand>
        </item>
		<item class="radio_item">
		
		<input type="radio" class="radio" id="radio_W" name="sex" value="W" val="true"/>
		<label for="radio_W"><?php echo $static['content']['MAN']; ?></label>
		
		
		<input type="radio" class="radio" id="radio_M" name="sex" value="M" val="true"/>
		<label for="radio_M"><?php echo $static['content']['WOMAN']; ?></label>
		
        </item>
        <item>
    <input type="submit" value="<?php echo $static['buttons']['SIGN_UP']; ?> &#8250">
        </item>
  </form> 
   </div>
   
   
   <div class="login">
    <form val="false"  what="login" method="post" >
        <item> 
    <input type="text" name="login" value="" val="false"  maxlength="30" placeholder="<?php echo $static['content']['LOGIN']; ?>"> 
    <hand></hand>
        </item>
         <item>
    <input type="password" name="password" value="" val="false"  maxlength="30" placeholder="&#8226&#8226&#8226&#8226&#8226&#8226&#8226&#8226&#8226">
    <hand></hand>
        </item>
         <item class="problem">
		 <input id="check1" type="checkbox" name="keep_in" value="on">
         <label for="check1"><?php echo $static['content']['KEEP_IN']; ?></label>
        </item>
         <item>
       <input type="submit" value="<?php echo $static['buttons']['ENTER']; ?> &#8250">
        </item>
  </form>  
   </div>
   
   
   <div class="forgot">
  
    <form val="false" what="forgot" method="post" >
         <item>
    <input type="text" name="login" value="" val="false"  maxlength="30" placeholder="<?php echo $static['content']['LOGIN']; ?>"> 
    <hand></hand>
        </item>
         <item>
    <input type="text" name="mail" value="" val="false"  maxlength="30" placeholder="<?php echo $static['content']['MAIL']; ?>">
    <hand></hand>
        </item>
         <item>
    <input type="submit" value="<?php echo $static['buttons']['REESTABLISH']; ?> &#8250">
        </item>
  </form>  
   </div>
    
    <board id="mobile_log" class="on_mob">
    
        <form val="false"  what="login" method="post" >
        <item> 
       <input type="text" name="login" value="" val="false"  maxlength="30" placeholder="<?php echo $static['content']['LOGIN']; ?>"> 
      <hand></hand>
        </item>
         <item>
        <input type="password" name="password" value="" val="false"  maxlength="30"  placeholder="&#8226&#8226&#8226&#8226&#8226&#8226&#8226&#8226&#8226">
       <hand></hand>
        </item>
         <item class="problem">
       <input id="check1" type="checkbox" name="keep_me" value="on">
       <span><?php echo $static['content']['KEEP_IN']; ?></span>
        </item>
         <item>
       <input type="submit" value="<?php echo $static['buttons']['ENTER']; ?> &#8250">
        </item>
              
  </form>  
    </board>
    
    

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
  <script src="../../../../static/COMMON/COMMON.js"></script>
        
  <script type="text/javascript">

$(document).ready(function(){
  
    
 /********CLICK ABSOLUTE ASSISTANT *********/
    
    $('cart').on('click', function(){ 


$('dilogs').animate({left:'10%'}, 130);
$('#prompt').animate({left:'40%'}, 130);
$('#user_board').animate({left:'40%'}, 130);

    
    
$('curtain').one('click', function(){
$('#prompt').animate({left:'50%'}, 130);
$('#user_board').animate({left:'50%'}, 130);


});
}); 
    

/**********Init***********/

    
  setTimeout(function(){
      $('#user_board').fadeIn(200).animate({top:'38%', opacity:'1'},475, function(){
      $('body').css('overflow-y','auto');
  });},50);
  $('#prompt').animate({bottom:'68%', opacity:'1'}, 440);
  
  
  
/***********DAVE Slide***********/    
    
    $('.dave').click(function(event){
      var $this = $(this);
      $('.dave_active').removeClass('dave_active');
      $this.addClass('dave_active');  
      var $parent = $this.parent();
        
    if ($parent.attr('fade')== 'off'){
   
      $parent.animate({marginLeft:'-=220px' },200).attr('fade','on');
      var app = $('.'+$this.attr('id'));
      $('.dave').css('border','none').css('backgroundColor', 'transparent');
      $('.dave').animate({paddingRight: '10px'} ,150);
      $('.r_active').children().css('display','none').end().append(app);
      setTimeout(function(){app.fadeIn()}, 200);
        
   } else {
      var app = $('.' + $this.attr('id'));
      $('.r_active').children().css('display','none').end().append(app);
      app.fadeIn();
      }
        
     
   }); 
  
 
/************Input validator*************/    
    
  $('input').blur(inputValidate);
 

function inputValidate(){
    var $inpt = $(this);
  
    if ($inpt.attr('type')== 'text'){
      
     if ($inpt.attr('name')== 'login'){
      var reg = /^[a-zA-Z0-9]{3,30}$/;
      if (reg.test($inpt.val())){
       if ($inpt.parent().hasClass('reg')){
        $inpt.next('hand').text('').end().attr('val','true');
        }else {
          $inpt.next('hand').text('').end().attr('val','true');
          }
      }else {
        $inpt.next('hand').text('< <?php echo $static['js']['ONLY_LATIN_DIGITAL']; ?>').end().attr('val','false');
      }
    }
      
       if ($inpt.attr('name')== 'mail'){
      var reg = /^([a-z0-9_\.-]+)@([a-z0-9_\.-]+)\.([a-z\.]{2,6})$/;
      if (reg.test($inpt.val())){
        
        if ($inpt.parent().hasClass('reg')){
        $inpt.next('hand').text('').end().attr('val','true');
        }else {
          $inpt.next('hand').text('').end().attr('val','true');
          }     
      }else {
        $inpt.next('hand').text('< <?php echo $static['js']['BAD_MAIL']; ?>').end().attr('val','false');
      }
    }
   }  
    
    if ($inpt.attr('type')== 'password'){
      var reg = /^[a-zA-Z0-9_-]{6,30}$/;
      if (reg.test($inpt.val())){
         if ($inpt.parent().hasClass('reg')){
        $inpt.next('hand').text('').end().attr('val','true');
        }else {
          $inpt.next('hand').text('').end().attr('val','true');
        }
      }else {
        $inpt.next('hand').text('< <?php echo $static['js']['BAD_PASSWORD']; ?>').end().attr('val','false');
        }
    }  
     if ($inpt.val().length <=0){
     $inpt.next().text('< <?php echo $static['js']['REQUIRED_FIELD']; ?>').end().attr('val','false');
      return false;
    }   
    if ($inpt.val().length < 3 ){
      $inpt.next('hand').text('< <?php echo $static['js']['TO_SHOTR']; ?>').end().attr('val','false');
      return false;
      }  
     if ($inpt.val().length > 30 ){
      $inpt.next('hand').text('< <?php echo $static['js']['TO_LONG']; ?>').end().attr('val','false');
      return false;
      } 
     if ($inpt.val()*20){
      $inpt.next('hand').text('< <?php echo $static['js']['ONLY_DIGITAL']; ?>').end().attr('val','false');
      return false;
      }   
    }
  
 
/************Submit Form LOG REG FORGOT*************/  

$('form').submit(submitForm);
    
function submitForm (event){
    $this = $(this);
    $this.find('input').trigger('blur'); 
    
	event.preventDefault();
	$parent = $this.parent();

   var flag = 0; 
 
     $this.find('[val="false"]').each(function(){
     $that = $(this);
     flag++;
     $that.parent().parent().attr('val','false');
         
    if ($that.val().length <=0){
       $that.next('hand').text('< <?php echo $static['js']['REQUIRED_FIELD']; ?>');
    }    
         if($that.attr('id') == 'check1' || $that.hasClass('radio_item') || $that.attr('id') == 'radio_W' || $that.attr('id') == 'radio_M'){
            flag--; 
         }    
  }); 
   

  if (flag == 0){
    $this.attr('val', 'true');
  }

  if ($this.attr('val')== 'true'){  

      var data = $this.serialize();
       data += '&what='+$this.attr('what'); 
 
			$.ajax({
               url:  window.location.href,
			   type: 'POST',
			   dataType: 'json', 
			   data: data, 
               cache: false,
		       beforeSend: function(data) {
		            Assistant.goLoad( $parent, 'on', 1000);
		          },
		       success: function(data){ 
		       		if (data['error']){ 
                       Assistant.greenBoard('<div>'+data['error']+'</div>', 'red');
		       		} else { 
                      Assistant.greenBoard('<div>'+data['message']+'</div>', 'green');
					  if (data['flag'] == 'login' || data['flag'] == 'registration'){
						  Assistant.setTimeout( function(){window.location.href = '/profile/news'}, 300);
						  
					  }
                    }
		         },
		       error: function (xhr, ajaxOptions, thrownError) { 
		              Assistant.greenBoard('<div><?php echo $common['js']['BACKEND_MISTAKE']; ?></div>', 'red');
		         },
		       complete: function(data) {
		              Assistant.goLoad( $parent, 'off', 1000);
		         }});  
       
  }
   
}
    

  
});
      
  </script>

  </body>
  
</html>