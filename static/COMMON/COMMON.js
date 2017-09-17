$(document).ready(function(){

/*****GLOBALS ***/
    
    
/************Menu init***********************/
   
$('menu').slimScroll({
         position: 'left',
         height: '75%',
         railVisible: true,
         alwaysVisible: false,
});   
/************Menu on click***********************/
    
 $('.trigger').on('click', function(){
 	var $this = $(this).parent();
 	if($this.children('ul').hasClass('d_none')){
 		$this.children('ul').removeClass('d_none');
 	}else{
 		$this.find('ul').addClass('d_none');
 	}
 } ); 
    
/*******Cart***********/    

function CartClicker(){ 

$('body').animate({marginLeft:'-=400px'}, 130, 'linear', function(){
$('body').css({overflow:'hidden'}); 
}); 

$('curtain').fadeIn(100); 
//$('.absolute').animate({marginLeft:'-=200px'}, 130);
//$('tools').animate({right:'+=400px'}, 130);
 
$('#cart').toggleClass('d_none').animate({right:'+=400px'},  130, 'linear'); 
    
    
$('curtain').one('click', function(){
$('#cart').animate({right:'-=400px'},  130, 'linear', function(){
    $(this).toggleClass('d_none');
});   
 $('body').animate({marginLeft:'+=400px'},   130, 'linear', function(){
 $('body').css({overflow:'auto'}); 
 });  
// $('.absolute').animate({marginLeft:'+=200px'}, 130);
// $('tools').animate({right:'-=400px'}, 130);
 $('curtain').fadeOut(110);  

});
}    
    
    
$('cart').on('click', CartClicker);    
             
             
  
$('#cart item').hover(function(){
    $(this).find('delete').toggleClass('hidden');
}, 
                       function(){
    $(this).find('delete').toggleClass('hidden');
});  
    
$('#cart delete').on('click', deleteCartItem);   
    
 function deleteCartItem(){
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
                                    $('.mob_cart amount').html(cart_amount); 
                                    
                                if(cart_amount>0){
                                    $('#cart order').animate({marginTop: '300px', opacity: '0'}, 300, function(){
                                        var common_price = Number($('#cart common_price').attr('price'));
                                        var item_ptice = Number($this.parent().find('price').attr('price'));
                                        var currency = $('#cart currency').attr('currency');
                                        var actual = common_price-item_ptice;
                                        $('#cart common_price').attr('price', actual);
                                        $('#cart order dynamic_s').html(Assistant.number_format(actual, 2, '.', ' ')+' '+currency);
                                        $('#mob_cart order dynamic_s').html(Assistant.number_format(actual, 2, '.', ' ')+' '+currency);
                                        $('#cart order').animate({marginTop: '0px', opacity: '1'}, 200);
                                        
                                    });
                                }else{
                                    $('#cart order').animate({marginTop: '300px', opacity: '0'}, 300).remove();
                                    $('#mob_cart order').remove();
                                }    
                                    
                                    
                                },
                                success: function(data){ 
                                    if (data['error']){ 
                                        Assistant.greenBoard('<div>'+data['error']+'</div>', 'red');
		       		                 } 
                                    
                                     Assistant.deleteCookie(alias);
                                     $this.parent().animate({opacity:'0'}, 140).slideUp(140); 
                                     $('#mob_cart item[alias="'+alias+'"]').remove();
                                     
                                     //Assistant.greenBoard('<div>'+data['message']+'</div>', 'green');  
                                        
                                },
                                error: function (xhr, ajaxOptions, thrownError){ 
                                     Assistant.greenBoard('<div>BACKEND_MISTAKE</div>', 'red');
                                },
                                complete: function(data) {
                  
                                }
                            }); 
    
}

