// KEPAS INDEX PAGE

const express = require('express');
const session = require('express-session');
const path = require('path');
const user_routes = require('./routes');
const flash = require('connect-flash');
const compression = require('compression');
const cookieParser = require('cookie-parser');
// const rateLimit = require('express-rate-limit')


const bodyParser = require('body-parser');
const cors = require('cors');
const mysql = require('mysql2');

require('dotenv').config();

const app = express();
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(cookieParser('secretStringForCookies'));
app.use(express.urlencoded({ extended: true }));
app.use(session({
  name: 'session',
  secret: 'my_secret',
  resave: false,
  saveUninitialized: false,
  cookie: {
    maxAge: 60000000, // Set the maximum age of the session cookie to 1 minute (60,000 milliseconds)
    secure: false, // Ensure that the session cookie is only sent over HTTPS
    // sameSite: 'strict' // Enforce strict same-site policy for the session cookie
  }
}));

// Middleware to check for session expiration
app.use((req, res, next) => {
  if (req.session && req.session.lastAccess && (Date.now() - req.session.lastAccess > 600000)) {
    req.session.destroy(); // Destroy the session if it has been inactive for 1 minute
    // res.send(`<h2>Your session has expired. Please login to continue. <a href="../">LOGIN</a></h2>`)
  }
  req.session.lastAccess = Date.now(); // Update the last access timestamp
  next();
});


app.use(compression({
  level: 6,
  threshold: 0
}));

app.use(flash());
app.use(express.static(path.join(__dirname, 'public')));
app.use(user_routes);
app.use(express.json());

app.use(cors());
app.use(bodyParser.urlencoded({extended:true}));

const db = mysql.createPool({
  port: process.env.DB_PORT,
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE
});


app.use((req, res, next) => {
  res.status(404).send(`<style>body {
      background-color: #2F3242;
    }
    svg {
      position: absolute;
      top: 50%;
      left: 50%;
      margin-top: -250px;
      margin-left: -400px;
    }
    .message-box {
      height: 200px;
      width: 380px;
      position: absolute;
      top: 50%;
      left: 50%;
      margin-top: -100px;
      margin-left: 50px;
      color: #FFF;
      font-family: Roboto;
      font-weight: 300;
    }
    .message-box h1 {
      font-size: 60px;
      line-height: 46px;
      margin-bottom: 40px;
    }
    .buttons-con .action-link-wrap {
      margin-top: 40px;
    }
    .buttons-con .action-link-wrap a {
      background: #68c950;
      padding: 8px 25px;
      border-radius: 4px;
      color: #FFF;
      font-weight: bold;
      font-size: 14px;
      transition: all 0.3s linear;
      cursor: pointer;
      text-decoration: none;
      margin-right: 10px
    }
    .buttons-con .action-link-wrap a:hover {
      background: #5A5C6C;
      color: #fff;
    }
    
    #Polygon-1 , #Polygon-2 , #Polygon-3 , #Polygon-4 , #Polygon-4, #Polygon-5 {
      animation: float 1s infinite ease-in-out alternate;
    }
    #Polygon-2 {
      animation-delay: .2s; 
    }
    #Polygon-3 {
      animation-delay: .4s; 
    }
    #Polygon-4 {
      animation-delay: .6s; 
    }
    #Polygon-5 {
      animation-delay: .8s; 
    }
    
    @keyframes float {
        100% {
        transform: translateY(20px);
      }
    }
    @media (max-width: 450px) {
      svg {
        position: absolute;
        top: 50%;
        left: 50%;
        margin-top: -250px;
        margin-left: -190px;
      }
      .message-box {
        top: 50%;
        left: 50%;
        margin-top: -100px;
        margin-left: -190px;
        text-align: center;
      }
    }</style><svg width="380px" height="500px" viewBox="0 0 837 1045" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:sketch="http://www.bohemiancoding.com/sketch/ns">
  <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" sketch:type="MSPage">
      <path d="M353,9 L626.664028,170 L626.664028,487 L353,642 L79.3359724,487 L79.3359724,170 L353,9 Z" id="Polygon-1" stroke="#007FB2" stroke-width="6" sketch:type="MSShapeGroup"></path>
      <path d="M78.5,529 L147,569.186414 L147,648.311216 L78.5,687 L10,648.311216 L10,569.186414 L78.5,529 Z" id="Polygon-2" stroke="#EF4A5B" stroke-width="6" sketch:type="MSShapeGroup"></path>
      <path d="M773,186 L827,217.538705 L827,279.636651 L773,310 L719,279.636651 L719,217.538705 L773,186 Z" id="Polygon-3" stroke="#795D9C" stroke-width="6" sketch:type="MSShapeGroup"></path>
      <path d="M639,529 L773,607.846761 L773,763.091627 L639,839 L505,763.091627 L505,607.846761 L639,529 Z" id="Polygon-4" stroke="#F2773F" stroke-width="6" sketch:type="MSShapeGroup"></path>
      <path d="M281,801 L383,861.025276 L383,979.21169 L281,1037 L179,979.21169 L179,861.025276 L281,801 Z" id="Polygon-5" stroke="#36B455" stroke-width="6" sketch:type="MSShapeGroup"></path>
  </g>
</svg>
<div class="message-box">
<h1>404</h1>
<p>Page not found</p>
<div class="buttons-con">
  <div class="action-link-wrap">
    <a onclick="history.back(-1)" class="link-button link-back-button">Go Back</a>
  </div>
</div>
</div>`)
})



