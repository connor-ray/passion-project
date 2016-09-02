$(document).ready(function () {
  // $("form").submit(function(event) {
  //   event.preventDefault();
  //   var input = $(this).serialize();

  //   $("#die-container").removeClass("hidden");

  //   $.ajax({
  //     method: 'post',
  //     url: '/rolls',
  //     data: input
  //   })
  //   .done(function(response){
  //     $('.roll').html(response)
  //   })
  // });

  // $(".artist_div").mouseenter(function() {
  //   $(".test-div").addClass("show-div");
  // })

  $(".artist_display").mouseenter(function() {
    $(".test-div").addClass("show-div");
    name = this.value;
    $(".test-div p").replaceWith(`<p>${name}</p>`);
  });

  $(".artist_display").mouseout(function() {
    $(".test-div").removeClass("show-div");
    $(".test-div p").replaceWith("<p></p>");
  });

  $("#flip-button").click(function() {
    $("#flip-button").toggleClass("flip-me");
  });


  // $(".artist_div").mouseout(function() {
  //   $(".test-div").removeClass("show-div");
  // });

});