/**************GREEN BOARD + dialog Board**********/
    

    window.Assistant = {
    greenBoard : function(what, style){
        var slider = $('<div class="greenSlider gs_'+style+'\">'+what+'</div>').
        one('click',this.greenSliderRemove).
        prependTo('#greenBoard').
        slideDown(100).
        animate({marginLeft:'0px'},500);
        setTimeout(function(){slider.animate({marginLeft:'+=1000px'},500).slideToggle(500, function() {$(this).remove();});}, 15000); 
    },
    greenSliderRemove : function(){
        $(this).slideToggle(150, function(){$(this).remove();}); 
    },
    dialogBoard : function (what, id){
                 var element = $('<dilogBoard class="'+id+'" ><delete>&#10005;</delete>'+what+'</dilogBoard>');
                $('body').css('overflow', 'hidden');
                $('curtain').fadeIn(100); 
                element.appendTo('body').animate({top:'120px'}, 200, 'linear');
                element.find('delete').on('click', function(){
                     $('curtain').trigger('click');
                });
                $('curtain').one('click',function(){
                      $('dilogBoard').animate({top:'-250px'}, 200, 'linear', function(){
                      $(this).remove();
                      $('body').css('overflow', 'auto');
                     });
                      $('curtain').fadeOut(110);
                });
                // element.find('delete').one('click', deleteCartItem);
                 element.find('button').hover(function(){
       
                var height = $(this).css('height');
                var width = $(this).css('width'); 
                $(this).css('height', height).css('width', width);
       
            },function(){});
    },
    setTimeout : function(func, time){ 
                setTimeout(func, time);
    },
    goLoad : function(where , flag, time){
            if (flag == 'off'){
                    setTimeout(function(){Assistant.switchContent(where, 'back');}, time);
            } else {   
                     var height = where.height()+'px';
                     var width =  where.width()+'px';
                     var mTop   = (parseInt(height)/2-50) + 'px';
                     var loader = $('<div class="loading"> <div style=" height:'+ height  +'; width:'+ width  +'; text-align: center;" > <img style=" margin-top:'+ mTop +';" src="http://localhost/static/img/ring-alt.svg"><loading style="display:block; text-align:center; margin-top:8px;">Loading</loading></div></div>');  
                     Assistant.switchContent(where,loader);  
            }
     },
     goItemSuccess : function(where){
             
                     var height = where.height()+'px';
                     var width =  where.width()+'px';
                     var mTop   = (parseInt(height)/2-50) + 'px';
                     var success = $('<div class="success_upload_logo"> <div style=" height:'+ height  +'; width:'+ width  +'; text-align: center;" > <img style=" margin-top:'+ mTop +';" src="http://localhost/static/img/success_item_upload.svg"></div></div>');  
                     Assistant.switchContent(where,success);  
     },
        
    number_format: function (number, decimals, dec_point, thousands_sep) {
                    number = (number + '').replace(/[^0-9+\-Ee.]/g, '');
                    var n = !isFinite(+number) ? 0 : +number,
                    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
                    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
                    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
                            s = '',
                        toFixedFix = function(n, prec) {
                            var k = Math.pow(10, prec);
                            return '' + (Math.round(n * k) / k)
                                .toFixed(prec);
                        };
                        // Fix for IE parseFloat(0.55).toFixed(0) = 0;
                    s = (prec ? toFixedFix(n, prec) : '' + Math.round(n))
                        .split('.');
                    if (s[0].length > 3) {
                        s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
                        }
                    if ((s[1] || '')
                        .length < prec) {
                        s[1] = s[1] || '';
                            s[1] += new Array(prec - s[1].length + 1)
                                .join('0');
                        }
                    return s.join(dec);
    },    
   
    switchContent : function(where, what){
            if (what == 'back'){
                where.find('.sc').remove();
                where.find('.switchContent').removeClass('switchContent');       
            } else {   
                    where.find('.sc').removeClass('sc');
                    where.children().addClass('switchContent'); 
                    where.append($(what).addClass('sc'));     
                }   
    },
        
    setCookie : function(name, value, options) {
        options = options || {};

        var expires = options.expires;

        if (typeof expires == "number" && expires) {
            var d = new Date();
            d.setTime(d.getTime() + expires * 1000);
            expires = options.expires = d;
            }
        if (expires && expires.toUTCString) {
            options.expires = expires.toUTCString();
            }

        value = encodeURIComponent(value);

        var updatedCookie = name + "=" + value;

        for (var propName in options) {
            updatedCookie += "; " + propName;
            var propValue = options[propName];
            if (propValue !== true) {
                updatedCookie += "=" + propValue;
            }
        }

        document.cookie = updatedCookie;
    },    
          
    deleteCookie : function(name){
     
        this.setCookie(name, "", {
            expires: -1
        })
    },    
};

  
/***********Make Order click******/
    
$('order button').on('click', function(){
   location.href = '/cart';
    
}); 
    
/*********** file upload *************/   
    
 $(".photo-upload input[type='file']").change(function(){
         var filename = $(this).val().replace(/.*\\/, "");
         $(this).parent().find("photo_name").html(filename);
});   

 $(".photo-change input[type='file']").change(function(){
         var filename = $(this).val().replace(/.*\\/, "");
         $(this).parent().find("photo_name").html(filename);
}); 
    
   
    
