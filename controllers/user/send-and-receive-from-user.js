const bcrypt = require('bcryptjs');
const dbConnection = require("../../utils/dbConnection");
const moment = require('moment');

exports.userMainPage_sendMoney_userToUser = async (req, res, next) => {

// generate random numbers
let generateRandomNumbers = function(amount, limit) {
  var result = [],memo = {};

  while(result.length < amount) {
    var num = Math.floor((Math.random() * limit) + 1);
    if(!memo[num]) { memo[num] = num; result.push(num); };
  }
  return result; 
}

const currentTime = moment().format('LT');
const currentDate = moment().format('ll');

// generate transaction ID:
const transactionId1 = generateRandomNumbers(5, 9).join('');
const transactionId2 = generateRandomNumbers(5, 9).join('');

const { body } = req;

let currentCost = 0; // Cost before any transaction
const senderAmount = parseFloat(body.recipientQuantity); // The amount sent by the user

// Function to detect what amount user send
const detectTransactionCost = () => {

if(senderAmount >= 1 && senderAmount <= 100){
  currentCost += 0;
  return currentCost;
}

if(senderAmount >= 101 && senderAmount <= 500){
  currentCost += 6;
  return currentCost;
}

if(senderAmount >= 501 && senderAmount <= 1000){
  currentCost += 12;
  return currentCost;
}

if(senderAmount >= 1001 && senderAmount <= 1500){
  currentCost += 22;
  return currentCost;
}

if(senderAmount >= 1501 && senderAmount <= 2500){
  currentCost += 32;
  return currentCost;
}

if(senderAmount >= 2501 && senderAmount <= 3500){
  currentCost += 51;
  return currentCost;
}

if(senderAmount >= 3501 && senderAmount <= 5000){
  currentCost += 55;
  return currentCost;
}

if(senderAmount >= 5001 && senderAmount <= 7500){
  currentCost += 75;
  return currentCost;
}

if(senderAmount >= 7501 && senderAmount <= 10000){
  currentCost += 87;
  return currentCost;
}

if(senderAmount >= 10001 && senderAmount <= 15000){
  currentCost += 97;
  return currentCost;
}

if(senderAmount >= 15001 && senderAmount <= 20000){
  currentCost += 102;
  return currentCost;
}

if(senderAmount >= 20001 && senderAmount <= 35000){
  currentCost += 105;
  return currentCost;
}

if(senderAmount >= 35001 && senderAmount <= 1000000){
  currentCost += 105;
  return currentCost;
}

if(senderAmount > 1000000){
  currentCost += 1665;
  return currentCost;
}

return currentCost;

}

  
let recipientNumber = body.recipientNumber;

const [row] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);

const [rowMobile] = await dbConnection.execute(
  "SELECT * FROM `users` WHERE `mobile`=?",
  [body.recipientNumber]
);

if(rowMobile.length > 1){

let errorTransactionId = `TID-${transactionId1 + transactionId2}`
let transactionMode = 'E';

let errorMessage = `${errorTransactionId} Failed. Multiple users with this number <u><b>(${body.recipientNumber})</b></u> detected! . Please contact us to resolve this error!`;

dbConnection.execute(
  "INSERT INTO `all_transactions` (`sender_id`,`mode`,`transaction_id`,`error_message`,`current_date`,`current_time`) VALUES (?,?,?,?,?,?)",
  [row[0].id,transactionMode,errorTransactionId,errorMessage,currentDate,currentTime]
);

res.send(`<h3>Failed. Multiple users with the same number detected!</h3> <br><br> <button><a href="/">GO BACK</a></button>`)
return;
}

if(rowMobile.length == 0){

let errorTransactionId = `TID-${transactionId1 + transactionId2}`
let transactionMode = 'E';

let errorMessage = `<span class="random-ids"><u><b>${errorTransactionId}</b></u></span> Failed. There Is No user with the number <span class="phone-number"><u><b>${body.recipientNumber}</b></u></span> Please check the number and try again`;

dbConnection.execute(
  "INSERT INTO `all_transactions` (`sender_id`,`mode`,`transaction_id`,`error_message`,`current_date`,`current_time`) VALUES (?,?,?,?,?,?)",
  [row[0].id,transactionMode,errorTransactionId,errorMessage,currentDate,currentTime]
);

res.send(`<h3>No user with such number !</h3> <br><br> <button><a href="/">GO BACK</a></button>`)
return;
}
  
