$(document).ready(function(){
    var moviePreviewVisible = false;
    $('.movie-box-poster').click(function(){
      var id = $(this).children(":first").data('id');
      $.ajax({
        url: "/preview_movie",
        type: "get",
        data: { 'movie_id': id }
      }).done(function(movie_preview_response){
        console.log(movie_preview_response)
        $('#movie-preview-container').html(movie_preview_response);
        if(!moviePreviewVisible){
          $('#movie-preview-container').toggle("slide", {direction: "left"});
          moviePreviewVisible = true;
          $('#sidebar').toggle("slide", {direction: "right"});
        };


      });
    });

    $('#toggle-sidebar-button').click(function(){
      $('#sidebar').toggle("slide", {direction: "right"});
      $('#movie-preview-container').toggle("slide", {direction: "left"});
      if(moviePreviewVisible){
         moviePreviewVisible = false;
      }
      else{
        moviePreviewVisible = true;
      };
    });
})