/**********MOBILE********/
    
    
$('l_menu').on('click', function(){ 

$('curtain').fadeIn(100);

var scrollTop = window.pageYOffset ? window.pageYOffset : (document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop);    
$('body').css({position:'fixed', top: '-'+scrollTop+'px'}); 
    
$('#l_menu').toggleClass('d_none').animate({left:'0%', display:'block'},  200, 'linear'); 
    
$('mob header').animate({left:'75%'},  200, 'linear');  
    
$('curtain').one('click', function(){
$('#l_menu').animate({left:'-75%'},  200, 'linear', function(){
    $(this).toggleClass('d_none');
    $('body').css({position:''}).scrollTop(scrollTop);  
}); 
//$('.absolute').animate({left:'0%'}, 130);  
 
 $('mob header').animate({left:'0%'},  200, 'linear');  
 $('curtain').fadeOut(200); 
    
 

});
}); 
    
    
$('r_menu').on('click', function(){ 

$('curtain').fadeIn(100);
   
var scrollTop = window.pageYOffset ? window.pageYOffset : (document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop);    

$('body').css({position:'fixed', top: '-'+scrollTop+'px'}); 
    
$('mob header').animate({left:'-75%'},  200 , 'linear');
$('#r_menu').toggleClass('d_none').animate({right:'0%', display:'block'},  200, 'linear'); 
        
$('curtain').one('click', function(){
$('#r_menu').animate({right:'-75%'},  200, 'linear', function(){
    $(this).toggleClass('d_none');
    $('body').css({position:''}).scrollTop(scrollTop);  
}); 
// $('.absolute').animate({right:'0%'}, 140); 
$('mob header').animate({left:'0%'},   200, 'linear');

 $('curtain').fadeOut(200);  

});
});  
    

$('#r_menu bar item').on('click', function(){
   $('#r_menu bar .active').removeClass('active');
    $(this).addClass('active');
    var board_id = $(this).attr('board_id');
    $('#r_menu board').addClass('d_none');
    $('#'+board_id).removeClass('d_none');
});
    


/****************POP_UP*************/   
    
$('pop_up li').on('click', function(event){
    event.stopPropagation();
    var board = $(this).attr('board');
    $('.interact').removeClass('interact');
    $('#'+board).addClass('interact');
    $('dynamic .on').addClass('d_none');
 $('#'+board).removeClass('d_none').addClass('on');
    $('.pop').toggleClass('h_auto');
    $('pop_up .active').removeClass('active');
    $(this).addClass('active'); 
    $('body').off('click');
    var text = $(this).text();
    $('pop_up .parent dynamic_s').text(text);
   
});

$('pop_up .parent').on('click', function(event){
    event.stopPropagation();
    $('.pop').toggleClass('h_auto');
    $('pop_up .over').removeClass('over');
    $('pop_up .active').addClass('over');
     $('body').one('click', function(){
     $('.pop').toggleClass('h_auto'); 
    });
});
    
    
    $('pop_up li').mouseover(function(){
        $('pop_up .over').removeClass('over');
        $(this).addClass('over');
    });

    
    
/*******change currency*****/    
    $('.set_lang item').on('click', function(){
        
        var lang = $(this).attr('lang');
        
         var data = 'what=set_lang&lang='+lang;
    
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
		       		                 }else{
                                        location.reload();   
                                     } 
                 
                                },
                                error: function (xhr, ajaxOptions, thrownError){ 
                                     Assistant.greenBoard('<div>BACKEND_MISTAKE</div>', 'red');
                                },
                                complete: function(data) {
                  
                                }
                            }); 
    
        
    });    

  
/*******change currency*****/    
    $('.set_currency item').on('click', function(){
        
        var currency = $(this).attr('currency');
        
         var data = 'what=set_currency&currency='+currency;
    
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
		       		                 }else{
                                        location.reload();   
                                     } 
                 
                                },
                                error: function (xhr, ajaxOptions, thrownError){ 
                                     Assistant.greenBoard('<div>BACKEND_MISTAKE</div>', 'red');
                                },
                                complete: function(data) {
                  
                                }
                            }); 
    
        
    });
    
/*******PRETTY BUTTON******/
    
 
/*
   $('button').hover(function(){
       
       var height = $(this).css('height');
       var width = $(this).css('width'); 
       $(this).css('height', height).css('width', width);
       
   },function(){});

*/


});


