$.FollowToggle = function(el) {
  this.$el = $(el);
  this.userId = this.$el.attr("data-userid");
  this.followState = this.$el.attr("data-initialfollowstate");
  this.render();
  this.handleClick();
};

$.FollowToggle.prototype.render = function() {
  this.$el.prop("disabled", true);

  if (this.followState === "unfollowed") {
    this.$el.text("Follow!");
    this.$el.prop("disabled", false);
  } else if (this.followState === "followed") {
    this.$el.text("Unfollow");
    this.$el.prop("disabled", false);
  }
};


$.FollowToggle.prototype.handleClick = function() {
  var that = this;
  this.$el.on("click", function(event) {
    event.preventDefault();
    if (that.followState === "unfollowed") {
      that.followState = "following";
      that.render();
      $.ajax({
        type: "post",
        url: "/users/" + that.userId + "/follow",
        dataType: 'json',
        success: function() {
          that.followState = "followed";
          that.render();
        }
      });
    } else {
      that.followState = "unfollowing";
      that.render();
      $.ajax({
        type: "delete",
        url: "/users/" + that.userId + "/follow",
        dataType: 'json',
        success: function() {
          that.followState = "unfollowed";
          that.render();
        }
      });
    }
  });
};



$.fn.followToggle = function() {
  return this.each(function() {
    new $.FollowToggle(this);
  });
};

$(function() {
  $("button.follow-toggle").followToggle();
});
