// generate random numbers
let generateRandomNumbers = function(amount, limit) {
    var result = [],memo = {};

    while(result.length < amount) {
        var num = Math.floor((Math.random() * limit) + 1);
        if(!memo[num]) { memo[num] = num; result.push(num); };
    }
    return result; 
  }