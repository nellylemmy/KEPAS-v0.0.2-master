// include modules
const { validationResult } = require("express-validator");
const bcrypt = require('bcryptjs');
const dbConnection = require("../../utils/dbConnection");
const moment = require('moment');
const { DateTime } = require("luxon");

// generate argent number
let generateRandomNumbers = function(amount, limit) {
var result = [],
  memo = {};

while(result.length < amount) {
  var num = Math.floor((Math.random() * limit) + 1);
  if(!memo[num]) { memo[num] = num; result.push(num); };
}
return result; 
}
  
exports.userMainPage_withdrawMoney_fromAgent = async (req, res, next) => {
// const currentTimeAndDate = moment().format('llll');
const currentTime = moment().format('LT');
const currentDate = moment().format('ll');

const now = DateTime.now();
console.log(`now is ${now}`)

// generate transaction ID:
const transactionId1 = generateRandomNumbers(5, 9).join('');
const transactionId2 = generateRandomNumbers(5, 9).join('');

const errors = validationResult(req);
const { body } = req;

let customerCurrentCost = 0; // Cost before any transaction
const userAmountToWithdraw = parseFloat(body.amountToWithdraw); // The amount a user want to withdraw

// Function to detect what amount user send
const detectUserTransactionCost = () => {
if(userAmountToWithdraw >= 1 && userAmountToWithdraw <= 100){
  customerCurrentCost += 10;
  return customerCurrentCost;
}

if(userAmountToWithdraw >= 101 && userAmountToWithdraw <= 500){
  customerCurrentCost += 6;
  return customerCurrentCost;
}

if(userAmountToWithdraw >= 501 && userAmountToWithdraw <= 1000){
  customerCurrentCost += 12;
  return customerCurrentCost;
}

if(userAmountToWithdraw >= 1001 && userAmountToWithdraw <= 1500){
  customerCurrentCost += 22;
  return customerCurrentCost;
}

if(userAmountToWithdraw >= 1501 && userAmountToWithdraw <= 2500){
  customerCurrentCost += 32;
  return customerCurrentCost;
}

if(userAmountToWithdraw >= 2501 && userAmountToWithdraw <= 3500){
  customerCurrentCost += 51;
  return customerCurrentCost;
}

if(userAmountToWithdraw >= 3501 && userAmountToWithdraw <= 5000){
  customerCurrentCost += 55;
  return customerCurrentCost;
}

if(userAmountToWithdraw >= 5001 && userAmountToWithdraw <= 7500){
  customerCurrentCost += 75;
  return customerCurrentCost;
}

if(userAmountToWithdraw >= 7501 && userAmountToWithdraw <= 10000){
  customerCurrentCost += 87;
  return customerCurrentCost;
}

if(userAmountToWithdraw >= 10001 && userAmountToWithdraw <= 15000){
  customerCurrentCost += 97;
  return customerCurrentCost;
}

if(userAmountToWithdraw >= 15001 && userAmountToWithdraw <= 20000){
  customerCurrentCost += 102;
  return customerCurrentCost;
}

if(userAmountToWithdraw >= 20001 && userAmountToWithdraw <= 35000){
  customerCurrentCost += 105;
  return customerCurrentCost;
}

if(userAmountToWithdraw >= 35001 && userAmountToWithdraw <= 1000000){
  customerCurrentCost += 105;
  return customerCurrentCost;
}

if(userAmountToWithdraw > 1000000){
  customerCurrentCost += 1665;
  return customerCurrentCost;
}


return customerCurrentCost;

}


let agentNumber = body.agentNumber;

const [row] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);

const [rowAgentNumber] = await dbConnection.execute(
  "SELECT * FROM `agents` WHERE `agent_number`=?",
  [agentNumber]
);


if(rowAgentNumber.length == 0){

let errorTransactionId = `TID-${transactionId1 + transactionId2}`
let transactionMode = 'E';

let errorMessage = `<span class="random-ids"><u><b>${errorTransactionId}</b></u></span> Failed. Please check agent number <span class="phone-number"><u><b>${body.agentNumber}</b></u></span> does not exist!`;

dbConnection.execute(
  "INSERT INTO `all_transactions` (`sender_id`,`mode`,`transaction_id`,`error_message`,`current_date`,`current_time`) VALUES (?,?,?,?,?,?)",
  [row[0].id,transactionMode,errorTransactionId,errorMessage,currentDate,currentTime]
  );

res.send(`<h3> ${errorMessage} <br><br> <button><a href="/">GO BACK</a></button>`)
return;
}

// Find the total income in 2 decimal places
const totalIncome = parseFloat(detectUserTransactionCost())

let getSenderBalance = parseFloat(row[0].balance);
let getAgentAmount = parseFloat(body.amountToWithdraw);

let calculatedSenderBalance = getSenderBalance - (getAgentAmount+totalIncome);

let expectedAmount = ()=>{
  return totalIncome +(getAgentAmount - getSenderBalance) 
}

