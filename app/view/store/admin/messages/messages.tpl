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
    

    
dilogs .new_message:before{
    float: right;
    content: 'new';
    display: table;
    color: rgb(242, 93, 0);
}    
    
no_dilogs{
    display: block;
    text-align: center;
    color: #bfbfbf;
    margin-top: 180px;
    
}   
    
    
               
/************content************/
dilogs{
   display: block;
   position: absolute;  
   width: 20%; 
   left: 20%;
   top: 150px;
   padding: 0px 6px 80px 12px;
   color: #2a2a2a;
  
}

dilogs item{
  display: block;
  height: 110px;
  margin: 5px 0px; 
  padding: 9px;
  background-color: rgba(255, 255, 255, 0.93);
  border: 1px solid rgba(124, 124, 124, 0);
  cursor: pointer;
}

dilogs item:hover{
  border: 1px solid rgba(124, 124, 124, 0.4);
}

dilogs .on{
 border: 1px solid rgba(0, 0, 0, 0.4);
}


dilogs item photo{   
    display: block;
    float: left;
    width: 80px;
    height: 70px;
    margin: 10px;
    overflow: hidden;
}

dilogs item photo div{
    height: 70px;
    width: 200px;
    margin-left: -62px;
    text-align: center;
}

dilogs photo img{
   height: 100%;
}

dilogs item what{
    display: block;
    
    height: 90px;
    padding:10px 0px;
    white-space: nowrap; /* Запрещаем перенос строк */
    overflow: hidden; /* Обрезаем все, что не помещается в область */
    text-overflow: ellipsis;
    font-size: 1em;
}
dilogs item seller{
    
    display: block;
    margin: 10px 0px;
    white-space: nowrap; /* Запрещаем перенос строк */
    overflow: hidden; /* Обрезаем все, что не помещается в область */
    text-overflow: ellipsis;
    font-size: 1.4em;
    
}

/********CHAT******/
    
 

chat{
    display: block;
    position: fixed;
    width: 740px;
    top: 150px;
    bottom: 150px;
    left: 40%;
    padding: 15px;
    padding-top: 20px;
    padding-bottom: 20px;
    background-color: rgba(0, 0, 0, 0.08);
    overflow: scroll;
    overflow-x: hidden;
}

    
chat output{
    display: block;
    width: 100%;
        
}
    
chat output .loading{
    margin-top: 20% !important;    
}    
    
chat output item{
    display: block;
    width: 70%;

}


    
    
    
 /*******formating dialog****/  
    
  
    
chat .from_mess{
  float: left;
  
}
   
chat .to_mess {
 float: right;
  
}

  
chat  item info{
    
    display: block;
     margin: 20px 0px;
}
    
chat .from_mess{
  text-align: left;
  
}    
    
chat .to_mess info{
 display: block;    
 text-align: right;

  
}    

chat  item person{

  font-size: 1.3em;
}


chat  item date{

  margin: 10px;    
  font-size: 0.8em;
  color: #878787;
  font-style: italic;
}

chat  item message{
 
    display: block;
    margin: 4px 36px 4px 20px;  
    padding: 20px;
    border: 1px solid #b7b7b7;
    background-color: rgb(255, 255, 255);
    border-radius: 10px;
    float: inherit;
    font-size: 0.98em;
    line-height: 1.2em;
 
}

.chat_zone .message:after {
  content: '';
  display: block;
  clear: both;
}

    
  /***/  
    
        

chat inpt{
    display: block;
    position: fixed;
    height: 150px;
    width: 732px;
    bottom: 0%;
    left: 40%;
    padding: 10px;
    background-color: rgba(0, 0, 0, 0.08);
}

chat inpt typing{
  display: block;
  height: 100%;
  width: 80%;
  float: left;
}

chat inpt typing textarea{
  height: 130px;
  width: 100%;
  font-size: 1.2em;
  resize: none;
}