app.use((err, req, res, next) => {
  return res.send(`<style>@import url("https://fonts.googleapis.com/css?family=Nunito:400,700");
  * {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
  }
  
  html {
    height: 100%;
  }
  
  body {
    background: #fff1f1;
    font-family: "Nunito", sans-serif;
  }
  .refresh-btn{
    padding: .6rem;
    display: flex;
    gap: .4rem;
    justify-content: center;
    align-items: center;
    background: white;
    border: 1px solid #122125;
    color: #122125;
    box-shadow: 1px 0px 15px 3px #f62f57a8;
    border-radius: .2rem;
    font-weight: 600;
  }
  .container {
    width: 75%;
    max-width: 700px;
    margin: 1.5rem auto;
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  @media (max-width: 650px) {
    .container {
      width: 85%;
    }
  }
  .container .header {
    color: #fb3958;
    font-size: 5em;
    font-weight: 700;
    text-align: center;
    text-shadow: 2px 2px 5px #b1041f;
  }
  @media (max-width: 650px) {
    .container .header {
      font-size: 3em;
    }
  }
  
  .compcontainer {
    width: 75%;
    height: 13rem;
    padding: 1rem 0;
  }
  @media (max-width: 650px) {
    .compcontainer {
      height: 10rem;
    }
  }
  .compcontainer svg {
    max-width: 100%;
    max-height: 100%;
    animation: bouncy 1300ms linear infinite;
  }
  
  .instructions {
    background: #FEFEFE;
    width: 80%;
    height: auto;
    padding: 1rem;
    border: 1px solid #DCDCDC;
    border-radius: 0.25rem;
  }
  @media (max-width: 650px) {
    .instructions {
      width: 100%;
    }
  }
  .instructions h2 {
    font-size: 1.25em;
    line-height: 1.3;
    color: #e30528;
  }
  @media (max-width: 650px) {
    .instructions h2 {
      font-size: 1.05em;
    }
  }
  .instructions p {
    font-size: 1.15em;
    line-height: 1.5;
    color: #122125;
  }
  @media (max-width: 650px) {
    .instructions p {
      font-size: 1em;
    }
  }
  .instructions .step {
    display: flex;
    flex-direction: row;
    width: 100%;
    height: 1.5rem;
    margin: 0.5rem 0;
  }
  .instructions .step .icon {
    width: 1.25rem;
    height: 1.25rem;
    align-self: center;
  }
  @media (max-width: 650px) {
    .instructions .step .icon {
      width: 1rem;
      height: 1rem;
    }
  }
  .instructions .step p {
    display: inline-block;
    width: 80%;
    line-height: 1.5;
    padding-left: 0.5rem;
  }
  
  @keyframes bouncy {
    0% {
      transform: translateY(10px) translateX(0) rotate(0);
    }
    25% {
      transform: translateX(-10px) rotate(-10deg);
    }
    50% {
      transform: translateX(0) rotate(0deg);
    }
    75% {
      transform: translateX(10px) rotate(10deg);
    }
    100% {
      transform: translateY(10px) translateX(0) rotate(0);
    }
  }</style><div class="container">
  <div class="compcontainer">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 90.5 74.769">
      <path fill="#C7CCDB" d="M58.073 74.769H32.426l6.412-19.236h12.824z"/>
      <path fill="#373F45" d="M90.5 52.063c0 1.917-2.025 3.471-4.525 3.471H4.525C2.025 55.534 0 53.98 0 52.063V3.471C0 1.554 2.026 0 4.525 0h81.449c2.5 0 4.525 1.554 4.525 3.471v48.592z"/>
      <path fill="#F1F2F2" d="M84.586 46.889c0 1.509-1.762 2.731-3.936 2.731H9.846c-2.172 0-3.933-1.223-3.933-2.731V8.646c0-1.508 1.761-2.732 3.933-2.732H80.65c2.174 0 3.936 1.225 3.936 2.732v38.243z"/>
      <path fill="#A2A7A5" d="M16.426 5.913L8.051 23h13l-6.875 12.384L26.75 46.259l-8.375-11.375L26.75 20H14.625l6.801-14.087zM68.551 49.62l-8.375-17.087h13l-6.875-12.384L78.875 9.274 70.5 20.649l8.375 14.884H66.75l6.801 14.087z"/>
    </svg>
  </div>
  <h1 class="header">500 ERROR</h1>
  <div class="instructions">
    <h2>Sorry, something went wrong on our end. This always happen when your account is inactive for some time. Don't worry, We are currently trying to fix the problem.</h2>
    <p>In the meantime, you can click the button below to refresh the page</p>
    <div class="step">
      <p>
      <button type="button" class="refresh-btn" onclick="refreshPage()">
      <span>
      <svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 489.711 489.711">
      <path d="M112.156,97.111c72.3-65.4,180.5-66.4,253.8-6.7l-58.1,2.2c-7.5,0.3-13.3,6.5-13,14c0.3,7.3,6.3,13,13.5,13    c0.2,0,0.3,0,0.5,0l89.2-3.3c7.3-0.3,13-6.2,13-13.5v-1c0-0.2,0-0.3,0-0.5v-0.1l0,0l-3.3-88.2c-0.3-7.5-6.6-13.3-14-13    c-7.5,0.3-13.3,6.5-13,14l2.1,55.3c-36.3-29.7-81-46.9-128.8-49.3c-59.2-3-116.1,17.3-160,57.1c-60.4,54.7-86,137.9-66.8,217.1    c1.5,6.2,7,10.3,13.1,10.3c1.1,0,2.1-0.1,3.2-0.4c7.2-1.8,11.7-9.1,9.9-16.3C36.656,218.211,59.056,145.111,112.156,97.111z"></path>
        <path d="M462.456,195.511c-1.8-7.2-9.1-11.7-16.3-9.9c-7.2,1.8-11.7,9.1-9.9,16.3c16.9,69.6-5.6,142.7-58.7,190.7    c-37.3,33.7-84.1,50.3-130.7,50.3c-44.5,0-88.9-15.1-124.7-44.9l58.8-5.3c7.4-0.7,12.9-7.2,12.2-14.7s-7.2-12.9-14.7-12.2l-88.9,8    c-7.4,0.7-12.9,7.2-12.2,14.7l8,88.9c0.6,7,6.5,12.3,13.4,12.3c0.4,0,0.8,0,1.2-0.1c7.4-0.7,12.9-7.2,12.2-14.7l-4.8-54.1    c36.3,29.4,80.8,46.5,128.3,48.9c3.8,0.2,7.6,0.3,11.3,0.3c55.1,0,107.5-20.2,148.7-57.4    C456.056,357.911,481.656,274.811,462.456,195.511z"></path>
    </svg>
    </span>
    <span>Refresh the page</span>
    </button>
      </p>
    </div>
  </ul>
</div>
</div> <script>function refreshPage() {location.reload();}</script>`);
});

let PORT = 5000;

app.listen(PORT, () => console.log(`Server is runngin on port : ` + PORT));