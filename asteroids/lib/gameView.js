// GameView
//
// Define an Asteroids.GameView class in lib/gameView.js. The GameView should store a Game and a drawing ctx.
//
// Write a GameView#start method. It should call setInterval to call Game#moveObjects and Game#draw once every 20ms, say.
(function(){
  if (typeof Asteroids === "undefined"){
    window.Asteroids = {};
  }

  var GameView = Asteroids.GameView = function () {
    this.game = new Asteroids.Game();
    this.ctx = canvasEl.getContext("2d");
  };

  GameView.prototype.start = function(){
    var that = this;
    setInterval(function() {
      that.game.move();
      that.game.draw(that.ctx);
    }, 20);
  };
})();
