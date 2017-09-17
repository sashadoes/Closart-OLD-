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
     background-image: url(../../../../static/img/info/policy/first_slider.jpg); 
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

        
    <logo>Политика конфиденциальности <br>  и  общие положения.</logo>
  
</board>
    

<board class="slider_2">  
    <text>
    <p>
           Данный ресур является e-commerce платформой. Будучи расположенными на территорри Украины мы ведем нашу деятельность соблюдая законы Украины, а именно - законы о дистанционной торговле, внутренней торговле и электронной коммерции. Ниже прдставленна политика взаимотношений пользователя с сайтом.
    </p>
    
    
    
     <p>
            Эта политика конфиденциальности описывает, как мы используем личную информацию, собранную на этом веб-сайте домменного имени closart.co (далее просто closart). Прочтите эту политику конфиденциальности перед использованием closart и отправки любой личной информации. Используя closart, вы принимаете методы, описанные в этой политике конфиденциальности. Эти методы могут быть изменены, но любые изменения будут опубликованы и будут применяться только к действиям и информации в будущем, а не ретроактивно. Вам рекомендуется просматривать политику конфиденциальности, когда вы посещаете сайт, чтобы отслеживать изменения политики и убедиться, что вы понимаете, как будет использоваться любая предоставленная вами личная информация.
    </p>
    
     <p>
            Примечание. Условия конфиденциальности, изложенные в этой политике конфиденциальности, относятся только к closart. Если вы ссылаетесь на другие веб-сайты, ознакомьтесь с политиками конфиденциальности, опубликованными на этих веб-сайтах.
    </p>
    
    
    <h2>Сбор информации</h2>
    <p>
            
            Мы собираем личную информацию, такую как имена, адреса электронной почты и т.д., при добровольном предоставлении их нашими посетителями. Эта информация используется только для корректного выполнения вашего конкретного запроса внутри closart и для того, чтобы подписать вас на нашу имейл рассылку от которой вы мжете откзаться в настройках в личнм кабинете. Также closart собирает различные статистические данные о пользователях которые помогают улучшить наш сервис. 
   
    </p>
        
    <h2>Хранение информации</h2>
    <p>
            
           Мы храним лишь добровольно предоставленную информацию, минимально необходимую для работы нашего сервиса. Такая информация находится в безопастности и не будет передана третьим лица ни при каких обстоятельствах.
   
    </p>
        
    <h2>Технология Cookie / Tracking</h2>
     <p>
            
            Этот сайт может использовать технологию cookie и отслеживания в зависимости от предлагаемых функций. Технология cookie и отслеживания полезна для сбора информации, такой как тип браузера и операционной системы, отслеживание количества посетителей на веб-сайте и понимание того, как посетители используют веб-сайт. Cookies могут также помочь настроить сайт для посетителей. Личная информация не может быть собрана с помощью файлов cookie и другой технологии отслеживания, однако, если вы ранее предоставили личную информацию, cookie могут быть привязаны к такой информации. Совокупная информация о cookie и отслеживании может передаваться третьим сторонам.
    </p>
    
    
    <h2>Распространение информации</h2>
     <p>
            
            Мы можем обмениваться информацией с правительственными учреждениями или другими компаниями, помогающими нам в предотвращении мошенничества или расследовании. Мы можем это сделать, когда: (1) разрешено или требуется по закону; Или (2) попытки защитить или предотвратить фактическое или потенциальное мошенничество или несанкционированные транзакции; Или (3) расследование мошенничества, которое уже имело место. Информация не предоставляется этим компаниям в маркетинговых целях.
    </p>
        
    <h2>Авторские права</h2>
     <p>
        

        Представленные материалы, а также все содержание closart охраняются правами промышленной и интеллектуальной собственности. Содержащиеся здесь информационные материалы, тексты, иллюстрации и рисунки предназначены исключительно для личного и некоммерческого использования и не могут копироваться, изменяться, переноситься, продаваться либо издаваться с какой-либо целью, кроме просмотра, как целиком, так и частями, без письменного соглашения администрации closart.
        
    </p>
     <h2>Приверженность обеспечению безопасности данных</h2>   
     <p>
           
            Ваша личная информация хранится в безопасности. Доступ к этой информации имеют только уполномоченные сотрудники, агенты и подрядчики (которые согласились хранить информацию в безопасности и конфиденциальности). Все электронные письма и информационные бюллетени с этого сайта позволяют вам отказаться от дальнейших рассылок.
    </p>

     <p>
            Если у вас есть какие-либо вопросы, замечания или замечания по поводу нашей политики конфиденциальности, вы можете связаться с нами, используя средства, представленные на этом веб-сайте.
    </p>

     <p>
            Мы оставляем за собой право вносить изменения в эту политику. Любые изменения в данных правилах будут опубликованы.
    
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