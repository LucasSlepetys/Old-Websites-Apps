//! Variables and data types 

/*var firstName = 'john';
console.log(firstName);

var lastName = 'Smith';
var age = 28;

var fullAge = true;
console.log(fullAge);

var job;
console.log(job);

job = 'Teacher';
console.log(job);
console.log("Hello")*/

//!Variable mutationand type coerction 

/*var firstName = 'John';
var age = 28;


//Type coerction
console.log(firstName + ' ' + age);


var job, isMarried;
job = 'teacher';
isMarried = false;

console.log(firstName + ' ' + age + ' year old ' + job + '. Is he married? ' + isMarried);
//!Variable mutation

age = 'twenty eight';
job = 'driver'
alert(firstName + ' is a ' + age + ' year old ' + job + '. Is he married? ' + isMarried);

//!Getting an input from the alert
var lastName = prompt('What is his last Name?');
console.log(firstName + ' ' + lastName)*/

//!Basic operators

// var now, yearJohn, yearMark
// now = 2018;
// ageJohn = 28;
// ageMark = 33;

// //! Math operators
// yearJohn = now - ageJohn;
// yearMark = now - ageMark;;

// console.log(yearJohn);

// console.log(now + 2);
// console.log(now * 2);
// console.log(now / 2);

// //! Logical operator
// var johnOlder = ageJohn < ageMark;
// console.log(johnOlder);

// //! typeof operator
// console.log(typeof johnOlder);
// console.log(typeof ageJohn);
// console.log(typeof 'Mark is older than John');
// var x;
// console.log(typeof x);


//! Operator precedence:

var now = 2018;
var yearJohn = 1989;
var fullAge = 18;

//! Multiple operators
var isFullAge = now - yearJohn >= fullAge;
console.log(isFullAge)

//! Grouping operatorsn
var ageJohn = now - yearJohn;
var ageMark = 35;
var avarage = (ageJohn + ageMark) / 2;
console.log(avarage)

//! Multiple assignments
var x, y;
x = y = (3 + 5) * 4 - 6; //26
console.log(x,y)

//! More operators;
x *=2;
console.log(x);
x += 10;
console.log(x);
//! Add one unit to the variable:
x++;
console.log(x)