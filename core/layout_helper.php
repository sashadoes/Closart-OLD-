<?php

class LayoutHelper {
	
	private $DataBase;
	private $Assistant;
	
	public function __construct (){
		
			$this->DataBase = DB::getDBO();
			$this->Assistant = Assistant::getAssistant();

	}
	
	private function getIniFile($file){
		
		$lang = $this->Assistant->getLang();
		
		$ini = parse_ini_file('langs/'.$lang.'/common/'.$file, true);

		if (!$ini ) {
			throw new MyExp('Configuration mistake');
		}else{
			return $ini;
		}
				
	}
	
	public function getCommonIni(){
		
		$params = $this->getIniFile('common.ini');
		return $params;
		
	}
	
	public function getItemOptions($value){
		
		$result = '';
		if(strlen($value) > 3){
			
			$options = substr($result, 0, -1*strlen(Config::OPTION_SEPARATOR_END));
			$options = explode(Config::OPTION_SEPARATOR_END, $value);
				$i=0;
				
			for($j = 0, $leng = (count($options)-1) ; $j < $leng ; $j++ ){	
			
				$i++;
				$option = explode(Config::OPTION_SEPARATOR, $options[$j]);
			
					$name = array_shift($option);
					$array = explode(Config::FIRST_SEPARATOR, $option[0]);
					
					$result .= '<item><label>'.$name.':</label>
								<input hidden type="text" name="name_op_'.$i.'" value="'.$name.'">
								<select name="op_'.$i.'">';
					
					
					foreach($array as $opt){
						$result .= '<option>'.$opt.'</option>';
					}
				
				$result .= '</select></item>';
			}
			
		}
		return $result;
		
	}
	
	
	public function getCart(){
		
		$cookies = $this->Assistant->getCookies();
		$cart_items_arts = $this->Assistant->getCatItemsArts();
		$cart_items_data = $this->Assistant->getCatItemsData();
		$currency = $this->Assistant->getCurrency();
		$rate = $this->Assistant->getCurrencyRate();
		
			if (!isset($cookies['t_visit'])){
				
				//обновляем корзину ;
				 
				setcookie ('t_visit', 'on', time() + (3600 * 96), '/');
				 
			}
			
			$all = 0;
		
			$items .= '<items>';
			
		for( $i = count($cart_items_arts)-1 ; $i>=0 ; $i-- ){
			
			$format = ($cookies[$cart_items_arts[$i]]);
			$item = json_decode($format, true);
		
			$items .= '<item store="'.$item['store'].'" art="'.$item['art'].'" alias="'.$cart_items_arts[$i].'">
                    <delete class="hidden">&#10005;</delete>
                    <a href="/'.$item['store'].'/item/'.$item['art'].'">
                    <photo>
                        <div>
                        <img src="http://'.$_SERVER['SERVER_NAME'].'/files/stores/'.$item['store'].'/items_img_min/'.$item['art'].'/'.$item['art'].'_p_1.jpg">
                        </div>
                    </photo>
                    <what>
                        <name>'.$item['name'].'</name>
                        <price price="'.($item['price'])* $rate.'">
                            <actual price ="'.$item['price'].'">'.number_format(($item['price'] )* $rate, 2, '.', ' ').' '.$currency.' </actual>';
							if($item['discount'] > 0){
								$items .= '<discount discount ="'.$item['discount'].'">'.number_format((($item['price'] * 100) / ( 100 - $item['discount']))* $rate, 2, '.', ' ').' '.$currency.'</discount>';
							}

                           $items .=  
                        '</price>
                    </what> 
                  </a>
                </item>' ;
				
			$all += ($item['price'])* $rate;
		
		}
			$items .= '<common_price class="d_none" price="'.$all.'"></common_price>';	
			$items .= '<currency class="d_none" currency="'.$currency.'"></currency>';	
			$items .= '</items>';
			$items .= '<order>
						<dynamic_s>'.number_format($all, 2, '.', ' ').' '.$currency.'</dynamic_s>';
		
		return $items;
	
	}	
	
	

	public function getMenuMore(){
		
		$params = $this->getIniFile('menu_more.ini');
		
		$menu = '<li><a href="/info/about">'.$params['ABOUT'].'</a></li>
				<li><a href="/info/customers">'.$params['CUSTOMERS'].'</a></li>
				<li><a href="/info/stores">'.$params['STORES'].'</a></li>
				<li class="d_none"><a href="/info/payment">'.$params['PAYMENT'].'</a></li>
				<li class="d_none"><a href="/info/delivery">'.$params['DELIVERY'].'</a></li>
				<li><a href="/info/policy">'.$params['RULES'].'</a></li>
				<li><a href="/info/contacts">'.$params['CONTACTS'].'</a></li>';
				
		return $menu;
	}
	
