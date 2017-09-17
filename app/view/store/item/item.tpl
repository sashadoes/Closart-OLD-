<?php   
$assistant = $params['assistant'];
$layout = $params['layout'];
$common = $params['common'];
$static = $params['static'];
$dynamic = $params['dynamic'];

if($assistant['cart_count'] <= 0){
		
	$layout['cart_layout'] = '<items><no_items>'.$common['cart']['N0_ITEMS'].'</no_items></items>
			<currency class="d_none" currency="'.$assistant['currency'].'"></currency>
			<common_price class="d_none" price="0"></common_price>
			<order class="d_none">
			<dynamic_s>0</dynamic_s>		 
            ';
}

?>

<!DOCTYPE html>
<html>
<head>
        
		<meta charset="utf-8">
        <meta name="viewport" content="user-scalable=no">
        <title><?php echo $dynamic['name']; ?></title>
		<meta name="keywords" content="<?php echo $dynamic['item']['seo'] ?>" />
<style type="text/css">
    
   
 
/************content************/
 
content{
    display: block;
    padding-left: 50vw;
    margin-left: -600px;
  
   
}
    
content space{
    display: block;
    height: 150px;
    
        
}    

content board {
    display: block;
}

content section{
    display: block;
}

#item{
    padding: 40px;
/*    border-top: 1px dotted rgba(0, 0, 0, 0.19);
    border-bottom: 1px dotted rgba(0, 0, 0, 0.19);*/
}

/*********item photo************/
#photo_item {
    
     display: block;
     float: left;
     margin-left: 80px;
     margin-bottom: 50px;
     padding-top: 150px;
     width: 650px;
    
}


#photo_item item{
    display: block;
    padding-bottom: 30px;
    overflow: hidden;
    text-align: center;
    overflow: visible;
}



#photo_item item img{
     
     box-shadow: 3px 3px 5.5px rgba(0, 0, 0, 0.5);
     width: 100%;   
     cursor: zoom-in;
}

/*******item about*****/

#about_item   {
      display: table;
      width: 370px;
      margin-bottom: 50px;
      padding-top: 150px;
      padding-left: 50px;   
    
}

#about_item  art{
    display: block;
    color: #3b3b3b;
    margin-right: -80px;
    margin-bottom: 10px;
    font-size: 0.9em;
}

#about_item  name {
    display: table;
    width: 100%;
    margin-top: 60px ;
    font-size: 2.6em;
    line-height: 1.2em;
    font-weight: bold;
    font-family: 'Open Sans Condensed', sans-serif;
	text-align: center;
   
}

#about_item   art static_s{
    font-weight: bold;
}

#about_item   price{
    display: block;
    margin:  auto;
    margin-top: 60px;
    margin-bottom: 50px;
	text-align: center;
    
}


#about_item  price item{
    display: block;
   
}

#about_item  price .price{
    font-size: 1.6em;
    margin: 0px 10px;
   
}

#about_item price .discount{
    padding-bottom: 8px;
    font-size: 1.3em;
    text-decoration: line-through;
    color: #6f6f6f;
 
}
#about_item  options{
    display: block;
    margin: 20px;
}

#about_item options item{
    display: block;
    margin: 16px 20px;
    text-align: center;
}

#about_item  options select{
   min-width: 50%;
 
}
#about_item actions{
    display: block;
    text-align: center;
}

#about_item actions button{
    width: 170px;
    background-color: black;
    color: #ffffff;
    
}

#about_item unavailable{
	
	display: block;
    text-align: center;
	padding-top: 30px;
	font-size: 1.4em;
	font-weight: bold;
	color: red;
}

#about_item  actions ask{
   display: table;
    margin: 20px auto;
    cursor: pointer;
    font-weight: bold;

}

#about_item description{
    display: block;
    margin-top: 60px;
    padding-bottom: 30px;
    color: #4e4e4e;
    font-weight: bold;
    font-family: 'Open Sans', sans-serif;
    font-size: 1em;
    line-height: 1.45em;
   
}

#about_item  description item{
    display: block;
    margin-top: 20px;
   
  
text-align: justify;  Выравнивание по ширине 
   
}

/************no_items******/ 
#cart no_items{

    margin-top: 42px !important;
  
}
    
