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
              
/******special*********/

content{
    display: block;
    margin: auto;
    margin-top: 40%;
    margin-left: 340px;
    margin-right: 40px;
    opacity: 0;
}
    
content items{
    display: block;
}    

content item{
    display: block;
    width: 270px;
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

content item name{
  display: block;
  margin: 0px;
  padding-top: 6px;
  margin-bottom: 6px;
  text-align: right;
  font-size: 1.4em;
  font-weight: bold;
  color: #1d1d1d;
  font-family: 'Open Sans Condensed', sans-serif;
  
}

content item by{
  display: none;
  text-align: right;
  margin: 8px 0px;
  margin-bottom: 15px;
  font-size: 1.1em;
  font-family: Times New Roman !important;
  font-weight: bold;
    
}

content item price{
   display: block;
   margin: 6px 0px;
   text-align: right;
   font-size: 0.9em;
 
}


content item price actual{   
    text-align: right;
    
    
}

content item price discount{   
  
    text-decoration:line-through;
    color: #6a6a6a;
	padding-left: 2px;
}

content item stats{
    display: block;
    padding: 10px;
    border-left: 1px solid rgba(0, 0, 0, 0.08);
   
}

@media screen and (max-width: 1050px) {
content{
    opacity: 1;
    margin-top: 0px !important;
}    
        

content item{
    width: 100%;
    margin-bottom: 50px;
}
    
content item name{
  
  padding-top: 12px;
  margin-bottom: 10px;
  padding-right: 10px;
  font-size: 1.8em;

  
}


content item price{
   display: block;
    margin: 16px 10px;
   text-align: right;
}


content item price actual{   
    text-align: right;    
    font-size: 1.8em;
    
}

content item price discount{   
    font-size: 1.5em;
  
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
			</magnifire><input type="text" placeholder="<?php echo $common['tools']['SEARCH']; ?>"></search>
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
	  
        <?php echo htmlspecialchars_decode($dynamic['menu']); ?>
		 
      </ul>
   
      <ul class="more">
			
		<?php echo $layout['menu_more']; ?> 
				
      </ul>       
    </menu>
    
</absolute>   
   
     
<content  offset="<?php echo count($dynamic['items']); ?>" >
<items>
<?php foreach( $dynamic['items'] as $item){ ?>

 <item> 
<a href="<?php echo '/'.$dynamic['url_name'].'/item/'.$item['art']; ?>">    
    <photo>
      <img src="<?php echo '/../files/stores/'.$dynamic['url_name'].'/items_img_mid/'.$item['art'].'/'.$item['art'].'_p_1.jpg'; ?>" alt="">
    </photo>
  <stats>
        <name><?php echo $item['name'];?></name>
          <by></by> 
          <price>
              <actual><?php echo  number_format($item['price'] * $assistant['rate'], 2, '.', ' ').' '.$assistant['currency']; ?></actual>
			 <?php if($item['discount'] > 0){ ?>
              <discount><?php echo  number_format( (($item['price'] * 100) / ( 100 - $item['discount']))  * $assistant['rate'], 2, '.', ' ').' '.$assistant['currency']; ?></discount>
			 <?php }?>
          </price>
      </stats>
    </a>    
</item>
     
<?php }?>
  
</items> 
<scroll_loader style="opacity:0; padding-right:60px;" loading="false"><img src="../../../../static/img/ring-alt.svg"></scroll_loader>      
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
  <script src="https://npmcdn.com/masonry-layout@4.0/dist/masonry.pkgd.min.js"></script>
        
  <script type="text/javascript">

$(document).ready(function(){
    
/********init**********/
    
  setTimeout(function(){
      if($(window).width() > 1020){
             $('content').animate({marginTop: '150px', opacity: 1}, 350, 'linear');
         
      }

  }, 200);  

/************Menu show***********************/ 
    function menuShow(){
        var url = location.pathname ;
        var array = url.split('/');
        var count = array[2].split('-').length;
        var query = '.'+array[2];
        $(query).addClass('show').parents('ul').removeClass('d_none');   
    }
    menuShow();
	
/***********MASONRY**********/	

$('content items').masonry({
  itemSelector: 'item',
  singleMode: false,
  resizeable: true,
  columnWidth: 2,
  gutter: 0
});
  
 $( "img" ).load(function() {
 $('content items').masonry();
});
      
/************Menu init***********************/
   
$('menu').slimScroll({
        position: 'left',
        height: '75%',
        railVisible: true,
        alwaysVisible: false,             
}); 
    
    
/*********load new item by scrolling******/
    
$(window).scroll(function() {
    if($(window).scrollTop() >= $(document).height() - ($(window).height()*1.5)) {
        
       if($('scroll_loader').attr('loading') == 'true'){
          
          return false;
           
       } 
        
       
        
        var offset = Number($('content').attr('offset'));
        
        if((offset%20) != 0){
          
           return false;
           
        }
        
        var category = location.pathname.split('/')[2];
        
        var data = 'what=scroll_load_items&offset='+offset+'&category='+category;
    
                    $.ajax({
                                url:  window.location.href,
                                type: 'POST',
                                dataType: 'json', 
                                data: data, 
                                cache: false,
                                beforeSend: function(data) {
                                    
                                    $('scroll_loader').css('opacity', '1').attr('loading', 'true');
                                    
                                },
                                success: function(data){ 
                                    
                                    if (data['error']){ 
                                        Assistant.greenBoard('<div>'+data['error']+'</div>', 'red');
		       		                 }else{
                                         
                                         if(data['items']){
                                             
                                             
                                            var i = 0 , count = data['items'].length;
                                             
                                            var interval = setInterval(function() {

                                            if (i >= count) {

                                                clearInterval(interval);

                                            } else {

                                            var item = data['items'][i];
                                            var store = '<?php echo $dynamic['url_name']; ?>';       
                                            var element = '<item><a href="/'+store+'/item/'+item['art']+'"><photo><img src="/../files/stores/'+store+'/items_img_mid/'+item['art']+'/'+item['art']+'_p_1.jpg"alt=""></photo><stats><name>'+item['name']+'</name><by></by><price><actual>'+Assistant.number_format(item['price'] * data['rate'], 2, '.', ' ')+' '+data['currency']+'</actual>';
                                            
                                            
                                                if( item['discount'] > 0){
                                                    element += '&nbsp<discount>'+ Assistant.number_format( ((item['price'] * 100) / ( 100 - item['discount'])) * data['rate'], 2, '.', ' ')+' '+data['currency']+'</discount>';
                                                
                                                    }
                                            
                                                element += '</price></stats></a></item>';    
                                                var $elemet = $(element);
                                                $('content items').masonry().append( $elemet ).masonry( 'appended', $elemet );
                                                  
                                                if(i%10 == 0){
                                                    $('content items').masonry();
                                                }
                                                          
                                                i++;
                                                
                                                    }

                                             }, 100);

                                             /*
                                             
                                            for( var i = 0 , count = data['items'].length ; i<count ; i++){
                                             
                                            var item = data['items'][i];
                                                  
                                            var element = '<item><a href="/'+item['store']+'/item/'+item['art']+'"><photo><img src="/../files/stores/'+item['store']+'/items_img_mid/'+item['art']+'/'+item['art']+'_p_1.jpg"alt=""></photo><stats><name>'+item['name']+'</name><by></by><price><actual>'+Assistant.number_format(item['price'] * data['rate'], 2, '.', ' ')+' '+data['currency']+'</actual>';
                                            
                                            
                                                if( item['discount'] > 0){
                                                    element += '<discount>'+ Assistant.number_format( ((item['price'] * 100) / ( 100 - item['discount'])) * data['rate'], 2, '.', ' ')+' '+data['currency']+'</discount>';
                                                
                                                    }
                                            
                                                element += '</price></stats></a></item>';    
                                                var $elemet = $(element);
                                                $('content items').masonry().append( $elemet ).masonry( 'appended', $elemet );
                                               
                                            }
                                         */
                                         
                                         }else{
                                             
                                              $('content').attr('offset', ++offset);
                                             
                                         }
                                             
                                           
                                              $('content').attr('offset', offset+count);
    
                                    
                                     } 
                  
                                },
                                error: function (xhr, ajaxOptions, thrownError){ 
                                     Assistant.greenBoard('<div>BACKEND_MISTAKE</div>', 'red');
                                },
                                complete: function(data) {
                                    
                                     $('scroll_loader').css('opacity', '0').attr('loading', 'false');
                                     $('content items').masonry();
                                    
                                }
                            }); 

                       
        
        
    }
});        
    


});
      
  </script>

  </body>
  
</html>