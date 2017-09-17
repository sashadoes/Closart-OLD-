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
        <title>Profile</title>

<style type="text/css">
/************content************/
content{
    display: block;
    width: 70%;
    margin: auto;
    margin-top: 140px;
   
}

content board{
    display: block;
}

board section {
    display: block;
}

#favorites{
    display: block;
   width: 1000px;
    margin: auto;
    text-align: right;
    margin-bottom: 50px;
}


#favorites item {
    display: inline-block;
    margin: 5px;
    font-family: Times New Roman !important;
   
   
}

#favorites item a{
    font-size: 1.6em;
 
}
#favorites item a:hover{
    border-bottom: 2px solid black;
}
#news{
   
   display: block;
   width: 700px;
    margin: auto;
    margin-bottom: 50px;
   
    text-align: center;
}
#news img{
   width: 100%;
}


/*********MOBILE********/

@media screen and (max-width: 1200px) {
     
    #favorites{
    
        width: 800px;
    }
   
}

@media screen and (max-width: 1000px) {
  
    content{
    width: 900px;
    margin: auto;
  
}
    
    #favorites{
        margin-top: 30px;
        text-align: center;
    }
 
}
                       
</style>
<link rel="stylesheet" href="../../../../static/COMMON/COMMON.CSS">
</head>
	
<body>
                 
<mob>
            <header class="absolute">
                <l_menu><img src="../../../../static/img/menu.svg"></l_menu>
                <tite_mob>Profile</tite_mob>
                <r_menu><img src="../../../../static/img/doots.svg"></r_menu>
            </header>
            
            <search><magnifire><img src="../../../../static/img/magnifire.svg">
			</magnifire><input type="text" placeholder="<?php echo $static['tools']['SEARCH']; ?>"></search>
        </mob>
   
        
<header class="no_mob absolute ">
       
        <tite class="absolute no_mob"><a href="/">CLOSART</a> / <a href="">PROFILE</a></tite>
        
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
                  
                 <board id="favorites">
                    
                     <section class="items">
                     <item><a href="">Lui</a>,</item>
                     <item><a href="">Pivivarova</a>,</item>
                     <item><a href="">Tony</a>,</item>
                     <item><a href="">Asxotaxist</a>,</item>
                     <item><a href="">Bbak</a>,</item>
                     <item><a href="">Shoe</a>,</item>
                     <item><a href="">Plastic Dima</a>,</item>
                     <item><a href="">Roberto davalli</a>,</item>
                     <item><a href="">Roalli</a>,</item>
                     <item><a href="">Lui</a>,</item>
                     <item><a href="">Pivivarova</a>,</item>
                     <item><a href="">Tony</a>,</item>
                     <item><a href="">Asxotaxist</a>,</item>
                     <item><a href="">Bbak</a>,</item>
                     <item><a href="">Shoe</a>,</item>
                     <item><a href="">Plastic Dima</a>,</item>
                     <item><a href="">Roberto davalli</a>,</item>
                     <item><a href="">Roalli</a>,</item>
                     <item><a href="">Lui</a>,</item>
                     <item><a href="">Pivivarova</a>,</item>
                     <item><a href="">Tony</a>,</item>
                     <item><a href="">Asxotaxist</a>,</item>
                     <item><a href="">Bbak</a>,</item>
                     <item><a href="">Shoe</a>,</item>
                     <item><a href="">Plastic Dima</a>,</item>
                     <item><a href="">Roberto davalli</a>,</item>
                     <item><a href="">Roalli</a>,</item>
                     <item><a href="">Lui</a>,</item>
                     <item><a href="">Pivivarova</a>,</item>
                     <item><a href="">Tony</a>,</item>
                     <item><a href="">Asxotaxist</a>,</item>
                     <item><a href="">Bbak</a>,</item>
                     <item><a href="">Shoe</a>,</item>
                     <item><a href="">Plastic Dima</a>,</item>
                     <item><a href="">Roberto davalli</a>,</item>
                     <item><a href="">Roalli</a>,</item>
                     <item><a href="">Lui</a>,</item>
                     <item><a href="">Pivivarova</a>,</item>
                     <item><a href="">Tony</a>,</item>
                     <item><a href="">Asxotaxist</a>,</item>
                     <item><a href="">Bbak</a>,</item>
                     <item><a href="">Shoe</a>,</item>
                     <item><a href="">Plastic Dima</a>,</item>
                     <item><a href="">Roberto davalli</a>,</item>
                     <item><a href="">Roalli</a></item>
                     </section>
                 </board>
                 
          </static>
          
          
          <dynamic>
               
              
              <board id="news">   
                 
                  <section class="items">
                  <item><img src="https://pp.vk.me/c837320/v837320205/9bbb/sOJtp1QEzWQ.jpg"></item>
                  <item><img src="https://pp.vk.me/c837320/v837320205/937a/bE_S5uKKgtk.jpg"></item>
                  <item><img src="https://pp.vk.me/c622017/v622017205/469e3/3vlSnFH8cds.jpg"></item>
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
        $('ul .profile-news').addClass('show');   
    }
    menuShow();	
  

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
				      Assistant.setTimeout( function(){window.location.href = '/profile'}, 200);
		         },
		       error: function (xhr, ajaxOptions, thrownError) { 
		              Assistant.greenBoard('<div><?php echo $static['js']['BACKEND_MISTAKE']; ?></div>', 'red');
		         },
		       complete: function(data) {
		             
		         }}); 
    
});    
   

});
      
  </script>

  </body>
  
</html>