/***********FLOATING DESCRIPTION*********/
    
    
.sticky {
  position: fixed;
   
  z-index: 101;
}
.stop {
  position: relative;
  
  z-index: 101;
}

/*****MOBILE******/



@media screen and (max-width: 1400px) {
    
    content{
           padding-left: 64vw;
          
    }
    
    #photo_item{
         width: 500px;
    }
    
    #about_item{
        
        padding-left: 40px;
    }
 
    
}


@media screen and (max-width: 1050px) {
    
    content{
        width: 100%;
        margin: 0px;
        padding: 0px;
        margin: auto;
    }
    
    #photo_item{
        width: 100%;
        margin: 0px;
        padding: 0xp;
    }
    
    
/*******mobile about********/
    
#photo_item {
    
     padding-top: 0px;
  
    
}  

#photo_item price .discount{
   
    text-decoration: line-through;
    color: #6f6f6f;
 
}    


#photo_item  art{
    display: block;
    float: right;
    color: #3b3b3b;
    margin: 30px;
    font-size: 0.9em;
}

#photo_item  name {
     display: block;
     margin-top: 60px ;
     text-align: center;
    font-size: 3em;
    font-weight: bold;
    line-height: 1.23em;
    font-family: 'Open Sans', sans-serif;
   
}

#photo_item   art static_s{
    font-weight: bold;
}

#photo_item  price{
     display: block;
      margin:  auto;
     margin-top: 60px;
     margin-bottom: 20px;
    font-size: 1.6em;
     
    
}



#photo_item  options{
    width: 100%;
    text-align: center;
}

#photo_item options item{
    display: block;
    margin: 20px;
}

#photo_item  options select{
   min-width: 500px;
   border: 1px solid #b9b9b9;
   color: #000000;
   font-size: inherit;
   overflow: hidden;
   padding: 3px 1px;
   border-radius: 3px;
    white-space: nowrap;
    cursor: pointer;
}
#photo_item actions{
    display: block;
    text-align: center;
    
}

#photo_item actions button{
    width: 50%;
    height: 100px;
    background-color: black;
    color: #ffffff;
    margin-top: 40px;
    font-size: 1.6em;
}

#photo_item  actions ask{
   display: table;
    margin: 20px auto;
    cursor: pointer;
    font-weight: bold;
     font-size: 1.2em;
}

#photo_item  description item{
    display: block;
    margin-top: 20px;
    padding: 28px;
    line-height: 1.2em;
    text-indent: 1.5em; /* Отступ первой строки */
     text-align: justify; /* Выравнивание по ширине */
}

      
}
                         
</style>
<link rel="stylesheet" href="../../../../static/COMMON/COMMON.CSS">
<link rel="stylesheet" href="../../../../library/js/photo_gallery/imageviewer.css">          
</head>
  
	
<body>
    
    <info login="<?php echo ($assistant['login'] !== false) ? "true" : "false"; ?>"></info>
                 
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
   
     
<content>
 