/*! pace 1.0.0 */
(function(){var a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X=[].slice,Y={}.hasOwnProperty,Z=function(a,b){function c(){this.constructor=a}for(var d in b)Y.call(b,d)&&(a[d]=b[d]);return c.prototype=b.prototype,a.prototype=new c,a.__super__=b.prototype,a},$=[].indexOf||function(a){for(var b=0,c=this.length;c>b;b++)if(b in this&&this[b]===a)return b;return-1};for(u={catchupTime:100,initialRate:.03,minTime:250,ghostTime:100,maxProgressPerFrame:20,easeFactor:1.25,startOnPageLoad:!0,restartOnPushState:!0,restartOnRequestAfter:500,target:"body",elements:{checkInterval:100,selectors:["body"]},eventLag:{minSamples:10,sampleCount:3,lagThreshold:3},ajax:{trackMethods:["GET"],trackWebSockets:!0,ignoreURLs:[]}},C=function(){var a;return null!=(a="undefined"!=typeof performance&&null!==performance&&"function"==typeof performance.now?performance.now():void 0)?a:+new Date},E=window.requestAnimationFrame||window.mozRequestAnimationFrame||window.webkitRequestAnimationFrame||window.msRequestAnimationFrame,t=window.cancelAnimationFrame||window.mozCancelAnimationFrame,null==E&&(E=function(a){return setTimeout(a,50)},t=function(a){return clearTimeout(a)}),G=function(a){var b,c;return b=C(),(c=function(){var d;return d=C()-b,d>=33?(b=C(),a(d,function(){return E(c)})):setTimeout(c,33-d)})()},F=function(){var a,b,c;return c=arguments[0],b=arguments[1],a=3<=arguments.length?X.call(arguments,2):[],"function"==typeof c[b]?c[b].apply(c,a):c[b]},v=function(){var a,b,c,d,e,f,g;for(b=arguments[0],d=2<=arguments.length?X.call(arguments,1):[],f=0,g=d.length;g>f;f++)if(c=d[f])for(a in c)Y.call(c,a)&&(e=c[a],null!=b[a]&&"object"==typeof b[a]&&null!=e&&"object"==typeof e?v(b[a],e):b[a]=e);return b},q=function(a){var b,c,d,e,f;for(c=b=0,e=0,f=a.length;f>e;e++)d=a[e],c+=Math.abs(d),b++;return c/b},x=function(a,b){var c,d,e;if(null==a&&(a="options"),null==b&&(b=!0),e=document.querySelector("[data-pace-"+a+"]")){if(c=e.getAttribute("data-pace-"+a),!b)return c;try{return JSON.parse(c)}catch(f){return d=f,"undefined"!=typeof console&&null!==console?console.error("Error parsing inline pace options",d):void 0}}},g=function(){function a(){}return a.prototype.on=function(a,b,c,d){var e;return null==d&&(d=!1),null==this.bindings&&(this.bindings={}),null==(e=this.bindings)[a]&&(e[a]=[]),this.bindings[a].push({handler:b,ctx:c,once:d})},a.prototype.once=function(a,b,c){return this.on(a,b,c,!0)},a.prototype.off=function(a,b){var c,d,e;if(null!=(null!=(d=this.bindings)?d[a]:void 0)){if(null==b)return delete this.bindings[a];for(c=0,e=[];c<this.bindings[a].length;)e.push(this.bindings[a][c].handler===b?this.bindings[a].splice(c,1):c++);return e}},a.prototype.trigger=function(){var a,b,c,d,e,f,g,h,i;if(c=arguments[0],a=2<=arguments.length?X.call(arguments,1):[],null!=(g=this.bindings)?g[c]:void 0){for(e=0,i=[];e<this.bindings[c].length;)h=this.bindings[c][e],d=h.handler,b=h.ctx,f=h.once,d.apply(null!=b?b:this,a),i.push(f?this.bindings[c].splice(e,1):e++);return i}},a}(),j=window.Pace||{},window.Pace=j,v(j,g.prototype),D=j.options=v({},u,window.paceOptions,x()),U=["ajax","document","eventLag","elements"],Q=0,S=U.length;S>Q;Q++)K=U[Q],D[K]===!0&&(D[K]=u[K]);i=function(a){function b(){return V=b.__super__.constructor.apply(this,arguments)}return Z(b,a),b}(Error),b=function(){function a(){this.progress=0}return a.prototype.getElement=function(){var a;if(null==this.el){if(a=document.querySelector(D.target),!a)throw new i;this.el=document.createElement("div"),this.el.className="pace pace-active",document.body.className=document.body.className.replace(/pace-done/g,""),document.body.className+=" pace-running",this.el.innerHTML='<div class="pace-progress">\n  <div class="pace-progress-inner"></div>\n</div>\n<div class="pace-activity"></div>',null!=a.firstChild?a.insertBefore(this.el,a.firstChild):a.appendChild(this.el)}return this.el},a.prototype.finish=function(){var a;return a=this.getElement(),a.className=a.className.replace("pace-active",""),a.className+=" pace-inactive",document.body.className=document.body.className.replace("pace-running",""),document.body.className+=" pace-done"},a.prototype.update=function(a){return this.progress=a,this.render()},a.prototype.destroy=function(){try{this.getElement().parentNode.removeChild(this.getElement())}catch(a){i=a}return this.el=void 0},a.prototype.render=function(){var a,b,c,d,e,f,g;if(null==document.querySelector(D.target))return!1;for(a=this.getElement(),d="translate3d("+this.progress+"%, 0, 0)",g=["webkitTransform","msTransform","transform"],e=0,f=g.length;f>e;e++)b=g[e],a.children[0].style[b]=d;return(!this.lastRenderedProgress||this.lastRenderedProgress|0!==this.progress|0)&&(a.children[0].setAttribute("data-progress-text",""+(0|this.progress)+"%"),this.progress>=100?c="99":(c=this.progress<10?"0":"",c+=0|this.progress),a.children[0].setAttribute("data-progress",""+c)),this.lastRenderedProgress=this.progress},a.prototype.done=function(){return this.progress>=100},a}(),h=function(){function a(){this.bindings={}}return a.prototype.trigger=function(a,b){var c,d,e,f,g;if(null!=this.bindings[a]){for(f=this.bindings[a],g=[],d=0,e=f.length;e>d;d++)c=f[d],g.push(c.call(this,b));return g}},a.prototype.on=function(a,b){var c;return null==(c=this.bindings)[a]&&(c[a]=[]),this.bindings[a].push(b)},a}(),P=window.XMLHttpRequest,O=window.XDomainRequest,N=window.WebSocket,w=function(a,b){var c,d,e,f;f=[];for(d in b.prototype)try{e=b.prototype[d],f.push(null==a[d]&&"function"!=typeof e?a[d]=e:void 0)}catch(g){c=g}return f},A=[],j.ignore=function(){var a,b,c;return b=arguments[0],a=2<=arguments.length?X.call(arguments,1):[],A.unshift("ignore"),c=b.apply(null,a),A.shift(),c},j.track=function(){var a,b,c;return b=arguments[0],a=2<=arguments.length?X.call(arguments,1):[],A.unshift("track"),c=b.apply(null,a),A.shift(),c},J=function(a){var b;if(null==a&&(a="GET"),"track"===A[0])return"force";if(!A.length&&D.ajax){if("socket"===a&&D.ajax.trackWebSockets)return!0;if(b=a.toUpperCase(),$.call(D.ajax.trackMethods,b)>=0)return!0}return!1},k=function(a){function b(){var a,c=this;b.__super__.constructor.apply(this,arguments),a=function(a){var b;return b=a.open,a.open=function(d,e){return J(d)&&c.trigger("request",{type:d,url:e,request:a}),b.apply(a,arguments)}},window.XMLHttpRequest=function(b){var c;return c=new P(b),a(c),c};try{w(window.XMLHttpRequest,P)}catch(d){}if(null!=O){window.XDomainRequest=function(){var b;return b=new O,a(b),b};try{w(window.XDomainRequest,O)}catch(d){}}if(null!=N&&D.ajax.trackWebSockets){window.WebSocket=function(a,b){var d;return d=null!=b?new N(a,b):new N(a),J("socket")&&c.trigger("request",{type:"socket",url:a,protocols:b,request:d}),d};try{w(window.WebSocket,N)}catch(d){}}}return Z(b,a),b}(h),R=null,y=function(){return null==R&&(R=new k),R},I=function(a){var b,c,d,e;for(e=D.ajax.ignoreURLs,c=0,d=e.length;d>c;c++)if(b=e[c],"string"==typeof b){if(-1!==a.indexOf(b))return!0}else if(b.test(a))return!0;return!1},y().on("request",function(b){var c,d,e,f,g;return f=b.type,e=b.request,g=b.url,I(g)?void 0:j.running||D.restartOnRequestAfter===!1&&"force"!==J(f)?void 0:(d=arguments,c=D.restartOnRequestAfter||0,"boolean"==typeof c&&(c=0),setTimeout(function(){var b,c,g,h,i,k;if(b="socket"===f?e.readyState<2:0<(h=e.readyState)&&4>h){for(j.restart(),i=j.sources,k=[],c=0,g=i.length;g>c;c++){if(K=i[c],K instanceof a){K.watch.apply(K,d);break}k.push(void 0)}return k}},c))}),a=function(){function a(){var a=this;this.elements=[],y().on("request",function(){return a.watch.apply(a,arguments)})}return a.prototype.watch=function(a){var b,c,d,e;return d=a.type,b=a.request,e=a.url,I(e)?void 0:(c="socket"===d?new n(b):new o(b),this.elements.push(c))},a}(),o=function(){function a(a){var b,c,d,e,f,g,h=this;if(this.progress=0,null!=window.ProgressEvent)for(c=null,a.addEventListener("progress",function(a){return h.progress=a.lengthComputable?100*a.loaded/a.total:h.progress+(100-h.progress)/2},!1),g=["load","abort","timeout","error"],d=0,e=g.length;e>d;d++)b=g[d],a.addEventListener(b,function(){return h.progress=100},!1);else f=a.onreadystatechange,a.onreadystatechange=function(){var b;return 0===(b=a.readyState)||4===b?h.progress=100:3===a.readyState&&(h.progress=50),"function"==typeof f?f.apply(null,arguments):void 0}}return a}(),n=function(){function a(a){var b,c,d,e,f=this;for(this.progress=0,e=["error","open"],c=0,d=e.length;d>c;c++)b=e[c],a.addEventListener(b,function(){return f.progress=100},!1)}return a}(),d=function(){function a(a){var b,c,d,f;for(null==a&&(a={}),this.elements=[],null==a.selectors&&(a.selectors=[]),f=a.selectors,c=0,d=f.length;d>c;c++)b=f[c],this.elements.push(new e(b))}return a}(),e=function(){function a(a){this.selector=a,this.progress=0,this.check()}return a.prototype.check=function(){var a=this;return document.querySelector(this.selector)?this.done():setTimeout(function(){return a.check()},D.elements.checkInterval)},a.prototype.done=function(){return this.progress=100},a}(),c=function(){function a(){var a,b,c=this;this.progress=null!=(b=this.states[document.readyState])?b:100,a=document.onreadystatechange,document.onreadystatechange=function(){return null!=c.states[document.readyState]&&(c.progress=c.states[document.readyState]),"function"==typeof a?a.apply(null,arguments):void 0}}return a.prototype.states={loading:0,interactive:50,complete:100},a}(),f=function(){function a(){var a,b,c,d,e,f=this;this.progress=0,a=0,e=[],d=0,c=C(),b=setInterval(function(){var g;return g=C()-c-50,c=C(),e.push(g),e.length>D.eventLag.sampleCount&&e.shift(),a=q(e),++d>=D.eventLag.minSamples&&a<D.eventLag.lagThreshold?(f.progress=100,clearInterval(b)):f.progress=100*(3/(a+3))},50)}return a}(),m=function(){function a(a){this.source=a,this.last=this.sinceLastUpdate=0,this.rate=D.initialRate,this.catchup=0,this.progress=this.lastProgress=0,null!=this.source&&(this.progress=F(this.source,"progress"))}return a.prototype.tick=function(a,b){var c;return null==b&&(b=F(this.source,"progress")),b>=100&&(this.done=!0),b===this.last?this.sinceLastUpdate+=a:(this.sinceLastUpdate&&(this.rate=(b-this.last)/this.sinceLastUpdate),this.catchup=(b-this.progress)/D.catchupTime,this.sinceLastUpdate=0,this.last=b),b>this.progress&&(this.progress+=this.catchup*a),c=1-Math.pow(this.progress/100,D.easeFactor),this.progress+=c*this.rate*a,this.progress=Math.min(this.lastProgress+D.maxProgressPerFrame,this.progress),this.progress=Math.max(0,this.progress),this.progress=Math.min(100,this.progress),this.lastProgress=this.progress,this.progress},a}(),L=null,H=null,r=null,M=null,p=null,s=null,j.running=!1,z=function(){return D.restartOnPushState?j.restart():void 0},null!=window.history.pushState&&(T=window.history.pushState,window.history.pushState=function(){return z(),T.apply(window.history,arguments)}),null!=window.history.replaceState&&(W=window.history.replaceState,window.history.replaceState=function(){return z(),W.apply(window.history,arguments)}),l={ajax:a,elements:d,document:c,eventLag:f},(B=function(){var a,c,d,e,f,g,h,i;for(j.sources=L=[],g=["ajax","elements","document","eventLag"],c=0,e=g.length;e>c;c++)a=g[c],D[a]!==!1&&L.push(new l[a](D[a]));for(i=null!=(h=D.extraSources)?h:[],d=0,f=i.length;f>d;d++)K=i[d],L.push(new K(D));return j.bar=r=new b,H=[],M=new m})(),j.stop=function(){return j.trigger("stop"),j.running=!1,r.destroy(),s=!0,null!=p&&("function"==typeof t&&t(p),p=null),B()},j.restart=function(){return j.trigger("restart"),j.stop(),j.start()},j.go=function(){var a;return j.running=!0,r.render(),a=C(),s=!1,p=G(function(b,c){var d,e,f,g,h,i,k,l,n,o,p,q,t,u,v,w;for(l=100-r.progress,e=p=0,f=!0,i=q=0,u=L.length;u>q;i=++q)for(K=L[i],o=null!=H[i]?H[i]:H[i]=[],h=null!=(w=K.elements)?w:[K],k=t=0,v=h.length;v>t;k=++t)g=h[k],n=null!=o[k]?o[k]:o[k]=new m(g),f&=n.done,n.done||(e++,p+=n.tick(b));return d=p/e,r.update(M.tick(b,d)),r.done()||f||s?(r.update(100),j.trigger("done"),setTimeout(function(){return r.finish(),j.running=!1,j.trigger("hide")},Math.max(D.ghostTime,Math.max(D.minTime-(C()-a),0)))):c()})},j.start=function(a){v(D,a),j.running=!0;try{r.render()}catch(b){i=b}return document.querySelector(".pace")?(j.trigger("start"),j.go()):setTimeout(j.start,50)},"function"==typeof define&&define.amd?define(function(){return j}):"object"==typeof exports?module.exports=j:D.startOnPageLoad&&j.start()}).call(this);




