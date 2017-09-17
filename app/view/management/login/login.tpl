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
content{
    display: block;
    width: 70%;
    margin: auto;
    margin-top: 150px;
   
}

content board {
    display: table;
    margin: 40px auto;
    padding: 30px;
    border: 1px solid #a5a5a5;
    
    text-align: center;
}

content board welcome{
    display: block;
    margin-bottom: 30px;
    font-size: 1.5em;
   
}

content board input[type="password"]{
    width: 100%;
    margin: 10px 0px;
    margin-bottom: 30px;
    text-align: center;
    font-size: 1.2em;
}

content board input[type="submit"]{
    min-width: 100px;
    
}

menu .exit{
	font-weight:100;
	color: rgb(242, 93, 0);
}

@media screen and (max-width: 1000px) {
    
content board {
   
    margin: 80px auto;
    width: 90%;
   
}

content board welcome{

    margin-top: 10px;
    margin-bottom: 40px;
}    
    
content board input[type="password"]{
        
    margin-bottom: 50px;
        
    }  

content board input[type="submit"]{
    min-width: 50%;
    
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
			</magnifire><input type="text" placeholder="<?php echo $static['tools']['SEARCH']; ?>"></search>
        </mob>
   
        
<header class="no_mob absolute ">
       
        <tite class="absolute no_mob"><a href="/">CLOSART</a> / <a>MANAGEMENT</a></tite>
        
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

<board id="log" class="">
    <form class="login" what="login" method="post">
    <welcome><?php echo $static['content']['WELCOME_AGAIN']; ?></welcome>
     <input type="password" name="password" data-rule-valid='[{"key":"regexp","value":"^[a-zA-Z0-9_-]{6,30}$"}]' placeholder="<?php echo $static['content']['SET_PASSWORD']; ?>">
     <input type="submit" value="<?php echo $static['buttons']['ENTER']; ?> &#8250">            
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
        
<tite class=""><a href="/">CLOSART</a></tite>        
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
  <script src="../../../../library/js/lemongrab/lemongrab.js"></script>
  <script src="../../../../static/COMMON/COMMON.js"></script>
  
        
  <script type="text/javascript">

$(document).ready(function(){
/**********AJAX log_in ***********/      
    
$('.login').on('submit', function(event){
    
    $this = $(this); 
    event.preventDefault();
	$parent = $this.parent();
    
    $this.lemongrab();
    
    if($this.isValid()){

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
                                        Assistant.setTimeout( function(){window.location.reload();}, 1000);
                                     }				     
                },
                error: function (xhr, ajaxOptions, thrownError) { 
		               Assistant.greenBoard('<div><?php echo $common['js']['BACKEND_MISTAKE']; ?></div>', 'red');
                },
                complete: function(data) {
		               Assistant.goLoad( $parent, 'off', 1000);   
		         }}); 
        
    }
   
});     
	

/*******log_out*********/
    
    $('.log_out').on('click', function(){
        location.href = '/';
    });
        

});
      
  </script>

  </body>
  
</html>