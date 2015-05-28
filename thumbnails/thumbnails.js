$.Thumbnails = function(el) {
  this.$el = $(el);
  this.$contentTabs = $(this.$el.attr('data-content-tabs'));
  this.$activeLink = this.$el.find('.active');
  this.$active = this.$contentTabs.find('.active');
  this.$el.on('click', 'a', this.clickTab.bind(this));

};

$.fn.thumbnails = function() {
  return this.each(function() {
    new $.Thumbnails(this);
  });
};
