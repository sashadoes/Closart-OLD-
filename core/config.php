<?php
if (PUMP === 'Og3'){

abstract class Config {

	const SECRET = "Ga%^&*L_4oi7g/\]`3=5^*(&";
	const ADM_EMAIL = "admin@example.com";
	
	/*********БАЗА ДАННЫХ ********/
	const DB_HOST = "mysql.hostinger.com.ua";
	const DB_USER = "u368413050_sasha";
	const DB_PASSWORD = "IWH75dVv0wN";
	const DB_NAME = 'u368413050_62jje';
	const DB_PREFIX = "jj2y_";
	const DB_KEY = "eF";
	const DB_SYM_QUERY = "?";

	/************ КОНФИГУРАЦИЯ ***********/
	const LANGS = array('ru', 'en');
	const CURRENCYS = array('usd', 'rub', 'uah');
	
	/************ ДЕНЬГИ ***********/
	const UAH_RATE = 25;
	const RUB_RATE = 60;
	const USD_RATE = 1;
	
	/************КРЕДИТЫ*************/
	
	const CREDIT_PRICE = 0.1;
	
	/******** РАЗДЕЛИТЕЛИ ПАРСИНГ ********/
	
	const LANG_SEPARATOR = '*|L|*';
	
	const FIRST_SEPARATOR = ',';
	const SECOND_SEPARATOR = '*|*';
	const THIRD_SEPARATOR = '*||*';
	
	const OPTION_SEPARATOR = ':';
	const OPTION_SEPARATOR_END = ';';
	
	const DELIVERY_MENAGEMENT_OPTION_SEPARATOR = ':';
	const DELIVERY_MENAGEMENT_ITEM_SEPARATOR = '+';
	
	/***********CART**********/
	
	const DELIVERY_NOT_SUPPORTED = 'NO';
	
	/***********DB SLANG**********/
	
	const DB_NONE = 'n';
	const DB_SCREENING = 'screening';
	
	
	/*******ITEM ANTI PROMO********/
	
	const PROMO_YEAR = 2018;
	const PROMO_SCREENING = '0';
	const PROMO_SETUP = '1';
	
	/*******COSTS*********/
	
	const PRICE_PROMO_TOP = 3;
	
	const PRICE_MAILING_W_M = 200;
	const PRICE_MAILING_A = 300;
	
	const PRICE_BANNER_P3 = 100;
	const PRICE_BANNER_P15 = 200;
	const PRICE_BANNER_P30 = 300;
	
	
	/********MARKETING_TABLE**********/
	
	const BANNER_M_TYPE = 'm';
	const BANNER_F_TYPE = 'b';
	
	/********STATUSES**********/
	
	const JUST_STATUS = 'n';
	const APPROVED_STATUS = 'a';
	const FAILURE_STATUS = 'f';
	const EXECUTED_STATUS = 'x';
	
	
	
	/******** БЕЗОПАСНОСТЬ ********/
	
	const STORE_ADMIN_CATEGORIES = array('news', 'orders', 'messages', 'items', 'marketing', 'settings', 'help');
	
	const ADMIN_URL = 'n76893vn893n489n768n6138651367n63n7063';
	
	const MAIN_CATEGORIES = array( 'exclusive',
							
						/*******woman*******/	
						
						'woman-outwear-winter',
						'woman-outwear-springautumn',
						'woman-outwear-cloak',
						'woman-outwear-bombers',
						'woman-outwear-leather',
						
						'woman-suits-sets',
						'woman-suits-elements',
						
						'woman-dresses-coctail',
						'woman-dresses-everyday',
						
						'woman-tops-shirts',
						'woman-tops-bluses',
						
						'woman-trousers-jeans',
						'woman-trousers-cloth',
						
						'woman-skirts-long',
						'woman-skirts-short',
						
						'woman-tshirts-monochrome',
						'woman-tshirts-print',
						'woman-tshirts-shirts',
						
						'woman-sweatshirts-knitwear',
						'woman-sweatshirts-hoodies',
						'woman-sweatshirts-svitshot',
						'woman-sweatshirts-cardigans',
						
						'woman-shoes-winter',
						'woman-shoes-springautumn',
						'woman-shoes-sneakers',
						
						'woman-bags-leather',
						'woman-bags-cloth',
						'woman-bags-poket',
						
						'woman-accessories-hats',
						'woman-accessories-scarvesandbelts',
						'woman-accessories-bijouterie',
						'woman-accessories-glasses',
						'woman-accessories-socks',
						'woman-accessories-other',
						
						'woman-lingerie-brasandpanties',
						'woman-lingerie-swimwear',
						
						'woman-homewear-clothers',
						'woman-homewear-shoes',
						'woman-homewear-other',
						
						/*******man*******/
						
						'man-outwear-winter',
						'man-outwear-springautumn',
						'man-outwear-cloak',
						'man-outwear-bombers',
						'man-outwear-leather',
						
						'man-suits-sets',
						'man-suits-elements',
						
						'man-shirts-monochrome',
						'man-shirts-print',
						
						'man-trousers-jeans',
						'man-trousers-cloth',
						
						'man-tshirts-monochrome',
						'man-tshirts-print',
						'man-tshirts-shirts',
						
						'man-sweatshirts-knitwear',
						'man-sweatshirts-hoodies',
						'man-sweatshirts-svitshot',
						'man-sweatshirts-cardigans',
						
						'man-shoes-winter',
						'man-shoes-spring-Autumn',
						'man-shoes-sneakers',
						
						'man-bags-leather',
						'man-bags-cloth',
						'man-bags-poket',
						
						'man-accessories-hats',
						'man-accessories-scarvesandbelts',
						'man-accessories-bijouterie',
						'man-accessories-glasses',
						'man-accessories-socks',
						'man-accessories-other',
						
						'man-underwear-pants',
						'man-underwear-swimwear',
						
						'man-homewear-clothers',
						'man-homewear-shoes',
						'man-homewear-other',
						
						
						/*******arts*******/
						
						'arts-painting-paint',
						'arts-painting-print',
						
						'arts-interior-furniture',
						'arts-interior-decor',
						'arts-interior-other',
						);
	
	
	const MAIN_MENU = array( 'EXCLUSIVE',
							
						/*******woman*******/	
						
						'WOMAN/Outwear/Winter',
						'WOMAN/Outwear/Spring-Autumn',
						'WOMAN/Outwear/Cloak',
						'WOMAN/Outwear/Bombers',
						'WOMAN/Outwear/Leather',
						
						'WOMAN/Suits/Sets',
						'WOMAN/Suits/Elements',
						
						'WOMAN/Dresses/Coctail',
						'WOMAN/Dresses/Everyday',
						
						'WOMAN/Tops/Shirts',
						'WOMAN/Tops/Bluses',
						
						'WOMAN/Trousers/Jeans',
						'WOMAN/Trousers/Cloth',
						
						'WOMAN/Skirts/Long',
						'WOMAN/Skirts/Short',
						
						'WOMAN/T-Shirts/Monochrome',
						'WOMAN/T-Shirts/Print',
						'WOMAN/T-Shirts/Shirts',
						
						'WOMAN/Sweatshirts/Knitwear',
						'WOMAN/Sweatshirts/Hoodies',
						'WOMAN/Sweatshirts/Svitshot',
						'WOMAN/Sweatshirts/Cardigans',
						
						'WOMAN/Shoes/Winter',
						'WOMAN/Shoes/Spring-Autumn',
						'WOMAN/Shoes/Sneakers',
						
						'WOMAN/Bags/Leather',
						'WOMAN/Bags/Cloth',
						'WOMAN/Bags/Poket',
						
						'WOMAN/Accessories/Hats',
						'WOMAN/Accessories/Scarves-and-Belts',
						'WOMAN/Accessories/Bijouterie',
						'WOMAN/Accessories/Glasses',
						'WOMAN/Accessories/Socks',
						'WOMAN/Accessories/Other',
						
						'WOMAN/Lingerie/Bras-and-Panties',
						'WOMAN/Lingerie/Swimwear',
						
						'WOMAN/Homewear/Clothers',
						'WOMAN/Homewear/Shoes',
						'WOMAN/Homewear/Other',
						
						/*******man*******/
						
						'MAN/Outwear/Winter',
						'MAN/Outwear/Spring-Autumn',
						'MAN/Outwear/Cloak',
						'MAN/Outwear/Bombers',
						'MAN/Outwear/Leather',
						
						'MAN/Suits/Sets',
						'MAN/Suits/Elements',
						
						'MAN/Shirts/Monochrome',
						'MAN/Shirts/Print',
						
						'MAN/Trousers/Jeans',
						'MAN/Trousers/Cloth',
						
						'MAN/T-Shirts/Monochrome',
						'MAN/T-Shirts/Print',
						'MAN/T-Shirts/Shirts',
						
						'MAN/Sweatshirts/Knitwear',
						'MAN/Sweatshirts/Hoodies',
						'MAN/Sweatshirts/Svitshot',
						'MAN/Sweatshirts/Cardigans',
						
						'MAN/Shoes/Winter',
						'MAN/Shoes/Spring-Autumn',
						'MAN/Shoes/Sneakers',
						
						'MAN/Bags/Leather',
						'MAN/Bags/Cloth',
						'MAN/Bags/Poket',
						
						'MAN/Accessories/Hats',
						'MAN/Accessories/Scarves-and-Belts',
						'MAN/Accessories/Bijouterie',
						'MAN/Accessories/Glasses',
						'MAN/Accessories/Socks',
						'MAN/Accessories/Other',
						
						'MAN/Underwear/Pants',
						'MAN/Underwear/Swimwear',
						
						'MAN/Homewear/Clothers',
						'MAN/Homewear/Shoes',
						'MAN/Homewear/Other',
						
						
						/*******arts*******/
						
						'ARTS/Painting/Paint',
						'ARTS/Painting/Print',
						
						'ARTS/Interior/Furniture',
						'ARTS/Interior/Decor',
						'ARTS/Interior/Other',
	
						
						);
	
	
}

}else{
	
	throw new MyExp('Config is failed');
}

?>