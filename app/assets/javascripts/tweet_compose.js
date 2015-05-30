$.TweetCompose = function(el) {
  this.$el = $(el);
  $('form.tweet-compose').on("submit", this.submitForm.bind(this));
  $('.chars-left').text(140);
  $('form.tweet-compose textarea').on("input", this.charsLeft.bind(this));
};

$.TweetCompose.prototype.charsLeft = function() {
  var numChars = $('form.tweet-compose textarea').val().length;
  $('.chars-left').text(140 - numChars);
}


$.TweetCompose.prototype.submitForm = function() {
  event.preventDefault();
  $.ajax({
    type: 'post',
    url: '/tweets',
    data: this.$el.serializeJSON(),
    dataType: 'json',
    success: this.handleSuccess.bind(this)
  });
  this.$el.find(":input").prop("disabled", true);

};

$.TweetCompose.prototype.clearInput = function() {
  this.$el.find(":input").val("");
};

$.TweetCompose.prototype.handleSuccess = function(content) {
  this.clearInput();
  this.$el.find(":input").prop("disabled", false);
  var $ulTarget = $(this.$el.attr("data-tweets-ul"));
  $ulTarget.prepend($('<li>').append(JSON.stringify(content)));
};

$.fn.tweetCompose = function() {
  return this.each(function() {
    new $.TweetCompose(this);
  });
};

$(function() {
  $("form.tweet-compose").tweetCompose();
});
