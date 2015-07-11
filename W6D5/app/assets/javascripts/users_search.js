$.UsersSearch = function(el) {
  this.$el = $(el);
  this.input = this.$el.find("input");
  this.$ul = this.$el.find("ul");
  this.eventListener();
};

$.UsersSearch.prototype.eventListener = function() {
  var that = this;
  this.input.on("input", function() {
    that.handleInput(event.currentTarget);
  });
};

$.UsersSearch.prototype.handleInput = function(event) {
  $.ajax({
    type: 'get',
    url: '/users/search',
    data: {
      query: this.input.val()
    },
    dataType: 'json',
    success: this.renderResults.bind(this)
  });
  // debugger;
};

$.UsersSearch.prototype.renderResults = function(users) {
  this.$ul.empty();
  for (var i = 0; i < users.length; i++) {
    this.$ul.append($("<li>"));
    var $user = $("<a>");
    $user.attr("href", "/users/" + users[i].id);
    $user.text(users[i].username);

    if (users[i].followed === true) {
      var followState = "followed";
      var buttonText = "Unfollow";
    } else {
      followState = "unfollowed";
      buttonText = "Follow";
    }
    var $button = $("<button>")
      .attr("data-userid", users[i].id)
      .attr("data-initialfollowstate", followState)
      .addClass("follow-toggle")
      .text(buttonText);
    this.$ul.find("li:last").append($user).append($button);
    $button.followToggle();
  }
};


$.fn.usersSearch = function() {
  return this.each(function() {
    new $.UsersSearch(this);
  });
};

$(function() {
  $("div.users-search").usersSearch();
});