// jQuery autoComplete v1.0.7
// https://github.com/Pixabay/jQuery-autoComplete
!function(e){e.fn.autoComplete=function(t){var o=e.extend({},e.fn.autoComplete.defaults,t);return"string"==typeof t?(this.each(function(){var o=e(this);"destroy"==t&&(e(window).off("resize.autocomplete",o.updateSC),o.off("blur.autocomplete focus.autocomplete keydown.autocomplete keyup.autocomplete"),o.data("autocomplete")?o.attr("autocomplete",o.data("autocomplete")):o.removeAttr("autocomplete"),e(o.data("sc")).remove(),o.removeData("sc").removeData("autocomplete"))}),this):this.each(function(){function t(e){var t=s.val();if(s.cache[t]=e,e.length&&t.length>=o.minChars){for(var a="",c=0;c<e.length;c++)a+=o.renderItem(e[c],t);s.sc.html(a),s.updateSC(0)}else s.sc.hide()}var s=e(this);s.sc=e('<div class="autocomplete-suggestions '+o.menuClass+'"></div>'),s.data("sc",s.sc).data("autocomplete",s.attr("autocomplete")),s.attr("autocomplete","off"),s.cache={},s.last_val="",s.updateSC=function(t,o){if(s.sc.css({top:s.offset().top+s.outerHeight(),left:s.offset().left,width:s.outerWidth()}),!t&&(s.sc.show(),s.sc.maxHeight||(s.sc.maxHeight=parseInt(s.sc.css("max-height"))),s.sc.suggestionHeight||(s.sc.suggestionHeight=e(".autocomplete-suggestion",s.sc).first().outerHeight()),s.sc.suggestionHeight))if(o){var a=s.sc.scrollTop(),c=o.offset().top-s.sc.offset().top;c+s.sc.suggestionHeight-s.sc.maxHeight>0?s.sc.scrollTop(c+s.sc.suggestionHeight+a-s.sc.maxHeight):0>c&&s.sc.scrollTop(c+a)}else s.sc.scrollTop(0)},e(window).on("resize.autocomplete",s.updateSC),s.sc.appendTo("body"),s.sc.on("mouseleave",".autocomplete-suggestion",function(){e(".autocomplete-suggestion.selected").removeClass("selected")}),s.sc.on("mouseenter",".autocomplete-suggestion",function(){e(".autocomplete-suggestion.selected").removeClass("selected"),e(this).addClass("selected")}),s.sc.on("mousedown click",".autocomplete-suggestion",function(t){var a=e(this),c=a.data("val");return(c||a.hasClass("autocomplete-suggestion"))&&(s.val(c),o.onSelect(t,c,a),s.sc.hide()),!1}),s.on("blur.autocomplete",function(){try{over_sb=e(".autocomplete-suggestions:hover").length}catch(t){over_sb=0}over_sb?s.is(":focus")||setTimeout(function(){s.focus()},20):(s.last_val=s.val(),s.sc.hide(),setTimeout(function(){s.sc.hide()},350))}),o.minChars||s.on("focus.autocomplete",function(){s.last_val="\n",s.trigger("keyup.autocomplete")}),s.on("keydown.autocomplete",function(t){if((40==t.which||38==t.which)&&s.sc.html()){var a,c=e(".autocomplete-suggestion.selected",s.sc);return c.length?(a=40==t.which?c.next(".autocomplete-suggestion"):c.prev(".autocomplete-suggestion"),a.length?(c.removeClass("selected"),s.val(a.addClass("selected").data("val"))):(c.removeClass("selected"),s.val(s.last_val),a=0)):(a=40==t.which?e(".autocomplete-suggestion",s.sc).first():e(".autocomplete-suggestion",s.sc).last(),s.val(a.addClass("selected").data("val"))),s.updateSC(0,a),!1}if(27==t.which)s.val(s.last_val).sc.hide();else if(13==t.which||9==t.which){var c=e(".autocomplete-suggestion.selected",s.sc);c.length&&s.sc.is(":visible")&&(o.onSelect(t,c.data("val"),c),setTimeout(function(){s.sc.hide()},20))}}),s.on("keyup.autocomplete",function(a){if(!~e.inArray(a.which,[13,27,35,36,37,38,39,40])){var c=s.val();if(c.length>=o.minChars){if(c!=s.last_val){if(s.last_val=c,clearTimeout(s.timer),o.cache){if(c in s.cache)return void t(s.cache[c]);for(var l=1;l<c.length-o.minChars;l++){var i=c.slice(0,c.length-l);if(i in s.cache&&!s.cache[i].length)return void t([])}}s.timer=setTimeout(function(){o.source(c,t)},o.delay)}}else s.last_val=c,s.sc.hide()}})})},e.fn.autoComplete.defaults={source:0,minChars:3,delay:150,cache:1,menuClass:"",renderItem:function(e,t){t=t.replace(/[-\/\\^$*+?.()|[\]{}]/g,"\\$&");var o=new RegExp("("+t.split(" ").join("|")+")","gi");return'<div class="autocomplete-suggestion" data-val="'+e+'">'+e.replace(o,"<b>$1</b>")+"</div>"},onSelect:function(e,t,o){}}}(jQuery);





