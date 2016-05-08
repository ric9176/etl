$(function() {
  return $('#teachers').imagesLoaded(function() {
    return $('#teachers').masonry({
      itemSelector: '.teacher_profile_box',
      isFitWidth: true
    });
  });
});