chat inpt .actions{
  width: 20%;
  float: left;
}

chat inpt input[type="button"]{
  width: 100px;
}
    
chat prompt{
  display: block;
  margin: 100px auto;    
  text-align: center;
  color: #bfbfbf;    
  font-size: 1.2em;
}   

chat begining{
    display: block;
    text-align: center;
    margin: auto;
    padding: 8px;
    padding-bottom: 24px;
    margin-bottom: 16px;
    border-bottom: 1px solid #c1c1c1;
    color: #c1c1c1;
}

/******Mobile*******/

@media screen and (max-width: 1300px) {
    
content{
        font-size: 16px !important;
    }
    
    
    dilogs{
         left: 16%;
    }
  
    chat{
        width: 720px;
        left: 36%;
        padding: 40px;
        padding-right: 80px;
    }
    chat inpt{
        width: 711px;
        left: 36%;  
    }
    
     footer{
        display: none!important;
    }
    
    chat output item message{
 
     margin: -10px 16px 30px 16px;
    }
   
}

@media screen and (max-width: 1000px){
    
   
    dilogs{
        margin-top: 40px;
        left: 0%;
        width: 30%;
    }
  
    chat {
        margin-top: 40px;
        width: 650px;
         left: 30%;
       
    }
    
     chat inpt{
         margin-top: 40px;
        width: 650px;
          left: 30%;
    }
    chat date{

     margin: 5px 36px 5px 6px;
}
   
    
  dilogs item seller{
    
    margin:0px;
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

<?php if(!$dynamic['dilogs']){
	echo '<no_dilogs>'.$static['content']['NO_DIALOGS'].'</no_dilogs>';
}else{ ?>

  <dilogs offset="<?php echo count($dynamic['dilogs']); ?>">
    <items>
 <?php foreach($dynamic['dilogs'] as $dialog){?>    
 
		<item id_dialod="<?php echo $dialog['id']?>" class="<?php echo ($dialog['flag'] == 'u') ? 'new_message' : '' ?>">     
            <photo>
                    <div>
                        
                        <img src="<?php echo '../../../../files/stores/'.$dialog['store'].'/items_img_min/'.$dialog['art'].'/'.$dialog['art'].'_p_1.jpg'; ?>">
                    </div>
            </photo>
            <what>
                        <seller><?php echo $dialog['user']?></seller>
                        <name><?php echo $dialog['name']?></name>
            </what> 
        </item>
    
<?php }?>  
</items>
<scroll_loader style="opacity:0;" loading="false"><img src="../../../../static/img/ring-alt.svg"></scroll_loader>             
</dilogs>  
          
          
          
          
  <chat>
   <output>
   
      <prompt><?php echo $static['content']['SELECT_DIALOG']?></prompt>
		
		
      </output>
    
     <inpt> 
    <form id="send_message" class="d_none" what="send_message" method="post">
      <typing><textarea name="message" maxlength="1000" placeholder="<?php echo $static['content']['MESAGE_PLACEHOLDER']; ?>" data-rule-valid='[{"key":"regexp","value":"(?=.{1,1000})"}]'></textarea></typing>
      <div class="actions">
      <button id="send_message_button"> <?php echo $static['buttons']['SEND']; ?> ^</button>
      </div> 
      </form>
    </inpt>    
</chat>
  
<?php }?>    
  
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
  <script type="text/javascript" src="http://timeago.yarp.com/jquery.timeago.js"></script>
  <script src="../../../../library/js/lemongrab/lemongrab.js"></script> 
  <script src="../../../../static/COMMON/COMMON.js"></script>
  
        
  <script type="text/javascript">

$(document).ready(function(){
    
/*******TIME CONTEXT**********/    
// Russian
(function() {
  function numpf(n, f, s, t) {
    // f - 1, 21, 31, ...
    // s - 2-4, 22-24, 32-34 ...
    // t - 5-20, 25-30, ...
    n = n % 100;
    var n10 = n % 10;
    if ( (n10 === 1) && ( (n === 1) || (n > 20) ) ) {
      return f;
    } else if ( (n10 > 1) && (n10 < 5) && ( (n > 20) || (n < 10) ) ) {
      return s;
    } else {
      return t;
    }
  }

  jQuery.timeago.settings.strings = {
    prefixAgo: null,
    prefixFromNow: "через",
    suffixAgo: "назад",
    suffixFromNow: null,
    seconds: "меньше минуты",
    minute: "минуту",
    minutes: function(value) { return numpf(value, "%d минуту", "%d минуты", "%d минут"); },
    hour: "час",
    hours: function(value) { return numpf(value, "%d час", "%d часа", "%d часов"); },
    day: "день",
    days: function(value) { return numpf(value, "%d день", "%d дня", "%d дней"); },
    month: "месяц",
    months: function(value) { return numpf(value, "%d месяц", "%d месяца", "%d месяцев"); },
    year: "год",
    years: function(value) { return numpf(value, "%d год", "%d года", "%d лет"); }
  };
})();    
    

/************Menu show***********************/ 

    function menuShow(){
        $('ul .admin-messages').addClass('show');   
    }
    menuShow();	
    
/*******SEND_MESSAGE ON CLICK******/    
    
    
    $('#send_message_button').on('click', function(e){
        
     e.preventDefault();   
        
     $this = $(this);
     
     if($this.hasClass('disabled')){
         return false;
     }
    
     var form = $('#send_message');
     var what = form.attr('what');  

       form.lemongrab();
       if(form.isValid()){
       var id_dialog = $('chat output .active').attr('id_dialog');
       var data = form.serialize();
       data += '&what='+what+'&id_dialog='+id_dialog; 
         
   
                            $.ajax({
                                url:  window.location.href,
                                type: 'POST',
                                dataType: 'json', 
                                data: data, 
                                cache: false,
                                beforeSend: function(data) {
                                    $this.addClass('disabled');
                                    form.find('textarea').animate({ marginTop : '-180px', opacity : 0} , 200);
                                    
                                },
                                success: function(data){ 
                                    if (data['error']){ 
                                         Assistant.greenBoard('<div>'+data['error']+'</div>', 'red');
		       		                 } else {
                                         
                                        setTimeout(function(){
                                        var text = form.find('textarea').val().trim();
                                        form.find('textarea').val('');
                                        var store = location.href.split('/')[3];
                                       
                                        var element = $('<item style="opacity:0;" class="to_mess">\n\
                                                            <info><person>'+store+'</person><date><?php echo $static['js']['JUST_NOW']; ?></date></info>\n\
                                                            <message>'+text.replace(/\n/g, "<br />")+'</message>\n\
                                                            </item>\n\
                                                        \n'); 
                                        $('chat output .active').append(element);
                                        element.animate({ opacity : 1} , 400);
                                         $('chat').animate({scrollTop: 800000 }, 500);    
                                        },200); 
                                     }
                                },
                                error: function (xhr, ajaxOptions, thrownError) { 
                                         Assistant.greenBoard('<div><?php echo $common['js']['BACKEND_MISTAKE']; ?></div>', 'red');
                                },
                                complete: function(data) {
                                    setTimeout(function(){ $this.removeClass('disabled');}, 1000); 
                                    setTimeout(function(){  
                                    form.find('textarea').css('marginTop','0px').css('marginBottom','-200px');
                                    form.find('textarea').animate({ marginBottom : '0px', opacity : 1} , 200);  
                                    }, 200); 
                                     
                                }
                            });      
        
    
     }
 
    });
    
    
/**********DILOG ON CLICK********/
    
$('dilogs item').one('click', function(){    
     $('chat output').children().addClass('d_none');
     $('#send_message').removeClass('d_none');
});
 
function LoadDilog(){
     var $this = $(this);           
                    
    if($this.hasClass('on')){
        return false;
    }
    
    var new_message = false;
    
     if($this.hasClass('new_message')){
         new_message = true;
        $this.removeClass('new_message');
         var html = $('ul flag').html();
         var amount = Number(html);
         amount--;
         if(amount > 0){
           $('ul flag').html('+'+amount);  
         }else{
           $('ul flag').addClass('d_none');    
         }
    }
    
    $('dilogs .on').removeClass('on');
    $this.addClass('on');
    
    
    $('chat output .active').removeClass('active').addClass('d_none');
   
    var id_dialod = $this.attr('id_dialod');
    
    var conversation = $('#dialog_'+id_dialod);
    
    if(conversation.length == 1 ){
        conversation.removeClass('d_none').addClass('active');
        $('chat').animate({scrollTop: 800000 }, 500);
        
    }else{
        var data = 'what=load_dialog&id_dialod='+id_dialod;
        
        if(new_message){
             var data = data+'&new_message=on';
        }
        
        $parent = $('chat output');
        $.ajax({
                        url:  window.location.href,
                        type: 'POST',
                        dataType: 'json', 
                        data: data, 
                        cache: false,
                        beforeSend: function(data) {
                            $this.addClass('disabled');
                            Assistant.goLoad( $parent, 'on', 1000);
                            $('#send_message_button').addClass('disabled');
                        },
                        success: function(data){ 
                            if (data['error']){ 
                                Assistant.greenBoard('<div>'+data['error']+'</div>', 'red');
		       		         } 
                            if(data['status'] == 'ok'){ 
                                
                                
                                var arr = data['conversation'].split('*||*');
                               
                                var layout = '<conversation class="active d_none" id="dialog_'+data['id']+'" id_dialog="'+data['id']+'"> <begining><?php echo $static['js']['CHAT_BEGINNING']; ?></begining>';
                                
                                var info = false;
                                for(var i = arr.length-1; i >= 1 ; i--){
                                    
                                    var item = arr[i].split('*|*');
                                    
                                    var stamp = Number(item[2]);
                                    
                                    var date = new Date(stamp*1000);
                                    date = $.timeago(date);

                                    if(item[1] == 'u'){
                                       
                                        layout += '<item class="from_mess">';
                                                    
                                                        if(info != 'u'){
                                                            layout += '<info><person>'+data['user']+'</person><date>'+date+'</date></info>'
                                                            info = 'u';
                                                         }
                                        
                                                        layout += '<message>'+item[0].replace(/\n/g, "<br />")+'</message></item>'; 
                                 
                                      }
                                    
                                    if(item[1] == 's'){
                                        
                                         layout =  layout+'<item class="to_mess">';
  
                                                        if(info != 's'){
                                                            layout += '<info><person>'+data['user']+'</person><date>'+date+'</date></info>'
                                                            info = 's';
                                                         }
                                        
                                                        layout += '<message>'+item[0].replace(/\n/g, "<br />")+'</message></item>'; 
                                    }
        
                                }
                               
                            layout = layout+'</conversation>';    
                                
                                var element = $(layout);
                                $parent.append(element);
          
                            
                            }
                            },
                        error: function (xhr, ajaxOptions, thrownError) { 
                                Assistant.greenBoard('<div><?php echo $common['js']['BACKEND_MISTAKE']; ?></div>', 'red');
                            },
                        complete: function(data) {
                                setTimeout(function(){ $this.removeClass('disabled');}, 1000);  
                                Assistant.goLoad( $parent, 'off', 1000);
                               
                            
                                setTimeout(function(){ $('chat output .active').removeClass('d_none');
                                                       $('chat').animate({scrollTop: 800000 }, 500);
                                                     }, 1000); 
                            
                             $('#send_message_button').removeClass('disabled');
          
                            }
                });  
   
    }
    
    
}    
    

$('dilogs item').on('click', LoadDilog);    
    
/******new dilogs by scrolling****/
    
$(window).scroll(function() {
    if($(window).scrollTop() >= $(document).height() - ($(window).height()*1.5)) {
        
       if($('scroll_loader').attr('loading') == 'true'){
          
          return false;
           
       } 
    
        var offset = Number($('dilogs').attr('offset'));
        
        if((offset%20) != 0){
          
           return false;
           
        }
    

        var data = 'what=scroll_load_dilogs&offset='+offset;
    
                    $.ajax({
                                url:  window.location.href,
                                type: 'POST',
                                dataType: 'json', 
                                data: data, 
                                cache: false,
                                beforeSend: function(data) {
                                    
                                    $('dilogs scroll_loader').css('opacity', '1').attr('loading', 'true');
                                    
                                },
                                success: function(data){ 
                                    
                                    if (data['error']){ 
                                        Assistant.greenBoard('<div>'+data['error']+'</div>', 'red');
		       		                 }else{
                                         
                                         if(data['dilogs']){
                                             
                                             
                                            var i = 0 , count = data['dilogs'].length;
                                             
                                            var interval = setInterval(function() {

                                            if (i >= count) {

                                                clearInterval(interval);

                                            } else {

                                            var item = data['dilogs'][i];
                                                  
                                            var element = '<item id_dialod="'+item['id']+'" class="'+item['class']+'"><photo><div><img src="'+item['img']+'"></div></photo>\n\
                                            <what><seller>'+item['user']+'</seller><name>'+item['name']+'</name></what></item>';
                                                var $elemet = $(element);
                                                
                                                 $elemet.on('click', function(){
                                                     if( $('#send_message').hasClass('d_none')){
                                                           $('chat output').children().addClass('d_none');
                                                           $('#send_message').removeClass('d_none');
                                                     }
                                                      return false;
                                                 });
                                                
                                                 $elemet.on('click', LoadDilog);
                                                            
                                                 $('dilogs items').append( $elemet );
                   
                                                i++;
                                                
                                                    }

                                             }, 100);

                                         
                                         }else{
                                             
                                              $('dilogs').attr('offset', ++offset);
                                             
                                         }
                                             
                                           
                                              $('dilogs').attr('offset', offset+count);
    
                                    
                                     } 
                  
                                },
                                error: function (xhr, ajaxOptions, thrownError){ 
                                     Assistant.greenBoard('<div>BACKEND_MISTAKE</div>', 'red');
                                },
                                complete: function(data) {
                                    
                                     $('dilogs scroll_loader').css('opacity', '0').attr('loading', 'false');
                                    
                                    
                                }
                            }); 
    
    }
}); 
    
    
    

/********* AJAX log_out ************/

$('.log_out').on('click', function(){
 $this = $(this); 
   
 var data ='&what='+$this.attr('what');    
    $.ajax({
               url:  window.location.href,
			   type: 'POST',
			   dataType: 'json', 
			   data: data, 
               cache: false,
		       beforeSend: function(data) {  
		          },
		       success: function(data){ 
				      Assistant.setTimeout( function(){window.location.href = '/'}, 200);
		         },
		       error: function (xhr, ajaxOptions, thrownError) { 
		              Assistant.greenBoard('<div><?php echo $common['js']['BACKEND_MISTAKE']; ?></div>', 'red');
		         },
		       complete: function(data) {
		             
		         }}); 
    
});      
/************Cart on click***************/


$('cart').on('click', function(){ 


$('dilogs').animate({left:'10%'}, 130);
$('chat').animate({left:'30%'}, 130);
$('inpt').animate({left:'30%'}, 130);

    
    
$('curtain').one('click', function(){
$('dilogs').animate({left:'20%'}, 130);
$('chat').animate({left:'40%'}, 130);
$('inpt').animate({left:'40%'}, 130);

});
}); 
    

});
      
  </script>

  </body>
  
</html>