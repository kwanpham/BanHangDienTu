function addLoadEvent(func) { if (typeof window.onload != 'function') { window.onload = func; } else { var oldonload = window.onload; window.onload = function() { if (oldonload) { oldonload(); } func(); } } }
addLoadEvent(function(){var Dinamods=new dinamods('dm_tabs_1');Dinamods.setpersist(true);Dinamods.setselectedClassTarget('link');Dinamods.init(0,0);});
addLoadEvent(function(){var Dinamods=new dinamods('dm_tabs_2');Dinamods.setpersist(true);Dinamods.setselectedClassTarget('link');Dinamods.init(0,0);});
addLoadEvent(function(){var Dinamods=new dinamods('dm_tabs_3');Dinamods.setpersist(true);Dinamods.setselectedClassTarget('link');Dinamods.init(0,0);});
addLoadEvent(function(){var Dinamods=new dinamods('dm_tabs_4');Dinamods.setpersist(true);Dinamods.setselectedClassTarget('link');Dinamods.init(0,0);});

jQuery(window).load(function() { 
		var $ = jQuery;
	$('#coin-slider').coinslider({ 
		width: 965, 
		navigation: true, 
		delay: 7000, // delay between images in ms
		height: 300, // height of slider panel
		spw: 7, // squares per width
		sph: 5, // squares per height
		sDelay: 30, // delay beetwen squares in ms
		opacity: 1, // opacity of title and navigation
		titleSpeed: 500, // speed of title appereance in ms
		effect: '', // random, swirl, rain, straight
		navigation: true, // prev next and buttons
		links : true, // show images as links 
		hoverPause: true // pause on hover		
				});	
  
	
	});
//<![CDATA[	if(!cartImageLoaded){	window.addEvent('domready', function(){		var carts = $$( '.addtocart_form' );	if( carts ) {		try {			for (var i=0; i<carts.length; i++){				carts[i].setAttribute('onsubmit','handleAdd2Card(this.id);return false;');			}		} catch(e) {}	}		});	var cartImageLoaded = true;	}	//]]>