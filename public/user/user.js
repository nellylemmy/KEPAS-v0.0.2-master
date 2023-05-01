// All the javascript functions or logics to manipulate the User DOM will be found here in (user.js)

// ===================================================== //
        // Show send button if checkbox ticked
// ===================================================== //

const getYear = new Date();
const currentYear = getYear.getFullYear();

const getYearClasses = document.querySelectorAll('.year');

getYearClasses.forEach(yearClass => {
  yearClass.innerText = currentYear
})

function terms_changed(termsCheckBox){
    //If the checkbox has been checked
    if(termsCheckBox.checked){
        document.getElementById("submit_button").disabled = false;
    } else{
        document.getElementById("submit_button").disabled = true;
    }
}

// ====================================================== //
      // user account logout popup
// ====================================================== //
/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */
function showUserProfileMenu() {
  document.getElementById("myDropdown").classList.toggle("show");
}

function showChainMenu() {
  document.getElementById("chain-menu").classList.toggle("show");
}
  
// Close the dropdown menu if the user clicks outside of it
window.onclick = function(event) {
  
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }

  if (!event.target.matches('.drop-chain-settings')) {
    var dropdowns = document.getElementsByClassName("dropdown-settings-chain");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}

// ========================================================= //
      // Transaction history messages
// ========================================================= //

document.querySelector('.chat[data-chat=person2]').classList.add('active-chat');
document.querySelector('.messages-list[data-chat=person2]').classList.add('active');

let smsList = {
  list: document.querySelector('.all-messages'),
  all: document.querySelectorAll('.left .messages-list'),
  dateTime:'',
  amountSend: '',
  amountReceived: '',
  recipientTransactionId: '',
  senderTransactionId: '',
  walletRecipientTransactionId: '',
  walletSenderTransactionId: '',
  recipientName:'',
  senderName:'',
  recipientMobile: '',
  senderMobile: '',
  senderSenderCost: '',
  recipientSenderCost: '',
  message: '',
  walletIncome: '',
},

smsData = {
  container: document.querySelector('.container .right'),
  current: null,
  messageList: null,
  dateTime: document.querySelector('.top .date-time'),
  amountSend: document.querySelector('.sender-table .amount'),
  amountReceived: document.querySelector('.recipient-table .amount'),
  recipientTransactionId: document.querySelector('.recipient-table .transaction-id'),
  senderTransactionId: document.querySelector('.sender-table .transaction-id'),
  walletRecipientTransactionId: document.querySelector('.recipient-wallet-table .transaction-id'),
  walletSenderTransactionId: document.querySelector('.sender-wallet-table .transaction-id'),
  message: document.querySelector('.right .sms'),
  senderSenderCost: document.querySelector('.right-activity-bottom-last .sender-sender-cost'),
  recipientSenderCost: document.querySelector('.right-activity-bottom-last .recipient-sender-cost'),
  walletIncome: document.querySelector('.wallet-income'),
  recipientName: document.querySelector('.right-activity-bottom .recipient-name'),
  senderName: document.querySelector('.right-activity-bottom .sender-name'),
  recipientMobile: document.querySelector('.right-activity-bottom .recipient-mobile'),
  senderMobile: document.querySelector('.right-activity-bottom .sender-mobile'),
};

smsList.all.forEach(f => {
  f.addEventListener('click', () => {
    f.classList.contains('active') || setAciveChat(f);
  });
  // if(f.classList.contains('active')){
  //   setAciveChat(f);
  //   return;
  // }
});

