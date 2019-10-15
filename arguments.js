function sum(){
  let sum = 0;
  for(let i = 0; i <arguments.length; i++){
    sum += arguments[i];
  }
  return sum;
}

function sum(...args){
  let sum = 0;
  args.forEach((num) => {
      sum += num;
  });
  return sum;
}

function curriedSum(numArgs){
  let this.numbers = [];

  function _curriedSum(num){
    let sum = 0;
    if this.numbers.length === numArgs {
      this.numbers.forEach((num) => {
        sum += num;
      })
      return sum
    } else {
      this.numbers.push(num);
    }
  }
}