<board id="photo_item">
           
           <art class="on_mob">
              <static_s><?php echo $static['content']['ART']; ?>:</static_s> <dynamic_s><?php echo $dynamic['item']['art']; ?></dynamic_s>
          </art>
             <item>
            <img src="<?php echo '/../files/stores/'.$dynamic['url_name'].'/items_img/'.$dynamic['item']['art'].'/'.$dynamic['item']['art'].'_p_1.jpg'; ?>" alt="p_1"> 
         </item>
            <name class="on_mob">
               <?php echo $dynamic['item']['name']; ?>
           </name>
		   
		   
           <?php if($dynamic['item']['category_self'] != Config::DB_SCREENING){ ?>
		   
		   
           <price class="on_mob">
            <?php if($dynamic['item']['discount'] > 0){ ?>  
            <item class="discount">
                <?php echo  number_format( (($dynamic['item']['price'] * 100) / ( 100 - $dynamic['item']['discount'])) * $assistant['rate'], 2, '.', ' ').' '.$assistant['currency'] ?>
              </item>
			<?php }?> 
              <item class="price">
				<?php echo  number_format($dynamic['item']['price'] * $assistant['rate'], 2, '.', ' ').' '.$assistant['currency'] ?>
              </item>
           </price>
		   
		<form class="buy_product_form" method="post">   
		
		  <input type="hidden" name="what" value="buy_product">
		  <input type="hidden" name="art" value="<?php echo $dynamic['item']['art']; ?>">
		  <input type="hidden" name="name" value="<?php echo $dynamic['item']['name']; ?>">
		  <input type="hidden" name="price" value="<?php echo $dynamic['item']['price']; ?>">
		  <input type="hidden" name="discount" value="<?php echo $dynamic['item']['discount']; ?>">
          
		  <?php if($dynamic['item']['options'] != ''){ ?>  
            <options class="on_mob">
				<?php echo $dynamic['item']['options'];?>
            </options>
          <?php }?>


          <actions class="on_mob">
              <item>
             <button class="buy_product"><?php echo $static['buttons']['BUY']; ?></button>
              </item>
			  
		  </form>
              <item>
              <ask><?php echo $static['content']['ASK_QUESTION']; ?></ask>
              </item>
          </actions>

            <description class="on_mob"> 
               <item>
                <?php echo $dynamic['item']['description']?>
               </item>
            </description>
		  
		  <?php }else{?>
		  
			<unavailable class="on_mob">
				(<?php echo $static['content']['UNAVAILABLE_ITEM']; ?>)
			</unavailable>
		  
		  <?php }?>
      
            <item>
             <img src="<?php echo '/../files/stores/'.$dynamic['url_name'].'/items_img/'.$dynamic['item']['art'].'/'.$dynamic['item']['art'].'_p_2.jpg' ?>" alt="p_2"> 
           </item>
           
		  
		  <?php for($i = 3 ; $i <= $dynamic['item']['img'] ; $i++){ ?>
           
            <item>
            <img src="<?php echo '/../files/stores/'.$dynamic['url_name'].'/items_img/'.$dynamic['item']['art'].'/'.$dynamic['item']['art'].'_p_'.$i.'.jpg' ?>" alt="<?php echo 'p_'.$i ?>"> 
           </item>
          
		<?php }?>
           
       </board>
   
       <board id="about_item" class="no_mob"  price = "<?php echo $dynamic['item']['price'] * $assistant['rate']; ?>">   
           
          <art >
              <static_s><?php echo $static['content']['ART']; ?>:</static_s> <dynamic_s><?php echo $dynamic['item']['art']; ?></dynamic_s>
          </art>
           
           <name>
               <?php echo $dynamic['item']['name']; ?>
           </name>
		   
		    <?php if($dynamic['item']['category_self'] != Config::DB_SCREENING){ ?>
    
          <price >
		  <?php if($dynamic['item']['discount'] > 0){ ?>  
            <item class="discount">
                <?php echo  number_format( (($dynamic['item']['price'] * 100) / ( 100 - $dynamic['item']['discount'])) * $assistant['rate'], 2, '.', ' ').' '.$assistant['currency'] ?>
              </item>
			<?php }?> 
              <item class="price">
				<?php echo  number_format($dynamic['item']['price'] * $assistant['rate'], 2, '.', ' ').' '.$assistant['currency'] ?>
              </item>
			
           </price>
          <div class="clearfix"></div>
		  
		  <form class="buy_product_form" method="post">   
		
		  <input type="hidden" name="what" value="buy_product">
		  <input type="hidden" name="art" value="<?php echo $dynamic['item']['art']; ?>">
		  <input type="hidden" name="name" value="<?php echo $dynamic['item']['name']; ?>">
		  <input type="hidden" name="price" value="<?php echo $dynamic['item']['price']; ?>">
		  <input type="hidden" name="discount" value="<?php echo $dynamic['item']['discount']; ?>">

          <?php if($dynamic['item']['options'] != ''){ ?>  
            <options class="on_mob">
				<?php echo $dynamic['item']['options'];?>
            </options>
          <?php }?> 
		  
          <actions class="on_mob">
              <item>
             <button class="buy_product"><?php echo $static['buttons']['BUY']; ?></button>
              </item>
			  
			</form>  
			  
              <item>
              <ask><?php echo $static['content']['ASK_QUESTION']; ?></ask>
              </item>
          </actions>
		  
		   <description class="on_mob"> 
               <item>
                <?php echo nl2br($dynamic['item']['description']);?>
               </item>
            </description>
		  
		  <?php }else{?>
		  
			<unavailable>
				(<?php echo $static['content']['UNAVAILABLE_ITEM']; ?>)
			</unavailable>
		  
		  <?php }?>

           
          
       
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
		 
            <button class=""><?php echo $common['buttons']['PROCEED']; ?></button>
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
  <script src="../../../../library/js/photo_gallery/imageviewer.min.js"></script>
  <script src="../../../../library/js/lemongrab/lemongrab.js"></script> 
    
  <script src="../../../../static/COMMON/COMMON.js"></script>
        
  <script type="text/javascript">

