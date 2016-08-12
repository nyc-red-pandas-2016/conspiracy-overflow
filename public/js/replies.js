$(document).ready(function() {
  //comment form show on answers
  $(".answers").on("click",".show-comments-form-button", function(e){
    $(this).parent().find(".comments-form").show();
    $(this).parent().find(".comments-form textarea").focus();
    $(".show-comments-form-button").hide();
    $(".show-answers-form-button").hide();
  });


  $(".question").on("click",".show-comments-form-button", function(e){
    $(this).parent().find(".comments-form").show();
    $(this).parent().find(".comments-form textarea").focus();
    $(".show-comments-form-button").hide();
    $(".show-answers-form-button").hide();
  });


  $(".show-answers-form-button").on("click", function(){
    $(".answers-form").show();
    $(this).parent().find(".answers-form textarea").focus();
    $(".show-answers-form-button").hide();
    $(".show-comments-form-button").hide();
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
    $(".answers-form").hide();
    $(".show-answers-form-button").show();
    $(".show-comments-form-button").show();
    });
   });


//comment form on answers
      $(".answers").on("submit", ".comments-form" ,function(e){
    debugger;
    e.preventDefault();
    var ourForm = e.target
      values = $(e.target).serialize()
    $.ajax({
      url: $(e.target).attr("action"),
      type: $(e.target).attr("method"),
      data: values
    }).done(function(response) {
      $(ourForm).closest(".answer").find(".all_comments").append(response);
      $(".comments-form textarea").val("");
      $(".comments-form").hide();
      $(".show-answers-form-button").show();
      $(".show-comments-form-button").show();
    });
  });

//comment form on questions
      $(".question").on("submit", ".comments-form" ,function(e){
    e.preventDefault();
    var ourForm = e.target
      values = $(e.target).serialize()
    $.ajax({
      url: $(e.target).attr("action"),
      type: $(e.target).attr("method"),
      data: values
    }).done(function(response) {
    debugger;
      $(ourForm).closest(".question").find(".all_comments").append(response);
      $(".comments-form textarea").val("");
      $(".comments-form").hide();
      $(".show-answers-form-button").show();
      $(".show-comments-form-button").show();
    });
  });



});
