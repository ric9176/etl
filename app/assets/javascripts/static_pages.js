var fadeInOnScroll = function(position, element, speed){
  $(document).ready(function() {
    $(window).scroll( function(){
      $(position).each( function(i){
        var bottom_of_object = $(this).offset().top + $(this).outerHeight();
        var bottom_of_window = $(window).scrollTop() + $(window).height();
        if( bottom_of_window > bottom_of_object ){
          $(element).animate({'opacity':'1'},speed);
        }
      });
    });
  });
};

$(document).ready(function() {
  fadeInOnScroll('.pricing-rate', '.table_one', 500);
  fadeInOnScroll('.pricing-rate', '.table_two', 500);
  fadeInOnScroll('.pricing-rate', '.table_three', 500);
  fadeInOnScroll('.pricing-rate', '.table_three', 500);
});

(function ($) {
  $(document).ready(function(){
	$(function () {
		$(window).scroll(function () {
			if ($(this).scrollTop() > 100) {
				$('.navbar').fadeOut("linear");
			} else {
				$('.navbar').fadeIn("ease-in-out");
			}
		});
	});
});
  }(jQuery));
