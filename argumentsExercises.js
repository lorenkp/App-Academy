function sum() {
  var args = Array.prototype.slice.call(arguments);
  var result = 0;
  for (var i = 0; i < args.length; i++) {
    result += args[i];
  }
  console.log(result);
  return result;
}

sum(1, 2, 3, 4);
