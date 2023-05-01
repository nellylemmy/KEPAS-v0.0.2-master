// All User Database functionalities will be foud in this document (userController.js)

const { validationResult } = require("express-validator");
const bcrypt = require('bcryptjs');
const dbConnection = require("../../utils/dbConnection");
const moment = require('moment');
const express = require('express');
const app = express();
const flash = require('connect-flash');
const cookieParser = require('cookie-parser');
const session = require('express-session');
// const chartjs = require('chart.js');

app.use(cookieParser('secretStringForCookies'));
app.use(session({
    name: 'session',
    secret: 'my_secret',
    resave: false,
    saveUninitialized: false,
    cookie: {
        maxAge: 3600 * 1000000, // 10yrs
    }
}));

app.use(express.json());

app.use(flash());
// generate argent number
var generateRandomNumbers = function(amount, limit) {
    var result = [],
        memo = {};
    
    while(result.length < amount) {
        var num = Math.floor((Math.random() * limit) + 1);
        if(!memo[num]) { memo[num] = num; result.push(num); };
    }
    return result; 
  }
  
  const argentNumber = generateRandomNumbers(6, 9).join('');
  const companyNumber = generateRandomNumbers(5,9).join('');
  const bankNumber = generateRandomNumbers(4,9).join('');

// get users
exports.allUsers = async(req,res,next) => {
    const [usersRow] = await dbConnection.execute("SELECT first_name, last_name, mobile, email, country FROM users ORDER BY id DESC")

    if(usersRow.length < 1){
        return res.send('error occured');
    }

    res.send(usersRow)
}

// get transactions
exports.allTransactions = async(req,res,next) => {
    let senderMode = 's'
    const [transactions] = await dbConnection.execute("SELECT id,amount,sender_mode,sender_transaction_cost,sender_income,recipient_transaction_cost,recipient_income,transaction_id,date_time FROM all_transactions WHERE sender_mode =? ORDER BY date_time ASC", [senderMode])

    if(transactions < 1){
        return res.send(`No Transactions for Entry ('${senderMode}')`);
    }

    var eth = `/^(0x)[0-9a-f]{40}$/i`;
    console.log(eth);

    res.send(transactions)
}


// Home Page
exports.homePage = async (req, res, next) => {
    
    const [userRow] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);

    const [agentRow] = await dbConnection.execute("SELECT * FROM `agents` WHERE `id`=?", [req.session.userID]);

    
    if (userRow.length !== 1) {
            if (agentRow.length !== 1) {
                return res.send('No Agent In The Database');    
            }else{
                if(agentRow[0].is_agent === "yes"){
                    // update any other field making it null
                    dbConnection.execute("UPDATE `agents` SET `is_company` = NULL, `is_local_user` = NULL, `is_bank` = NULL WHERE `id`=?", [req.session.userID])

                    res.redirect('/agent/agentmainpage');
                    return;
                    }
                }
        return res.send('No user In The Database');

    }else{
        if(userRow[0].is_local_user === "yes"){
            // update any other field making it null
            dbConnection.execute("UPDATE `users` SET `is_agent` = NULL, `is_company` = NULL, `is_bank` = NULL WHERE `id`=?", [req.session.userID])

            res.redirect('/user/mainPage');
            return;
        }
    }

    
    

    

    

    if(userRow[0].is_company === "yes"){

         // update any other field making it null
        dbConnection.execute("UPDATE `users` SET `is_local_user` = NULL, `is_agent` = NULL, `is_bank` = NULL WHERE `id`=?", [req.session.userID])

        res.redirect('/company/mainPage');
        return;
    }

    if(userRow[0].is_bank === "yes"){

         // update any other field making it null
        dbConnection.execute("UPDATE `users` SET `is_local_user` = NULL, `is_agent` = NULL, `is_company` = NULL WHERE `id`=?", [req.session.userID])

        res.redirect('/bank/mainPage');
        return;
    }
    
    // res.render('user/home', {
    //     user: row[0]
    // });
    
}

