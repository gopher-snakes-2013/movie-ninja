$(document).ready(function(){
  // var pickedMovies = []

  // $('.enqueue-movie-button').click(function(){

  //   $currentMovieBox = $(this).parents('.movie-box')

  //   // if clicked movie is already in pickedMovies
  //   if (pickedMovies.indexOf($currentMovieBox.data('id')) === -1) {

  //     var sideBarTemplate = $currentMovieBox.find('.sidebar-movie-template').clone().removeClass('hidden')
  //     $('#picked-movies').append(sideBarTemplate)

  //     $(this).fadeTo(1,1)

  //     pickedMovies.push($currentMovieBox.data('id'))
  //   }
  // })

  $('#picked-movies').on('click', 'i', function(){
    var movieId = $(this).parent().data('id')
    pickedMovies.splice(pickedMovies.indexOf(movieId), 1)
    $($('[data-id =' + movieId + ']')[0]).find('.enqueue-movie-button').fadeTo(1,.3)
    $(this).parent().remove()
  })
})