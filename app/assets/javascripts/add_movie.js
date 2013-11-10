$(document).ready(function(){
  $('.movie-box-poster').click(function(){
    console.log('click registered')
    var title = this.nextElementSibling.innerText
    $('#picked-movies ul').append("<li>" + title + "</li>")
  })
})