exports.agentHomePage = async (req, res, next) => {
    
    const [row] = await dbConnection.execute("SELECT * FROM `agents` WHERE `id`=?", [req.session.userID]);
    
    if (row.length !== 1) {
        return res.send('No User In The Database');
    }
    

    // if(row[0].is_local_user === "yes"){

    //     // update any other field making it null
    //     dbConnection.execute("UPDATE `agents` SET `is_agent` = NULL, `is_company` = NULL, `is_bank` = NULL WHERE `id`=?", [req.session.userID])

    //     res.redirect('/agent/mainPage');
    //     return;
    // }

    if(row[0].is_agent === "yes"){
        console.log('is agent yes')

         // update any other field making it null
        dbConnection.execute("UPDATE `agents` SET `is_company` = NULL, `is_local_user` = NULL, `is_bank` = NULL WHERE `id`=?", [req.session.userID])

        res.redirect('/agent/home');
        return;
    }

    // if(row[0].is_company === "yes"){

    //      // update any other field making it null
    //     dbConnection.execute("UPDATE `agents` SET `is_local_user` = NULL, `is_agent` = NULL, `is_bank` = NULL WHERE `id`=?", [req.session.userID])

    //     res.redirect('/company/mainPage');
    //     return;
    // }

    // if(row[0].is_bank === "yes"){

    //      // update any other field making it null
    //     dbConnection.execute("UPDATE `agents` SET `is_local_user` = NULL, `is_agent` = NULL, `is_company` = NULL WHERE `id`=?", [req.session.userID])

    //     res.redirect('/bank/mainPage');
    //     return;
    // }
    
    res.render('agent/home', {
        user: row[0]
    });
    
}

// Home Page
// exports.home = async (req, res, next) => {
//     const [row] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);
    
//     if (row.length !== 1) {
//         return res.send('No User In The Database');
//     }
//     // res.render("user/completeUser");
    
//     res.render('user/home', {
//         user: row[0]
//     });
// }

exports.userMainPage_withdrawMoney_fromAgent = async (req, res, next) => {
    const errors = validationResult(req);
    const { body } = req;

    // const agentNumber = body.agentNumber;
    // const amountWithdrawn = body.amountToWithdraw;

    await dbConnection.execute("UPDATE `agents` SET `customer_amt_withdrawn` =? WHERE `agent_number`=?", [body.amountToWithdraw, body.agentNumber]);

    console.log('user successfully withdaw the money');


    res.redirect('./mainPage')
}

exports.wallet = async (req, res, next) => {
    const [row] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);

    res.render('user/wallet', {
        user: row[0],
    });
}

