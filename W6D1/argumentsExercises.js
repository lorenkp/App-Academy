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

// var gizmoDoingSomething = doSomething.myBind(gizmo, 1,2,3);
//
// console.log("gizmo function below here");
// console.log(gizmoDoingSomething);
//
// console.log(gizmoDoingSomething(4, 5, 6));

// curriedSum

function curriedSum(numArgs) {
  var numbers = [];
  return function _curriedSum(n) {
      numbers.push(n);
      if (numbers.length === numArgs) {
        var result = 0;
        for(var i = 0; i < numbers.length; i++) {
          result += numbers[i];
        }
        return result;
      } else {
        return _curriedSum;
    }
  };
}
// var sum = curriedSum(4);
// console.log(sum(5));

// sum2 = sum(5);
// sum3 = sum2(4);
// sum4 = sum3(4);
// number = sum4(1);
//
// console.log(console.log);
//
// var sum = curriedSum(4);
// var sum1 = sum(5);
// var sum2 = sum1(30);

// function#curry(numArgs)

Function.prototype.curry = function(numArgs){
  var numbers = [];
  var funky = this;
  return function _curry(n) {
    numbers.push(n);
    if (numbers.length === numArgs) {
      console.log(numbers);
      return funky.apply(null, numbers);
    } else {
      return _curry;
    }
  };
};

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}
console.log(sumThree.curry(3)(4)(20)(6));
