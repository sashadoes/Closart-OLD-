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
        <title><?php echo $static['code']; ?></title>

<style type="text/css">

content {
    display: block;
    width: 800px;
    margin: auto;
    margin-top: 150px;
   
}

.error_board {  
   
    margin: auto;
    border-radius: 10px;
    overflow: hidden;

}

.error_board p{
    margin: 12px;
    color: black;
    text-align: center;
    font-size: 48px;
}

.error_board .actions{
   text-align: center
}

.error_board button{
    margin: 10px;
    
    
}

.message code{
	margin-right: 10px;
	font-size: 1.1em;
}

    
@media screen and (max-width: 1020px){
    
    footer{
        margin-top: 200px;
    }
    
}    


</style>
<link rel="stylesheet" href="<?php echo 'http://'.$_SERVER['SERVER_NAME']; ?>/static/COMMON/COMMON.CSS">
</head>


<body>
<mob>
         <header class="absolute">
                <l_menu><img src="<?php echo 'http://'.$_SERVER['SERVER_NAME']; ?>/static/img/menu.svg"></l_menu>
                <tite_mob>Error</tite_mob>
                <r_menu><img src="<?php echo 'http://'.$_SERVER['SERVER_NAME']; ?>/static/img/doots.svg"></r_menu>
            </header>
            
            <search><magnifire><img src="<?php echo 'http://'.$_SERVER['SERVER_NAME']; ?>/static/img/magnifire.svg">
			</magnifire><input type="text" placeholder="<?php echo $common['tools']['SEARCH']; ?>"></search>
        </mob>
   
        
<header class="no_mob absolute ">
       
        <tite class="absolute no_mob"><a href="/news">CLOSART</a></tite>
        
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

<div class="error_board">
  <div class="message">
    <p><?php echo $static['mess']; ?></p>
  </div>
  
  <div class="actions">
        <a href="/"> <button><?php echo $static['buttons']['MAIN']; ?></button></a>
        <a id="back"> <button><?php echo $static['buttons']['BACK']; ?></button> </a>
  </div>
</div>

</content>

<footer>
            <credits>
                <item><img src="<?php echo 'http://'.$_SERVER['SERVER_NAME']; ?>/static/img/visa.png"></item>
                <item><img src="<?php echo 'http://'.$_SERVER['SERVER_NAME']; ?>/static/img/mastercard.png"></item>
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
                 
            <item class="mob_cart active" board_id="mob_cart"><img  src="<?php echo 'http://'.$_SERVER['SERVER_NAME']; ?>/static/img/bag.svg"><amount><?php echo $assistant['cart_count']; ?></amount></item>
            <item class="mob_setts " board_id="mob_setts"><img  src="<?php echo 'http://'.$_SERVER['SERVER_NAME']; ?>/static/img/settings.svg"></item>
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
   <script src="<?php echo 'http://'.$_SERVER['SERVER_NAME']; ?>/library/js/jquery.slimscroll.min.js"></script>
   <script src="<?php echo 'http://'.$_SERVER['SERVER_NAME']; ?>/static/COMMON/COMMON.js"></script>
        
  <script type="text/javascript">

$(document).ready(function(){
	
/**********Init***********/

  $('#back').on('click', function(){
     window.history.go(-1);
  })
	

});
      
  </script>

  </body>
  
</html>