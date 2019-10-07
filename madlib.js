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