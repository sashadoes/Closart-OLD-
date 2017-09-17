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
    width: 1100px;
    margin: auto;
    margin-top: 140px;
   
}

#counter{
    display: block;
    width: 90%;
    margin: 30px auto;
    text-align: center;
}

#counter item{
    display: inline-block;
    margin: 10px;
}

#counter item static_s{
    margin-left: 50px;
    font-size: 1em;
}

#counter item dynamic_s{
     margin-left: 15px;
     font-size: 1.1em;
    font-weight: bold;
}

/*****order*********/

.order{
    display: table; 
    margin: 40px auto;
    width: 100%;
    padding: 30px;
    border: 1px solid #a5a5a5;
}

.order section{
    display: block;
    float: left;
}
.order section item{
    display: block;
    margin: 20px;
}

.order .photo{
     width: 25%;
  
}

.order .photo img{
    width: 100%;
}

.order .about {
    width: 60%;
    
}

.order .about item{
    margin: 16px 20px;
}

.order .about static_s{
    font-weight: bold;
    margin-bottom: 4px;
}



.order .about button{
    margin-right: 10px;
    margin-bottom: 10px;
    padding: 8px 5px;
    font-size: 0.9em;
    font-family: sans-serif;  
}

.order .status{
    width: 15%;
    text-align: center;
    float: right;
    
}

.order .status item{
    margin: 20px 0px;
    margin-right: 20px;
}

.order .status static_d{
    margin: 15px 0px;
    font-size: 1.2em;
}

.order .status .state dynamic_d{
    font-size: 1.4em;
    color: #ff8900;
}

.order .status .price dynamic_d old_price, .order .status .price dynamic_d price{
    display: block;
    margin: 10px 0px;
    font-size: 1.1em;
    font-weight: bold;
    
}

.order .status .price dynamic_d old_price{
    color: #818181;
   text-decoration: line-through;
}


menu .exit{
	font-weight:100;
	color: rgb(242, 93, 0);
}

/*****MOBILE******/

@media screen and (max-width: 1200px) {
  

    
content{
    display: block;
    width: 900px;
    margin: auto;
    margin-top: 238px;
   
}
  
    

.order .on_mob{
    margin-top: 40px;
}   
.order .on_mob static_d{
    margin: 15px 0px;
    font-size: 1.2em;
}

.order .on_mob .state dynamic_d{
    font-size: 1.4em;
    color: #ff8900;
}

.order .on_mob .price dynamic_d old_price, .order .on_mob .price dynamic_d price{
    display: block;
    margin: 10px 0px;
    font-size: 1.1em;
    font-weight: bold;
    
}

.order .on_mob .price dynamic_d old_price{
    color: #818181;
   text-decoration: line-through;
}  
  
}

@media screen and (max-width: 1000px){
    
content{
    display: block;
    width: 600px;
    min-width: 500px;
    margin: auto;
    margin-top: 238px;
   
}
    
    .order .photo{
        width: 30%;
        text-align: center;
    }

.order .about {
    float: right;
    
}
  

}
@media screen and (max-width: 720px){
    
   
    .order{
        padding: 0px;
    }
}
    
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
             <board id="counter">
                 <item>
                     <static_s><?php echo $static['content']['TOTAL_ORNED']; ?>:</static_s><dynamic_s>903$</dynamic_s>
                 </item>
                 <item>
                     <static_s><?php echo $static['content']['TOTAL_PAID']; ?>:</static_s><dynamic_s>843$</dynamic_s>
                 </item>
                 <item>
                     <static_s><?php echo $static['content']['TOTAL_HOLD']; ?>:</static_s><dynamic_s> 50$</dynamic_s>
                 </item>
            </board>
            
        
            </static>
        
        
         <dynamic> 
             <board class="order">
                 
                 <section class="photo">
                     <item>
                     <img src="https://cs7064.vk.me/c604829/v604829720/18c5c/OxaCZX9vltw.jpg">
                     </item>
                     <div class="on_mob">
                         <item class="state">
                             <static_d><?php echo $static['content']['STATUS']; ?>:</static_d>
                             <dynamic_d><?php echo $static['content']['IN_PROCESSING']; ?></dynamic_d>
                         </item>
                         <item class="price">
                             <static_d><?php echo $static['content']['PRICE']; ?>:</static_d>
                             <dynamic_d><price>1.500 uah</price></dynamic_d>
                         </item>
                     </div>
                 </section>
                 
                 <section class="about">                     
                     <item>
                         <static_s><?php echo $static['content']['ORDER_NUMBER']; ?>:</static_s>
                         <dynamic_s>564</dynamic_s>
                     </item>
                     <item>
                         <static_s><?php echo $static['content']['ART']; ?>:</static_s>
                         <dynamic_s>564847kp</dynamic_s>
                     </item>
					 <item>
                         <static_s><?php echo $static['content']['SELLER']; ?>:</static_s>
                         <dynamic_s>Катя пивоварова</dynamic_s>
                     </item>
                     <item>
                         <static_s><?php echo $static['content']['NAME']; ?>:</static_s>
                         <dynamic_s>Блейз</dynamic_s>
                     </item>
					  <item>
                         <static_s><?php echo $static['content']['OPTIONS']; ?>:</static_s>
                         <dynamic_s>Цвет: черный</dynamic_s>
                     </item>
					 <item>
                         <static_s><?php echo $static['content']['DELIVERY']; ?>:</static_s>
                         <dynamic_s>Новая Почта</dynamic_s>
                     </item>
                     <item>
                         <static_s><?php echo $static['content']['DELIVERY_ADDRESS']; ?>:</static_s>
                         <dynamic_s>Украина г Одесса новая почта отделение 15</dynamic_s>
                     </item>
                     <item class="delivery">
                         <static_s><?php echo $static['content']['DELIVERY_DATA']; ?>:</static_s>
                         <dynamic_s>Ожидайте, данные появятся в ближайшем времени</dynamic_s>
                     </item>
                     
                     
                     <item class="actions">
                         <button><?php echo $static['buttons']['PROCEED_ORDER']; ?></button>
                         <button><?php echo $static['buttons']['ADD_DELIVERY_DATA']; ?></button>
                         <button><?php echo $static['buttons']['CANCEL_ORDER']; ?></button>
                     </item>
                     <item class="message">
                         <static_s><?php echo $static['content']['ATTACHED_MESSAGE']; ?>:</static_s>
                         <dynamic_s>Качество просто ужасное, такое невозможно носить, это ужас. ужас ужас адд.</dynamic_s>
                     </item>  
                 </section>
               
                <section class="status no_mob">
                    <item class="state">
                     <static_d><?php echo $static['content']['STATUS']; ?>:</static_d>
                     <dynamic_d><?php echo $static['content']['IN_PROCESSING']; ?></dynamic_d>
                    </item>
                    <item class="price">
                     <static_d><?php echo $static['content']['PRICE']; ?>:</static_d>
                     <dynamic_d><price>1.500 uah</price></dynamic_d>
                    </item>
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
  <script src="../../../../static/COMMON/COMMON.js"></script>
  
        
  <script type="text/javascript">

$(document).ready(function(){

/************Menu show***********************/ 

    function menuShow(){
        $('ul .admin-orders').addClass('show');   
    }
    menuShow();	
    

    

});
      
  </script>

  </body>
  
</html>