function setAciveChat(f) {
  smsList.list.querySelector('.active').classList.remove('active');
  f.classList.add('active');
  smsData.current = smsData.container.querySelector('.active-chat');
  smsData.messageList = f.getAttribute('data-chat');
  smsData.current.classList.remove('active-chat');
  smsData.container.querySelector('[data-chat="' + smsData.messageList + '"]').classList.add('active-chat');

  smsList.dateTime = f.querySelector('.date-time').innerText;
  smsList.amountSend = f.querySelector('.amount').innerText;
  smsList.senderSenderCost = f.querySelector('.sender-sender-cost').innerText;
  smsList.recipientSenderCost = f.querySelector('.recipient-sender-cost').innerText;

// smsList.recipientTransactionId should represent all TIDs
  smsList.recipientTransactionId = f.querySelector('.transaction-id').innerText;

  smsList.message = f.querySelector('.sms').innerText;
  smsList.walletIncome = f.querySelector('.wallet-income-data').innerText;
  smsList.recipientName = f.querySelector('.recipient-name').innerText;
  smsList.senderName = f.querySelector('.sender-name').innerText;
  smsList.recipientMobile = f.querySelector('.recipient-mobile').innerText;
  smsList.senderMobile = f.querySelector('.sender-mobile').innerText;

  smsData.dateTime.innerHTML = smsList.dateTime;
  smsData.amountSend.innerHTML = smsList.amountSend;
  smsData.amountReceived.innerHTML = smsList.amountSend;
  smsData.senderSenderCost.innerHTML = smsList.senderSenderCost;
  smsData.recipientSenderCost.innerHTML = smsList.recipientSenderCost;

// The inner HTML has been repeated since they should all match-
// "smsList.recipientTransactionId".
  smsData.recipientTransactionId.innerHTML = smsList.recipientTransactionId;
  smsData.senderTransactionId.innerHTML = smsList.recipientTransactionId;
  smsData.walletRecipientTransactionId.innerHTML = smsList.recipientTransactionId;
  smsData.walletSenderTransactionId.innerHTML = smsList.recipientTransactionId;
// ========================================================= //

  smsData.message.innerHTML = smsList.message;
  smsData.walletIncome.innerHTML = smsList.walletIncome;
  smsData.recipientName.innerHTML = smsList.recipientName;
  smsData.senderName.innerHTML = smsList.senderName;
  smsData.recipientMobile.innerHTML = smsList.recipientMobile;
  smsData.senderMobile.innerHTML = smsList.senderMobile;
}

// Hide Empty list
const checkEmptyList = document.getElementsByClassName('sms-list');
// check if list is active and contains R,S,E or W
const smsImage = document.getElementsByClassName('sms-image');