exports.withdraw_my_wallet = async (req,res,next) => {
    const { body } = req;
    // generate transaction ID:
    const walletTransactionId1 = generateRandomNumbers(5, 9).join('');
    const walletTransactionId2 = generateRandomNumbers(5, 9).join('');

    // time
    const walletCurrentTime = moment().format('LT');
    const walletCurrentDate = moment().format('ll');

    const [row] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);

    const userCurrentWalletBalance = parseFloat(row[0].income);
    const userCurrentLocalBalance = parseFloat(row[0].balance);
    const userWalletAmount = parseFloat(body.walletAmount);
    const checkWalletPassword = await bcrypt.compare(body.walletPassword, row[0].password);
       // add income to local balance and update the table. incoma and balance.
    const addIncomeAndBalance = parseFloat(userCurrentLocalBalance + userCurrentWalletBalance).toFixed(2);

    if(userWalletAmount <= 1 || userWalletAmount == NaN || userWalletAmount == null || userWalletAmount == undefined || userWalletAmount == " "){
        res.send(`<h3>Warning! You can not transact amount less than 2Ksh</h3> <br><br> <button><a href="/">GO BACK</a></button>`)
        return;
    }
    if(userWalletAmount > userCurrentWalletBalance){
        res.send(`<h3>Warning! can not transact amount more than ${userCurrentWalletBalance}</h3> <br><br> <button><a href="/">GO BACK</a></button>`)
        return;
    }
        
    if(checkWalletPassword !== true || checkWalletPassword == ''){
        let warningTransactionId = `TID-${walletTransactionId1 + walletTransactionId2}`
        let transactionMode = 'W';
        
        let warningMessage = `<span class="random-ids"><u><b>${warningTransactionId}</b></u></span> Warning! Please check your password and try again!`

        dbConnection.execute(
            "INSERT INTO `all_transactions` (`sender_id`,`mode`,`transaction_id`,`warning_message`,`current_date`,`current_time`) VALUES (?,?,?,?,?,?)",
            [row[0].id,transactionMode,warningTransactionId,warningMessage,walletCurrentDate,walletCurrentTime]
            );

        res.send(`<h3>Warning! Please check your password and try again!</h3> <br><br> <button><a href="/">GO BACK</a></button>`)
        return;
    }

       

    console.log(`the input is: ${userWalletAmount}`)
        console.log(`balance: ${row[0].balance}`);
        console.log(`wallet: ${row[0].income}`);
        console.log(`TOTAL = ${parseFloat(addIncomeAndBalance).toFixed(2)}`);
  
    
    // const userWalletAmount = body.walletAmount;
    // const userWalletPassword = body.walletPassword;

    // console.log(`body amount input is ${userWalletAmount}`)
    // console.log(`body password input is ${userWalletPassword}`)

    // res.redirect('./mainPage');
    res.send(`<h3>Successfully transfered ${userWalletAmount.toFixed(2)} to local account</h3> <br><br> <button><a href="/user/wallet">GO BACK</a></button>`)
    return;
}

exports.userMainPage_sendMoney_userToUser = async (req, res, next) => {


    const currentTimeAndDate = moment().format('llll');
    const currentTime = moment().format('LT');
    const currentDate = moment().format('ll');

    // generate transaction ID:
    const transactionId1 = generateRandomNumbers(5, 9).join('');
    const transactionId2 = generateRandomNumbers(5, 9).join('');

    const errors = validationResult(req);
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

        const senderSuccessMessage = `<span class="random-ids"><u><b>${successTransactionIds}</b></u></span> Confirmed You have successfully sent <span class="money"><b><u>Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(body.recipientQuantity).slice(4)} </u></b></span> to <b>${getRecipientNames()}</b> (<span class="phone-number"><u>${recipientNumber}</u></span>). On (<b>${currentDate}</b> at <b>${currentTime}</b>). New BOM balance is <span class="money"><b><u>Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(calculatedSenderBalance).slice(4)}</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.`

        const recipeintSuccessMessage = `<span class="random-ids"><u><b>${successTransactionIds}</b></u></span> Confirmed You have Received <span class="money"><b><u>Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(body.recipientQuantity).slice(4)} </u></b></span> from <b>${row[0].first_name}</b> <b>${row[0].last_name}</b> (<span class="phone-number"><u>${row[0].mobile}</u></span>). On (<b>${currentDate}</b> at <b>${currentTime}</b>) New BOM balance is <span class="money"><b><u>Ksh ${Intl.NumberFormat('en-US', { style: 'currency',currency: 'KES'}).format(calculateRecipientBalance).slice(4)}</u></b></span>. Thank you for choosing our platform. BOM, YOUR MONEY FREEDOM.`;

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

    res.send(`<div class="send-page"><h3>You have successfully sent ${parseFloat(body.recipientQuantity)} to ${recipientNumber}. New balance is: ${calculatedSenderBalance}. Thank you choosing our platform. BOM, with you everywhere. </h3> <br><br> <button><a href="/">GO BACK</a></button></div>`);
    return;
}

// exports.withdraw_my_wallet = async (req, res, next) => {
//     const errors = validationResult(req);
//     // const { body } = req;
//     let walletAmount = req.wallet_amount_to_local_account;
//     let walletPassword = req.wallet_password;

//     const [row] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);

//     console.log(row[0].income);
//     console.log(`The Inputs are: wallet amount ${walletAmount} and password ${walletPassword}`)

//     res.redirect('./mainPage')
// }

