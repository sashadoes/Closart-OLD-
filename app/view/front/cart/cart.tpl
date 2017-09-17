
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
        <title>Cart</title>

<style type="text/css">
board select{
    
    max-width: 400px;
   
  
}

/******special*********/

content{
    display: block;
    width: 1100px;
    margin: auto;
    margin-top: 150px;
   
}

content static {
    text-align: center;
}

#pop_up{
    display: block;
}

static prompt{
    
   
    margin-bottom: 20px;
    font-size: 1em;
    color: #000000; 
}

static hint{
     display: block;
    
     margin-bottom: 20px;
    text-align: center;
    font-size: 1em;
    color: #767676; 
    font-style: italic;
}

static hint a{
    color: #000000; 
}

static prompt a{
    border-bottom: 1px solid black;
}

#pop_up item{
    display: inline-block;
    margin: 0px 8px;
    height: 33px;
}

#pop_up select{
    
   border: 1px solid #000000;
   color: #000000;
   font-size: inherit;
   overflow: hidden;
   padding: 4px 2px;
   border-radius: 2px;
    white-space: nowrap;
    width: 200px;
    cursor: pointer;
  
}

dynamic board {
    display: table;
    margin: 40px auto;
    padding: 30px;
  
}
    
    
/****loaders****/
    
.region_loader{
    padding-top: 10px;
}    

.delivery_loader{
   opacity: 0.5;     
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
    display: block;
    margin: 16px 20px;
}

.order .about static_s{
    font-weight: bold;
    margin-bottom: 4px;
}


.order .about .left{
   
    float: left;
    width: 50%;
}

.order .about .right{
    padding-top: 7px;
    padding-right: 10px;
    color: #6d6d6d;
    font-size: 0.9em;
    font-style: italic;
}


    
.about label{
     
    font-size: 1em !important;
    font-weight: bold !important;
    color: #000000 !important;
} 
    
.order .about select{
    width: 90%;
    
    font-size: 1.1em;
}
    
.order .about textarea{
    width: 90%;
    height: 60px;
    font-size: 1.1em;
}

.order .status{
    width: 15%;
    text-align: center;
    float: right;
    
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
    
    
.order .status button{
    width: 100%;    
}
    
.order .pay button{
    color: #ff9021 !important;  
} 
    
.order .about no_support{
    display: block;
    height: 0px;
    margin-top: 10px;
    color: #ff9021 !important;  
}
    
.order .about render{
    display: block !important;
    height: 0px; 
    overflow: hidden;
    opacity: 0;
}    
/********purchase********/ 


.purchase item{
    
    display: block;
    margin-bottom: 40px;
    text-align: center;
 
}

.purchase item input[type="text"]{
       
     width: 300px;
    font-size: 1.3em;
       text-align: center;
}

.purchase item input[type="text"]:focus{
    text-align: left;
   
}
.purchase item button{
    width: 170px;
    font-weight: bold;
}
    
/*****no_items*****/

no_items{
    display: block;
    margin: auto;
    margin-top:40px;
    text-align: center;
    font-size: 1.1em;
    color: #b9b9b9;
    

}    


/*****MOBILE******/


 @media screen and (max-width: 1200px) {

content{
    display: block;
    width: 900px;
   
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
}
    
    .order .photo{
        width: 30%;
        text-align: center;
    }

.order .about {
    float: right;
    width: 66%;
    
}
    
    .order .about textarea{
        height: 130px;
    }

    #pop_up{
        margin-top: 20px;
    }
    static .pop_up{
        width: 490px;
    }
    

.purchase item input[type="text"]{
  
     min-width: 600px;
    font-size: 1.3em;
       text-align: center;
}

}
@media screen and (max-width: 720px){

    .order{
        padding: 0px;
    }
}
    
