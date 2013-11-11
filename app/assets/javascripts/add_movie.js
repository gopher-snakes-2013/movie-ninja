$(document).ready(function(){
  $('.select-movie').click(function(){
    console.log('click registered')
    var sideBarTemplate = $(this).parent().parent().find('.sidebar-movie-template').clone().removeClass('hidden')
    $('#picked-movies').append(sideBarTemplate)
    $(this).find('i').fadeTo(1,1)
  })
})