let findTotalAmountExpected = expectedAmount()

let qt = getAgentAmount + totalIncome;

if(rowAgentNumber.length == 1){

if(parseFloat(body.amountToWithdraw) < 50){
  let warningTransactionId = `TID-${transactionId1 + transactionId2}`
  let transactionMode = 'W';
  const minimumAmount = 50.00;

  let warningMessage = `<span class="random-ids"><u><b>${warningTransactionId}</b></u></span> Failed. You can not withdraw funds less than <span class="money"><b><u>Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(minimumAmount).slice(4)}</u></b></span> Current balance is <span class="money"><b><u> Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(row[0].balance).slice(4)}</u></b></span> Please try again.`

dbConnection.execute(
  "INSERT INTO `all_transactions` (`sender_id`,`mode`,`transaction_id`,`warning_message`,`current_date`,`current_time`) VALUES (?,?,?,?,?,?)",
  [row[0].id,transactionMode,warningTransactionId,warningMessage,currentDate,currentTime]
);    

res.send(`<h3> ${warningMessage} </h3> <br><br> <button><a href="/">GO BACK</a></button>`)
return;
}


if(getSenderBalance < qt){
  let warningTransactionId = `TID-${transactionId1 + transactionId2}`
  let transactionMode = 'W';

  let warningMessage = `<span class="random-ids"><u><b>${warningTransactionId}</b></u></span> Failed. You do not have sufficient funds to withdraw <span class="money"><b><u>Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(getAgentAmount).slice(4)}</u></b></span> Your balance is <span class="money"><b><u>Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(getSenderBalance).slice(4)}</u></b></span> You should pay a transaction fee of <span class="money"><b><u>Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(totalIncome).slice(4)}</u></b></span> Please top up <span class="money"><b><u>Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(findTotalAmountExpected).slice(4)}</u></b></span> and Try Again`

dbConnection.execute(
  "INSERT INTO `all_transactions` (`sender_id`,`mode`,`transaction_id`,`warning_message`,`current_date`,`current_time`) VALUES (?,?,?,?,?,?)",
  [row[0].id,transactionMode,warningTransactionId,warningMessage,currentDate,currentTime]
);

res.send(`<h3> ${warningMessage} </h3> <br><br> <button><a href="/">GO BACK</a></button>`)
return;
}

const checkUserPassword = await bcrypt.compare(body.userPassword, row[0].password);

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
// update the sender & agent data

const successTransactionIds = `TID-${transactionId1 + transactionId2}`

let [oldAgentBalance] = await dbConnection.execute(
  "SELECT `agent_total_bal` FROM `agents` WHERE `agent_number`=?",
  [agentNumber]
);

let agentBal = 0;
const getAgentBal = ()=>{
  oldAgentBalance.forEach(bal => {
    agentBal += parseFloat(bal.agent_total_bal) 
  });
  return agentBal;
}
  
let calculateAgentBalance = getAgentBal() + parseFloat(body.amountToWithdraw);



// ================================================= //
// Find agent,tax and company income
// ================================================= //            

const agentIncomeFromTransactionCostInPercentage = (10).toFixed(2); // agent receive 11% TC
const taxFromCompanyInPercentage = (25).toFixed(2); // tax is 25% of company income
// Function to convert percentage to real cash
const convertPercentageIncome = (cost, percentage) => {
return ((cost/100)*percentage).toFixed(2)
}



// Find real Agent income 
const agentIncome = parseFloat(convertPercentageIncome(totalIncome, agentIncomeFromTransactionCostInPercentage))

// Find company income without any tax deductions
const companyIncomeWithoutTaxDeduction = parseFloat(totalIncome - agentIncome)

// Find total tax deducted from company income
const tax = parseFloat(convertPercentageIncome(companyIncomeWithoutTaxDeduction, taxFromCompanyInPercentage))

// Find the total income of the company after Tax deductions
const companyIncomeWithTaxDeduction = parseFloat(companyIncomeWithoutTaxDeduction - tax).toFixed(2);

// The sender income should be 0.00. No sender will earn
const senderIncome = 0.00;

// The agent transaction cost should be 0.00
const agentTransactionCost = 0.00;


// ============================================== //
  // LOG OUTPUTS BELOW //
// ============================================== //

console.log(`Total income Ksh ${parseFloat(totalIncome)}`);
console.log(`Tax Ksh ${tax}`);
console.log(`company income Ksh ${companyIncomeWithTaxDeduction}`);
console.log(`agent income Ksh ${agentIncome}`);
console.log(`sender income Ksh ${senderIncome}`);

let [oldAgentWalletIncome] = await dbConnection.execute(
"SELECT `agent_total_income` FROM `agents` WHERE `agent_number`=?",
[agentNumber]
);

let agentWalletIncome = 0;
const getAgentWalletIncome = ()=>{
oldAgentWalletIncome.forEach(inc => {
  agentWalletIncome += parseFloat(inc.agent_total_income) 
});
return agentWalletIncome;
}

let currentAgentName;
const getAgentNames = ()=>{
rowAgentNumber.forEach(agentData => {
  currentAgentName = agentData.agent_name
});
return currentAgentName;
}

console.log(getAgentNames());

let calculateAgentIncomeBalance = getAgentWalletIncome() + agentIncome;

// let agentNumber = body.agentNumber;

dbConnection.execute("UPDATE `users` SET `balance` =? WHERE `id`=?", [calculatedSenderBalance, req.session.userID]);

dbConnection.execute("UPDATE `agents` SET `agent_total_bal` =?, `agent_total_income` =? WHERE `agent_number`=?", [calculateAgentBalance, calculateAgentIncomeBalance, agentNumber]);

const senderSuccessMessage = `<span class="random-ids"><u><b>${successTransactionIds}</b></u></span> Confirmed You have successfully withdraw <span class="money"><b><u>Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(body.amountToWithdraw).slice(4)} </u></b></span> from <b>${getAgentNames()}</b> (<span class="phone-number"><u>${agentNumber}</u></span>). On (<b>${currentDate}</b> at <b>${currentTime}</b>). New KEPAS balance is <span class="money"><b><u>Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(calculatedSenderBalance).slice(4)}</u></b></span>. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM.`

const recipeintSuccessMessage = `<span class="random-ids"><u><b>${successTransactionIds}</b></u></span> Confirmed You Received <span class="money"><b><u>Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(body.amountToWithdraw).slice(4)} </u></b></span> from <b>${row[0].first_name}</b> <b>${row[0].last_name}</b> (<span class="phone-number"><u>${row[0].mobile}</u></span>). On (<b>${currentDate}</b> at <b>${currentTime}</b>) New agent balance is <span class="money"><b><u>Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(calculateAgentBalance).slice(4)}</u></b></span>. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM.`;

const [getAllAgentData] = await dbConnection.execute("SELECT * FROM `agents` WHERE `agent_number`=?", [agentNumber]);

let senderTransactionMode = 'S'; //S stands for Sender
let agentTransactionMode = 'R'; //W stands for Agent

  // sender
dbConnection.execute(
  "INSERT INTO `all_transactions` (`sender_id`,`agent_id`,`amount`,`mode`,`sender_first_name`,`sender_last_name`,`sender_mobile`,`sender_transaction_cost`,`sender_income`,`agent_name`,`agent_number`,`agent_mobile`,`transaction_id`,`sender_success_message`,`current_date`,`current_time`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
  [row[0].id,getAllAgentData[0].id,parseFloat(body.amountToWithdraw),senderTransactionMode,row[0].first_name,row[0].last_name,row[0].mobile,parseFloat(totalIncome),senderIncome,getAllAgentData[0].agent_name,getAllAgentData[0].agent_number,getAllAgentData[0].agent_phone,successTransactionIds,senderSuccessMessage,currentDate,currentTime]
); 

  // agent
dbConnection.execute(
  "INSERT INTO `all_transactions` (`sender_id`,`agent_id`,`amount`,`mode`,`sender_first_name`,`sender_last_name`,`sender_mobile`,`sender_transaction_cost`,`sender_income`,`agent_name`,`agent_number`,`agent_mobile`,`transaction_id`,`agent_income`,`agent_success_message`,`current_date`,`current_time`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
  [row[0].id,getAllAgentData[0].id,parseFloat(body.amountToWithdraw),agentTransactionMode,row[0].first_name,row[0].last_name,row[0].mobile,parseFloat(totalIncome),senderIncome,getAllAgentData[0].agent_name,getAllAgentData[0].agent_number,getAllAgentData[0].agent_phone,successTransactionIds, agentIncome,recipeintSuccessMessage,currentDate,currentTime]
);

  // in_wallet
// dbConnection.execute(
//     "INSERT INTO `in_wallet` (`agent_id`, `transaction_cost`, `wallet_income`, `date`, `time`) VALUES (?,?,?,?,?)", [getAllAgentData[0].id, parseFloat(totalIncome), agentIncome, currentDate, currentTime]
// );


return(res.send(`<div class="send-page"><h3>You have successfully withdraw ${parseFloat(body.amountToWithdraw)} from ${getAllAgentData[0].agent_name} ( ${agentNumber} ). Your new balance is: ${calculatedSenderBalance}. Thank you for choosing our platform. KEPAS, YOUR MONEY FREEDOM. </h3> <br><br> <button><a href="/">GO BACK</a></button></div>`));
}

}else if(rowAgentNumber.length > 1){
  return(res.send(`<div class="send-page"><h3>Sorry but we have problems with this agent number. </h3> <br><br> <button><a href="/">GO BACK</a></button></div>`));
}else{
  return(res.send(`<div class="send-page"><h3>There was an error. Please try again later </h3> <br><br> <button><a href="/">GO BACK</a></button></div>`));
}
}