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
     background-image: url(../../../../static/img/info/stores/first_slider.jpg); 
     background-repeat: no-repeat;
     background-size: cover;
     overflow: hidden;
}  
    

    
    
.slider_1  logo {
    display: block ;
    width: 600px;
    margin-left: 25vw;
   
    margin-top: 18vh;
    margin-bottom: 40px;
  
    padding-top: 1000px;

    
}  
    
.slider_1  logo text{
    display: block ;
  
    font-size: 2.7em;
  
    margin-bottom: 40px;
    color: #ffffff;
   
    line-height: 1.2em; 
        
    }
    
.slider_1  logo action{
       display: block ;
 
        
    }    
    
    
    
.slider_1  logo action button{
       background-color: rgba(253, 253, 253, 0.28);
       border: 1px solid white;
       color: #ffffff;
 
        
    }  
    
.slider_1  logo action button:hover{
       background-color: rgb(0, 0, 0);
       
        
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
    
.slider_3 {
        
     display: block;
     overflow: hidden;
     width: 30vw;
     margin-left: 25vw;
     margin-top: 20px;
     opacity: 0;
        
}
    
.slider_3 about{
    
    display: block;
     width: 95%;
    text-align: right;
    margin-bottom: 40px;
    font-size: 0.8em;
    color: #9b9b9b;
    font-style: italic;
}
    
.slider_3 loader{
    display: block;
    width: 100%;

} 
    
.slider_3 thumb{
    display: block;
    width: 1%;
    height: 2px;
    background-color: black;
    opacity: 0;

}    

.slider_3 letter{
        
     display: block;
     padding: 10px 0px;
        
} 
    
    
.slider_3 form{
        
     display: block;
    
        
} 
    
.slider_3 letter item{
        
     display: block;
    
        
} 
    

    
.slider_3 letter .floater input[type="text"]{
        
     display: block;
     float: left;
     height: 30px;
     width: 45%;
     margin-right: 5%;
     margin-bottom: 30px;
     
        
}
    
.slider_3 letter .lefter {
        
     display: block;
     width: 95%;
     text-align: right;
    
    
}
.slider_3 letter .lefter button{
        
    margin-top: 20px;
     
        
}     
    
.slider_3 letter item textarea{
        
    
     width: 100%;
     height: 200px;
     margin-top: 20px;
     padding: 7px;
        
}  
    
.slider_3 .letter_loader{
    
    display: block;
    float: right;
    padding:31px 20px;
} 
    
.slider_3 success_letter{
    display: block;
   margin-top: 200px; 
    color: #4b4b4b;
}    

/**************/ 
    
.slider_4{
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

        
    <logo>
        
        <text> Продавайте с нами. </text>
        <action><button> Отправить заявку </button> </action>

    </logo>
  
</board>
    

<board class="slider_2">  
    <text>
    <p>
          Мы отккрыты для сотрудничества! Если Вы шьёте одежду, пишете картины занимаетесь хендмейдом и у Вас есть товары то приглашаем Вас создать свой персональный интернете магазин на нашей платформе.
    </p>
    
    
    
     <p>
            Наш сервис с подпорой отчестнлстью и простотой в использовании позволит вам расширить свою аудиторию и повысить ваши продажи. Сфокусируйтесь на творчестве пока мы возьмём на себя технические детали . Ниже описаны несколько доводов почему это стоит того.
    </p>
    
   
    
    
    <h2>Это просто</h2>
    <p>
            
         Вам лишь нужно рассказать что вы продаёте все остальное сделает наша команда. Уже через 3 дня у васв оуках будет мощный инструмент онлайн продаж с широкими маркетинговыми возможностями. Управлять магазином по настоящиму просто. В меню администратора вы сможете загружать товары, обрабатывать заказы и при необходимости отвечать на вопросы клиентов. 
   
    </p>
        
    <h2>Сосредоточьтесь на творчестве</h2>
    <p>
            
           Наши менеджеры будут работать на вас 24 час в сутки. Мы берем на себя любые возможные проблемы с клиентами и доставкой. При желании Вы можете полностью передать управление магазином нашим сотрудникам и забыть об наполнении, обработки заказов и общени с покупателями. Профессиональные менеджеры будут вести дело за вас, продвигая Ваш продукт пока вы занимаетесь творчеством и лишь сообщаая Вам о поступивших новых заказах.
   
    </p>
        
    <h2>Мы работаем за ваш успех</h2>
     <p>
            
            Мы не берём денег за создание магазина как другие платформы, мы получаем лишь комиссионные в размерее 15% за успешную продажу. Разворачивая агазин на нашей платформе такой подход позвволяет вам не рисковать и не влаживать деньги до конкретных результатов. 
    </p>
    
    
    <h2>Мы ищем именно вас</h2>
     <p>
            
            Клозарт активно продвигает молодых дизайнеров. Наш бизнес построен на талантливых людях. Мы заинтересованы в Вашем успехе и будем влаживать собственные средства рекламируя Вас. 
    </p>
        
    <h2>Мы ориентированы зарубеж </h2>
     <p>
        

        Мы нацелены вывезти отечественныЙ дизайн зарубеж. На сегодняшний день тенденции в моде и дизайне не имеют четких форм, мировой рынок все чаще обращает внимание на то что создают в СНГ. Это и не удивительно, ведь отечественные дизайнеры нашли свой стиль, создают неповторимые изделия - удобные и качественные. В связи с этим мы хотим помочь Вам выйти на европейский рынок обрести мировую узнаваемость.
        
    </p>
  


     <p>
           Если наш план вам показалась интересным призывам выйти на связь спомощью формы ниже:
    
    </p>

        
    </text>       
    
    
</board>
    

    

    
<board class="slider_3"> 
    <about>
        <static_s>( Форму отправили:</static_s>
        <dynamic_s><?php echo $dynamic['letters'] ?></dynamic_s>
         <static_s>раз )</static_s>
    </about>
    <loader>
        <thumb></thumb>
    </loader>
    <letter>
        <form what="store_deal_letter" method="post">
            
            <item class="floater">
                <input type="text" name="name" placeholder="Полное имя"  data-rule-valid='[{"key":"regexp","value":"^[а-яА-ЯёЁa-zA-Z\\s]{3,30}$"}]' style="width:94%">
                
            </item>
            
            <item class="floater">
                <input type="text" name="mail" placeholder="Имейл" data-rule-valid='[{"key":"regexp","value":"^([a-z0-9_\\.-]+)@([a-z0-9_\\.-]+)\\.([a-z\\.]{2,6})$"}]'>
                <input type="text" id="phone" name="phone" placeholder="Телефон" data-rule-valid='[{"key":"regexp","value":"(?=.{19,19})"}]'>
            </item>
            
            <item class="floater">
                <input type="text" name="social" placeholder="Ссылка на Вас в соц. сетях">
                <input type="text"  name="photo" placeholder="Ссылка на фото Ваших изделий">
            </item>
            
            <item class="lefter">
                <textarea name="message" placeholder="Рассскажите нам о себе и о том что бы Вы хотели продавать..." data-rule-valid='[{"key":"regexp","value":"(?=.{3,50000})"}]'></textarea>
               
            </item>
            
            <item class="lefter">
                 <button id="send_letter">Отправить</button>
            </item>
            
           
        </form>
    </letter>
    
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
    

        
        
        $('.slider_1 logo').animate({ paddingTop: '0px' }, 500, function(){
            $('.slider_2 text').animate({ opacity: '1' }, 600);
            $('.slider_3').animate({ opacity: '1' }, 600);
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
    
    
    
    /******.slider_1 action button*******/

    
    $('.slider_1 action button').on('click', function(){
        
        $('body').animate({ scrollTop: '3000px' }, 500);
        
    });
    
/****** phone mask *****/
    
$("#phone").on('focus', function(){
$(this).removeClass('UNACCEPTABLE');
});  
$("#phone").mask("+999 (99) 999 99 99",{placeholder:" "}); 
    
    
    /***********send_letter***********/
    
    
    
    $('#send_letter').on('click', function(e){
         e.preventDefault();
        
         $this = $(this);
     
        if($this.hasClass('disabled')){
            return false;
        }
     
        var $form = $this.closest('form');
        
       $form.lemongrab();
  
       if(!$form.isValid()){ 
           return false; 
       }
    
  
       var data = $form.serialize();
       var what = $form.attr('what'); 
       data += '&what='+what; 
        
        
                $.ajax({
                                url:  window.location.href,
                                type: 'POST',
                                dataType: 'json', 
                                data: data, 
                                cache: false,
                                beforeSend: function(data) {
                                    $this.addClass('disabled');
                                    var loader = '<img class="letter_loader" src="/static/img/ajax_loader.gif">';
                                    Assistant.switchContent( $this.parent() ,loader); 
                                    
                                    $this.closest('letter').animate({opacity: '0.4'},100);
                                    

                                    
                                },
                                success: function(data){ 
                                    if (data['error']){ 
                                        Assistant.greenBoard('<div>'+data['error']+'</div>', 'red');
                                        setTimeout(function(){
                                            
                                          Assistant.switchContent( $this.parent() ,'back'); 
                                          $this.closest('letter').animate({opacity: '1'},100);  
                                            
                                        }, 400);
                                        
                                        
		       		                 } else { 
                                         Assistant.greenBoard('<div>'+data['message']+'</div>', 'green');
                                         
                                          $('thumb').animate({opacity: '1', width:'100%'}, 600);   
                                          
                                         var height = $this.closest('letter').height();
                                         $this.closest('letter').css('height', height+'px');
                                          $this.closest('letter').animate({opacity: '0'},300, function(){
                                              
                                              var element = '<success_letter>Письмо оправлено! <br> Ожидайте, мы выйдем с Вами на связь.<br>Хорошего дня :)</success_letter>';
                                              $(this).html(element).animate({opacity: '1'}, 400).find('success_letter').animate({marginTop: '10px'}, 400);
                                              
                                              
                                          }); 
                                         var amount = Number($('.slider_3 about dynamic_s').html());
                                    
                                         $('.slider_3 about dynamic_s').html(++amount);
                                         
                                     }
                                },
                                error: function (xhr, ajaxOptions, thrownError) { 
                                    Assistant.greenBoard('<div><?php echo $common['js']['BACKEND_MISTAKE']; ?></div>', 'red');
                                },
                                complete: function(data) {
                                    setTimeout(function(){ $this.removeClass('disabled');}, 1000);  
                                      
                                }
                            });      
        
   

});
    
});    
      
  </script>

  </body>
  
</html>