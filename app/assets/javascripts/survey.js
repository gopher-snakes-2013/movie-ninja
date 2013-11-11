$(document).ready(function(){
    $('.movie-box-poster').click(function(){
      var id = $(this).children(":first").data('id');
      $.ajax({
        url: "/preview_movie",
        type: "get",
        data: { 'movie_id': id }
      }).done(function(movie_preview_response){
        console.log(movie_preview_response)
        $('#movie-preview-container').html(movie_preview_response);
      });
      $('#sidebar').toggle(function(){
        $('#sidebar').animate({
          top: '0'
        }, 400);
      }, function(){
      $('#sidebar').animate({
          top: '-4'+$(this).height()
      }, 400);
    });
  })
})