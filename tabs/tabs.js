$.Tabs = function (el) {
 this.$el = $(el);
 this.$contentTabs = $(this.$el.attr('data-content-tabs'));
 this.$activeLink = this.$el.find('.active');
 this.$active = this.$contentTabs.find('.active');
 this.$el.on('click', 'a', this.clickTab.bind(this));

 };

$.Tabs.prototype.clickTab = function(event){
  event.preventDefault();
  var act = $(event.currentTarget).addClass('active');
  this.$activeLink = act;
  this.$active.removeClass('active').addClass('transitioning');
  var that = this;
  this.$active.one('transitionend', function() {
    that.$active.removeClass('transitioning');
    that.$active = that.$contentTabs.find(act.attr('href')).addClass('active');
  });
  this.$activeLink.removeClass('active');

  console.log(event.currentTarget);

  //debugger;
};

$.fn.tabs = function () {
  return this.each(function () {
    new $.Tabs(this);
  });
};
