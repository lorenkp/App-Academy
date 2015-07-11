(function(){
  if (typeof Asteroids === "undefined"){
      window.Asteroids = {};
  }

  Asteroids.Util = {};

  Asteroids.Util.inherits = function(ChildClass, ParentClass) {
    function Surrogate (){}
    Surrogate.prototype = ParentClass.prototype;
    ChildClass.prototype = new Surrogate ();
  };

  Asteroids.Util.randomVec = function() {
    return [(Math.floor(Math.random() * 10) + 1),
                (Math.floor(Math.random() * 10) + 1)];
  };



})();
