function hammertime(time) {
  setTimeout(function() {
    alert(`${time} is hammertime!`);
  }, time)
}

// --- Tea and Biscuits ---
const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits(callback) {
  reader.question('Would you like some tea?: ', function(teaChoice) {
    reader.question('How about a biscuit or two?: ', function(biscuitChoice) {
      callback([teaChoice, biscuitChoice]);
    })
  })
}

teaAndBiscuits(function(choices) {
  const choice1 = (choices[0].toLowerCase() === 'yes') ? 'do' : 'don\'t';
  const choice2 = (choices[1].toLowerCase() === 'yes') ? 'do' : 'don\'t';
  const conjunction = (choices[0] === choices[1]) ? ' and' : ', but';
  console.log(`Ok. So you ${choice1} want tea${conjunction} you ${choice2} want biscuits. Got it!`);
  reader.close();
})

// --- Call and Apply ---
function Cat () {
  this.name = 'Markov';
  this.age = 3;
}

function Dog () {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat ();
const Noodles = new Dog ();

Noodles.chase(Markov);
Noodles.chase.call(Markov,[Noodles]);
