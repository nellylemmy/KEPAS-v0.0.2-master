// 741642093
// All the post and get methods from the dom to DB will be found in this document. (routes.js)
const router = require("express").Router();
const { body } = require("express-validator");
const rateLimit = require('express-rate-limit')

// ============================================= \\
// LIMIT API ENDPOINTS REQUEST FOR ALL ROUTES     \\
// =============================================== \\
let rateLimitMessage = {
    windowMs: 6 * 60 * 1000, // 6 minutes
    max: 6, // Limit each IP to 6 requests per `window` (here, per 6 minutes)
    standardHeaders: true, // Return rate limit info in the `RateLimit-*` headers
    legacyHeaders: false, // Disable the `X-RateLimit-*` headers
    message: 
  `<style>
      section{
          max-width:30rem;
          margin:5rem auto;
      }
      .card {
          display: flex;
          flex-direction: column;
          border: 1px red solid;
      }
      .header {
          height: 30%;
          background: red;
          color: white;
          text-align: center;
          font-size: 1.3rem;
          font-weight: 600;
      }
      .container {
          padding: 2px 16px;
      }
  </style>
  
  <section>
    <div class="card">
      <div class="header">
          <p>Too Many Request! Please Wait for 15 minutes</p>
      </div>
          <div class="container">
          <p>We apologize for the inconvenience, but it seems that there has been unusual activity detected from your device. To ensure the security of your account, we have temporarily restricted access for the next 15 minutes. This precautionary measure helps us protect your account from potential unauthorized access.
          </p>

          <p>
          If you have forgotten your account information or need assistance, please don't hesitate to contact our support team. We'll be happy to assist you in recovering your account.
          </p>
          
          <p>Thank you for your understanding and cooperation in maintaining the security of your account.</p>
      </div>
    </div>
  </section>`
};
const userLoginAttemptLimiter = rateLimit(rateLimitMessage);
const agentLoginAttemptLimiter = rateLimit(rateLimitMessage);
const usersAPIsLimiter = rateLimit(rateLimitMessage);
const agentsAPIsLimiter = rateLimit(rateLimitMessage);

// Apply the rate limiting middleware to API calls only
router.use('/user/login', userLoginAttemptLimiter)
router.use('/agent/login', agentLoginAttemptLimiter)
router.use('/api/users', usersAPIsLimiter)
router.use('/api/agents', agentsAPIsLimiter)

// ============================================= \\
// END FOR LIMIT API ENDPOINTS                    \\
// =============================================== \\

// ===============================================  \\
// ROUTES TO DIFFERENT CONTROLLERS
// ===============================================  \\

const {userMainPage_withdrawMoney_fromAgent} = 
require("./controllers/user/withdraw-from-agent");

const {withdraw_my_wallet} = 
require("./controllers/user/withdraw-to-wallet");

const {userMainPage_sendMoney_userToUser} = 
require("./controllers/user/send-and-receive-from-user");

// ===============================================  \\
// END OF ROUTES TO DIFFERENT CONTROLLERS
// ===============================================  \\

const {
  welcome,
  homePage,
  agentHomePage,

  register,
  registerPage,
  agentRegister,
  agentRegisterPage,

  login,
  agentLogin,
  loginPage,
  agentloginPage,

  completeUser,
  completeArgent,
  completeCompany,
  completeBank,

  completeUserPage,
  completeArgentPage,
  completeCompanyPage,
  completeBankPage,

  morePage,
  moreAboutPage,

  activity,
  help,
  contactus,
  security,
  privacy,
  legal,
  notifications,
  account,
  sendAndWithdraw,
  
  userMainPage,
  agentMainPage,
  wallet,
  sendMoney,
  withdrawMoney,
  companyMainPage,
  bankMainPage,

  allUsers,
  allTransactions,
  allAgents,

} = require("./controllers/user/userController");

// ...Checking if the user is NOT loged in...//
const ifNotLoggedin = (req, res, next) => {
  if(!req.session.userID){
    return res.redirect('/welcome');
  }
  next();
}

