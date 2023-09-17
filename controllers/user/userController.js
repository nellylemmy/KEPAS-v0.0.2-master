// All User Database functionalities will be foud in this document (userController.js)

// include files
require("./database/dbencryption");

// include modules
const { validationResult } = require("express-validator");
const bcrypt = require('bcryptjs');
const dbConnection = require("../../utils/dbConnection");
const moment = require('moment');
const { DateTime } = require("luxon");
const express = require('express');
const app = express();
const flash = require('connect-flash');


app.use(express.json());

app.use(flash());

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
  
const argentNumber = generateRandomNumbers(6, 9).join('');
const companyNumber = generateRandomNumbers(5,9).join('');
const bankNumber = generateRandomNumbers(4,9).join('');
  

// get users
exports.allUsers = async(req,res,next) => {
  // const [authorizedRow] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);
  const [usersRow] = await dbConnection.execute("SELECT first_name AS `un_fn`, last_name AS `un_ln`, mobile AS `un_mb` FROM users ORDER BY id DESC");


  // authorization and authentication
  // const [usersRow] = await dbConnection.execute("SELECT * FROM `users` WHERE `mobile`=?", [recipientNumber]);

  if(req.session.userID){
    if(usersRow.length < 0){
      return res.send({message:"We encountered an error"});
    }
    console.log(`this user is authorized to fetch the data`)
    res.json(usersRow)
  }else{
    console.log(`this user is not authorized`)
    res.json({message:"You are not authorized"})
  }
  // res.send(usersRow)
}

exports.allAgents = async(req,res,next) => {
  const [agentRow] = await dbConnection.execute("SELECT agent_number AS RN, agent_name AS AN FROM agents ORDER BY id DESC")

  if(agentRow.length < 1){
    return res.send('error occured');
  }

if(req.session.userID){
    if(agentRow.length < 0){
      return res.send({message:"We encountered an error"});
    }
    console.log(`this user is authorized to fetch the data`)
    res.json(agentRow)
  }else{
    console.log(`this user is not authorized`)
    res.json({message:"You are not authorized"})
  }

  // res.send(agentRow)
}

// get transactions
exports.allTransactions = async(req,res,next) => {
  let senderMode = 'w'
  const [transactions] = await dbConnection.execute("SELECT id,amount,sender_mode,sender_transaction_cost,sender_income,recipient_transaction_cost,recipient_income,transaction_id,date_time FROM all_transactions WHERE sender_mode =? ORDER BY date_time ASC", [senderMode])

  if(transactions <= 0){
    return res.send(`No Transactions for Entry ('${senderMode}')`);
  }

  if(req.session.userID){
    // if(transactions.length < 0){
    //   return res.send({message:"We encountered an error"});
    // }
    console.log(`this user is authorized to fetch the data`)
    res.json(transactions)
    // res.send(transactions)
  }else{
    console.log(`this user is not authorized`)
    res.json({message:"You are not authorized"})
  }
  return;

  // res.send(transactions)
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



exports.wallet = async (req, res, next) => {
  const [row] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);

  res.render('user/wallet', {
    user: row[0],
  });
}


// Render Page layouts
exports.welcome = (req, res, next) => {
  res.render("welcome");
  // res.redirect("http://localhost:3000/home");
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
                
} catch (e) {
    next(e);
  }
};

