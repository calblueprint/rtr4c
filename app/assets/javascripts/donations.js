jQuery(function($){
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
  $('#new_donation').submit(function(event) {
    var $form = $(this);
    $('input[type=submit]').attr('disabled', true);
    Stripe.card.createToken($form, stripeResponseHandler);
    return false;
  });

  var stripeResponseHandler = function(status, response) {
    var $form = $('#new_donation');
    if (status == 200) {
      var token = response.id;
      $form.append($('<input type="hidden" name="stripeToken" />').val(token));
      $form.get(0).submit();
    }
    else {
      $form.find('#payment_error').text(response.error.message);
      $('input[type=submit]').attr('disabled', false);
    }
  }

});