const ifAgentNotLoggedin = (req, res, next) => {
  if(!req.session.userID){
    return res.redirect('/welcome');
  }
  next();
}

// ...Checking if the user is loged in...//
const ifLoggedin = (req,res,next) => {
  if(req.session.userID){
    return res.redirect('/');
  }
  next();
}

const ifAgentLoggedin = (req,res,next) => {
  if(req.session.userID){
    return res.redirect('/');
  }
  next();
}

// ------------APIs-------------
router.get('/api/users', allUsers);
router.get('/api/agents', allAgents);
router.get('/api/transactions', allTransactions);
//-----End of APIs--------------

// Will only Fire When users have loged in
//=========================================
router.get('/', ifNotLoggedin, homePage);
router.get('/', ifAgentNotLoggedin, homePage);

router.get("/user/mainPage", ifNotLoggedin, userMainPage);
router.get("/user/wallet", ifNotLoggedin, wallet);
router.get("/user/sendmoney", ifNotLoggedin, sendMoney);
router.get("/user/withdrawmoney", ifNotLoggedin, withdrawMoney);
router.get("/user/withdrawmoney", ifNotLoggedin, userMainPage_withdrawMoney_fromAgent);
router.get("/user/sendmoney", ifNotLoggedin, userMainPage_sendMoney_userToUser);
router.get("/user/mainPage", ifNotLoggedin, withdraw_my_wallet);
router.get("/user/activity", ifNotLoggedin, activity);
router.get("/user/help", ifNotLoggedin, help);
router.get("/user/contactus", ifNotLoggedin, contactus);
router.get("/user/security", ifNotLoggedin, security);
router.get("/user/privacy", ifNotLoggedin, privacy);
router.get("/user/legal", ifNotLoggedin, legal);
router.get("/user/notifications", ifNotLoggedin, notifications);
router.get("/user/account", ifNotLoggedin, account);
router.get("/user/sendandwithdraw", ifNotLoggedin, sendAndWithdraw);
router.get("/company/mainPage", ifNotLoggedin, companyMainPage);
router.get("/bank/mainPage", ifNotLoggedin, bankMainPage);
router.get("/user/Complete", ifNotLoggedin, completeUserPage);

router.get("/agent/agentmainpage", ifAgentNotLoggedin, agentMainPage);
router.get("/agent/Complete", ifAgentNotLoggedin, completeArgentPage);

router.get("/company/complete", ifNotLoggedin, completeCompanyPage);
router.get("/bank/Complete", ifNotLoggedin, completeBankPage);
router.get("/user/More", ifNotLoggedin, morePage);
//=========================================================//

// Will only Fire When users have NOT loged in
//=========================================
router.get("/Moreabout", ifLoggedin, moreAboutPage)
router.get("/welcome", ifLoggedin, welcome);
router.get("/user/login", ifLoggedin, loginPage);

router.get("/agent/login", ifAgentLoggedin, agentloginPage);

router.get("/user/signup", ifLoggedin, registerPage);
router.get("/agent/signup", ifAgentLoggedin, agentRegisterPage);
//===============================================//

router.post("/user/login",
ifLoggedin,
  [
    body("phone", "Invalid phone Number")
      .notEmpty()
      .escape()
      .trim(),

    body("password", " Password must have at least 4 characters ")
      .notEmpty()
      .trim()
      .isLength({ min: 4 }),
  ],
  login
);
router.post("/agent/login",
ifAgentLoggedin,
  [
    body("phone", "Invalid phone Number")
      .notEmpty()
      .escape()
      .trim(),

    body("password", " Password must have at least 4 characters ")
      .notEmpty()
      .trim()
      .isLength({ min: 4 }),
  ],
  agentLogin
);

router.post("/user/complete", 
ifNotLoggedin, 
  [
    body("agree_user_complete", "Please check the box")
      .notEmpty(),
  ],
  completeUser
);