// Render Page layouts
exports.welcome = (req, res, next) => {
    res.render("welcome");
};
exports.registerPage = (req, res, next) => {
    res.render("user/register");
};
exports.agentRegisterPage = (req, res, next) => {
    res.render("agent/register");
};
exports.loginPage = (req, res, next) => {
    res.render("user/login");
};
exports.agentloginPage = (req, res, next) => {
    res.render("agent/login");
};

exports.completeUserPage = (req, res, next) => {
    res.render("user/completeUser");
};

exports.completeArgentPage = (req, res, next) => {
    res.render("user/completeArgent");
};

exports.completeBankPage = (req, res, next) => {
    res.render("user/completeBank");
};

exports.completeCompanyPage = (req, res, next) => {
    res.render("user/completeCompany");
};

exports.morePage = (req, res, next) => {
    res.render("user/readMore");
};

exports.moreAboutPage = (req, res, next) => {
    res.render("user/readMore");
};


// complete account data by marking the checkbox
exports.completeUser = async (req, res, next) => {
    
    const [row] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);

    const errors = validationResult(req);
    const { body } = req;

    if (!errors.isEmpty()) {
        return res.render('user/completeUser', {
            error: errors.array()[0].msg
        });
    }

    try {
    
    if(row[0].is_local_user == null){   // will change to on
        console.log(`user should update`);
        dbConnection.execute("UPDATE `users` SET `is_local_user` =? WHERE `id`=?", [body.agree_user_complete, req.session.userID]);
        
        dbConnection.execute(
            "INSERT INTO `local_user`(`local_user_id`,`first_name`,	`last_name`,`mobile`,`email`,`password`,`country`) VALUES (?,?,?,?,?,?,?)",
            [row[0].id, row[0].first_name,row[0].last_name,row[0].mobile,row[0].email,row[0].password,row[0].country]
            );
            
            
            res.redirect('/user/mainPage'); //will render home for logedin
        }else if(row[0].is_local_user === "yes"){
            res.redirect('/user/mainPage');
        } else{
        res.render('user/home')
        return;
    }
    
    
}catch(e){
    next(e)
}


}

exports.completeArgent = async (req, res, next) => {
    
    const [row] = await dbConnection.execute("SELECT * FROM `agents` WHERE `id`=?", [req.session.userID]);

    const errors = validationResult(req);
    const { body } = req;
    
    if (!errors.isEmpty()) {
        return res.render('user/completeArgent', {
            error: errors.array()[0].msg
        });
    }
    
    try {
        
        if (row.length !== 1) {
            return res.send('No User In The Database');
        }
        
        if(row[0].is_agent == null){   // will change to on
            console.log(`agent should update`);
        dbConnection.execute("UPDATE `agents` SET `is_agent` =? WHERE `id`=?", [body.agree_agent_complete, req.session.userID]);
        
        dbConnection.execute(
            "INSERT INTO `agents`(`agent_id`,`number`,`name`,`phone`,`country`,`email`,`password`) VALUES (?,?,?,?,?,?,?)",
            [row[0].id, parseInt(argentNumber),row[0].first_name,row[0].mobile,row[0].country,row[0].email,row[0].password]
        );

        res.redirect('/agent/agentmainpage'); //will render home for logedin
    }else if(row[0].is_agent === "yes"){
        res.redirect('/agent/agentmainpage');
    } else{
        res.render('user/home')
        return;
    }
    

}catch(e){
    next(e)
    }
    
    
}

