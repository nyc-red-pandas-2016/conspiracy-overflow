$(document).ready(function() {

  var $errorsRegister = $("#registration-errors");
  $errorsRegister.hide()

  //user-side validation for creating a user
  $( "#registration-form" ).submit(function( event ) {
      $errorsRegister.show('slow');
    $( "#registration-errors" ).html("");

    var errors = new Array();
    var name = $( "input[id=name]" ).val();
    var email = $( "input[id=email]" ).val();
    var password = $( "input[type=password]" ).val();

    if (password.length < 6) {
      errors.push('<li>Password too short.</li>');
    }
    if (!(/\d/.test(password))) {
      errors.push('<li>Password must contain at least one number.</li>');
    }
    if (!(/[A-Z]/.test(password))) {
      errors.push('<li>Password must contain at least one capital letter.</li>');
    }
    if (!(/\w+@\w+\.[a-zA-Z]{2,3}/.test(email))) {
      errors.push('<li>Not a valid email.</li>');
    }
    if (name.length < 1) {
      errors.push('<li>Name field cannnot be blank.</li>');
    }

    if (errors.length > 0) {
      event.preventDefault();
      for (var i = 0; i < errors.length; i++) {
        $( "#registration-errors" ).append(errors[i]);
      }
    }
  });

  //user-side validation for creating a question
  $( "#question-form" ).submit(function( event ) {
    $( "#question-form-errors" ).html("");

    var errors = new Array();
    var title = $( "input[id=title]" ).val();
    var body = $( "input[id=body]" ).val();
    var tags = $( "input[id=tags]" ).val();

    if (title.length < 3) {
      errors.push('<li>Title too short.</li>');
    }
    if (body.length < 3) {
      errors.push('<li>Text too short.</li>');
    }

    if (errors.length > 0) {
      event.preventDefault();
      for (var i = 0; i < errors.length; i++) {
        $( "#question-form-errors" ).append(errors[i]);
      }
    }
  });

//Ajaxing the replays to a question


  $(".show-comments-form-button").on("click", function(e){
    debugger;
    $(".comments-form").show();

    // $(".comments-form").focus();

    $(".show-comments-form-button").hide();
    $(".show-answers-form-button").hide();
  });



  $(".comments-form").focusout(function(){
    $(".comments-form").hide();
    $(".show-answers-form-button").show();
    $(".show-comments-form-button").show();
  });

  $(".show-answers-form-button").on("click", function(){
    $(".answers-form").show();
    // $(".answers-form").focus();
    $(".show-answers-form-button").hide();
    $(".show-comments-form-button").hide();
  });

    $(".answers-form").focusout(function(){
    $(".answers-form").hide();
    $(".show-answers-form-button").show();
    $(".show-comments-form-button").show();
  });


});
