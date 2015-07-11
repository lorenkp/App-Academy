$.Thumbnails = function(el) {
  this.$el = $(el);
  this.gutterIdx = 1;
  this.$images = this.$el.find("div.gutter-images img");
  this.fillGutterImages();
  this.$gutterImages = this.$el.find("div.gutter-images");
  this.$activeImg = this.$gutterImages.find('img').eq(0);
  this.activate(this.$activeImg);
  var that = this;
  $('div.gutter-images img').on('click', function(event) {
    var target = $(event.currentTarget);
    that.$activeImg = target;
    that.activate(that.$activeImg);
  });

  $('div.gutter-images img').on('mouseenter', function(event) {
    var target = $(event.currentTarget);
    that.activate(target);
  });

  $('div.gutter-images img').on('mouseleave', function(event) {
    that.activate(that.$activeImg);
  });
  $('a.nav').on('click', this.fillGutterImages.bind(this));
};

$.Thumbnails.prototype.activate = function($img) {
  $('.active').empty();
  $img.clone().appendTo($('.active'));
};

$.Thumbnails.prototype.fillGutterImages = function() {
  this.gutterIdx += 1;
  $('div.gutter-images').empty();
  for (var i = 0; i < 5; i++) {
    this.$images.eq(this.gutterIdx + i).appendTo($('div.gutter-images'));
  }
  this.$gutterImages = this.$el.find("div.gutter-images");
};

$.fn.thumbnails = function() {
  return this.each(function() {
    new $.Thumbnails(this);
  });
};