exports.agentRegister = async (req, res, next) => {
const agentNumber = generateRandomNumbers(7,9).join('');
// Array containing all the names
const names = [
  // Fruits
  "Mango", "Apple", "Banana", "Orange", "Pineapple", "Watermelon", "Grapes", "Strawberry", "Kiwi", "Peach", "Pear", "Blueberry", "Raspberry", "Lemon", "Lime", "Avocado", "Papaya", "Coconut", "Cherry", "Plum", "Guava", "Pomegranate", "Fig", "Apricot", "Cranberry", "Blackberry", "Grapefruit", "Lychee", "Passion fruit", "Persimmon", "Dragon fruit", "Cantaloupe", "Honeydew melon", "Nectarine", "Tangerine", "Elderberry", "Mulberry", "Gooseberry", "Boysenberry", "Currant", "Jackfruit", "Star fruit", "Plantain", "Acerola", "Quince", "Ackee", "Jabuticaba", "Rambutan", "Durian", "Ugli fruit", "Mangosteen", "Kumquat", "Carambola", "Chayote", "Pawpaw", "Feijoa", "Tamarind", "Loquat", "Jujube", "Soursop", "Mamey sapote", "Longan", "Kiwano", "Prickly pear", "Guanabana", "Breadnut", "Maracuja", "Cupuacu", "Damson plum", "Sloe", "Physalis", "Cloudberry", "Aronia", "Juneberry", "Bael fruit", "Indian gooseberry", "Calamondin", "Karanda", "Yellow passion fruit", "Miracle fruit", "Monstera deliciosa", "Salak", "Santa Claus melon", "Horned cantaloupe", "Lemon drop melon", "Casaba melon", "Pepino melon", "Crenshaw melon", "Sharlyn melon", "Galia melon", "Canary melon", "Ogen melon", "Charentais melon", "Piel de Sapo melon", "Sprite melon", "Hami melon",
  
  // Animals
  "Lion", "Elephant", "Giraffe", "Tiger", "Cheetah", "Zebra", "Hippopotamus", "Rhino", "Gorilla", "Chimpanzee", "Orangutan", "Panda", "Koala", "Kangaroo", "Platypus", "Dolphin", "Whale", "Shark", "Octopus", "Jellyfish", "Seahorse", "Turtle", "Crocodile", "Alligator", "Snake", "Lizard", "Gecko", "Chameleon", "Frog", "Toad", "Salamander", "Newt", "Bat", "Squirrel", "Chipmunk", "Raccoon", "Fox", "Wolf", "Coyote", "Dog", "Cat", "Lionfish", "Swordfish", "Penguin", "Ostrich", "Emu", "Peacock", "Flamingo", "Eagle", "Falcon", "Hawk", "Owl", "Toucan", "Parrot", "Pelican", "Swan", "Duck", "Goose", "Chicken", "Rooster", "Turkey", "Pigeon", "Sparrow", "Hummingbird", "Bee", "Butterfly", "Ladybug", "Ant", "Grasshopper", "Cricket", "Beetle", "Spider", "Scorpion", "Centipede", "Millipede", "Snail", "Slug", "Worm", "Armadillo", "Hedgehog", "Rabbit", "Hare", "Mouse", "Rat", "Hamster", "Guinea pig", "Ferret", "Chinchilla", "Gerbil", "Mole", "Otter", "Seal", "Walrus", "Beaver", "Raccoon dog", "Skunk", "Meerkat", "Lemur", "Squirrel monkey", "Tamarin", "Gibbon", "Capuchin", "Baboon", "Mandrill", "Macaque", "Vervet monkey", "Red panda", "Wombat", "Tasmanian devil", "Wallaby", "Quokka", "Dingo", "Platypus", "Tasmanian tiger", "Alpaca", "Llama", "Camel", "Reindeer", "Moose", "Caribou", "Bison", "Yak", "Water buffalo", "Musk ox",
  
  // Cars
  "Toyota", "Camry", "Honda", "Civic", "Ford", "Mustang", "Chevrolet", "Corvette", "BMW", "Series", "Mercedes-Benz", "C-Class", "Audi", "A4", "Nissan", "Altima", "Volkswagen", "Golf", "Tesla", "Model", "Subaru", "Impreza", "Mazda", "Hyundai", "Elantra", "Kia", "Optima", "Lexus", "ES", "Jeep", "Wrangler", "GMC", "Sierra", "Ram", "F-", "Silverado", "Tacoma", "Accord", "Passat", "Outback", "CX-", "Santa", "Fe", "Sorento", "RX", "Grand", "Cherokee", "Yukon", "Explorer", "Traverse", "Highlander", "Pilot", "E-Class", "Q7", "Murano", "Tiguan", "Forester", "Kona", "Soul", "Compass", "Canyon", "ProMaster", "Expedition", "Tahoe", "Land", "Cruiser", "Odyssey", "LS", "Renegade", "Bolt", "EV", "Prius", "Insight", "EQC", "e-tron", "Leaf", "ID.", "XV", "MX-", "Tucson", "Niro",
  
  // Trees
  "Nymph", "Plum", "Stick", "Azo", "Red", "Maple", "Blue", "Aspen", "Yew", "Palm", "Bamboo", "Alder", "Ginkgo", "Boxwood", "Banyan", "Dogwood", "Jacaranda", "Magnolia", "Willow", "Olive", "Ebony", "Laurel", "Larch", "Tulip", "Teak", "Weeping", "Yellow", "Quaking", "African", "Giant", "Black", "California", "Eastern", "English", "European", "Flowering", "Japanese", "Joshua", "Kentucky", "King", "Lacebark", "Leyland", "London", "Maidenhair", "Mahogany", "Oak", "Palm", "Pine", "Redwood", "Sequoia", "Sycamore", "Willow"
];
  
// Function to generate a random name
function generateRandomName() {
  const randomIndex = Math.floor(Math.random() * names.length);
  return names[randomIndex];
}
  
// Example usage
const randomName = generateRandomName();
//   const number = 2342536;

const firstFourDigits = Number(String(agentNumber).slice(0, 4));

console.log(firstFourDigits); // Output: 2342

const agentExtensionName = `${randomName}-${firstFourDigits}`;
console.log(agentExtensionName)


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

const agentFullNames = `${body.firstName} ${body.lastName}`;
const agentName = `${body.firstName}-${body.lastName}-${agentExtensionName}`;

const [newAgentRow] = await dbConnection.execute(
  "INSERT INTO `agents`(`agent_owner_full_names`,`agent_id`,`agent_phone`,`agent_email`,`agent_password`,`agent_number`,`agent_name`) VALUES (?,?,?,?,?,?,?)",
  [agentFullNames, body.idnumber, body.phone, body.email, hashPass,agentNumber,agentName]
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

const [gMessages] = await dbConnection.execute("SELECT * FROM `all_transactions` WHERE `sender_id`=? OR `recipient_id`=? ORDER BY `date_time` DESC",[req.session.userID, req.session.userID]);

res.render('user/activity', {
  user: row[0],
  msgGeneral:gMessages,
});
    
}

exports.help = async (req, res, next) => {
const [row] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);

res.render('user/help', {
  user: row[0],
});
    
}
exports.contactus = async (req, res, next) => {
const [row] = await dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID]);

res.render('user/contactus', {
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
