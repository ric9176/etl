// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require masonry/jquery.masonry
//= require masonry/jquery.imagesloaded.min
//= require_tree .

var fadeInOnScroll = function(position, element, speed){
  $(document).ready(function() {
    /* Every time the window is scrolled ... */
    $(window).scroll( function(){
      /* Check the location of each desired element */
      $(position).each( function(i){
        var bottom_of_object = $(this).offset().top + $(this).outerHeight();
        var bottom_of_window = $(window).scrollTop() + $(window).height();
        /* If the object is completely visible in the window, fade it it */
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
