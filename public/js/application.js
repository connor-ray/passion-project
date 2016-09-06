$(document).ready(function () {

  // ajax related artist call///////
  $(".flipper").on("submit", ".artist_search", function(event) {
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

    $.ajax({
      method: 'post',
      url: '/artist',
      data: {name: name}
    })
    .done(function(response){
      $("#ra_placement").replaceWith(response);
    })
  });

  $("")

  // $(".back").on("submit", ".artist_search", function(event) {
  //   event.preventDefault();
  //   var stuff = $(event).serialize();
  //   var name = this.name.value;

  //   $.ajax({
  //     method: 'post',
  //     url: '/artist',
  //     data: {name: name}
  //   })
  //   .done(function(response){
  //     $("#ra_placement").replaceWith(response);
  //   })
  // });
  // ajax related artist call///////

  $(".save_button").submit(function(event) {
    event.preventDefault();

    $
  });

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

  // flip artist display container////////////
  $(".flip-button").on("click", function() {
    $("#flipper_box").toggleClass("flip-container");
  });
  // flip artist display container////////////

  // hide menu button////////////
  $(".open_btn").click( function(){
    $(".open_btn").addClass("hide");
  });

  $(".closebtn").click( function(){
    $(".open_btn").removeClass("hide");
  });
  // hide menu button////////////

  // hide/show search bar////////////
  $(".find_artist").click( function() {
    $("#search_input").toggleClass("hide");
  });
  // hide/show search bar////////////


});

// Nav bar open/close ////////
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
// Nav bar open/close ////////
