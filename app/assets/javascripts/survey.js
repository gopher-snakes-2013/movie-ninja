var Survey = {
  bindEventListeners: function(){
   $('.movie-box-poster').click(function(event){
      event.preventDefault();
      Survey.previewMovie($(this).children(":first").data('id'));
    });
   $('#toggle-sidebar-button').click(function(event){
      event.preventDefault();
      Survey.toggleSideBar();
    });
   $('.enqueue-movie-button').click(function(event){
      event.preventDefault();
      var movieId = $(this).data('id');
      if(selectedMovies.indexOf(movieId) === -1) {
        Survey.addMovieToSurvey(movieId);
      }
      else{
        Survey.removeMovieFromSurvey(movieId);
      };
   });
   $('#selected-movies').on('click', 'i', function(event){
      event.preventDefault();
      Survey.removeMovieFromSurvey($(this).data('id'));
   });
  },

  previewMovie: function(movieId){
    $.ajax({
      url: "/preview_movie",
      type: "get",
      data: { 'movie_id': movieId }
    }).done(function(movie_preview_response){
      $('#movie-preview-container').html(movie_preview_response);
      if(!moviePreviewVisible){
        $('#movie-preview-container').toggle("slide", {direction: "left"});
        moviePreviewVisible = true;
        $('#sidebar').toggle("slide", {direction: "right"});
      };
    });
  },

  toggleSideBar: function(){
    $('#sidebar').toggle("slide", {direction: "right"});
    $('#movie-preview-container').toggle("slide", {direction: "left"});
    if(moviePreviewVisible){
       moviePreviewVisible = false;
    }
    else{
      moviePreviewVisible = true;
    };
  },

  addMovieToSurvey: function(movieId){
    if(selectedMovies.indexOf(movieId) === -1) {
      var title = $(".movie-box[data-id=" + movieId + "] > .movie-box-title").text();
      $('#selected-movies').append("<div><a href='#'><i class='fa fa-times remove-movie' data-id=" + movieId + "></a></i>" + title + "</div>");
      $('[data-id='+movieId+']').find('.enqueue-movie-button').fadeTo(1,1);
      selectedMovies.push(movieId);
    };
  },

  removeMovieFromSurvey: function(movieId){
    selectedMovies.splice(selectedMovies.indexOf(movieId), 1);
    $('[data-id='+movieId+']').find('.enqueue-movie-button').fadeTo(1,.4);
    $('#selected-movies').find('[data-id=' + movieId + ']').parent().parent().remove();
  }
};

$(document).ready(function(){
  moviePreviewVisible = false;
  selectedMovies = [];
  Survey.bindEventListeners();
})