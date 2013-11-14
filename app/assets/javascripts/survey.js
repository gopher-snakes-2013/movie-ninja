var Survey = {
  bindEventListeners: function(){
    // use the on syntax, it's preferred
   $('.movie-box-poster').on('click', Movie.previewMovie);
   $('#toggle-sidebar-button').click(Survey.toggleSideBar);
   $('.enqueue-movie-button').click(Survey.addOrRemoveMovieFromSurvey);
   $('#selected-movies').on('click', 'i', Survey.addOrRemoveMovieFromSurvey);
   $("form#new_survey").on("submit", Survey.submitSurvey);
  },

  addOrRemoveMovieFromSurvey: function(event) {
    event.preventDefault();
    var movieId = $(this).data('id');
    if(selectedMovies.indexOf(movieId) === -1) {
      Survey.addMovieToSurvey(movieId);
      if(moviePreviewVisible){
        Survey.toggleSideBar(event);
      };
    }
    else{
      Survey.removeMovieFromSurvey(movieId);
    };
  },

  toggleSideBar: function(event){
    event.preventDefault();
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
      // a better way to solve this is to create a templates hidden div, include this one, clone it, modify it and then inject it.
      $('#selected-movies').append("<div><a href='#'><i class='fa fa-times remove-movie' data-id=" + movieId + "></a></i>" + title + "</div>");
      $('[data-id='+movieId+']').find('.enqueue-movie-button').fadeTo(1,1);
      $('[data-id='+movieId+']').find('.fa-plus-square').addClass('fa-minus-square');
      $('[data-id='+movieId+']').find('.fa-plus-square').removeClass('fa-plus-square');
      selectedMovies.push(movieId);
    };
  },

  removeMovieFromSurvey: function(movieId){
    selectedMovies.splice(selectedMovies.indexOf(movieId), 1);
    $('[data-id='+movieId+']').find('.enqueue-movie-button').fadeTo(1,.4);
    $('[data-id='+movieId+']').find('.fa-minus-square').addClass('fa-plus-square');
    $('[data-id='+movieId+']').find('.fa-minus-square').removeClass('fa-minus-square');
    $('#selected-movies').find('[data-id=' + movieId + ']').parent().parent().remove();
  },

  submitSurvey: function(event){
    event.preventDefault();
    var $form = $(this);
    for (var i in selectedMovies) {
      console.log(selectedMovies[i])
      // a better way to solve this is to create a templates hidden div, include this one, clone it, modify it and then inject it.
      $form.append("<input type='hidden' name='survey[movie_ids][]' value=" + selectedMovies[i] +" />")
    };
    $form.off("submit");
    $form.submit();
  }
};

var Movie = {
  previewMovie: function(event){
    // use remote => true on the link
    event.preventDefault();
    var movieId = $(this).children(":first").data('id')
    $.ajax({
      url: "/preview_movie",
      type: "get",
      data: { 'movie_id': movieId }
    }).done(Movie.renderPreviewedMovie);
  },

  renderPreviewedMovie: function(movie_preview_response){
    $('#movie-preview-container').html(movie_preview_response);
    if(!moviePreviewVisible){
      $('#movie-preview-container').toggle("slide", {direction: "left"});
      moviePreviewVisible = true;
      $('#sidebar').toggle("slide", {direction: "right"});
    };
  }
};

$(document).ready(function(){
  // you're poluting the global namespace with lines 94 & 95
  selectedMovies = [];
  moviePreviewVisible = false;
  Survey.bindEventListeners();
})