router.post("/user/sendmoney", 
ifNotLoggedin, 
  [
    body("recipientNumber", "enter recipient number")
    .notEmpty(),
    body("recipientQuantity", "enter amount")
    .notEmpty(),
    body("pword", " Password must have at least 4 characters ")
      .notEmpty()
      .trim()
      .isLength({ min: 4 })
  ],
  userMainPage_sendMoney_userToUser
);

router.post("/user/wallet", 
ifNotLoggedin, 
    [
      body("walletAmount", "enter amount to send to local account")
      .notEmpty(),
      body("walletPassword", "incorrect password")
        .notEmpty()
        .trim()
        .isLength({ min: 4 }),
    ],
    withdraw_my_wallet
);

router.post("/user/withdrawmoney", 
ifNotLoggedin, 
  [
    body("agentNumber", "enter agent number")
    .notEmpty(),
    body("amountToWithdraw", "enter amount")
    .notEmpty(),
    body("userPassword", " Password must have at least 4 characters ")
    .notEmpty()
    .trim()
    .isLength({ min: 4 }),
  ],
  userMainPage_withdrawMoney_fromAgent
);

router.post("/agent/complete", 
ifAgentNotLoggedin, 
  [
    body("agree_argent_complete", "Please check the box")
    .notEmpty(),
  ],
  completeArgent
);

router.post("/company/complete", 
ifNotLoggedin, 
  [
    body("agree_company_complete", "Please check the box")
    .notEmpty(),
  ],
  completeCompany
);

router.post("/bank/complete", 
ifNotLoggedin, 
  [
    body("agree_bank_complete", "Please check the box")
    .notEmpty(),
  ],
  completeBank
);


router.post(
  "/user/signup",
  ifLoggedin,
[
  body("firstName", "First name must have at least 3 characters")
    .notEmpty()
    .escape()
    .trim()
    .isLength({ min: 3 }),

    body("lastName", "Last name must have at least 3 characters")
    .notEmpty()
    .escape()
    .trim()
    .isLength({ min: 3 }),

    body("idnumber", "ID Number must be atleast 8 numbers")
    .notEmpty()
    .escape()
    .trim()
    .isLength({ min: 8 }),

    body("phone", "The phone number must be of minimum 10 numbers and maximum 12 numbers")
    .notEmpty()
    .escape()
    .trim()
    .isLength({ min: 10, max: 12}),

  body("password", "Password must have at least 4 characters")
    .notEmpty()
    .trim()
    .isLength({ min: 4 }),

    body("confirmPassword").custom((value, { req }) => {
      if (value !== req.body.password) {
        throw new Error("Password and password confirmation did not match !");
      }
      return true;
    })    
],
register
);

router.post(
  "/agent/signup",
  ifAgentLoggedin,
  [
    body("firstName", "First name must have at least 3 characters")
      .notEmpty()
      .escape()
      .trim()
      .isLength({ min: 3 }),

      body("lastName", "Last name must have at least 3 characters")
      .notEmpty()
      .escape()
      .trim()
      .isLength({ min: 3 }),

      body("idnumber", "ID Number must be atleast 8 numbers")
      .notEmpty()
      .escape()
      .trim()
      .isLength({ min: 8 }),

      body("phone", "Please check your phone number")
      .notEmpty()
      .escape()
      .trim()
      .isLength({ min: 10, max: 12}),

    body("email", "Invalid email address")
      .notEmpty()
      .escape()
      .trim(),

    body("password", "Password must have at least 4 characters")
      .notEmpty()
      .trim()
      .isLength({ min: 4 }),

      body("confirmPassword").custom((value, { req }) => {
          if (value !== req.body.password) {
            throw new Error("Password and password confirmation did not match !");
          }
          return true;
      })    
  ],
  agentRegister
);

router.get('/logout', (req, res) => {
  req.session.destroy((err) => err);
  res.redirect('/');
});

router.get('/agentlogout', (req, res) => {
  req.session.destroy((err) => err);
  res.redirect('/');
});

module.exports = router;