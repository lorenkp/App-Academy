(function(){
  if (typeof Asteroids === "undefined") {
      window.Asteroids = {};
  }

  var Game = Asteroids.Game = function() {
    this.addAsteroids();
    this.asteroids = [];

  };

  Game.DIM_X = 1000;
  Game.DIM_Y = 1000;
  Game.NUM_ASTEROIDS = 10;

  Game.prototype.addAsteroids = function() {
    for (var i = 0; i < this.NUM_ASTEROIDS; i++) {
      this.asteroids.push(Asteroids.Asteroid(this.randomPosition()));
    }
  };

  Game.prototype.randomPosition = function() {
    return [Math.floor(Math.random() * this.DIM_X),
      Math.floor(Math.random() * this.DIM_Y)];
  };

  Game.prototype.draw = function(ctx) {
    ctx.clearRect(0, 0, 1000, 1000);
    for(var i = 0; i < this.asteroids.length; i++){
      this.asteroids[i].draw();
    }
  };

  Game.prototype.move = function(ctx) {
    for(var i = 0; i < this.asteroids.length; i++){
      this.asteroids[i].move();
    }
  };

})();