// Find the total income in 2 decimal places
const totalIncome = parseFloat(detectTransactionCost())

let getSenderBalance = parseFloat(row[0].balance);
let getRecipientAmount = parseFloat(body.recipientQuantity);

let calculatedSenderBalance = getSenderBalance - (getRecipientAmount+totalIncome);

let expectedAmount = ()=>{
  return totalIncome +(getRecipientAmount - getSenderBalance) 
}

let findTotalAmountExpected = expectedAmount()
let qt = getRecipientAmount + totalIncome;

if(rowMobile.length == 1){
if(recipientNumber === row[0].mobile){

let errorTransactionId = `TID-${transactionId1 + transactionId2}`
let transactionMode = 'E';

let errorMessage = `<span class="random-ids"><u><b>${errorTransactionId}</b></u></span> Failed. You can not send money to your own number! Your number is <span class="phone-number"><u>${row[0].mobile}</u></span> And recipient number is <span class="phone-number"><u>${recipientNumber}</u></span>. Please Check the number And Try Again`

dbConnection.execute(
  "INSERT INTO `all_transactions` (`sender_id`,`mode`,`transaction_id`,`error_message`,`current_date`,`current_time`) VALUES (?,?,?,?,?,?)",
  [row[0].id,transactionMode,errorTransactionId,errorMessage,currentDate,currentTime]
);

res.send(`<h3>You cannot send money to the same number. Your number is: ( ${row[0].mobile} ) And recipient number is: ( ${recipientNumber} ). Please Check the number And Try Again</h3> <br><br> <button><a href="/">GO BACK</a></button>`)
return;
}

if(parseFloat(body.recipientQuantity) <= 4){
let warningTransactionId = `TID-${transactionId1 + transactionId2}`
let transactionMode = 'W';
const minimumAmount = 5.00;

let warningMessage = `<span class="random-ids"><u><b>${warningTransactionId}</b></u></span> Failed. You can not send funds less than <span class="money"><b><u>Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(minimumAmount).slice(4)}</u></b></span> Current balance is <span class="money"><b><u> Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(row[0].balance).slice(4)}</u></b></span> Please top up and try again.`

dbConnection.execute(
"INSERT INTO `all_transactions` (`sender_id`,`mode`,`transaction_id`,`warning_message`,`current_date`,`current_time`) VALUES (?,?,?,?,?,?)",
[row[0].id,transactionMode,warningTransactionId,warningMessage,currentDate,currentTime]
);    

res.send(`<h3>${warningTransactionId} Confirmed You can not send money less than Ksh 5.00. Current balance is: ${row[0].balance}. Please top up and try again.</h3> <br><br> <button><a href="/">GO BACK</a></button>`)
return;
}

if(getSenderBalance < qt){
let warningTransactionId = `TID-${transactionId1 + transactionId2}`
let transactionMode = 'W';

let warningMessage = `<span class="random-ids"><u><b>${warningTransactionId}</b></u></span> Failed. You do not have sufficient funds to send <span class="money"><b><u>Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(getRecipientAmount).slice(4)}</u></b></span> Your balance is <span class="money"><b><u>Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(getSenderBalance).slice(4)}</u></b></span> You should pay a transaction fee of <span class="money"><b><u>Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(totalIncome).slice(4)}</u></b></span> Please top up <span class="money"><b><u>Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(findTotalAmountExpected).slice(4)}</u></b></span> and Try Again`

dbConnection.execute(
  "INSERT INTO `all_transactions` (`sender_id`,`mode`,`transaction_id`,`warning_message`,`current_date`,`current_time`) VALUES (?,?,?,?,?,?)",
  [row[0].id,transactionMode,warningTransactionId,warningMessage,currentDate,currentTime]
);

res.send(`<h3>You do not have sufficient funds to send Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(parseFloat(body.recipientQuantity)).slice(4)}. Your balance is Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(row[0].balance).slice(4)}. Please top up And Try Again</h3> <br><br> <button><a href="/">GO BACK</a></button>`)
return;
}

const checkUserPassword = await bcrypt.compare(body.pword, row[0].password);
      
if(checkUserPassword !== true){
let warningTransactionId = `TID-${transactionId1 + transactionId2}`
let transactionMode = 'W';

let warningMessage = `<span class="random-ids"><u><b>${warningTransactionId}</b></u></span> Warning! You entered a wrong password`

dbConnection.execute(
  "INSERT INTO `all_transactions` (`sender_id`,`mode`,`transaction_id`,`warning_message`,`current_date`,`current_time`) VALUES (?,?,?,?,?,?)",
  [row[0].id,transactionMode,warningTransactionId,warningMessage,currentDate,currentTime]
);

res.send(`<h3>Warning! You entered a wrong password</h3> <br><br> <button><a href="/">GO BACK</a></button>`)
return;
}else{
// update the sender & recipient data

const successTransactionIds = `TID-${transactionId1 + transactionId2}`

let [oldRecipientBalance] = await dbConnection.execute(
  "SELECT `balance` FROM `users` WHERE `mobile`=?",
  [body.recipientNumber]
);

let recipientBal = 0;
const getRecipientBal = ()=>{
  oldRecipientBalance.forEach(bal => {
    recipientBal += parseFloat(bal.balance) 
  });
  return recipientBal;
}
    
let calculateRecipientBalance = getRecipientBal() + parseFloat(body.recipientQuantity);


      
// ================================================= //
  // Find recipient,tax and company income
// ================================================= //            

const recipientIncomeFromTransactionCostInPercentage = (10).toFixed(2); // recipient receive 11% TC
const taxFromCompanyInPercentage = (25).toFixed(2); // tax is 25% of company income
// Function to convert percentage to real cash
const convertPercentageIncome = (cost, percentage) => {
  return ((cost/100)*percentage).toFixed(2)
}



// Find real Recipient income 
const recipientIncome = parseFloat(convertPercentageIncome(totalIncome, recipientIncomeFromTransactionCostInPercentage))

// Find company income without any tax deductions
const companyIncomeWithoutTaxDeduction = parseFloat(totalIncome - recipientIncome)

// Find total tax deducted from company income
const tax = parseFloat(convertPercentageIncome(companyIncomeWithoutTaxDeduction, taxFromCompanyInPercentage))

// Find the total income of the company after Tax deductions
const companyIncomeWithTaxDeduction = parseFloat(companyIncomeWithoutTaxDeduction - tax).toFixed(2);

// The sender income should be 0.00. No sender will earn
const senderIncome = 0.00;

// The recipient transaction cost should be 0.00
const recipientTransactionCost = 0.00;


// ============================================== //
          // LOG OUTPUTS BELOW //
// ============================================== //

console.log(`Total income Ksh ${parseFloat(totalIncome)}`);
console.log(`Tax Ksh ${tax}`);
console.log(`company income Ksh ${companyIncomeWithTaxDeduction}`);
console.log(`recipient income Ksh ${recipientIncome}`);
console.log(`sender income Ksh ${senderIncome}`);

let [oldRecipientWalletIncome] = await dbConnection.execute(
  "SELECT `income` FROM `users` WHERE `mobile`=?",
  [body.recipientNumber]
);

let recipientWalletIncome = 0;
const getRecipientWalletIncome = ()=>{
  oldRecipientWalletIncome.forEach(inc => {
    recipientWalletIncome += parseFloat(inc.income) 
  });
  return recipientWalletIncome;
}

let recipientFirstName;
let recipientLastName;
const getRecipientNames = ()=>{
  rowMobile.forEach(name => {
    recipientFirstName = name.first_name
    recipientLastName = name.last_name
  });
  return recipientFirstName + ' ' + recipientLastName;
}

console.log(getRecipientNames());
  
let calculateRecipientIncomeBalance = getRecipientWalletIncome() + recipientIncome;

let recipientNumber = body.recipientNumber;

dbConnection.execute("UPDATE `users` SET `balance` =? WHERE `id`=?", [calculatedSenderBalance, req.session.userID]);

dbConnection.execute("UPDATE `users` SET `balance` =?, `income` =? WHERE `mobile`=?", [calculateRecipientBalance, calculateRecipientIncomeBalance, recipientNumber]);

// dbConnection.execute("UPDATE `users` SET `balance` =? WHERE `mobile`=?", [calculateRecipientBalance, recipientNumber]);

const senderSuccessMessage = `<span class="random-ids"><u><b>${successTransactionIds}</b></u></span> Confirmed You have successfully sent <span class="money"><b><u>Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(body.recipientQuantity).slice(4)} </u></b></span> to <b>${getRecipientNames()}</b> (<span class="phone-number"><u>${recipientNumber}</u></span>). On (<b>${currentDate}</b> at <b>${currentTime}</b>). New KEPAS balance is <span class="money"><b><u>Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(calculatedSenderBalance).slice(4)}</u></b></span>. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM.`

const recipeintSuccessMessage = `<span class="random-ids"><u><b>${successTransactionIds}</b></u></span> Confirmed You have Received <span class="money"><b><u>Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(body.recipientQuantity).slice(4)} </u></b></span> from <b>${row[0].first_name}</b> <b>${row[0].last_name}</b> (<span class="phone-number"><u>${row[0].mobile}</u></span>). On (<b>${currentDate}</b> at <b>${currentTime}</b>) New KEPAS balance is <span class="money"><b><u>Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(calculateRecipientBalance).slice(4)}</u></b></span>. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM.`;

const [getAllRecipientData] = await dbConnection.execute("SELECT * FROM `users` WHERE `mobile`=?", [body.recipientNumber]);

let senderTransactionMode = 'S'; //S stands for Sender
let recipientTransactionMode = 'R'; //R stands for Recipient

// sender
dbConnection.execute(
  "INSERT INTO `all_transactions` (`sender_id`,`recipient_id`,`amount`,`sender_mode`,`sender_first_name`,`sender_last_name`,`sender_mobile`,`sender_transaction_cost`,`sender_income`,`recipient_first_name`,`recipient_last_name`,`recipient_mobile`,`recipient_transaction_cost`,`recipient_income`,`transaction_id`,`sender_success_message`,`current_date`,`current_time`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
  [row[0].id,getAllRecipientData[0].id,parseFloat(body.recipientQuantity),senderTransactionMode,row[0].first_name,row[0].last_name,row[0].mobile,parseFloat(totalIncome),senderIncome,getAllRecipientData[0].first_name,getAllRecipientData[0].last_name,getAllRecipientData[0].mobile,recipientTransactionCost,recipientIncome,successTransactionIds,senderSuccessMessage,currentDate,currentTime]
); 

// recipient
dbConnection.execute(
  "INSERT INTO `all_transactions` (`sender_id`,`recipient_id`,`amount`,`recipient_mode`,`sender_first_name`,`sender_last_name`,`sender_mobile`,`sender_transaction_cost`,`sender_income`,`recipient_first_name`,`recipient_last_name`,`recipient_mobile`,`recipient_transaction_cost`,`transaction_id`,`recipient_income`,`recipient_success_message`,`current_date`,`current_time`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
  [row[0].id,getAllRecipientData[0].id,parseFloat(body.recipientQuantity),recipientTransactionMode,row[0].first_name,row[0].last_name,row[0].mobile,parseFloat(totalIncome),senderIncome,getAllRecipientData[0].first_name,getAllRecipientData[0].last_name,getAllRecipientData[0].mobile,recipientTransactionCost,successTransactionIds, recipientIncome,recipeintSuccessMessage,currentDate,currentTime]
);

// in_wallet
dbConnection.execute(
  "INSERT INTO `in_wallet` (`recipient_id`, `transaction_cost`, `wallet_income`, `date`, `time`) VALUES (?,?,?,?,?)", [getAllRecipientData[0].id, parseFloat(totalIncome), recipientIncome, currentDate, currentTime]
);
}
}

// req.flash('info', 'Successfully')
// res.redirect('./mainPage')

res.send(`<div class="send-page"><h3>You have successfully sent ${parseFloat(body.recipientQuantity)} to ${recipientNumber}. New balance is: ${calculatedSenderBalance}. Thank you choosing our platform. KEPAS, with you everywhere. </h3> <br><br> <button><a href="/">GO BACK</a></button></div>`);
return;
}