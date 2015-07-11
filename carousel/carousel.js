$.Carousel = function(el) {
  this.$el = $(el);
  this.activeIdx = 0;
  $('.items img').eq(this.activeIdx).addClass('active');

  $('.slide-right').on('click', this.slide.bind(this, 1));
  $('.slide-left').on('click', this.slide.bind(this, -1));

};

$.Carousel.prototype.slide = function(dir) {
  if (this.transitioning){
    return;
  }
  this.transitioning = true;
  var act = $('.items img').eq(this.activeIdx);
  var tempIdx = (this.activeIdx + dir);
  if (tempIdx < 0) {
    tempIdx = 2;
  } else if (tempIdx > 2) {
    tempIdx = 0;
  }
  console.log(tempIdx);
  var newImg = $('.items img').eq(tempIdx);

  if (dir === 1) {
    newImg.addClass("right");
    act.addClass("left");
  }

  if (dir === -1) {
    newImg.addClass("left");
    act.addClass("right");
  }
  var that = this;
  act.one('transitionend', function(event) {
    act.removeClass('active left right');
    that.transitioning= false;
    console.log(event.currentTarget);
    // act.removeClass('left right');
  });

  window.setTimeout(function() {
    newImg.removeClass('left right');
    newImg.addClass('active');
  }, 0);

  this.activeIdx = tempIdx;
};


$.fn.carousel = function() {
  return this.each(function() {
    new $.Carousel(this);
  });
};
