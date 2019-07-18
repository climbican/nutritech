jQuery(function($) {'use strict',

	//#main-slider
	$(function(){
		$('#main-slider.carousel').carousel({
			interval: 8000
		});
	});


	// accordian
	$('.accordion-toggle').on('click', function(){
		$(this).closest('.panel-group').children().each(function(){
		$(this).find('>.panel-heading').removeClass('active');
		 });

	 	$(this).closest('.panel-heading').toggleClass('active');
	});

	//Initiat WOW JS
	new WOW().init();

	// portfolio filter
	$(window).load(function(){'use strict';
		var $portfolio_selectors = $('.portfolio-filter >li>a');
		var $portfolio = $('.portfolio-items');
		$portfolio.isotope({
			itemSelector : '.portfolio-item',
			layoutMode : 'fitRows'
		});
		
		$portfolio_selectors.on('click', function(){
			$portfolio_selectors.removeClass('active');
			$(this).addClass('active');
			var selector = $(this).attr('data-filter');
			$portfolio.isotope({ filter: selector });
			return false;
		});
	});

	// Contact form
	var form = $('#main-contact-form');
	form.submit(function(event){
		event.preventDefault();
		var form_status = $('<div class="form_status"></div>');
		$.ajax({
			url: $(this).attr('action'),

			beforeSend: function(){
				form.prepend( form_status.html('<p><i class="fa fa-spinner fa-spin"></i> Email is sending...</p>').fadeIn() );
			}
		}).done(function(data){
			form_status.html('<p class="text-success">' + data.message + '</p>').delay(3000).fadeOut();
		});
	});

	
	//goto top
	$('.gototop').click(function(event) {
		event.preventDefault();
		$('html, body').animate({
			scrollTop: $("body").offset().top
		}, 500);
	});	

	//Pretty Photo
	$("a[rel^='prettyPhoto']").prettyPhoto({
		social_tools: false
	});	
});

//change title and content of gallery page


