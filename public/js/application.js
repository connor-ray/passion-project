$(document).ready(function () {

  // ajax related artist call///////
  $(".front").on("submit", ".artist_search", function(event) {
    event.preventDefault();
    var stuff = $(event).serialize();
    var name = this.name.value;

    $.ajax({
      method: 'post',
      url: '/artist_circle',
      data: {name: name}
    })
    .done(function(response){
      $("#ra_placement_circle").replaceWith(response);
    })
  });

  $(".back").on("submit", ".artist_search", function(event) {
    event.preventDefault();
    var stuff = $(event).serialize();
    var name = this.name.value;

    $.ajax({
      method: 'post',
      url: '/artist',
      data: {name: name}
    })
    .done(function(response){
      $("#ra_placement").replaceWith(response);
    })
  });


  // ajax related artist call///////

// hover for snowflake///////
  $(".artist_div").mouseenter(function() {
    $(".test-div").addClass("show-div");
  })

  $(".artist_display").mouseenter(function() {
    $(".test-div").addClass("show-div");
    name = this.value;
    $(".test-div p").replaceWith(`<p>${name}</p>`);
  });

  $(".artist_display").mouseout(function() {
    $(".test-div").removeClass("show-div");
    $(".test-div p").replaceWith("<p></p>");
  });

  $(".artist_display").click(function() {
    $(".test-div").removeClass("show-div");
    $(".test-div p").replaceWith("<p></p>");
  });

  $(".artist_div").mouseout(function() {
    $(".test-div").removeClass("show-div");
  });
  // hover for snowflake///////

  $(".flip-button").on("click", function() {
    console.log("hellooo")
    $("#flipper_box").toggleClass("flip-container");
  });



});