/******GLOBAL SEARCH**********/

$('search .global_search').on('focus', function(){
    $('body').css('overflow', 'hidden'); 
   $('tools .tool_icon').animate({opacity: '0'}, 200);    
    
   var focus_holder = $(this).attr('focus_holder');                    
    $(this).attr('placeholder', focus_holder);                             
                                  
});

$('search .global_search').on('blur', function(){
      $('body').css('overflow', 'auto'); 
    $('tools .tool_icon').animate({opacity: '1'}, 200);  
    
    var blur_holder = $(this).attr('blur_holder');                    
    $(this).attr('placeholder', blur_holder);                              
                                  
});


$('search .global_search').autoComplete({
     minChars: 1,
     cache:true,
     source: function(term, suggest){
                    term = term.toLowerCase();
                    var data = 'what=global_search&query='+term;
                    var suggestions = [];
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
		       		                 } else { 
                                        suggestions = data['suggestions'];
                                        suggest(suggestions);
                                     }
                                },
                                error: function (xhr, ajaxOptions, thrownError) { 
                                   
                                },
                                complete: function(data) {
                                  
                                }
                            });      
         
                    
         
                   
                },
    renderItem: function (item, search){
        
        if(item['type'] == 'store'){
            
             search = search.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
            var re = new RegExp("(" + search.split(' ').join('|') + ")", "gi");
            return '<div class="autocomplete-suggestion" data-type="store" data-store="'+item['url_name']+'" data-val="'+item['name']+'"><global_search><str><name>'+item['name'].replace(re, "<b>$1</b>")+'</name><type>(store)</type></str><image><img src="http://localhost/files/stores/'+item['url_name']+'/bio_img/bio_min.jpg"></image></global_search></div>';   
            
        }else if(item['type'] == 'item'){
            
            search = search.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
            var re = new RegExp("(" + search.split(' ').join('|') + ")", "gi");
            return '<div class="autocomplete-suggestion" data-type="item" data-store="'+item['store']+'" data-art="'+item['art']+'" data-val="'+item['name']+'"><global_search><str><name>'+item['name'].replace(re, "<b>$1</b>")+'</name><type>(item)</type></str><image><img src="http://localhost/files/stores/'+item['store']+'/items_img_min/'+item['art']+'/'+item['art']+'_p_1.jpg"></image></global_search></div>';  
            
        }
        
       
    },
    
     onSelect: function(e, term, item){
         
       
         
          if(item.data('type') == 'store'){
            
            location.href = '/'+item.data('store');
            
        }else if(item.data('type') == 'item'){
            
           location.href = '/'+item.data('store')+'/item/'+item.data('art');
            
        }
    }
    

        
 });


$('search .global_search_form').on('submit', function(e){
   e.preventDefault();
    
    var query = $(this).find('.global_search').val();
    if(query.length > 0){
      location.href = '/search/?s='+query;  
    }
    
});

$('.autocomplete-suggestions').hover(function(){
    
   
    
    
}, function(){
    
    
});

 

