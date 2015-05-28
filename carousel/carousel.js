$.Carousel = function(el) {
  this.$el = $(el);
  this.activeIdx = 0;
  this.$el.find('.items::first-child').addClass('active');
  this.$el.on('click', 'a', this.clickTab.bind(this));

};