exports.completeCompany = async (req, res, next) => {
    
    const [row] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);
    
    const errors = validationResult(req);
    const { body } = req;
    
    if (!errors.isEmpty()) {
        return res.render('user/completeCompany', {
            error: errors.array()[0].msg
        });
    }

    try {
        
        if (row.length !== 1) {
            return res.send('No User In The Database');
        }

        if(row[0].is_company == null){   // will change to on
            console.log(`company should update`);
        dbConnection.execute("UPDATE `users` SET `is_company` =? WHERE `id`=?", [body.agree_company_complete, req.session.userID]);
        
        dbConnection.execute(
            "INSERT INTO `company`(`company_id`,`company_name`,`company_number`,`company_phone`,`email`,`password`,`country`) VALUES (?,?,?,?,?,?,?)",
            [row[0].id, row[0].last_name, parseInt(companyNumber),
            row[0].mobile, row[0].email, row[0].password, row[0].country]
            );

        res.redirect('/company/mainPage'); //will render home for logedin
    }else if(row[0].is_company === "yes"){
        res.redirect('/company/mainPage');
    } else{
        res.render('user/home')
        return;
    }
    
    
}catch(e){
    next(e)
    }
    
    
}

exports.completeBank = async (req, res, next) => {
    
    const [row] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);
    
    const errors = validationResult(req);
    const { body } = req;
    
    if (!errors.isEmpty()) {
        return res.render('user/completeBank', {
            error: errors.array()[0].msg
        });
    }
    
    try {
        
        if (row.length !== 1) {
            return res.send('No User In The Database');
        }
        
        if(row[0].is_bank == null){   // will change to on
            console.log(`Bank should update`);
            dbConnection.execute("UPDATE `users` SET `is_bank` =? WHERE `id`=?", [body.agree_bank_complete, req.session.userID]);
            
            dbConnection.execute(
                "INSERT INTO `banks`(`bank_id`,`bank_name`,`bank_number`,`bank_phone`,`email`,`password`,`country`) VALUES (?,?,?,?,?,?,?)",
                [row[0].id, row[0].last_name, parseInt(bankNumber),
            row[0].mobile, row[0].email, row[0].password, row[0].country]
            );
            
            res.redirect('/bank/mainPage'); //will render home for logedin
        }else if(row[0].is_bank === "yes"){
            res.redirect('/bank/mainPage');
        } else{
        res.render('user/home')
        return;
    }
    

}catch(e){
        next(e)
    }
    
    
}

exports.register = async (req, res, next) => {
    const errors = validationResult(req);
    const { body } = req;
    
    if (!errors.isEmpty()) {
        return res.render('user/register', {
            error: errors.array()[0].msg
        });
    }
    
    try {
        
        const [row] = await dbConnection.execute(
            "SELECT * FROM `users` WHERE `mobile`=?",
            [body.phone]
            );
            
            if (row.length >= 1) {
                return res.render('user/register', {
                    error: 'This Phone Number has already been used.'
                });
        }
        
        const [rowEmail] = await dbConnection.execute(
            "SELECT * FROM `users` WHERE `email`=?",
            [body.email]
            );
            
            if (rowEmail.length >= 1) {
            return res.render('user/register', {
                error: 'This Email has already been used.'
            });
        }
        
        const hashPass = await bcrypt.hash(body.password, 12);
        const pid = generateRandomNumbers(9,9).join('');

        const [rows] = await dbConnection.execute(
            "INSERT INTO `users`(`first_name`,`last_name`,`id_number`,`mobile`,`email`,`password`,is_local_user,`public_id`) VALUES (?,?,?,?,?,?,?,?)",
            [body.firstName, body.lastName, body.idnumber, body.phone, body.email, hashPass,body.agree_user_complete,pid]
            );
            
            
            if (rows.affectedRows !== 1) {
                return res.render('user/register', {
                    error: 'Your registration has failed.'
                });
            }
            console.log('data inserted');
            res.redirect('./login');
            
            //     res.redirect('./login', {
                //         msg: 'You have been successfully registered. Please fill in your phone number and password to login'
                // });
                
            } catch (e) {
                next(e);
            }
};

