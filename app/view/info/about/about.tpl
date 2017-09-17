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
}
    
    
.slider_1{
     display: block;
     position: relative;
     height: 60vh;
     padding-top: 150px;
     background-image: url(../../../../static/img/info/about/first_slider.jpg); 
     background-repeat: no-repeat;
     background-size: cover;
     overflow: hidden;
}  
    

    
    
.slider_1  logo{
    display: block ;
    width: 600px;
    margin-left: 25vw;
    font-size: 2.7em;
    margin-top: 18vh;
    margin-bottom: 40px;
    color: #ffffff;
    padding-top: 1000px;
    line-height: 1.2em;
    
}  
    
 
/**************/    
    
.slider_2{
      display: block;
      overflow: hidden;
      margin-top: 50px;
}
    
.slider_2  text{
      display: block;
      width: 30vw;
      margin-left: 25vw;
     
      opacity: 0;
   
 
}
    
.slider_2  text h2{
      display: block;
     
      margin-top: 30px;
      margin-bottom: 10px;
        font-size: 1.2em;
 
}    
    
.slider_2 text p{
      display: block;
      margin-bottom: 30px;
    
     color: #505050;
     line-height: 1.3em;
     text-align: justify;
     text-indent: 1.6em;
     font-size: 1em;    
     
}
    

/**************/ 
    
.slider_3{
     display: block;
     overflow: hidden;
     width: 20vw;
     margin-left: 25vw;
     margin-top: 50px;
     
     margin-bottom: 100px;
    
     border-top: 1px solid #aaaaaa;
}  
    
@media screen and (max-width: 1600px) {
        
.slider_1 logo{
  
    margin-top: 10vh;
    
    
} 
    
@media screen and (max-width: 1500px) {
        
.slider_1 logo{
  
    margin-top: 4vh;
 
    
}   
    
@media screen and (max-width: 1100px) {
        
.slider_1 logo{
  
    margin-top: 1px;

    
}     
    
@media screen and (max-width: 1020px) {    

    
 header{
    background-color: rgb(255, 255, 255) !important;
}    
    
     
.slider_1{
    
     height: 30vh;

}
    
   
.slider_1  logo{
    display: block ;
    width: 90%;
 
    font-size: 2.2em;
    margin-left: 10vw;
    margin-bottom: 40px;
    color: aliceblue;

    line-height: 1.2em;
    
}
    
.slider_2  text{
      display: block;
      width: 80%;
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
    
<board class="slider_1 paralax" data-speed="5">    

        
    <logo>Открытое сообщество дизайнеров <br>  и современный онлайн маркет <br> в одном лице.</logo>
  
</board>
    

<board class="slider_2">    

        <text>
             <p>   
                 - Наш сервис специализируется на продажах изделий искусства и модной одежды. Разрабатывая CLOSART, мы представляли магазин в котором покупателям будет удобно - покупать, а продавцам - продавать. Нашими главными приймуществами являются: удобстово пользования, простота в навигации, качество товаров и безопастность покупок.
            </p> 

            <p> 
                В современном мире так много хороших и плохих вещей, а когда дело касается покупок в интернете ситуация начинает обостряться еще сильнее и приходится доверять только проверенным брендам. Но не только бренды с широкой адиторией качественные и красивые. Новые дизайнеры в Украине и России появляются каждый день и заслуживают внимания. Помимо знаменитых имен CLOSART постоянно привлекает все больше новых дизайнеров, которые делают качественные изделия и чувствуют тенденции, поэтому Вы всегда сможете увидеть что-то свежее и оригинальное у нас в каталоге.
            </p>

            
            <p>
                Сейчас мы стартап с большими амбициями, но мы уверены, что если упорно работать, то можно многого добиться! Мы хотим стать местом где дизайнеры смогут реализовываться и находить свою аудиторию, а покупатели всегда будут довольны качественными и красивыми вещами. Именно поэтому мы лично поддерживаем контакт с каждым дизайнером чьи изделия мы продаем. 
            </p>

            <p>
              Ежедневно наша команда трудится над повышеним качества работы и предоставляемых услуг. Нашей целью является создать самый удобный и дружелюбный сервис для продажи и покупки дизайнерских вещей, предметов интерьера и арта.
            </p>
    </text>
    
</board>
    

    

    
<board class="slider_3">     
    
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
    
    /******init***/
    

        
        
        $('.slider_1 logo').animate({ paddingTop: '0px' }, 500, function(){
            $('.slider_2 text').animate({ opacity: '1' }, 600);
        });
        
        
   
 
 /****paralax*****/
    
     $('.paralax').each(function(){
        var $bgobj = $(this); // создаем объект
        $(window).scroll(function() {
            var yPos = - ( $(window).scrollTop() / 1.5); // вычисляем коэффициент 
            
            // Присваиваем значение background-position
            var coords = 'center '+ yPos + 'px';
            // Создаем эффект Parallax Scrolling
            
            if( $(window).width() > 1500){
                 $bgobj.css({ backgroundPosition: coords });
                
            }
           
        });
    });
       

});
      
  </script>

  </body>
  
</html>