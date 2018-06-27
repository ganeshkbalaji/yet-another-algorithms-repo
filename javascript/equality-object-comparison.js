function greet(person) {
  if (person == { name: 'amy' }) {
    console.log('hey amy');
  } else {
    console.log('hey arnold');
  }
}
greet({ name: 'amy' });

// above will not work since type comparison breaks and comparing two objects with equality or strict equality. JS also cannot compare the related internal references. In memory there are 2 different objects

function greet1(person) {
  if (person.name === 'amy') {
    console.log('hey amy');
  } else {
    console.log('hey arnold');
  }
}

greet1({ name: 'amy' });
