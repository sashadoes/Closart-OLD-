<?php   
$assistant = $params['assistant'];
$static = $params['static'];
$dynamic = $params['dynamic'];

if($assistant['cart_count'] <= 0){
		
	$assistant['cart_layout'] = '<no_items>'.$static['cart']['N0_ITEMS'].'</no_items>';
}

?>

<!DOCTYPE html>
<html>
<head>
        
		<meta charset="utf-8">
        <title>Admin</title>

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
                <tite_mob><?php echo $dynamic['name']; ?></tite_mob>
                <r_menu><img src="../../../../static/img/doots.svg"></r_menu>
            </header>
            
            <search><magnifire><img src="../../../../static/img/magnifire.svg">
			</magnifire><input type="text" placeholder="<?php echo $static['tools']['SEARCH']; ?>"></search>
        </mob>
   
        
<header class="no_mob absolute ">
       
        <tite class="absolute no_mob"><a href="/">CLOSART</a> / <a><?php echo mb_strtoupper($dynamic['name']); ?></a></tite>
        
       <tools class="no_mob">
        <search class="child">
          <input type="text" placeholder="<?php echo $static['tools']['SEARCH_l']; ?>">
            <hints class="d_none">
                <item>Postage</item>
                <item>Pivovarove</item>
                <item>Pop-up</item>
            </hints>
          </search>
          
          <profile class="child"><a href="/profile"><img src="../../../../static/img/user.svg"></a></profile>
          
          <cart class="child"><img  src="../../../../static/img/bag.svg"><amount><?php echo $assistant['cart_count']; ?></amount></cart>
        
          <setts class="child"><img  src="../../../../static/img/settings.svg">
            
          <div id="setts">
              <board>
                <section>
                    <name><?php echo $static['tools']['LANGUAGE']; ?>:</name>
                    <actions>
                        <item class="<?php echo ($assistant['lang'] == 'ru') ? "on" : ""; ?>">RU</item>
						<item class="<?php echo ($assistant['lang'] == 'en') ? "on" : ""; ?>">EN</item>
                    </actions>    
               </section>
                <section>
                    <name><?php echo $static['tools']['CURRENCY']; ?>:</name>
                    <actions>
                        <item class="<?php echo ($assistant['currency'] == 'uah') ? "on" : ""; ?>">UAH</item>
                        <item class="<?php echo ($assistant['currency'] == 'rub') ? "on" : ""; ?>">RUB</item>
                        <item class="<?php echo ($assistant['currency'] == 'usd') ? "on" : ""; ?>">USD</item>
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
			
				<li><a href="/info/about"><?php echo $static['menu_more']['ABOUT']; ?></a></li>
				<li><a href="/info/customers"><?php echo $static['menu_more']['CUSTOMERS']; ?></a></li>
				<li><a href="/info/stores"><?php echo $static['menu_more']['STORES']; ?></a></li>
				<li class="d_none"><a href="/info/payment"><?php echo $static['menu_more']['PAYMENT']; ?></a></li>
				<li class="d_none"><a href="/info/delivery"><?php echo $static['menu_more']['DELIVERY']; ?></a></li>
				<li><a href="/info/policy"><?php echo $static['menu_more']['RULES']; ?></a></li>
				<li><a href="/info/contacts"><?php echo $static['menu_more']['CONTACTS']; ?></a></li>
			
                <li  id="more" class="d_none"><a><?php echo $static['menu']['MORE']; ?> &#9207;</a>
                  <div  class="sub">
                    <ul>
                        <li><a href=""><?php echo $static['menu_more']['PAYMENT']; ?></a></li>
                        <li><a href=""><?php echo $static['menu_more']['DELIVERY']; ?></a></li>
                        <li><a href=""><?php echo $static['menu_more']['RULES']; ?></a></li>
                        <li><a href=""><?php echo $static['menu_more']['CONTACTS']; ?></a></li>
                    </ul>
                </div>
                </li>
            </ul>
       
        
        
    </menu>
    
</absolute>   
   
     
<content>

<board id="log" class="">
        <welcome>C возвращением!</welcome>
    <form>
     <input type="password" name="pass" placeholder="Введите пароль">
     <input type="submit" value="Войти &#8250">            
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

           
		    <?php echo $assistant['cart_layout']; ?>
		   
		   
            <button class="<?php echo ($assistant['cart_count'] > 0) ? "" : "d_none"; ?>"><?php echo $static['buttons']['PROCEED']; ?></button>
         </order>
        </board>  
        
<board id="l_menu" class="d_none on_mob">
        
		<tite class="d_none"><a href="/">CLOSART</a></tite>
        
		<ul class="menu">
          
			<?php echo $dynamic['menu']; ?> 
		  
       </ul>
      
       <ul class="more">
            <li><a href="/info/about"><?php echo $static['menu_more']['ABOUT']; ?></a></li>
            <li><a href="/info/customers"><?php echo $static['menu_more']['CUSTOMERS']; ?></a></li>
		    <li><a href="/info/stores"><?php echo $static['menu_more']['STORES']; ?></a></li>
			<li class="d_none"><a href="/info/payment"><?php echo $static['menu_more']['PAYMENT']; ?></a></li>
			<li class="d_none"><a href="/info/delivery"><?php echo $static['menu_more']['DELIVERY']; ?></a></li>
			<li><a href="/info/policy"><?php echo $static['menu_more']['RULES']; ?></a></li>
			<li><a href="/info/contacts"><?php echo $static['menu_more']['CONTACTS']; ?></a></li>
         </ul>
            
		</board>
		
        
<board id="r_menu" class="d_none on_mob">
                  
        <bar>
                 
            <item class="mob_cart active" board_id="mob_cart"><img  src="../../../../static/img/bag.svg"><amount><?php echo $assistant['cart_count']; ?></amount></item>
            <item class="mob_setts " board_id="mob_setts"><img  src="../../../../static/img/settings.svg"></item>
        </bar> 
             
        <board id="mob_cart" class="">

		<?php echo $assistant['cart_layout']; ?>
	   
	  
         <button class="<?php echo ($assistant['cart_count'] > 0) ? "" : "d_none"; ?>"><?php echo $static['buttons']['PROCEED']; ?></button>
         </order>
        
      </board>
             
            <board id="mob_setts" class="d_none">
             
                 <section>
                    <name><?php echo $static['tools']['LANGUAGE']; ?>:</name>
                    <actions>
                        <item class="<?php echo ($assistant['lang'] == 'ru') ? "on" : ""; ?>">RU</item>
						<item class="<?php echo ($assistant['lang'] == 'en') ? "on" : ""; ?>">EN</item>
                    </actions>    
               </section>
                <section>
                    <name><?php echo $static['tools']['CURRENCY']; ?>:</name>
                    <actions>
                        <item class="<?php echo ($assistant['currency'] == 'uah') ? "on" : ""; ?>">UAH</item>
                        <item class="<?php echo ($assistant['currency'] == 'rub') ? "on" : ""; ?>">RUB</item>
                        <item class="<?php echo ($assistant['currency'] == 'usd') ? "on" : ""; ?>">USD</item>
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


      
/************Menu init***********************/
   
    $('menu').slimScroll({
             position: 'left',
             height: '75%',
             railVisible: true,
             alwaysVisible: false,
             
         }); 
     
    

    

});
      
  </script>

  </body>
  
</html>