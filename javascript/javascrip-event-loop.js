console.log('Start!');

for (let i = 0; i < 4; i++) {
  setTimeout(function() {
    console.log(i);
  }, 0);
}

console.log('End!');

// for (var i = 0; i < 4; i++) {
//   setTimeout(() => console.log(i), 0);
// }

// console.log('Start!');

// setTimeout(function(cb) {
//   console.log('hello');
// }, 0);

// console.log('End!');
