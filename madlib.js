function madlib(verb, adjective, noun){
    console.log(`We shall ${verb} the ${adjective} ${noun}`);
}

madlib("print", "loud", "dollar");

function isSubstring(searchString, subString){
   return searchString.includes(subString);
}
isSubstring("time to program", "time");
isSubstring("Jump for joy", "joys");

function fizzbuzz(arr){
    var nums = arr.filter(num => (num % 3 === 0 || num % 5 ===0) && (num % 15 !== 0));
    console.log(nums);
}

fizzbuzz([1,2,3,5,6,15,40]);

function isPrime(num){
    let i = 2;
    for(i; i < num; i++){
        if (num % i === 0){
            return false;
        }
    }
    if (num === 1){
        return false
    }
    return true;
}
isPrime(2)
isPrime(10)
isPrime(15485863)
isPrime(3548563)

function sumOfNPrimes(n){
    var count = 0;
    var total = 0;
    var num = 2;
    while(count < n){
        if(isPrime(num)){
            count += 1
            total += num
        }
        num += 1;
    }
    return total;
}

function titleize(arr,func){
    var names = arr.map(el => `Mx. ${el} Jingleheimer Schmidt`);
    func(names);
}

function printCallback(arr){
    arr.forEach(element => console.log(element));
}

titleize(["Mary", "Brian", "Leo"], printCallback);


function Elephant(name, height,tricks){
    this.name = name;
    this.height = height;
    this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
   console.log(`${this.name} the elephant goes "phrRRRRRRRRRRR!!!!!!!"`); 
}

Elephant.prototype.grow = function() {
    this.height += 12;
    console.log(`height is now: ${this.height}`);
}

Elephant.prototype.addTrick = function(trick) {
    this.tricks.push(trick);
    console.log(`tricks: ${this.tricks}`);
}

Elephant.prototype.play = function() {
    var index = Math.floor(Math.random() * this.tricks.length);
    var trick = this.tricks[index]
    console.log(`${this.name} is ${trick}`);
}

function paradeHelper(elephant) {
    var index = Math.floor(Math.random() * elephant.tricks.length);
    var trick = elephant.tricks[index]
    console.log(`${elephant.name} is ${trick} by the crowd!`);
}

function dinerBreakfast() {
    let order = "I'd like cheesy scrambled eggs please.";
    console.log(order);
  
    return function (food) {
      order = `${order.slice(0, order.length - 8)} and ${food} please.`;
      console.log(order);
    };}