function changeServicesContent(cat){

	var titles = ['Recent Work',
		'VINYL REPLACEMENT WINDOWS &amp; DOORS: LOWER YOUR HEATING/COOLING COST ',
		'SOLAR SYSTEMS: TURN BACK YOUR ELECTRIC METER',
		'EXTERIOR COATINGS: SAVE ENERGY AND MONEY',
		'RESIDENTIAL ROOFING SERVICES FOR SAN DIEGO HOMEOWNERS'];
	var urlReferences = ['defaultAllRef', 'windowsDoorsRef', 'solarRef', 'texCoteRef'];
	var dataReferences = ['*', '.windowsDoors', '.solar', '.texCote'];
	var bodyText = [];
	var titleId = document.getElementById('recentWorksTitle');
	var bodyId = document.getElementById('recentWorksBodyText');

	bodyText[0] = 'Check out a group of our most recent work.';

	bodyText[1] = '<p><strong>Distinctive Home Improvements in San Diego is proud to to be able to offer our </strong>' +
		'customers Anlin Window Systems; the best vinyl replacement windows and patio doors' +
		'on the market today and at the very best prices.  Vinyl acts as a highly efficient thermal ' +
		'barrier that dramatically reduces your home&#39;s heating and cooling costs.</p>' +
		'<p>We offer FREE WITH EVERY WINDOW: LOW E3 for better UVA and UVB protection,' +
		' ARGON GAS for better insulation, EZ CLEAN coating for cleaner glass and every Anlin ' +
		'window comes with a LIMITED LIFETIME GLASS BREAKAGE WARRANTY! </p>'+
		'<p>You simply cannot do any better than <a href="http://anlin.com/" style="color:#2d7da4;">Anlin Window Systems</a>' +
		' and their  sister company <a href="http://monteverdewindows.com/" style="color:#2d7da4;">Monte Verde Windows and Doors</a></p>';


	bodyText[2] = '<p><strong>DHI Solar Systems</strong> are installed as roof mount or ground mount systems.&#32;' +
		'Our installations of solar panels are configured to produce the most solar energy output from<br> each panel every day of the year.</p>' +
		'<p>Recent legislation has made the <strong>installation of solar panels</strong> an even wiser investment.&#32;' +
		'When your solar panel system produces more electricity than you consume each  month, your power company is required by law ' +
		'to <strong>buy back</strong> the excess power you generated at the same price that you are charged for power!</p>' +
		'<div class="center"><strong>CALL TODAY FOR YOUR FREE 30 POINT ENERGY EVALUATION!<br>(619) 857- 8388</strong></div>'

	bodyText[3] = '<p></p><strong>Distinctive Home Improvements San Diego</strong> offers the finest heat reflective products for the <strong>exterior coating</strong> of your home.&#32;' +
		' Our exterior coatings will not only save you up to 21.9% on cooling costs for your home, but you will also save thousands of dollars over time because you won&#39;t ever need ' +
		'to <strong>repaint</strong> your home.</p>' +
		'<p>Our Exterior coating is 10-20 times thicker than paint and it won&#39;t chip, flake or peel. Not to mention, it has a class A Fire Protection, it&#39;s water repellent ' +
		'and comes with a lifetime manufacturer&#39;s warranty.</p>';

	bodyText[4] = '<p>DHI are pleased to offer San Diego homeowners, professional residential roofing sale and installation.&#32;  Our skilled team of roofing professionals ensures that ' +
		'every home can be both distinctive and functional for years to come.</p>' +
		'<p>Only the best products and materials are used when installing a new roofing system. Below are a few of the roofing types we sell, install and maintain as part of the residential ' +
		'roofing contractor services we offer San Diego homeowners:</p>' +
		'<ul style="text-align:left;">' +
			'<li>Asphalt shingles</li>' +
			'<li>Concrete tile</li>' +
	    	'<li>Clay tile</li>' +
			'<li>Synthetic shakes</li>' +
			'<li>Natural stone slate</li>' +
			'<li>Flat roof materials</li>'
		'</ul>'+
		'<div class="center"><strong>CALL TODAY FOR YOUR FREE 30 POINT ENERGY EVALUATION!<br>(619) 857- 8388</strong></div>';

	titleId.innerHTML = titles[cat];
	bodyId.innerHTML = bodyText[cat];



}
/**
function changeContentFromURL(){
	var vars = window.location.search.substring(1);
	var urlReferences = ['defaultAllRef', 'windowsDoorsRef', 'solarRef', 'texCoteRef'];
	var dataReferences = ['*', '.windowsDoors', '.solar', '.texCote'];
	var pair = vars.split("=");
	console.log('this is pair 0 :: '+pair[0]);
	if(pair[0] == 'serviceContent'){
		changeServicesContent(pair[1]);
		var element = document.getElementById(urlReferences[pair[1]]);
		var defaultElement = document.getElementById('defaultAllRef');
		defaultElement.classList.remove('active');
		element.classList.add('active');

		var $portfolio = $('.portfolio-items');
		$portfolio.isotope({ filter: dataReferences[pair[1]] });
	}

	return(false);

}**/

function changeContentFromURL(match){
	//var vars = window.location.search.substring(1);
	var urlReferences = ['defaultAllRef', 'windowsDoorsRef', 'solarRef', 'texCoteRef', 'roofingRef'];
	var dataReferences = ['*', '.windowsDoors', '.solar', '.texCote', '.roofing'];
	//var pair = vars.split("=");

	console.log('this is pair 0 :: '+match);

	changeServicesContent(match);
	var element = document.getElementById(urlReferences[match]);
	var defaultElement = document.getElementById('defaultAllRef');
	defaultElement.classList.remove('active');
	element.classList.add('active');

	var $portfolio = $('.portfolio-items');
	$portfolio.isotope({ filter: dataReferences[match] });

	return(false);

}
