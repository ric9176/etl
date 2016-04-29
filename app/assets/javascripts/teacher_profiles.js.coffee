$ ->
  $('#teachers').imagesLoaded ->
    $('#teachers').masonry
      itemSelector: '.box'
      isFitWidth: true
