function sum() {
  var args = Array.prototype.slice.call(arguments);
  var result = 0;
  for (var i = 0; i < args.length; i++) {
    result += args[i];
  }
  console.log(result);
  return result;
}

// sum(1, 2, 3, 4);

Function.prototype.myBind = function(obj) {
  var fn = this;
  var args1 = Array.prototype.slice.call(arguments, 1);
  return function () {
    var args2 = Array.prototype.slice.call(arguments);
    return fn.apply(obj, args1.concat(args2));
  };
};


function doSomething(a, b, c, d, e) {
  console.log(this.name);
  return a + b + c + d + e;
}

var gizmo = {
  name: "gizmo"
};

var gizmoDoingSomething = doSomething.myBind(gizmo, 1,2,3);
console.log(gizmoDoingSomething(4, 5, 6));
