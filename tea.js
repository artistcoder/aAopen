const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits() {
  reader.question('Would you like some tea?', function(responseOne) {
    reader.question('Would you like some biscuits?', function(responseTwo) {
      const first = responseOne.toString();
      const second = responseTwo.toString();
      console.log(`You replied ${first}.`);
      console.log(`You replied ${second}.`);

      const firstRes = (first === 'yes') ? 'do' : 'don\'t';
      const secondRes = (second === 'yes') ? 'do' : 'don\'t';
      console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
      reader.close();
    });
  });
}
