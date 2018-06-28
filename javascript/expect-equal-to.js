// function __expectObj(v) {
//   this.__value = v;
// }
//
// const expect = v => new __expectObj(v);
//
// Object.defineProperty(__expectObj.prototype, 'to', {
//   get() {
//     return this;
//   }
// });
//
// Object.defineProperty(__expectObj.prototype, 'true', {
//   get() {
//     return !!this.__value;
//   }
// });
//
// console.log(expect(true).to.true);
// console.log(expect(false).to.true);

function expect(x) {
  var to = {};
  var anotherObject = { to: to };
  to.be = function(y) {
    if (x === y) {
      console.log('ok');
    } else {
      console.log('Expected ' + x + ' to equal ' + true);
    }
  };
  return anotherObject;
}

// expect(true).to.be(false);
// expect(false).to.be(false);

var value = [];

function it(str, callback) {
  value.push(str);
  value.push(callback);
}

function run(arr) {
  for (let i = 0; i < arr.length; i++) {
    if (typeof arr[i] == 'function') {
      console.log(arr[i]);
      arr[i]();
    }
  }
}

it('should be passed', () => {
  expect(false).to.be(false);
});

it('should not be passed', () => {
  expect(true).to.be(false);
});

run(value);
