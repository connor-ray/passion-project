$(document).ready(function () {

  // ajax related artist call///////
  $(".flipper").on("submit", ".artist_search", function(event) {
    event.preventDefault();
    var name = this.name.value;

    var request = $.ajax({
      method: 'post',
      url: '/artist_circle',
      data: {name: name}
    });

    request.done(function(response){
      $("#ra_placement_circle").replaceWith(response);
    });

    var request2 = $.ajax({
      method: 'post',
      url: '/artist',
      data: {name: name}
    });

    request2.done(function(response){
      $("#ra_placement").replaceWith(response);
    });

  });
  // ajax related artist call///////

// Save button //////////////// *IN PROGRESS
  $(".flipper").on("submit", ".save_button", function(event) {
    event.preventDefault();
    name = this.name.value;
    console.log(name);
    // var request = $.ajax({
    //   method: 'post',
    //   url: '/flakes',
    //   data: {name: name}
    // });
    request.done(function(response){

    });
  });
// Save button //////////////// *IN PROGRESS


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

  $("#flake_show").click("#my_flakes_button", function(event){
    event.preventDefault();
    if ($(".flake_list").hasClass("show")) {
        $(".flake_list").removeClass("show");
        var emptyDiv = $(".flake_list").empty()
        setTimeout(function(){emptyDiv}, 5000);
    }
    else {
      var request = $.ajax({
        method: 'post',
        url: '/flakes',
        data: {name: name}
      });

      request.done(function(response){
        $(".flake_list").empty().append(response);
      });

      $(".flake_list").addClass("show");
    }
  });



});

// Nav bar open/close ////////
function openNav() {
    document.getElementById("mySidenav").style.right = "0";
}

function closeNav() {
    document.getElementById("mySidenav").style.right = "-250px";
}
// Nav bar open/close ////////
