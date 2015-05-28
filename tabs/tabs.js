$.Tabs = function(el) {
  this.$el = $(el);
  this.$contentTabs = $(this.$el.attr('data-content-tabs'));
  this.$activeLink = this.$el.find('.active');
  this.$active = this.$contentTabs.find('.active');
  this.$el.on('click', 'a', this.clickTab.bind(this));

};

$.Tabs.prototype.clickTab = function(event) {
  event.preventDefault();
  var act = $(event.currentTarget).addClass('active');
  this.$activeLink.removeClass('active');

  this.$activeLink = act;
  this.$active.addClass('transitioning');
  var that = this;
  this.$active.one('transitionend', function() {
    that.$active.removeClass('transitioning active');
    that.$active = that.$contentTabs.find(act.attr('href')).addClass('active transitioning');
    window.setTimeout(function() {
      console.log("hello");
      that.$active.removeClass('transitioning');
    }, 0);
  });

  console.log(event.currentTarget);

  //debugger;
};

$.fn.tabs = function() {
  return this.each(function() {
    new $.Tabs(this);
  });
};
