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
        <title>Closart</title>

<style type="text/css">
/******special*********/

content{
    display: block;
    margin: auto;
    margin-top: 150px;
    margin-left: 340px;
    margin-right: 40px;
}

content item{
    display: block;
    width: 37vw;
    margin-bottom: 30px;
    margin-right: 30px;
    cursor: pointer;
   /* box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);*/
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);

}

content item photo{
    display: block;
    margin-bottom: -5px;
}

content item photo img{
   width: 100%;
}


content item stats{
    display: block;
    padding: 13px;
    border-left: 1px solid rgba(0, 0, 0, 0.08);
    background-color: #ffffff;
    text-align: center;
}

content item stats by{
  
  margin: 6px 0px;
  margin-top: 2px;
  margin-bottom: 4px;
  font-size: 1.35em;
  font-family: 'Bitter' !important;
  font-weight: bold;
  border-bottom: 1px solid black;
    
}
              
content item stats by:hover{
          
}
            
/*****MOBILE****/            
@media screen and (max-width: 1800px) {
    content item{
        width: 35vw;
    }              
}
    
@media screen and (max-width: 1600px) {
    content item{
        width: 30vw;
    }              
}
    
@media screen and (max-width: 1050px) {


content item{
    width: 100%;
    margin-bottom: 50px;
}

}
                         
</style>
<link rel="stylesheet" href="../../../../static/COMMON/COMMON.CSS">

</head>
	
<body>
                 
<mob>
            <header class="absolute">
                <l_menu><img src="../../../../static/img/menu.svg"></l_menu>
                <tite_mob>Closart</tite_mob>
                <r_menu><img src="../../../../static/img/doots.svg"></r_menu>
            </header>
            
            <search><magnifire><img src="../../../../static/img/magnifire.svg">
			</magnifire><input type="text" placeholder="<?php echo $common['tools']['SEARCH']; ?>"></search>
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

 
   <item> 
        <a>
        <photo>
            <img src="https://pp.vk.me/c836538/v836538428/19271/bh2VBw8DxVU.jpg" alt="">
        </photo>
       </a> 
    <stats>
        <a>
          <by>Loly Pop</by>
        </a>
    </stats>
 </item>
   
 
  <item>
      <a>
          <photo>
              <img src="https://pp.vk.me/c638028/v638028237/17aa0/hgo-jciEErw.jpg" alt="">
          </photo>
      </a>
    <stats>
        <a>
            <by>Andy</by> 
        </a>
    </stats>
 </item>
 
     
 <a>
   <item> 
    <photo>
      <img src="https://pp.vk.me/c627319/v627319832/15f49/sp-FcKfC3OI.jpg" alt="">
    </photo>
    <stats>
        <by>Pivovarova</by>   
    </stats>
 </item>
 </a>   
 
 <a>
  <item>
    <photo>
      <img src="https://pp.vk.me/c625521/v625521832/3f113/Zv7HyZOeIIg.jpg" alt="">
    </photo>
    <stats>
        <by>Ascotaxist</by>   
    </stats>
 </item>
 </a>
     

 <a>
  <item>
    <photo>
      <img src="https://pp.vk.me/c604316/v604316338/32ea5/0jTVzcb6J9I.jpg" alt="">
    </photo>
    <stats>
        <by>Putsider</by>   
    </stats>
 </item>
 </a> 
    
     <a>
  <item>
    <photo>
      <img src=" https://pp.userapi.com/c623830/v623830217/3a7c1/xWlYYtLvnWg.jpg" alt="">
    </photo>
    <stats>
        <by>Skull</by>   
    </stats>
 </item>
 </a>
 
 <a>
  <item>
    <photo>
      <img src="https://pp.userapi.com/c310127/v310127832/1803/5kjuHaAiGHw.jpg" alt="">
    </photo>
    <stats>
        <by>Aice</by>   
    </stats>
 </item>
 </a> 
    
     <a>
  <item>
    <photo>
      <img src="https://pp.userapi.com/c310127/v310127832/17ca/f2G8hbGcNqQ.jpg" alt="">
    </photo>
    <stats>
        <by>Oscaleta</by>   
    </stats>
 </item>
 </a> 
    
<a>
  <item>
    <photo>
      <img src=" https://pp.userapi.com/c625124/v625124088/7ea2/3TgBcaIhuHs.jpg" alt="">
    </photo>
    <stats>
        <by>Sweet 1</by>   
    </stats>
 </item>
 </a> 
  
<a>
  <item>
    <photo>
      <img src="https://pp.userapi.com/c625124/v625124088/7eef/cwSl7N1eJRM.jpg" alt="">
    </photo>
    <stats>
        <by>Sweet 2</by>   
    </stats>
 </item>
 </a>   
 
<a>
  <item>
    <photo>
      <img src="https://pp.userapi.com/c402920/v402920194/3cb2/BJn_lM5bof4.jpg" alt="">
    </photo>
    <stats>
        <by>Psycho 1</by>   
    </stats>
 </item>
 </a> 
    
<a>
  <item>
    <photo>
      <img src="https://pp.userapi.com/c402920/v402920194/3ca2/4Q4i5Wl7_0A.jpg" alt="">
    </photo>
    <stats>
        <by>Psycho 2</by>   
    </stats>
 </item>
 </a>     
    
 
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
  <script src="https://npmcdn.com/masonry-layout@4.0/dist/masonry.pkgd.min.js"></script>
        
  <script type="text/javascript">
  
$(document).ready(function(){
	
/************Menu show***********************/ 

    function menuShow(){
        $('ul .news').addClass('show');   
    }
    menuShow();
    
/**********MASONRY**********/  
    $('content').masonry({
        itemSelector: 'item',
        singleMode: false,
        resizeable: true,
        columnWidth: 2,
        gutter: 0
    });
  
    $( "content img" ).load(function() {
        $('content').masonry();
    });
    
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