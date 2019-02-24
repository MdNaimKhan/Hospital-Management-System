function Validation() {
    var FName = document.getElementById('txtFName').value;
    var LName = document.getElementById('txtLName').value;
    var email = document.getElementById('txtemail').value;
    var phone = document.getElementById('txtPhnNum').value;
    var phoneDigit = phone.length;
    var dob = document.getElementById('txtDOB').value;
    var state = document.getElementById('ddlState').value;
    var plan = document.getElementById('ddlPlan').value;
    if ((plan = "") && (state = "") && (dob = "") && (email = "") && (phone = "") && (FName = "") && (LName = "")) {
        alert("Please fill all the data fields.");
    }
    else if (plan = "") {
        alert("Please select an Insurence plan");
    }
    else if (state = "") {
        alert("Please select a state");
    }
    else if (dob = "") {
        alert("Please select a date of birth by clicking the calender icon");
    }
    else if (email = "")  {
        alert("Please enter an email id");
    }
    else if (phone = "") {
        alert("Please enter a mobile number **10 digit**");
    }
    else if ((phoneDigit > 10) || (phoneDigit < 10)) {
        alert("Please enter phone number in exactly 10 digits **if your phone number is '01XXXXXXXXX' then start with '1' ");
    }
    else if (LName = "") {
        alert("Please enter a Last Name");
    }
    else if (FName = "") {
        alert("Please enter a First Name");
    }
    else {
        alert("Data added successfully");
        //return true;
    }
}