	public function getMenuProfile(){
		
		$params = $this->getIniFile('menu_profile.ini');
		
		$messages_flag = $this->Assistant->getMessagesFlags('user');
		
		$menu = '<li class="profile-news"><a href="/profile/news">'.$params['NEWS'].'</a></li>
				<li class="profile-orders"><a href="/profile/orders">'.$params['ORDERS'].'</a></li>
				<li class="profile-messages"><a href="/profile/messages">'.$params['MESSAGES'].'<flag class="messages_flag_'.$messages_flag.' emphasis">+'.$messages_flag.'</flag></a></li>
				<li class="profile-settings"><a href="/profile/settings">'.$params['SETTINGS'].'</a></li>
				<li><a class="emphasis log_out" what="log_out">'.$params['EXIT'].'</a></li>';
				
		return $menu;
			
	}
	
	public function getMenuManagementStore($stores){
		
		$params = $this->getIniFile('menu_management.ini');
		
		$menu .= '<li class="management-all"><a href="/management/orders">'.$params['ALL'].'</a></li>';
		
		foreach($stores as $store){
		
		$menu .= ' <li><a class="trigger">'.mb_strtoupper($store['name']).'</a>
					<ul class="d_none">
						<li class="management-'.$store['url_name'].'-configuration"><a href="/management/'.$store['url_name'].'/configuration">'.$params['CONFIGURATION'].'</a></li>
						<li class="management-'.$store['url_name'].'-orders"><a href="/management/'.$store['url_name'].'/orders">'.$params['ORDERS'].'</a></li>
					</ul>
				</li>';
				
		}

		$menu .= '<li><a class="emphasis log_out" what="log_out">'.$params['EXIT'].'</a></li>';
				
		return $menu;
		
		
		
	}
	
