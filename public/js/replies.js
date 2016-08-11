$(document).ready(function() {
  $(".show-comments-form-button").on("click", function(e){
    $(this).parent().find(".comments-form").show();

    $(this).parent().find(".comments-form textarea").focus();

    $(".show-comments-form-button").hide();
    $(".show-answers-form-button").hide();
  });

  $(".comments-form").submit(function(){
    $(".comments-form").hide();
    $(".show-answers-form-button").show();
    $(".show-comments-form-button").show();
  });

  $(".show-answers-form-button").on("click", function(){
    $(".answers-form").show();
    $(this).parent().find(".answers-form textarea").focus();
    $(".show-answers-form-button").hide();
    $(".show-comments-form-button").hide();
  });

    $(".answers-form").submit(function(){
    $(".answers-form").hide();
    $(".show-answers-form-button").show();
    $(".show-comments-form-button").show();
  });

  $(".answers-form").submit(function(e){
    e.preventDefault();
    var ourForm = e.target
      values = $(e.target).serialize()
    $.ajax({
      url: $(e.target).attr("action"),
      type: $(e.target).attr("method"),
      data: values
    }).done(function(response) {
      $(ourForm).closest(".contain").find(".answers").append(response);
      $(".answers-form textarea").val("");
    });
  });
});