exports.agentRegister = async (req, res, next) => {
    console.log('from agent-register')
    const errors = validationResult(req);
    const { body } = req;
    
    if (!errors.isEmpty()) {
        return res.render('agent/register', {
            error: errors.array()[0].msg
        });
    }
    
    try {
        
        const [row] = await dbConnection.execute(
            "SELECT * FROM `agents` WHERE `agent_phone`=?",
            [body.phone]
            );
            
            if (row.length >= 1) {
                return res.render('agent/register', {
                    error: 'This Phone Number has already been used.'
                });
                
        }
        
        const [rowEmail] = await dbConnection.execute(
            "SELECT * FROM `agents` WHERE `agent_email`=?",
            [body.email]
            );
            
            if (rowEmail.length >= 1) {
            return res.render('agent/register', {
                error: 'This Email has already been used.'
            });
        }
        
        const hashPass = await bcrypt.hash(body.password, 12);
        const agentNumber = generateRandomNumbers(7,9).join('');

        const agentFullNames = `${body.firstName} ${body.lastName}`;

        const [newAgentRow] = await dbConnection.execute(
            "INSERT INTO `agents`(`agent_owner_full_names`,`agent_id`,`agent_phone`,`agent_email`,`agent_password`,`agent_number`) VALUES (?,?,?,?,?,?)",
            [agentFullNames, body.idnumber, body.phone, body.email, hashPass,agentNumber]
            );    
            
            if (newAgentRow.affectedRows !== 1) {
                return res.render('agent/register', {
                    error: 'Your registration has failed.'
                });
            }else{
            console.log('data inserted');
            res.redirect('./login');
            }
                
            } catch (e) {
                next(e);
            }
};


exports.login = async (req, res, next) => {

    const errors = validationResult(req);
    const { body } = req;
    
    if (!errors.isEmpty()) {
        return res.render('user/login', {
            error: errors.array()[0].msg
        });
    }
    
    try {
        
        const [row] = await dbConnection.execute('SELECT * FROM `users` WHERE `mobile`=?', [body.phone]);
        
        if (row.length != 1) {
            return res.render('user/login', {
                error: 'No user with such entry. Please try again with different credentials !'
            });
        }
        
        const checkPass = await bcrypt.compare(body.password, row[0].password);
        
        if (checkPass === true) {
            req.session.userID = row[0].id;
            return res.redirect('/');
        }
        
        res.render('user/login', {
            error: 'Credentials ERROR.'
        });
        
        
    }
    catch (e) {
        next(e);
    }
    
}

exports.agentLogin = async (req, res, next) => {

    const errors = validationResult(req);
    const { body } = req;
    
    if (!errors.isEmpty()) {
        return res.render('agent/login', {
            error: errors.array()[0].msg
        });
    }
    
    try {
        
        const [row] = await dbConnection.execute('SELECT * FROM `agents` WHERE `agent_phone`=?', [body.phone]);
        
        if (row.length != 1) {
            return res.render('agent/login', {
                error: 'No user with such entry. Please try again with different credentials !'
            });
        }
        
        const checkPass = await bcrypt.compare(body.password, row[0].agent_password);
        
        if (checkPass === true) {
            req.session.userID = row[0].id;
            return res.redirect('./agentmainpage');
        }
        
        res.render('agent/login', {
            error: 'Credentials ERROR.'
        });
        
        
    }
    catch (e) {
        next(e);
    }
    
}

exports.sendMoney = async (req, res, next) => {
    const [row] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);

    const [gMessages] = await dbConnection.execute("SELECT * FROM `all_transactions` WHERE `sender_id`=? OR `recipient_id`=? ORDER BY `date_time` DESC LIMIT 6",[req.session.userID, req.session.userID]);

    res.render('user/sendmoney', {
        user: row[0],
        msgGeneral:gMessages,
    });
    
}

exports.withdrawMoney = async (req, res, next) => {
    const [row] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);

    const [gMessages] = await dbConnection.execute("SELECT * FROM `all_transactions` WHERE `sender_id`=? OR `recipient_id`=? ORDER BY `date_time` DESC LIMIT 6",[req.session.userID, req.session.userID]);

    res.render('user/withdrawmoney', {
        user: row[0],
        msgGeneral:gMessages,
    });
    
}



exports.activity = async (req, res, next) => {
    const [row] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);

    res.render('user/activity', {
        user: row[0],
    });
    
}