	public function getMenuAdminStore($store){
		
		$params = $this->getIniFile('menu_store.ini');
		
		$messages_flag = $this->Assistant->getMessagesFlags('store');
		
		$menu = '<li class="admin-news"><a href="/'.$store.'/admin/news">'.$params['NEWS'].'</a></li>
				<li class="admin-orders"><a href="/'.$store.'/admin/orders">'.$params['ORDERS'].'</a></li>
				<li class="admin-messages"><a href="/'.$store.'/admin/messages">'.$params['MESSAGES'].'<flag class="messages_flag_'.$messages_flag.' emphasis">+'.$messages_flag.'</flag></a></li>
				<li class="admin-items"><a href="/'.$store.'/admin/items/new">'.$params['ITEMS'].'</a></li>
				<li class="admin-marketing"><a href="/'.$store.'/admin/marketing">'.$params['MARKETING'].'</a></li>
				<li class="admin-settings"><a href="/'.$store.'/admin/settings">'.$params['SETTINGS'].'</a></li>
				<li class="admin-help"><a href="/'.$store.'/admin/help">'.$params['HELP'].'</a></li>
				<li><a class="emphasis log_out" what="log_out">'.$params['EXIT'].'</a></li>';
				
		return $menu;
		
		
		
	}

	
	public function getMenuMain(){
		
		$params = $this->getIniFile('menu_main.ini');
		
		$menu = '<li><a class="emphasis trigger news" href="/news">'.$params['NEWS'].'</a></li>
          <li class="exclusive"><a class="trigger" href="/shop/exclusive">'.$params['EXCLUSIVE'].'</a></li>
		  
          <li><a class="trigger">'.$params['WOMAN'].'</a>
		  
			<ul class="d_none">
				<li><a class="trigger">'.$params['OUTERWEAR'].'</a> 
					<ul class="d_none">
						<li class="woman-outwear-winter"><a href="/shop/woman-outwear-winter">'.$params['WINTER'].'</a></li>
						<li class="woman-outwear-springautumn"><a href="/shop/woman-outwear-springautumn">'.$params['SPRING_AUTUMN'].'</a></li>
						<li class="woman-outwear-cloak"><a href="/shop/woman-outwear-cloak">'.$params['CLOAK'].'</a></li>
						<li class="woman-outwear-bombers"><a href="/shop/woman-outwear-bombers">'.$params['BOMBERS'].'</a></li>
						<li class="woman-outwear-leather"><a href="/shop/woman-outwear-leather">'.$params['LEATHER'].'</a></li>
					</ul>
				</li>
				
				<li><a class="trigger">'.$params['SUITS'].'</a>
					<ul class="d_none">
						<li class="woman-suits-sets"><a href="/shop/woman-suits-sets">'.$params['SETS'].'</a></li>
						<li class="woman-suits-elements"><a href="/shop/woman-suits-elements">'.$params['ELEMENTS'].'</a></li>
					</ul>
				</li>
				
				<li><a class="trigger">'.$params['DRESSES'].'</a>
					<ul class="d_none">
						<li class="woman-dresses-coctail"><a href="/shop/woman-dresses-coctail">'.$params['COCTAIL'].'</a></li>
						<li class="woman-dresses-everyday"><a href="/shop/woman-dresses-everyday">'.$params['EVERYDAY'].'</a></li>
					</ul>
				</li>
				
				<li><a class="trigger">'.$params['TOPS'].'</a>
					<ul class="d_none">
						<li class="woman-tops-shirts"><a href="/shop/woman-tops-shirts">'.$params['SHIRT'].'</a></li>
						<li class="woman-tops-bluses"><a href="/shop/woman-tops-bluses">'.$params['BLUSES'].'</a></li>
					</ul>
				</li>
						
				<li><a class="trigger">'.$params['TROUSERS'].'</a>
					<ul class="d_none">
						<li class="woman-trousers-jeans"><a href="/shop/woman-trousers-jeans">'.$params['JEANS'].'</a></li>
						<li class="woman-trousers-cloth"><a href="/shop/woman-trousers-cloth">'.$params['CLOTH'].'</a></li>
					</ul>
				</li>
				
				<li><a class="trigger">'.$params['SKIRTS'].'</a>
					<ul class="d_none">
						<li class="woman-skirts-long"><a href="/shop/woman-skirts-long">'.$params['LONG'].'</a></li>
						<li class="woman-skirts-short"><a href="/shop/woman-skirts-short">'.$params['SHORT'].'</a></li>
					</ul>
				</li>
			
				<li><a class="trigger">'.$params['T-SHIRTS'].'</a>
					<ul class="d_none">
						<li class="woman-tshirts-monochrome"><a href="/shop/woman-tshirts-monochrome">'.$params['MONOCHROME'].'</a></li>
						<li class="woman-tshirts-print"><a href="/shop/woman-tshirts-print">'.$params['PRINT'].'</a></li>
						<li class="woman-tshirts-shirts"><a href="/shop/woman-tshirts-shirts">'.$params['SHIRTS'].'</a></li>
					</ul>
				</li>
				
				<li><a class="trigger">'.$params['SWEATSHIRTS'].'</a>
					<ul class="d_none">
						<li class="woman-sweatshirts-knitwear"><a href="/shop/woman-sweatshirts-knitwear">'.$params['KNITWEAR'].'</a></li>
						<li class="woman-sweatshirts-hoodies"><a href="/shop/woman-sweatshirts-hoodies">'.$params['HOODIES'].'</a></li>
						<li class="woman-sweatshirts-svitshot"><a href="/shop/woman-sweatshirts-svitshot">'.$params['SVITSHOT'].'</a></li>
						<li class="woman-sweatshirts-cardigans"><a href="/shop/woman-sweatshirts-cardigans">'.$params['CARDIGANS'].'</a></li>
					</ul>
				</li>
				
				<li><a class="trigger">'.$params['SHOES'].'</a>
					<ul class="d_none">
						<li class="woman-shoes-winter"><a href="/shop/woman-shoes-winter">'.$params['WINTER'].'</a></li>
						<li class="woman-shoes-springautumn"><a href="/shop/woman-shoes-springautumn">'.$params['SPRING_AUTUMN'].'</a></li>
						<li class="woman-shoes-sneakers"><a href="/shop/woman-shoes-sneakers">'.$params['SNEAKERS'].'</a></li>
					</ul>
				</li>
				
				<li><a class="trigger">'.$params['BAGS'].'</a>
					<ul class="d_none">
						<li class="woman-bags-leather"><a href="/shop/woman-bags-leather">'.$params['LEATHER'].'</a></li>
						<li class="woman-bags-cloth"><a href="/shop/woman-bags-cloth">'.$params['CLOTH'].'</a></li>
						<li class="woman-bags-poket"><a href="/shop/woman-bags-poket">'.$params['POCKET'].'</a></li>
					</ul>
				</li>
				
				<li><a class="trigger">'.$params['ACCESSORIES'].'</a>
					<ul class="d_none">
						<li class="woman-accessories-hats"><a href="/shop/woman-accessories-hats">'.$params['HATS'].'</a></li>
						<li class="woman-accessories-scarvesandbelts"><a href="/shop/woman-accessories-scarvesandbelts">'.$params['SCARVES_AND_BELTS'].'</a></li>
						<li class="woman-accessories-bijouterie"><a href="/shop/woman-accessories-bijouterie">'.$params['BIJOUTERIE'].'</a></li>
						<li class="woman-accessories-glasses"><a href="/shop/woman-accessories-glasses">'.$params['GLASSES'].'</a></li>
						<li class="woman-accessories-socks"><a href="/shop/woman-accessories-socks">'.$params['SOCKS'].'</a></li>
						<li class="woman-accessories-other"><a href="/shop/woman-accessories-other">'.$params['OTHER'].'</a></li>
					</ul>
				</li>
				
				<li><a class="trigger">'.$params['LINGERIE'].'</a>
					<ul class="d_none">
						<li class="woman-lingerie-brasandpanties"><a href="/shop/woman-lingerie-brasandpanties">'.$params['BRAS_AND_PANTIES'].'</a></li>
						<li class="woman-lingerie-swimwear"><a href="/shop/woman-lingerie-swimwear">'.$params['SWIMWEAR'].'</a></li>
					</ul>
				</li>
				
				<li><a class="trigger">'.$params['HOMEWEAR'].'</a>
					<ul class="d_none">
						<li class="woman-homewear-clothers"><a href="/shop/woman-homewear-clothers">'.$params['CLOTHES'].'</a></li>
						<li class="woman-homewear-shoes"><a href="/shop/woman-homewear-shoes">'.$params['SHOES'].'</a></li>
						<li class="woman-homewear-other"><a href="/shop/woman-homewear-other">'.$params['OTHER'].'</a></li>
					</ul>
				</li>
         </ul>
        </li>
		
		
		<li><a class="trigger">'.$params['MAN'].'</a>
		  
			<ul class="d_none">
				<li><a class="trigger">'.$params['OUTERWEAR'].'</a> 
					<ul class="d_none">
						<li class="man-outwear-winter"><a href="/shop/man-outwear-winter">'.$params['WINTER'].'</a></li>
						<li class="man-outwear-springautumn"><a href="/shop/man-outwear-springautumn">'.$params['SPRING_AUTUMN'].'</a></li>
						<li class="man-outwear-cloak"><a href="/shop/man-outwear-cloak">'.$params['CLOAK'].'</a></li>
						<li class="man-outwear-bombers"><a href="/shop/man-outwear-bombers">'.$params['BOMBERS'].'</a></li>
						<li class="man-outwear-leather"><a href="/shop/man-outwear-leather">'.$params['LEATHER'].'</a></li>
					</ul>
				</li>
				
				<li><a class="trigger">'.$params['SUITS'].'</a>
					<ul class="d_none">
						<li class="man-suits-sets"><a href="/shop/man-suits-sets">'.$params['SETS'].'</a></li>
						<li class="man-suits-elements"><a href="/shop/man-suits-elements">'.$params['ELEMENTS'].'</a></li>
					</ul>
				</li>
				
				<li><a class="trigger">'.$params['SHIRT'].'</a>
					<ul class="d_none">
						<li class="man-shirts-monochrome"><a href="/shop/man-shirts-monochrome">'.$params['SHIRT'].'</a></li>
						<li class="man-shirts-print"><a href="/shop/man-shirts-print">'.$params['BLUSES'].'</a></li>
					</ul>
				</li>
						
				<li><a class="trigger">'.$params['TROUSERS'].'</a>
					<ul class="d_none">
						<li class="man-trousers-jeans"><a href="/shop/man-trousers-jeans">'.$params['JEANS'].'</a></li>
						<li class="man-trousers-cloth"><a href="/shop/man-trousers-cloth">'.$params['CLOTH'].'</a></li>
					</ul>
				</li>
				
				<li><a class="trigger">'.$params['T-SHIRTS'].'</a>
					<ul class="d_none">
						<li class="man-tshirts-monochrome"><a href="/shop/man-tshirts-monochrome">'.$params['MONOCHROME'].'</a></li>
						<li class="man-tshirts-print"><a href="/shop/man-tshirts-print">'.$params['PRINT'].'</a></li>
						<li class="man-tshirts-shirts"><a href="/shop/man-tshirts-shirts">'.$params['SHIRTS'].'</a></li>
					</ul>
				</li>
				
				<li><a class="trigger">'.$params['SWEATSHIRTS'].'</a>
					<ul class="d_none">
						<li class="man-sweatshirts-knitwear"><a href="/shop/man-sweatshirts-knitwear">'.$params['KNITWEAR'].'</a></li>
						<li class="man-sweatshirts-hoodies"><a href="/shop/man-sweatshirts-hoodies">'.$params['HOODIES'].'</a></li>
						<li class="man-sweatshirts-svitshot"><a href="/shop/man-sweatshirts-svitshot">'.$params['SVITSHOT'].'</a></li>
						<li class="man-sweatshirts-cardigans"><a href="/shop/man-sweatshirts-cardigans">'.$params['CARDIGANS'].'</a></li>
					</ul>
				</li>
				
				<li><a class="trigger">'.$params['SHOES'].'</a>
					<ul class="d_none">
						<li class="man-shoes-winter"><a href="/shop/man-shoes-winter">'.$params['WINTER'].'</a></li>
						<li class="man-shoes-springautumn"><a href="/shop/man-shoes-springautumn">'.$params['SPRING_AUTUMN'].'</a></li>
						<li class="man-shoes-sneakers"><a href="/shop/man-shoes-sneakers">'.$params['SNEAKERS'].'</a></li>
					</ul>
				</li>
				
				<li><a class="trigger">'.$params['BAGS'].'</a>
					<ul class="d_none">
						<li class="man-bags-leather"><a href="/shop/man-bags-leather">'.$params['LEATHER'].'</a></li>
						<li class="man-bags-cloth"><a href="/shop/man-bags-cloth">'.$params['CLOTH'].'</a></li>
						<li class="man-bags-poket"><a href="/shop/man-bags-poket">'.$params['POCKET'].'</a></li>
					</ul>
				</li>
				
				<li><a class="trigger">'.$params['ACCESSORIES'].'</a>
					<ul class="d_none">
						<li class="man-accessories-hats"><a href="/shop/man-accessories-hats">'.$params['HATS'].'</a></li>
						<li class="man-accessories-scarvesandbelts"><a href="/shop/man-accessories-scarvesandbelts">'.$params['SCARVES_AND_BELTS'].'</a></li>
						<li class="man-accessories-bijouterie"><a href="/shop/man-accessories-bijouterie">'.$params['BIJOUTERIE'].'</a></li>
						<li class="man-accessories-glasses"><a href="/shop/man-accessories-glasses">'.$params['GLASSES'].'</a></li>
						<li class="man-accessories-socks"><a href="/shop/man-accessories-socks">'.$params['SOCKS'].'</a></li>
						<li class="man-accessories-other"><a href="/shop/man-accessories-other">'.$params['OTHER'].'</a></li>
					</ul>
				</li>
				
				<li><a class="trigger">'.$params['LINGERIE'].'</a>
					<ul class="d_none">
						<li class="man-underwear-pants"><a href="/shop/man-underwear-pants">'.$params['BRAS_AND_PANTIES'].'</a></li>
						<li class="man-underwear-swimwear"><a href="/shop/man-underwear-swimwear">'.$params['SWIMWEAR'].'</a></li>
					</ul>
				</li>
				
				<li><a class="trigger">'.$params['HOMEWEAR'].'</a>
					<ul class="d_none">
						<li class="man-homewear-clothers"><a href="/shop/man-homewear-clothers">'.$params['CLOTHES'].'</a></li>
						<li class="man-homewear-shoes"><a href="/shop/man-homewear-shoes">'.$params['SHOES'].'</a></li>
						<li class="man-homewear-other"><a href="/shop/man-homewear-other">'.$params['OTHER'].'</a></li>
					</ul>
				</li>
         </ul>
        </li>
		
		 <li><a class="trigger">'.$params['ARTS'].'</a>
		 
			<ul class="d_none">
				<li><a class="trigger">'.$params['PAINTING'].'</a>
					<ul class="d_none">
						<li class="arts-painting-paint"><a href="/shop/arts-painting-paint">'.$params['PAINT'].'</a></li>
						<li class="arts-painting-print"><a href="/shop/arts-painting-print">'.$params['PRINT'].'</a></li>
					</ul>
				</li>
				<li><a class="trigger">'.$params['INTERIOR'].'</a>
					<ul class="d_none">
						<li class="arts-interior-furniture"><a href="/shop/arts-interior-furniture">'.$params['FURNITURE'].'</a></li>
						<li class="arts-interior-decor"><a href="/shop/arts-interior-decor">'.$params['DECOR'].'</a></li>
						<li class="arts-interior-other"><a href="/shop/arts-interior-other">'.$params['OTHER'].'</a></li>
					</ul>
				</li>
				
			</ul>
		 </li>';
		 
		 return $menu;
		
	}
}


?>