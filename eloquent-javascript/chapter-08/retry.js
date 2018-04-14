class MultiplicatorUnitFailure extends Error {}

function primitiveMultiply(x, y) {
    debugger;
  if (Math.random() < 0.2) {
    return x * y;
  }
  throw new MultiplicatorUnitFailure("Boo");
}

function reliableMultiply(a, b) {
  for (;;) {
    try {
      return primitiveMultiply(a, b);
      console.log("in try");
    } catch (e) {
      if (!(e instanceof MultiplicatorUnitFailure)) throw e;
      console.log("in catch");

    }
    console.log("after catch");
  }
}

console.log(reliableMultiply(8, 8));
