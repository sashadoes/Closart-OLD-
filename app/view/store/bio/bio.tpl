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
        <title><?php echo $dynamic['name']; ?></title>

<style type="text/css">
              
/******content******/


content{
    display: block;
    width: 1000px;
    margin: auto;
    margin-top: 112px;
   
}

content board {
    display: block;
}

content section{
    display: block;
}

#bio{
    padding: 40px;
/*    border-top: 1px dotted rgba(0, 0, 0, 0.19);
    border-bottom: 1px dotted rgba(0, 0, 0, 0.19);*/
}

#bio stats {
    display: table;
   
    padding-top: 50px;
    margin-bottom: 10px;
   
}

#bio stats item{
    display: inline-block;
    margin-right: 30px;
    margin-bottom: 30px;
    font-size: 1.2em;
 
}

#bio stats item dynamic_s{
    font-weight: bold;
    margin-left: 6px;
}


#bio .first_letter:first-letter {
    font-family: "Times New Roman", Times, serif; 
    font-size: 3em; 
    color: red;
    font-weight: 100;
   
   }

#bio p{
   
    font-size: 1.1em;
    line-height: 1.6em;
    margin-top: 30px;
    color: #000000;
    font-weight: bold;
    font-family: 'Open Sans', sans-serif;
}


#bio .photo{
    
    width: 300px;
    float: left;
    margin: 42px;
    margin-top: 0px;
    margin-left: 0px;
    margin-bottom: 30px;
    box-shadow: 3px 5px 5.5px rgba(0, 0, 0, 0.5);
}

#bio .photo img{
  width: 100%;
  margin-bottom: -6px;
}

#bio .photo actions {
    
}

#bio .about actions{
    display: block;
    text-align:right;
   
}

#bio .about button{
    margin-right: 20px;
}


/*****MOBILE******/

@media screen and (max-width: 1400px) {
   
content{
    
    width: 900px;
    margin-left: 300px;
  
}
   
}

@media screen and (max-width: 1200px) {
  
content{
    
    width: 780px;
    margin-left: 300px;  
}
     
}

@media screen and (max-width: 1000px){
    
    #bio .photo{
        width: 100%;
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
			</magnifire><input type="text" placeholder="<?php echo $static['tools']['SEARCH']; ?>"></search>
        </mob>
   
        
<header class="no_mob absolute ">
       
        <tite class="absolute no_mob"><a href="/">CLOSART</a> / <a href="/<?php echo $dynamic['url_name']; ?>"><?php echo mb_strtoupper($dynamic['name']); ?></a></tite>
        
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
	  
         <?php echo htmlspecialchars_decode($dynamic['menu']); ?>
		 
      </ul>
   
       <ul class="more">
			
		 <?php echo $layout['menu_more']; ?> 
		
      </ul>
 
 </menu>
    
</absolute>   
   
     
<content>

<board id="bio">
 
     <section class="photo">
         <img src="../../../../files/stores/<?php echo $dynamic['url_name']; ?>/bio_img/bio.jpg" alt="лого главное"> 
     </section>
         
      <section class="about">
          <actions>
             <button>Подписаться</button>
             
          </actions>
          <stats>
              <item>Страна: <dynamic_s> <?php echo $dynamic['country']; ?></dynamic_s></item>
              <item>Год основания: <dynamic_s> <?php echo $dynamic['year']; ?></dynamic_s></item>
              <item>Клиенты: <dynamic_s> <?php echo $dynamic['followers']; ?></dynamic_s></item>
          </stats>

           <p class="first_letter"> <?php echo $dynamic['bio']; ?> </p>
          
         </section>
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
	  
         <?php echo htmlspecialchars_decode($dynamic['menu']); ?> 
		 
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


});
      
  </script>

  </body>
  
</html>