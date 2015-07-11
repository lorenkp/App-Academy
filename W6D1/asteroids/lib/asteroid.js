(function() {
  if (typeof Asteroids === "undefined") {
    window.Asteroids = {};
  }

  var Asteroid = Asteroids.Asteroid = function (pos) {
      Asteroids.MovingObject.apply(
            this, { pos: pos,
            vel: Asteroids.Util.randomVec(),
            radius: Asteroid.RADIUS,
            color: Asteroid.COLOR }
          );
  }

  Asteroids.Util.inherits(Asteroids.Asteroid, Asteroids.MovingObject);
  Asteroids.Asteroid.COLOR = "#FF0000";
  Asteroids.RADIUS = 100;

})();