for (let i = 0; i < checkEmptyList.length; i++) {
  const list = checkEmptyList[i];

  if(list.textContent <= 1){
    list.classList.add('hide')
  }

  list.addEventListener('click', ()=>{
    list.classList.add('active')
    
    for (let i = 0; i < smsImage.length; i++) {
      const currentImage = smsImage[i];
    
      function getR(){
        let you = document.getElementsByClassName('you')
        for (let r = 0; r < you.length; r++) {
        const rForYou = you[r];
        rForYou.style = 
        `
        border-right: .4rem solid var(--lightGreen);
        background: #03a63c27;
        `
      }
      }
    
      function getS(){
        let you = document.getElementsByClassName('you')
        for (let s = 0; s < you.length; s++) {
        const sForYou = you[s];
        sForYou.style = 
        `
        border-right: .4rem solid var(--darkBlue);
        background: #3e688c27;
        `
      }
      }

      function getW(){
        let you = document.getElementsByClassName('you')
        for (let w = 0; w < you.length; w++) {
        const wForYou = you[w];
        wForYou.style = 
        `
        border-right: .4rem solid var(--color-bg-warning-inverse);
        background: #9e6a0327;
        `
      }
      }

      function getE(){
        let you = document.getElementsByClassName('you')
        for (let e = 0; e < you.length; e++) {
        const eForYou = you[e];
        eForYou.style = 
        `
        border-right: .4rem solid var(--color-alert-error-icon);
        background: #f8514927;
        `
      }
      }

      function removeRecipientTable(){
        let recipientTable = document.getElementsByClassName('recipient-table')
        for (let i = 0; i < recipientTable.length; i++) {
          const singleTable = recipientTable[i];
          singleTable.style = 
        `display:none;`
        }
      }

      function removeSenderWalletTable(){
        let senderWalletTable = document.getElementsByClassName('sender-wallet-table')
        for (let i = 0; i < senderWalletTable.length; i++) {
          const singleTable = senderWalletTable[i];
          singleTable.style = 
        `display:none;`
        }
      }

      function returnSenderWalletTable(){
        let senderWalletTable = document.getElementsByClassName('sender-wallet-table')
        for (let i = 0; i < senderWalletTable.length; i++) {
          const singleTable = senderWalletTable[i];
          singleTable.style = 
        `display:table;`
        }
      }

      function removeRecipientWalletTable(){
        let senderWalletTable = document.getElementsByClassName('recipient-wallet-table')
        for (let i = 0; i < senderWalletTable.length; i++) {
          const singleTable = senderWalletTable[i];
          singleTable.style = 
        `display:none;`
        }
      }

      function returnrecipientrWalletTable(){
        let senderWalletTable = document.getElementsByClassName('recipient-wallet-table')
        for (let i = 0; i < senderWalletTable.length; i++) {
          const singleTable = senderWalletTable[i];
          singleTable.style = 
        `display:table;`
        }
      }

      function returnRecipientTable(){
        let recipientTable = document.getElementsByClassName('recipient-table')
        let recipientTableTh = document.querySelectorAll('.recipient-table th')
        let recipientTableTr = document.querySelectorAll('.recipient-table .light-bg')
        for (let i = 0; i < recipientTable.length; i++) {
          const singleTable = recipientTable[i];

          recipientTableTh.forEach(th => {
            th.style = `color:#03a63c;`
          });
          recipientTableTr.forEach(tr => {
            tr.style = `background:#03a63c27;`
          })

          singleTable.style = 
        `display:table;`
        }
      }

      function removeSenderTable(){
        let senderTable = document.getElementsByClassName('sender-table')
        for (let i = 0; i < senderTable.length; i++) {
          const singleTable = senderTable[i];
          singleTable.style = 
        `display:none;`
        }
      }

      function returnSenderTable(){
        let senderTable = document.getElementsByClassName('sender-table');
        let senderTableTh = document.querySelectorAll('.sender-table th')
        let senderTableTr = document.querySelectorAll('.sender-table .light-bg')
        for (let i = 0; i < senderTable.length; i++) {
          const singleTable = senderTable[i];

          senderTableTh.forEach(th => {
          th.style = `color:#3e688c;`
          });
          senderTableTr.forEach(tr => {
            tr.style = `background:#3e688c27;`
          })
          singleTable.style = 
        `display:table;`
        }
      }

      function removeTableData(){
        let TableData = document.getElementsByClassName('table-data')
        for (let i = 0; i < TableData.length; i++) {
          const singleTableData = TableData[i];
          singleTableData.style = 
        `
        display: none;
        width: 0;
        height: 0;
        visibility: hidden;
        opacity: 0;
        `
        }
      }

      function returnTableData(){
        let TableData = document.getElementsByClassName('table-data')
        for (let i = 0; i < TableData.length; i++) {
          const singleTableData = TableData[i];
          singleTableData.style = 
        `
        display: block;
        width: auto;
        height: auto;
        visibility: visible;
        opacity: 1;
        `
        }
      }
      
    
      if(currentImage.classList.contains('r') && currentImage.parentElement.parentElement.classList.contains('active')){
        getR();
        removeSenderTable();
        returnRecipientTable();
        returnrecipientrWalletTable();
        removeSenderWalletTable();
        returnTableData();
      }
    
      if(currentImage.classList.contains('s') && currentImage.parentElement.parentElement.classList.contains('active')){
        getS();
        removeRecipientTable();
        returnSenderTable();
        returnSenderWalletTable();
        removeRecipientWalletTable();
        returnTableData();
      }

      if(currentImage.classList.contains('w') && currentImage.parentElement.parentElement.classList.contains('active')){
        getW();
        removeTableData();
      }

      if(currentImage.classList.contains('e') && currentImage.parentElement.parentElement.classList.contains('active')){
        getE();
        removeTableData();
      }
      
    }

  })
}




// ============================================== //
      // Empty list for users 
      // with no transaction history
// ============================================== //

const detectEmptyList = document.querySelectorAll('.all-messages');
detectEmptyList.forEach(emptyField => {
  if(emptyField.children.length <= 1){
    document.querySelector('.activities').classList.add('hide');
    document.querySelector('.sms-body-list').classList.add('hide');
    document.querySelector('.no-data-field').classList.remove('hide');
  }

})




// ============================================== //
        // The Send Money Button //
// ============================================== //

const sendMoneyBtn = document.getElementById('send-money');
const backFromSendMoneyBtn = document.getElementById('back-from-sendMoney');

const sendMoneyLayout = document.querySelector('.send-money-layout');
const localView = document.querySelector('.local-view');
const argetView = document.querySelector('.agent-view');

let recipientInput = document.getElementById('recipient-number')
sendMoneyBtn.addEventListener('click', () => {
    recipientInput.autofocus = true;
    sendMoneyLayout.classList.add('show')
})

backFromSendMoneyBtn.addEventListener('click', () => {
    sendMoneyLayout.classList.remove('show')
})

function showPassword() {
  var show_password = document.getElementById("user_pass");
  if (show_password.type === "password") {
    show_password.type = "text";
  } else {
    show_password.type = "password";
  }
}



const collapsibles = document.querySelectorAll(".collapsible-header");
const onlyExpandOneCheckbox = true;
let lastActiveCollapsibleBody = null;

