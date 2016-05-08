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