exports.help = async (req, res, next) => {
    const [row] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);

    res.render('user/help', {
        user: row[0],
    });
    
}
exports.contact = async (req, res, next) => {
    const [row] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);

    res.render('user/contact', {
        user: row[0],
    });
    
}
exports.security = async (req, res, next) => {
    const [row] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);

    res.render('user/security', {
        user: row[0],
    });
    
}
exports.privacy = async (req, res, next) => {
    const [row] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);

    res.render('user/privacy', {
        user: row[0],
    });
    
}
exports.legal = async (req, res, next) => {
    const [row] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);

    res.render('user/legal', {
        user: row[0],
    });
    
}
exports.notifications = async (req, res, next) => {
    const [row] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);

    res.render('user/notifications', {
        user: row[0],
    });
    
}
exports.account = async (req, res, next) => {
    const [row] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);

    res.render('user/account', {
        user: row[0],
    });
    
}
exports.sendAndWithdraw = async (req, res, next) => {
    const [row] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);

    res.render('user/sendandwithdraw', {
        user: row[0],
    });
    
}







exports.userMainPage = async (req, res, next) => {
   
    const [row] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);

    // const [transactions] = await dbConnection.execute("SELECT * FROM `all_transactions` WHERE `sender_id`=? ORDER BY `date_time` DESC", [req.session.userID]);

    // const [senderSuccessMessage] = await dbConnection.execute("SELECT * FROM `all_transactions` WHERE `sender_id`=? ORDER BY `date_time` DESC", [req.session.userID]);

    // const [checkIfShowBalanceIsOn] = await dbConnection.execute("SELECT show_balance FROM `users` WHERE `id`=?", [req.session.userID])

    const [generalMessages] = await dbConnection.execute("SELECT * FROM `all_transactions` WHERE `sender_id`=? OR `recipient_id`=? ORDER BY `date_time` DESC LIMIT 6",[req.session.userID, req.session.userID]);

    // const [senderWarningMessageId] = await dbConnection.execute("SELECT * FROM `warning_messages` WHERE `sender_id`=? ORDER BY `time` DESC", [req.session.userID]);

    // const [senderErrorMessageId] = await dbConnection.execute("SELECT * FROM `error_messages` WHERE `sender_id`=? ORDER BY `time` DESC", [req.session.userID]);
    
    res.render('user/userMainPage', {
        user: row[0],
        // msgTransactions: transactions,
        // msgSenderSuccess:senderSuccessMessage,
        msgGeneral:generalMessages,
        // msgSenderWarning:senderWarningMessageId,
        // msgSenderError:senderErrorMessageId,
        // showBalance:checkIfShowBalanceIsOn
    });
} 

exports.agentMainPage = async (req, res, next) => {
    const [agentrow] = await dbConnection.execute("SELECT * FROM `agents` WHERE `id`=?", [req.session.userID]);

    // const [generalMessages] = await dbConnection.execute("SELECT * FROM `all_transactions` WHERE `sender_id`=? OR `recipient_id`=? ORDER BY `date_time` DESC LIMIT 6",[req.session.userID, req.session.userID]);
    
    res.render('agent/agentmainpage', {
        agent: agentrow[0],
        // msgGeneral:generalMessages,
    });

   
} 

exports.companyMainPage = async (req, res, next) => {
    const [row] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);
    
    if (row.length !== 1) {
        return res.send('No User In The Database');
    }

    const [companyRow] = await dbConnection.execute("SELECT * FROM `company` WHERE `company_id`=?", [row[0].id]);
    // res.render("user/completeUser");
    

    res.render('user/companyMainPage', {
        user: row[0],
        company: companyRow[0]
    });
} 

exports.bankMainPage = async (req, res, next) => {
    const [row] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);
    
    if (row.length !== 1) {
        return res.send('No User In The Database. Please register');
    }

    const [bankRow] = await dbConnection.execute("SELECT * FROM `banks` WHERE `bank_id`=?", [row[0].id]);
    // res.render("user/completeUser");
    

    res.render('user/bankMainPage', {
        user: row[0],
        bank: bankRow[0]
    });
} 