// ===================================================== //
        // Next / Previous steps in signup page
// ===================================================== //

function terms_check(termsCheckBox){
  //If the checkbox has been checked
  if(termsCheckBox.checked){
      document.getElementById("signupNextBtn").disabled = false;
  } else{
      document.getElementById("signupNextBtn").disabled = true;
  }
}

let genesis_tab = 0; // Current tab is set to be the first tab (0)
showGenesisTab(genesis_tab); // Display the current tab

function showGenesisTab(n) {
  // This function will display the specified tab of the form...
  let x = document.getElementsByClassName("signup-tab");
  if(x[n] !== undefined){
    x[n].style.display = "block";

    //... and fix the Previous/Next buttons:
  if (n == 0) {
    document.getElementById("signupPrevBtn").style.visibility = "hidden";
  } else {
    document.getElementById("signupPrevBtn").style.visibility = "visible";
  }
  if (n == (x.length - 1)) {
    document.getElementById("signupNextBtn").disabled = true;
    document.getElementById("signupNextBtn").innerHTML = "Submit";
  } else {
    document.getElementById("signupNextBtn").disabled = false;
    document.getElementById("signupNextBtn").innerHTML = "Next &rightarrow;";
  }
  }
  
  
  //... and run a function that will display the correct step indicator:
  signupFixStepIndicator(n)
}

function signupNextPrev(n) {
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("signup-tab");
  // Exit the function if any field in the current tab is invalid:
  if (n == 1 && !signupValidateForm()) return false;
  // Hide the current tab:
  x[genesis_tab].style.display = "none";
  // Increase or decrease the current tab by 1:
  genesis_tab = genesis_tab + n;
  // if you have reached the end of the form...
  if (genesis_tab >= x.length) {
    // ... the form gets submitted:
    document.getElementById("signupRegForm").submit();
    return false;
  }
  // Otherwise, display the correct tab:
  showGenesisTab(genesis_tab);
}

function signupValidateForm() {
  // This function deals with validation of the form fields
  var x, y, i, valid = true;
  x = document.getElementsByClassName("signup-tab");
  y = x[genesis_tab].querySelectorAll(".signup-tab input");
  // A loop that checks every input field in the current tab:
  for (i = 0; i < y.length; i++) {
    // If a field is empty...
    if (y[i].value == "") {
      // add an "invalid" class to the field:
      y[i].className += " invalid";
      // and set the current valid status to false
      valid = false;
    }
  }
  // If the valid status is true, mark the step as finished and valid:
  if (valid) {
    document.getElementsByClassName("step")[genesis_tab].className += " finish";
  }
  return valid; // return the valid status
}

function signupFixStepIndicator(n) {
  // This function removes the "active" class of all steps...
  var i, x = document.getElementsByClassName("step");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" active", "");
  }

  if(x[n] !== undefined){
    //... and adds the "active" class on the current step:
    x[n].className += " active";
  }
}


// ============================================== //
        // The Send Money Button //
// ============================================== //



// let userFName = document.getElementById('f-name');

