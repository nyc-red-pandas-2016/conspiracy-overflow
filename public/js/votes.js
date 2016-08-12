$(document).ready(function() {

  $(".votes-form").submit(function(e){
    e.preventDefault();
    var vote_info = $(this).serialize();
    var votable_id = $("input[id=votable_id]").val();
    var votable_type = $("input[id=votable_type]").val();
    $.ajax({
      url: '/votes',
      method: 'POST',
      data: vote_info
    }).done(function(response) {
      if (response == "already voted") {
        alert("You've already liked this!");
      } else {
        var classname = ".votes-number-" + votable_type + "-" + votable_id;
        $( classname ).html(response);
      }
    });
  });

});
