// --- Part 1 ---

function madLib(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}`;
}

function isSubstring(str,sub_str) {
  return str.includes(sub_str);
}

function fizzBuzz(arr) {
  return arr.filter(num => ((num%3===0) + (num%5===0)) === 1)
}

function isPrime(num) {
  for(var i = 2; i < (num/2)+1; i++) {
    if(num%i === 0) { return false; }
  }
  return (num > 1) ? true : false;
}

function firstNPrimes(n) {
  var arr = [];
  var i = 2;
  while (arr.length < n) {
    if(isPrime(i)) { arr.push(i) }
    i++;
  }
  return arr;
}

function sumNPrimes(n) {
  return firstNPrimes(n).reduce((acc,num) => acc+num);
}

// --- Part 2 ---
// - Callbacks -
function callback(str) {
  console.log(`Mx. ${str} Jingleheimer Schmidt`);
}

function titleize(arr, cb) {
  arr.map(callback);
}

// - Constructors -
function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}
Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
}
Elephant.prototype.grow = function() {
  this.height += 12;
}
Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
}
Elephant.prototype.play = function() {
  num = Math.floor(Math.random() * this.tricks.length);
  console.log(`${this.name} is ${this.tricks[num]}!`);
}

// - Invocation -
Elephant.paradeHelper = function(e) {
  console.log(`${e.name} is trotting by!`);
};

// - Closures -