$(document).ready(function(){
    
    
/******buy_product*********/
    
    
$('.buy_product').on('click', function(e){
     e.preventDefault();   
     var $this =  $(this);
    
    if($this.hasClass('disabled')){
        return false;
    }
    
    var count_items = Number($('cart amount').html());
    
    if(count_items >= 10){
        Assistant.dialogBoard('<logo><?php echo $static['content']['CART_IS_CROWDED']; ?></logo><interact><a target="_blank" href="/cart"><button><?php echo $static['buttons']['PAY_ITEMS']; ?></button></a></interact>', 'pay_items');
        return false();
    }
    
    var form = $this.closest('.buy_product_form');
    var data = form.serialize();
    
    
                            $.ajax({
                                url:  window.location.href,
                                type: 'POST',
                                dataType: 'json', 
                                data: data, 
                                cache: false,
                                beforeSend: function(data) {
                                    $this.addClass('disabled');
                                    
                                    $('cart amount').animate({ color: 'rgba(255, 128, 0, 0.87)',
                                                               marginTop: '-5px',    
                                                               marginLeft: '-4px',    
                                                               paddingTop: '10px',    
                                                               paddingLeft: '10px',    
                                                               paddingRight: '10px',    
                                                               height: '30px',    
                                                               opacity: '0',    
                                                             }, 200, function(){
                                        
                                        $(this).animate({ color: '#ffffff',
                                                               marginTop: '4px',    
                                                               marginLeft: '0px',    
                                                               paddingTop: '5px',    
                                                               paddingLeft: '6px',    
                                                               paddingRight: '6px',    
                                                               height: '20px',    
                                                               opacity: '1',    
                                                             } ,200).html(++count_items);                
                                    });
                                   
                                   
                                },
                                success: function(data){ 
                                    
                                    if (data['error']){ 
                                        Assistant.greenBoard('<div>'+data['error']+'</div>', 'red');
		       		                 } 
                                    
                                     if (data['flag'] == 'ok'){
              
                                         
                                        var name = $('#about_item name').html();
                                        var price = $('#about_item .price').html();
                                        var discount = $('#about_item .discount').html();
                                        var art = $('#about_item art dynamic_s').html();
                                        var store = location.href.split('/')[3];
                                         
                                        var element = '<item store="'+store+'" art=""><delete class="hidden">&#10005;</delete><a href="/'+store+'/item/'+art+'"><photo><div><img src="../../../../files/stores/'+store+'/items_img_min/'+art+'/p_1.gif"></div></photo><what style="margin-left:4px;"><name>'+name+'</name><price><actual price ="">'+price+'</actual>';
                                        
                                        if(discount){
                                            element += '<discount discount ="">'+discount+'</discount>';
                                        }
      
                                          element += '</price></what></a></item>';

                                          element = $(element);
                                         
                                         
             /*
                                        $(element).hover(function(){
                                             $(this).find('delete').toggleClass('hidden');
                                         }, 
                                                               function(){
                                             $(this).find('delete').toggleClass('hidden');
                                         });  
    
                                         $(element).find('delete').on('click', function(){
                                             
                                             var $this = $(this);
                                             var alias = $(this).parent().attr('alias');
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
                                                   if(cart_amount>0){
                                                       $('#cart order').animate({marginTop: '300px', opacity: '0'}, 300, function(){
                                                           var common_price = Number($('#cart common_price').attr('price'));
                                                           var item_ptice = Number($this.parent().find('price').attr('price'));
                                                           var currency = $('#cart currency').attr('currency');
                                                           var actual = common_price-item_ptice;
                                                           $('#cart common_price').attr('price', actual);
                                                           $('#cart order dynamic_s').html(Assistant.number_format(actual, 2, '.', ' ')+' '+currency);
                                                           $('#cart order').animate({marginTop: '0px', opacity: '1'}, 200);
                                                        });
                                                   }else{
                                                       $('#cart order').animate({marginTop: '300px', opacity: '0'}, 300).remove();
                                                   }    
                                    
                                    
                                                    },
                                               success: function(data){ 
                                                   if (data['error']){ 
                                                     Assistant.greenBoard('<div>'+data['error']+'</div>', 'red');
                                                   } 
                                    
                                                    Assistant.deleteCookie(alias);
                                                    $this.parent().animate({opacity:'0'}, 140).slideUp(140); 
                                     
                                                   //Assistant.greenBoard('<div>'+data['message']+'</div>', 'green');  
                                        
                                               },
                                               error: function (xhr, ajaxOptions, thrownError){ 
                                                   Assistant.greenBoard('<div>BACKEND_MISTAKE</div>', 'red');
                                               },
                                               complete: function(data) {
                  
                                               }
                                           });   
                                         });
                                         
       */                                    
                                            $('#cart no_items').remove();
                                            $('#cart items').prepend(element);
                                            $('#mob_cart').prepend(element.clone());
                                         
                                        
                                        $('#cart order').animate({marginTop:'400px', opacity: '0'}, 200, function(){
                                            
                                             var common_price = Number($('#cart common_price').attr('price'));
                                             var currency = $('#cart currency').attr('currency');
                                             var item_ptice = Number($('#about_item').attr('price'));
                                             var actual = common_price+item_ptice;
                                             $('#cart common_price').attr('price', actual); 
  
                                             actual = Assistant.number_format(actual, 2, '.', ' ');
                                             actual = actual+' '+currency;
                                             //alert(actual);
                                            
                                             $(this).removeClass('d_none').find('dynamic_s').html(actual);
                                            
                                             $(this).animate({marginTop:'0px', opacity: '1'}, 200);
                                        });
                                         
		       		                 }
                                    
                                     //Assistant.greenBoard('<div>'+data['message']+'</div>', 'red');
                                    
                                    setTimeout(function(){
                                     location.reload();   
                                    }, 400);   
                                   
                                    
                                },
                                error: function (xhr, ajaxOptions, thrownError) { 
                                    Assistant.greenBoard('<div><?php echo $common['js']['BACKEND_MISTAKE']; ?></div>', 'red');
                                },
                                complete: function(data) {
                                    setTimeout(function(){ $this.removeClass('disabled');}, 1000);  
                                    
                                }
                            });          
    
})
    
    
/*******GALLERY***/
    
    $(function () {
    var viewer = ImageViewer();
    $('#photo_item img').click(function () {
        var imgSrc = this.src,
            highResolutionImage = imgSrc;
 
        viewer.show(imgSrc, highResolutionImage);
    });
});
    
    
/*********ASK QUESTION ***********/
    
    $('ask').on('click', function(){
        
        var login = $('info').attr('login');
        
        if(login == 'true'){
             Assistant.dialogBoard('<logo><?php echo $dynamic['item']['name']; ?></logo><screen><form method="post" what="ask_question"><input hidden="" type="text" name="art" value="<?php echo $dynamic['item']['art']; ?>"><input hidden="" type="text" name="name" value="<?php echo $dynamic['item']['name']; ?>"><input hidden="" type="text" name="store" value="<?php echo $dynamic['url_name']; ?>"><textarea name="message" placeholder="<?php echo $static['content']['ASK_QUESTION_PLACEHOLDER']; ?>" data-rule-valid=\'[{"key":"regexp","value":"(?=.{1,500})"}]\'></textarea></form></screen><interact><button><?php echo $static['buttons']['SEND_QUESTION']; ?></button></interact>', 'ask_question');
            
/*******AJAX ASK QUESTION *******/
    
    $('.ask_question button').on('click', function(){
     $this = $(this);
     $parent = $this.closest('dilogboard');
    
       var form = $parent.find('form');
     
       form.lemongrab();
       if(form.isValid()){   
      
       var what = form.attr('what'); 
          
       var data = form.serialize();
       data += '&what='+what; 

                            $.ajax({
                                url:  window.location.href,
                                type: 'POST',
                                dataType: 'json', 
                                data: data, 
                                cache: false,
                                beforeSend: function(data) {
                                    $this.addClass('disabled');
                                    Assistant.goLoad( $parent, 'on', 1000);
                                },
                                success: function(data){ 
                                    if (data['error']){ 
                                        Assistant.greenBoard('<div>'+data['error']+'</div>', 'red');
		       		                 } else { 
                                         $('body curtain').trigger('click');
                                         Assistant.greenBoard('<div>'+data['message']+'</div>', 'green');  
                                        
                                     }
                                },
                                error: function (xhr, ajaxOptions, thrownError) { 
                                    Assistant.greenBoard('<div><?php echo $common['js']['BACKEND_MISTAKE']; ?></div>', 'red');
                                },
                                complete: function(data) {
                                    setTimeout(function(){ $this.removeClass('disabled');}, 1000);  
                                    Assistant.goLoad( $parent, 'off', 1000);   
                                }
                            });      
               
     }
    
 });   
            
        }else{
            
             Assistant.dialogBoard('<logo><?php echo $static['content']['ASK_QUESTION_LOGIN']; ?></logo><interact><a target="_blank" href="/profile"><button><?php echo $static['buttons']['ASK_QUESTION_LOGIN']; ?></button></a></interact>', 'ask_question_login');
        
			$('.ask_question_login button').on('click', function(){
			$('body curtain').trigger('click');
			});
		}     
       
    });
    

/********FLOATING DESCRIPTION*******/
    
    
(function(){
var a = document.querySelector('#about_item'), b = null, K = null, Z = 0, P = 0, N = 0;  // если у P ноль заменить на число, то блок будет прилипать до того, как верхний край окна браузера дойдёт до верхнего края элемента, если у N — нижний край дойдёт до нижнего края элемента. Может быть отрицательным числом
window.addEventListener('scroll', Ascroll, false);
document.body.addEventListener('scroll', Ascroll, false);
function Ascroll() {
  var Ra = a.getBoundingClientRect(),
      R1bottom = document.querySelector('#photo_item').getBoundingClientRect().bottom;
  if (Ra.bottom < R1bottom) {
    if (b == null) {
      var Sa = getComputedStyle(a, ''), s = '';
      for (var i = 0; i < Sa.length; i++) {
        if (Sa[i].indexOf('overflow') == 0 || Sa[i].indexOf('padding') == 0 || Sa[i].indexOf('border') == 0 || Sa[i].indexOf('outline') == 0 || Sa[i].indexOf('box-shadow') == 0 || Sa[i].indexOf('background') == 0) {
          s += Sa[i] + ': ' +Sa.getPropertyValue(Sa[i]) + '; '
        }
      }
      b = document.createElement('div');
      b.className = "stop";
      b.style.cssText = s + ' box-sizing: border-box; width: ' + a.offsetWidth + 'px;';
      a.insertBefore(b, a.firstChild);
      var l = a.childNodes.length;
      for (var i = 1; i < l; i++) {
        b.appendChild(a.childNodes[1]);
      }
      a.style.height = b.getBoundingClientRect().height + 'px';
      a.style.padding = '0';
      a.style.border = '0';
    }
    var Rb = b.getBoundingClientRect(),
        Rh = Ra.top + Rb.height,
        W = document.documentElement.clientHeight -50,
        R1 = Math.round(Rh - R1bottom),
        R2 = Math.round(Rh - W);
    if (Rb.height > W) {
      if (Ra.top < K) {  // скролл вниз
        if (R2 + N > R1) {  // не дойти до низа
           
          if (Rb.bottom - W + N <= 10) {  // подцепиться
            b.className = 'sticky';
            b.style.top = W - Rb.height - N + 'px';
            Z = N + Ra.top + Rb.height - W;
          } else {
            b.className = 'stop';
            b.style.top = - Z + 'px';
          }
        } else {
          b.className = 'stop';
          b.style.top = - R1 +'px';
          Z = R1;
        }
      } else {  // скролл вверх
        if (Ra.top - P < 0) {  // не дойти до верха
          if (Rb.top - P >= 0) {  // подцепиться
            b.className = 'sticky';
            b.style.top = P + 'px';
            Z = Ra.top - P;
          } else {
            b.className = 'stop';
            b.style.top = - Z + 'px';
          }
        } else {
          b.className = '';
          b.style.top = '';
          Z = 0;
        }
      }
      K = Ra.top;
    } else {
      if ((Ra.top - P) <= 0) {
        if ((Ra.top - P) <= R1) {
          b.className = 'stop';
          b.style.top = - R1 +'px';
        } else {
          b.className = 'sticky';
          b.style.top = P + 'px';
        }
      } else {
        b.className = '';
        b.style.top = '';
      }
    }
    window.addEventListener('resize', function() {
      a.children[0].style.width = getComputedStyle(a, '').width
    }, false);
  }
}
})();
    
    
    
    

(function(){
var a = document.querySelector('#photo_item'), b = null, K = null, Z = 0, P = 0, N = 0;  // если у P ноль заменить на число, то блок будет прилипать до того, как верхний край окна браузера дойдёт до верхнего края элемента, если у N — нижний край дойдёт до нижнего края элемента. Может быть отрицательным числом
window.addEventListener('scroll', Ascroll, false);
document.body.addEventListener('scroll', Ascroll, false);
function Ascroll() {
  var Ra = a.getBoundingClientRect(),
      R1bottom = document.querySelector('#about_item').getBoundingClientRect().bottom;
  if (Ra.bottom < R1bottom) {
    if (b == null) {
      var Sa = getComputedStyle(a, ''), s = '';
      for (var i = 0; i < Sa.length; i++) {
        if (Sa[i].indexOf('overflow') == 0 || Sa[i].indexOf('padding') == 0 || Sa[i].indexOf('border') == 0 || Sa[i].indexOf('outline') == 0 || Sa[i].indexOf('box-shadow') == 0 || Sa[i].indexOf('background') == 0) {
          s += Sa[i] + ': ' +Sa.getPropertyValue(Sa[i]) + '; '
        }
      }
      b = document.createElement('div');
      b.className = "stop";
      b.style.cssText = s + ' box-sizing: border-box; width: ' + a.offsetWidth + 'px;';
      a.insertBefore(b, a.firstChild);
      var l = a.childNodes.length;
      for (var i = 1; i < l; i++) {
        b.appendChild(a.childNodes[1]);
      }
      a.style.height = b.getBoundingClientRect().height + 'px';
      a.style.padding = '0';
      a.style.border = '0';
    }
    var Rb = b.getBoundingClientRect(),
        Rh = Ra.top + Rb.height,
        W = document.documentElement.clientHeight ,
        R1 = Math.round(Rh - R1bottom),
        R2 = Math.round(Rh - W);
    if (Rb.height > W) {
      if (Ra.top < K) {  // скролл вниз
        if (R2 + N > R1) {  // не дойти до низа
           
          if (Rb.bottom - W + N <= 10) {  // подцепиться
            b.className = 'sticky';
            b.style.top = W - Rb.height - N + 'px';
            Z = N + Ra.top + Rb.height - W;
          } else {
            b.className = 'stop';
            b.style.top = - Z + 'px';
          }
        } else {
          b.className = 'stop';
          b.style.top = - R1 +'px';
          Z = R1;
        }
      } else {  // скролл вверх
        if (Ra.top - P < 0) {  // не дойти до верха
          if (Rb.top - P >= 0) {  // подцепиться
            b.className = 'sticky';
            b.style.top = P + 'px';
            Z = Ra.top - P;
          } else {
            b.className = 'stop';
            b.style.top = - Z + 'px';
          }
        } else {
          b.className = '';
          b.style.top = '';
          Z = 0;
        }
      }
      K = Ra.top;
    } else {
      if ((Ra.top - P) <= 0) {
        if ((Ra.top - P) <= R1) {
          b.className = 'stop';
          b.style.top = - R1 +'px';
        } else {
          b.className = 'sticky';
          b.style.top = P + 'px';
        }
      } else {
        b.className = '';
        b.style.top = '';
      }
    }
    window.addEventListener('resize', function() {
      a.children[0].style.width = getComputedStyle(a, '').width
    }, false);
  }
}
})();
    

});
      
  </script>

  </body>
  
</html>