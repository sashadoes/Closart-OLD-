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
        <title>About</title>

<style type="text/css">

/*****special******/
header{
    background-color: rgba(255, 255, 255, 0) !important;
}     
     
    
content {
    display: block;
    margin: auto; 
    margin-top: 150px;
}
    
    

 
/**************/    
    
.slider_1{
       display: block;
       overflow: hidden;

       margin-left: 25vw;  
       margin-top: 50px;
       float: left;
}
    
.slider_1  text{
      display: block;
      margin-right: 100px;
     
     
    
   
 
}
    
.slider_1  text h2{
      display: block;
     
      margin-top: 30px;
      margin-bottom: 10px;
      font-size: 1em;
 
}    
    
.slider_1 text p{
      display: block;
      margin-bottom: 30px;
    
     color: #505050;
     line-height: 1.3em;
     text-align: justify;
   
     font-size: 1em;    
     
}
    
    
.slider_1 stress{
    display: block;
    border-top: 1px solid #656565;
    width: 100px;
}    
/**************/     
    
.slider_2 {
        
     display: block;
     overflow: hidden;

     margin-top: 150px;
     margin-bottom: 150px;
     bottom: 0px;
        
}
    

    
  
    
@media screen and (max-width: 1600px) {
        
}
    
@media screen and (max-width: 1500px) {
        
.slider_1{
       
       float: NONE;
        margin-left: 25vw;     
}
    
.slider_2{
         margin-top: 30px;
         margin-left: 25vw;  
}
}    
    
@media screen and (max-width: 1100px) {
        
.slider_1 logo{
  
    margin-top: 1px;

    
}  
}
    
@media screen and (max-width: 1020px) {    

    
 header{
    background-color: rgb(255, 255, 255) !important;
}    
    
     
.slider_1{
       
       float: NONE;
        margin-left: 20vw;     
}
    
.slider_2{
         margin-top: 30px;
         margin-left: 20vw;  
}
    
   

    
.slider_2  text{
      display: block;
     
      margin-left: 0vw;
     
      padding: 0px 80px;
  
   
      opacity: 0;
}
    
.slider_2 text p{
    
      font-size: 0.8em;

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
    

    

<board class="slider_1">  
    <text>
    <p>
        Украина, Одесса (65034)
    </p>


    <h2>Служба поддержки:</h2>
    <p>
            
       support@closart.co
   
    </p>
        
    <h2>Отдел маркетинга и рекламы:</h2>
    <p>
            
        marketing@closart.co
   
    </p>
        
    <h2>Директор:</h2>
     <p>
            
        direct@closart.co
    </p>
    
        <stress></stress>
    
        
    </text>       
    
    
</board>
    

    

    
<board class="slider_2"> 
   
    <map>
        <img src="https://maps.googleapis.com/maps/api/staticmap?key=AIzaSyAx-HDfzqrblvQCes5IYoJrPnpMqoO-G-8&center=46.47925029036952,30.731957711791996&zoom=14&format=png&maptype=roadmap&style=element:geometry%7Ccolor:0x212121&style=element:labels.icon%7Cvisibility:off&style=element:labels.text.fill%7Ccolor:0x757575&style=element:labels.text.stroke%7Ccolor:0x212121&style=feature:administrative%7Celement:geometry%7Ccolor:0x757575%7Cvisibility:off&style=feature:administrative.country%7Celement:labels.text.fill%7Ccolor:0x9e9e9e&style=feature:administrative.land_parcel%7Cvisibility:off&style=feature:administrative.locality%7Celement:labels.text.fill%7Ccolor:0xbdbdbd&style=feature:poi%7Cvisibility:off&style=feature:poi%7Celement:labels.text.fill%7Ccolor:0x757575&style=feature:poi.park%7Celement:geometry%7Ccolor:0x181818&style=feature:poi.park%7Celement:labels.text.fill%7Ccolor:0x616161&style=feature:poi.park%7Celement:labels.text.stroke%7Ccolor:0x1b1b1b&style=feature:road%7Celement:geometry.fill%7Ccolor:0x2c2c2c&style=feature:road%7Celement:labels.icon%7Cvisibility:off&style=feature:road%7Celement:labels.text.fill%7Ccolor:0x8a8a8a&style=feature:road.arterial%7Celement:geometry%7Ccolor:0x373737&style=feature:road.highway%7Celement:geometry%7Ccolor:0x3c3c3c&style=feature:road.highway.controlled_access%7Celement:geometry%7Ccolor:0x4e4e4e&style=feature:road.local%7Celement:labels.text.fill%7Ccolor:0x616161&style=feature:transit%7Cvisibility:off&style=feature:transit%7Celement:labels.text.fill%7Ccolor:0x757575&style=feature:water%7Celement:geometry%7Ccolor:0x000000&style=feature:water%7Celement:labels.text.fill%7Ccolor:0x3d3d3d&size=680x560" >
    </map>    
    
</board>
    
<board class="slider_4">     
    
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
   <script src="../../../../library/js/phone_validator.js"></script>
   <script src="../../../../library/js/lemongrab/lemongrab.js"></script> 
   <script src="../../../../static/COMMON/COMMON.js"></script>
        
   <script type="text/javascript">

$(document).ready(function(){
    
    /******init***/
    

        
        
     
    
});    
      
  </script>

  </body>
  
</html>