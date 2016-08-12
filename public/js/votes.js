$(document).ready(function() {

  // $(".votes-form").submit(function(e){
  //   e.preventDefault();
  //   var vote_info = $(this).serialize();
  //   var arr = $(this).serializeArray();
  //   var votable_id = arr[0]["value"];
  //   var votable_type = arr[1]["value"];
  //   $.ajax({
  //     url: '/votes',
  //     method: 'POST',
  //     data: vote_info
  //   }).done(function(response) {
  //     if (response == "already voted") {
  //       alert("You can't undo what's been done while drunk. (You already liked this)");
  //     } else {
  //       var classname = ".votes-number-" + votable_type + "-" + votable_id;
  //       $( classname ).html(response);
  //     }
  //   });
  // });


  $(".question").on("submit", ".votes-form", function(e) {
    if ($(this).parent().attr("class") != 'comment-body') {
      votesFunction(e, $(this));
    }
  });

  $(".answers").on("submit", ".votes-form", function(e) {
    if ($(this).parent().attr("class") != 'comment-body') {
      votesFunction(e, $(this));
    }
  });

  $(".all_comments").on("submit", ".votes-form", function(e) {
    votesFunction(e, $(this));
  });

  function votesFunction(e, thisThing){
    e.preventDefault();
    var vote_info = thisThing.serialize();
    var arr = thisThing.serializeArray();
    var votable_id = arr[0]["value"];
    var votable_type = arr[1]["value"];
    $.ajax({
      url: '/votes',
      method: 'POST',
      data: vote_info
    }).done(function(response) {
      if (response == "already voted") {
        alert("You can't undo what's been done while drunk. (You already liked this)");
      } else {
        var classname = ".votes-number-" + votable_type + "-" + votable_id;
        $( classname ).html(response);
      }
    });
  }

});