function expand(el) {
  if (
    onlyExpandOneCheckbox === true &&
    lastActiveCollapsibleBody
  ) {
    unexpand(lastActiveCollapsibleBody);
  }
  el.style.maxHeight = el.scrollHeight + "px";
  el.classList.add("active");
  lastActiveCollapsibleBody = el;
}

function unexpand(el) {
  el.style.maxHeight = null;
  el.classList.remove("active");
}

collapsibles.forEach((collapsible) => {
  const collapsibleBody = collapsible.nextElementSibling;

  if (collapsibleBody.classList.contains("active")) {
    expand(collapsibleBody);
  }

  collapsible.addEventListener("click", function () {
    if (!!collapsibleBody.style.maxHeight) {
      unexpand(collapsibleBody);
    } else {
      expand(collapsibleBody);
    }
  });
});


// Three dots on the user balance top section
function showTopBalanceThreeDotsDropdown() {
  document.getElementById("rightTopDotsDropdownMenu").classList.toggle("right-top-dots-dropdown-show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.right-top-dots-dropbtn')) {
      var dropdowns = document.getElementsByClassName("right-top-dots-dropdown-content");
      var i;
      for (i = 0; i < dropdowns.length; i++) {
          var openDropdown = dropdowns[i];
          if (openDropdown.classList.contains('right-top-dots-dropdown-show')) {
              openDropdown.classList.remove('right-top-dots-dropdown-show');
          }
        }
      }
    }

// COPY MESSAGE ID

// function copyMessageId() {
//   /* Get the text field */
//   const copyText = document.getElementsByClassName("messageId");

//   /* Select the text field */
//   copyText[0].select();
//   copyText[0].setSelectionRange(0, 99999); /* For mobile devices */

//    /* Copy the text inside the text field */
//   navigator.clipboard.writeText(copyText[0].value);

//   /* Alert the copied text */
//   alert("Copied the text: " + copyText[0].value);
// }


// const printMessage = document.getElementById('print-message');

// printMessage.addEventListener('click', ()=>{
//   console.log('clicked');
//   document.querySelector('.active-chat').classList.add('print')
//   document.querySelector('.left-panel').setAttribute('class','dont-print')
//   document.querySelector('.right-panel').setAttribute('class','dont-print')
  
//   window.print();
// })



// const switchToagentBtn = document.getElementById('switch-to-agent'); 
// const switchToLocalBtn = document.getElementById('switch-to-local');

// switchToagentBtn.addEventListener('click', () => {
//     argetView.classList.remove('hide');
//     localView.classList.add('hide');
// })

// switchToLocalBtn.addEventListener('click', () => {
//     argetView.classList.add('hide');
//     localView.classList.remove('hide');
// })


// NOTIFICATIONS

// if (Notification.permission === 'granted') {
//   //do something
//   $('#allow-push-notification-bar').hide();
//   // show all notifications
// }
// else if (Notification.permission === 'default') {
//   $('#allow-push-notification-bar').show();
// }

// $('#allow-push-notification').click(function () {
//   $('#allow-push-notification-bar').hide();
//   Notification.requestPermission().then(function (status) {
//       if (status === 'denied') {
//           //do something
//           alert('go to setings to allow notificatoin')
//       } else if (status === 'granted') {
//           //do something
//           $('#allow-push-notification-bar').hide();
//           alert('show messages everytime coz notification is always on')
//       }
//   });
// });

// function showNotification(){
//   const notification = new Notification("You have a new Message from BOM",{
//     // body:"Somebody send money in to your BOM account. Don't forget to check your transaction history",
//     body:"You will be receiving notification from BOM, with you everywhere. ",
//     icon:"./bom-logo.png"
//   });

//   notification.style = `background:red;`;
// }

// if(Notification.permission === "granted"){
//   showNotification();
// }else if(Notification.permission != "denied"){
//   Notification.requestPermission().then(permission => {
//     if(permission === "granted"){
//       showNotification();
//     }
//   })
// }

// =======END OF NOTIFICATIONS=========== //



// checking all classes and IDs in the dom
var idArr = [];
var classArr = [];
[].forEach.call(document.querySelectorAll("*"), function(element){
    if (element.id && idArr.indexOf(element.id) == -1) {
        idArr.push(element.id);
    }
    if (element.className) {
        var tempClassArr = element.className.split(" ");
        for (var i = 0; i < tempClassArr.length; i++) {
            if (classArr.indexOf(tempClassArr[i]) == -1) {
                classArr.push(tempClassArr[i]);
            }
        }
    }
});
console.log(idArr);
console.log(classArr);
//=========================================================//