@media screen and (max-width: 1600px) {

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
                         
</style>
<link rel="stylesheet" href="../../../../static/COMMON/COMMON.CSS">
</head>
	
<body>
                 
<mob>
            <header class="absolute">
                <l_menu><img src="../../../../static/img/menu.svg"></l_menu>
                <tite_mob>Cart</tite_mob>
                <r_menu><img src="../../../../static/img/doots.svg"></r_menu>
            </header>
            
            <search><magnifire><img src="../../../../static/img/magnifire.svg">
			</magnifire><input type="text" placeholder="<?php echo $common['tools']['SEARCH']; ?>"></search>
        </mob>
   
        
<header class="no_mob absolute ">
       
        <tite class="absolute no_mob"><a href="/news">CLOSART</a> / <a>CART</a></tite>
        
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

    <?php if($dynamic['items']){ ?>  
	
    <static>
 
        <board id="pop_up">
              <hint>(<?php echo $static['content']['GUIDE']; ?>)</hint>
              <prompt><?php echo $static['content']['CHOOSE_COUNTRY']; ?>:</prompt>
                 <item class="pop_up">
                     <pop_up>
                        <wrapper>
                            <div class="pop content">
                                <ul id="region_choose">
                                    <li region="0"><?php echo $static['content']['UKRAINE']; ?></li>
                                    <li region="1"><?php echo $static['content']['RUSSIA']; ?></li>
                                    <li region="2"><?php echo $static['content']['EUROPE']; ?></li>
                                    <li region="3"><?php echo $static['content']['AMERICA']; ?></li>
                                </ul>
                            </div>
                            <div class="parent"><dynamic_s><?php echo $static['content']['CHOOSE']; ?></dynamic_s><static_d>&#8595;</static_d></div>
                         </wrapper>
                     </pop_up>
                 </item>
                   
            </board>
     
       </static>
     
     
     <dynamic>
     

         <orders>
		 
         <?php foreach( $dynamic['items'] as $item){ 

            if(!$item['out']){

            ?>
             
             
		 
            <board class="order" store="<?php echo $item['store']; ?>" alias="<?php echo $item['alias']; ?>">
                 
                 <section class="photo">
					<a href="/<?php echo $item['store']; ?>/item/<?php echo $item['art']; ?>" target="_blank">
                     <item>
                         
                     <img src="<?php echo '../../../../files/stores/'.$item['store'].'/items_img_mid/'.$item['art'].'/'.$item['art'].'_p_1.jpg'; ?>">
                     </item>
					 </a>
                     <div class="on_mob">
                         <item class="price">
                             <static_d><?php echo $static['content']['COST']; ?>:</static_d>
                             <dynamic_d>
							<?php if($item['discount'] > 0){ ?>
                             <old_price><?php echo number_format((($item['price'] * 100) / ( 100 - $item['discount']))* $assistant['rate'], 2, '.', ' ').' '.$assistant['currency']; ?></old_price>
							<?php } ?>
							 <price><?php echo number_format(($item['price'] )* $assistant['rate'], 2, '.', ' ').' '.$assistant['currency']; ?></price></dynamic_d>
                         </item>
						  <item class="delete">
							<button><?php echo $static['buttons']['DELETE']; ?></button>
						 </item>
                         <item class="pay" style="display:none;">
                             <button><?php echo $static['buttons']['PAY']; ?></button>
                         </item>
                     </div>
                 </section>
                 
                 <section class="about">                     
                     <item>
                         <static_s><?php echo $static['content']['ART']; ?>:</static_s>
                         <dynamic_s><?php echo $item['art']; ?></dynamic_s>
                     </item>
                     <item>
                         <static_s><?php echo $static['content']['NAME']; ?>:</static_s>
                         <dynamic_s><?php echo $item['name']; ?></dynamic_s>
                     </item>
                     <item>
                         <static_s><?php echo $static['content']['SELLER']; ?>:</static_s>
                         <dynamic_s><?php echo $item['store']; ?></dynamic_s>
                     </item>
					 
					<?php if($item['options'] != ''){ ?> 
					 <item>
                         <static_s><?php echo $static['content']['SETTINGS']; ?>:</static_s>
                         <dynamic_s><?php echo $item['options']; ?></dynamic_s>
                     </item>
                     <?php } ?>
					 		
                    <item class="clearfix">  
					<label for="delivery_servis"><?php echo $static['content']['DELIVERY_SERVICE']; ?>:</label>
					<div class="left del_servis"> 
					   <selector>
                       <select name="delivery_servis">
                         <option>-</option>
                       </select>
					   </selector>
                             
                    </div>     
                     <div class="right del_servis_bio">     
                       
                     </div>    
                         
                     </item>
					 
                    <render style="display:none;">
					
					<item class="clearfix">
					
                        <div class="left">     
                         <textarea placeholder="<?php echo $static['content']['DELIVERY_ADDRESS']; ?>"></textarea>
                      </div>     
                      <div class="right del_address_bio">     
                       
                      </div>    
                         
                     </item>
                    
                      <item class="clearfix">
                        <div class="left">     
                         <textarea placeholder="<?php echo $static['content']['DELIVERY_COMMENTS']; ?>"></textarea>
                      </div>     
                        <div class="right del_comments">     
                       
                        </div>    
                         
                     </item>
                    </render>
                 </section>
               
                <section class="status no_mob">
				 <item class="price">
				 
                    <static_d><?php echo $static['content']['COST']; ?>:</static_d>
                     <dynamic_d>
					<?php if($item['discount'] > 0){ ?>
                       <old_price><?php echo number_format((($item['price'] * 100) / ( 100 - $item['discount']))* $assistant['rate'], 2, '.', ' ').' '.$assistant['currency']; ?></old_price>
					<?php } ?>
					<price><?php echo number_format($item['price'] * $assistant['rate'], 2, '.', ' ').' '.$assistant['currency']; ?></price></dynamic_d>
                    </item>
                    
                    <item class="delete">
                        <button><?php echo $static['buttons']['DELETE']; ?></button>
                    </item>
					<item class="pay" style="display:none;">
                        <button><?php echo $static['buttons']['PAY']; ?></button>
                    </item>
                </section>
            </board>
		
		<?php }else{ ?>
             
             
             
        
             <P>OUT IF STOCK</P>  
        
             
        <?php }} ?>

		</orders>	

      <board class="purchase">
          <item>
			<input id="phone" type="text" placeholder="<?php echo $static['content']['PHONE_NUMBER']; ?>">
          </item>
		  <item>
            <button><?php echo $static['buttons']['NEXT']; ?> &#8250</button>
		  </item>
         </board>
     </dynamic>
         
		<?php }else{ ?>
		
        <static>
 
        <board id="pop_up">
              <hint>(<?php echo $static['content']['GUIDE']; ?>)</hint>   
            </board>
		<no_items><?php echo $static['content']['NO_ITEMS']; ?></no_items>
       </static>
			
		
		<?php } ?>
	   
	
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
             
            

</board>
        
   
   <div id="greenBoard"></div>
   <curtain style="display:none;"></curtain>  
        
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="../../../../library/js/jquery.slimscroll.min.js"></script> 
  <script src="../../../../library/js/phone_validator.js"></script>
  <script src="../../../../static/COMMON/COMMON.js"></script>
        
  <script type="text/javascript">

$(document).ready(function(){
    
/*****CHOOSE REGION AJAX******/
    
    
   window.DeliverResults = new Object();   
    
    
$('#region_choose li').on('click', function(){
    
    var $this = $(this);
    
    if($this.hasClass('region_active')){
        return false;
    }
    
    $('#region_choose .region_active').removeClass('region_active');
    $this.addClass('region_active');
    var $parent = $this.closest('.pop_up');
    
    var loader = '<img class="region_loader" src="/static/img/ajax_loader.gif">';
    
     Assistant.switchContent($parent,loader); 
 
     var region = $this.attr('region');
    
     window.DeliverResults = new Object();
    
    var orders = $('dynamic .order');
  
    $.each(orders, function(index, value){
        
         var $order = $(this);
          var store = $order.attr('store');
        
      
             var data = 'what=select_region_cart&region='+region+'&store='+store;
         
               $.ajax({
                                url:  window.location.href,
                                type: 'POST',
                                dataType: 'json', 
                                data: data, 
                                cache: false,
                                beforeSend: function(data) {
                                    
                                  
                                },
                                success: function(data){ 
                                    if (data['error']){ 
                                        Assistant.greenBoard('<div>'+data['error']+'</div>', 'red');
		       		                 } else if(data['flag'] == 'ok'){ 
                                       
                                        if(data['delivery'] == '<?php echo Config::DELIVERY_NOT_SUPPORTED ?>'){
                                           $order.find('.about .del_servis_bio').fadeOut(0); 
                                          
                                            $order.find('.about render').animate({opacity: '0'}, 160, function(){
                                                $(this).animate({height: '0px'}, 300);
                                            });
                                            $order.find('.pay').fadeOut(150);
                                            $order.find('.del_servis selector').html('<no_support><?php echo $static['content']['DELIVERY_NOT_SUPPORTED'] ?></no_support>'); 
                                            
                                        }else{
                                            
                                            var servises = data['delivery'].split('<?php echo Config::SECOND_SEPARATOR ?>');
                                            
                                            var servises_array = [];
                                            var servise_bio_array = [];
                                           
                                            for(var i = 0 ; i < servises.length ; i++){
                                                
                                                var format = servises[i].split('<?php echo Config::DELIVERY_MENAGEMENT_OPTION_SEPARATOR ?>');
                                                servises_array[i] = format[0];
                                                if(i == 0){
                                                    servise_bio_array = format[1].split('<?php echo Config::DELIVERY_MENAGEMENT_ITEM_SEPARATOR ?>');
                                                }
                                                
                                            }
                                           
                                            var selector = '<select name="delivery_servis" class="delivery_load" store="'+data['store']+'">';
                                            
                                            for(var i = 0 ; i <  servises_array.length ; i++){
                                            
                                                selector += '<option servis_number="'+i+'">'+servises_array[i]+'</option>';
                                            }
                                            
                                                selector += '</select>';
                                            
                                             $order.find('.del_servis selector').html(selector); 
                                                
                                             $order.find('.about .del_servis_bio').html(servise_bio_array[0]).fadeIn(200);
                                             $order.find('.about render .del_address_bio').html(servise_bio_array[1]);
                                             $order.find('.about render .del_comments').html(servise_bio_array[2]);
                                            
                                             $order.find('.about render').animate({height: (($order.find('.about render item').height()*2)+50)+'px', opacity: '1'}, 200, function(){
                                                 $(this).css('height', 'auto');
                                             });
                                             $order.find('.pay').fadeIn(340);
                                            
                                             
                                            /**********select delivery_load*****/
    
                                            $order.find('.delivery_load').on('change', function(){
        
            
                                                var $this = $(this);
                                               // var $parent = $this.parent();
                                                var servis_number = $this.find('option:selected').attr('servis_number');
                                                var region = $('pop_up .region_active').attr('region');
                                                var store = $this.attr('store');
                                              
                                                var data = 'what=delivery_load_bio&store='+store+'&servis_number='+servis_number+'&region='+region;
        
                                                $order = $this.closest('.order');
        
                                                $.ajax({
                                                    url:  window.location.href,
                                                    type: 'POST',
                                                    dataType: 'json', 
                                                    data: data, 
                                                    cache: false,
                                                    beforeSend: function(data) {
                                     
                                     var loader = '<img class="delivery_loader" src="/static/img/ajax_loader.gif">';
                                                        $order.find('.del_servis_bio').html(loader);
                                                        $order.find('.del_address_bio').html(loader);
                                                        $order.find('.del_comments').html(loader);
                                    
                                  
                                },
                                success: function(data){ 
                                    if (data['error']){ 
                                        Assistant.greenBoard('<div>'+data['error']+'</div>', 'red');
		       		                 } else if(data['flag'] == 'ok'){ 
        
                                            var servis = data['delivery'].split('<?php echo Config::SECOND_SEPARATOR ?>')[servis_number];
                                            servis_number = parseInt(servis_number);
                                            var servise_bio_array = servis.split('<?php echo Config::DELIVERY_MENAGEMENT_OPTION_SEPARATOR ?>');
                                            servise_bio_array = servise_bio_array[1].split('<?php echo Config::DELIVERY_MENAGEMENT_ITEM_SEPARATOR ?>');
                                        
           
                                                
                                             setTimeout(function(){
                                                 $order.find('.about .del_servis_bio').html(servise_bio_array[0]);
                                                 $order.find('.about render .del_address_bio').html(servise_bio_array[1]);
                                                 $order.find('.about render .del_comments').html(servise_bio_array[2]);
                                             }, 500);
                                         
                                             
                                            
                                            
                                            
                                            
                                        } 
                                         
        
                                     
                                },
                                error: function (xhr, ajaxOptions, thrownError) { 
                                    Assistant.greenBoard('<div><?php echo $common['js']['BACKEND_MISTAKE']; ?></div>', 'red');
                                },
                                complete: function(data) {
                                   
                                     
                                }
                            });
    
    });                    
                                            
                                            
                                            
                                        } 
                                         
        
                                         
                                          //Assistant.greenBoard('<div>'+servises[0]+'</div>', 'green');  
                                        
                                         
                                     }
                                },
                                error: function (xhr, ajaxOptions, thrownError) { 
                                    Assistant.greenBoard('<div><?php echo $common['js']['BACKEND_MISTAKE']; ?></div>', 'red');
                                },
                                complete: function(data) {
                                   
                                     
                                }
                            });
      
        
        
    });
  

   setTimeout( function(){Assistant.switchContent($parent,'back');}, 500);
    
    
});    
    

/*******delete_item_cart*****/    
    
$('.order .delete').on('click', function(){
    
    var $order = $(this).closest('.order');
    
    var alias = $order.attr('alias');
    
    var data = 'what=delete_cart_item&alias='+alias;
    
                    $.ajax({
                                url:  window.location.href,
                                type: 'POST',
                                dataType: 'json', 
                                data: data, 
                                cache: false,
                                beforeSend: function(data) {
                                    var cart_amount = Number($('cart amount').html());
                                    
                                    $('cart amount').html(--cart_amount); 
                                    $('.mob_cart amount').html(cart_amount); 
                                     
                                    
                                },
                                success: function(data){ 
                                    if (data['error']){ 
                                        Assistant.greenBoard('<div>'+data['error']+'</div>', 'red');
		       		                 }else{
                                        $order.animate({marginLeft: '+=200px', opacity : '0'}, 300).slideUp(300); 
                                         
                                     } 
                  
                                },
                                error: function (xhr, ajaxOptions, thrownError){ 
                                     Assistant.greenBoard('<div>BACKEND_MISTAKE</div>', 'red');
                                },
                                complete: function(data) {
                  
                                }
                            }); 
    


});   
    
    
/*********pay_order*******/    
 

$('.order .pay').on('click', function(){
   
   
         Assistant.dialogBoard('<logo><?php echo $static['js']['CLOSART_IS_OFF']; ?></logo><screen><?php echo $static['js']['CLOSART_IS_OFF_DESC']; ?></screen>', '');
    

    
});
    
    
    
    
/*********cart_false*******/
    
    
    
 $('cart').off('click');
 $('cart').on('click', function(){
     location.reload();
 });
    

    
   
 $("#phone").mask("+999 (99) 999 99 99",{placeholder:" "});


    
    
/************NOT_LOGED_PROCEDURE*********/ 
    
    <?php if(!$assistant['login'] && $dynamic['items']){ ?>
        
		setTimeout(function(){
         Assistant.dialogBoard('<logo><?php echo $static['js']['USER_NOT_LOGED']; ?></logo><screen><?php echo $static['js']['USER_NOT_LOGED_PROMPT']; ?></screen><interact><a target="_blank" href="/profile"><button><?php echo $static['buttons']['ENTER']; ?> &#8250</button></a></interact>', '');
    
    }, 2000);
            
    <?php } ?>
    

});  
      
  </script>

  </body>
  
</html>