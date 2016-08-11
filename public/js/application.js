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
      errors.push('<li>Password too short.</li>')
    }
    if (!(/\d/.test(password))) {
      errors.push('<li>Password must contain at least one number.</li>')
    }
    if (!(/[A-Z]/.test(password))) {
      errors.push('<li>Password must contain at least one capital letter.</li>')
    }
    if (!(/\w+@\w+\.[a-zA-Z]{2,3}/.test(email))) {
      errors.push('<li>Not a valid email.</li>')
    }
    if (name.length < 1) {
      errors.push('<li>Name field cannnot be blank.</li>')
    }

    if (errors.length > 0) {
      event.preventDefault();
      for (var i = 0; i < errors.length; i++) {
        $( "#registration-errors" ).append(errors[i]);
      }
    }
  });

});
