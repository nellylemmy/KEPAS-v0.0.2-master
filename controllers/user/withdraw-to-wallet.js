const bcrypt = require('bcryptjs');
const dbConnection = require("../../utils/dbConnection");
const moment = require('moment');

exports.withdraw_my_wallet = async (req,res,next) => {

// generate random numbers
let generateRandomNumbers = function(amount, limit) {
  var result = [],memo = {};

  while(result.length < amount) {
    var num = Math.floor((Math.random() * limit) + 1);
    if(!memo[num]) { memo[num] = num; result.push(num); };
  }
  return result; 
}

const { body } = req;
// generate transaction ID:
const walletTransactionId1 = generateRandomNumbers(5, 9).join('');
const walletTransactionId2 = generateRandomNumbers(5, 9).join('');

// time
const [row] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);

const userCurrentWalletBalance = parseFloat(row[0].income);
const userCurrentLocalBalance = parseFloat(row[0].balance);
const userWalletAmount = parseFloat(body.walletAmount);

const checkWalletPassword = await bcrypt.compare(body.walletPassword, row[0].password);
  // add income to local balance and update the table. incoma and balance.
const addIncomeAndBalance = userCurrentLocalBalance + userWalletAmount;

if(userWalletAmount <= 1 || userWalletAmount == NaN || userWalletAmount == null || userWalletAmount == undefined || userWalletAmount == " "){
  res.send(`<h3>Warning! You can not transact amount less than 2Ksh</h3> <br><br> <button><a href="./wallet">GO BACK</a></button>`)
  return;
}
if(userWalletAmount > userCurrentWalletBalance){
  res.send(`<h3>Warning! can not transact amount more than ${userCurrentWalletBalance}</h3> <br><br> <button><a href="./wallet">GO BACK</a></button>`)
  return;
}
  
if(checkWalletPassword !== true || checkWalletPassword == ''){
  let warningTransactionId = `TID-${walletTransactionId1 + walletTransactionId2}`
  let transactionMode = 'W';
  
  let warningMessage = `<span class="random-ids"><u><b>${warningTransactionId}</b></u></span> Warning! Please check your password and try again!`

  res.send(`<h3>Warning! Please check your password and try again!</h3> <br><br> <button><a href="./wallet">GO BACK</a></button>`)
  return;
}

// calculate the remaining income balance

if(!(userWalletAmount > userCurrentWalletBalance)){

  // Update user wallet balance
  let walletBalanceAfterUserWithdraw = parseFloat(userCurrentWalletBalance.toFixed(2) - userWalletAmount.toFixed(2));


console.log(walletBalanceAfterUserWithdraw)

console.log(`the input is: ${userWalletAmount}`)
console.log(`balance: ${row[0].balance}`);
console.log(`wallet: ${row[0].income}`);
console.log(`TOTAL = ${addIncomeAndBalance}`);
let transactionMode = 'R';

dbConnection.execute("UPDATE `users` SET `balance` =?, `income` = ? WHERE `id`=?", [addIncomeAndBalance, walletBalanceAfterUserWithdraw, req.session.userID]);

const currentTime = moment().format('LT');
const currentDate = moment().format('ll');

let walletWithdrawTransactionId1 = generateRandomNumbers(5, 9).join('');
let walletWithdrawTransactionId2 = generateRandomNumbers(5, 9).join('');

let successWaletTransactionId = `TID-${walletWithdrawTransactionId1 + walletWithdrawTransactionId2}`

let moneyFromWallet = `Wallet`;
let walletPhoneNumber = `${row[0].mobile}`;

let successWithdrawWalletMessage = `<span class="random-ids"><u><b>${successWaletTransactionId}</b></u></span> Confirmed You Transfered <span class="money"><b><u>Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(userWalletAmount).slice(4)} </u></b></span> from Your wallet to your Local account On (<b>${currentDate}</b> at <b>${currentTime}</b>) Your new balance is <span class="money"><b><u>Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(addIncomeAndBalance).slice(4)}</u></b></span> and your remaining wallet balance is <span class="money"><b><u>Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(walletBalanceAfterUserWithdraw).slice(4)}</u></b></span>. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM.`;

dbConnection.execute(
  "INSERT INTO `all_transactions` (`sender_id`, `recipient_id`,`recipient_mode`,`transaction_id`,`amount`,`recipient_success_message`,`sender_first_name`,`sender_mobile`,`current_date`,`current_time`) VALUES (?,?,?,?,?,?,?,?,?,?)",
  [row[0].id, row[0].id,transactionMode,successWaletTransactionId,userWalletAmount, successWithdrawWalletMessage,moneyFromWallet,walletPhoneNumber,currentDate,currentTime]
);

console.log('execution succeeded. transaction message inserted')

res.send(`<h3>Successfully transfered ${userWalletAmount.toFixed(2)} to local account</h3> <br><br> <button><a href="./wallet">GO BACK</a></button>`)
return;

}else{
  res.send(`<h3>An Error Occured to your local account. Please try again</h3> <br><br> <button><a href="./wallet">GO BACK</a></button>`)
  return;
}
}