$ ->
  $('#teachers').imagesLoaded ->
    $('#teachers').masonry
      itemSelector: '.teacher_profile_box'
      isFitWidth: true
