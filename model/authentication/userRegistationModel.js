var userServiceModel = require("./userServiceModel");
var db = require("../../database/databaseConnection");
var authService = require('../../service/authServices');

// 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

/**
 * user Registation
 * @param {*} requestData request body data
 * @returns
 */
module.exports.createUserFunc = (requestData) => {
  return new Promise(async (resolve, reject) => {
    console.log(requestData);

    var firstName = requestData.firstName.trim();
    var email = requestData.userEmail.trim();
    var lastName = requestData.lastName.trim();
    var userpassword = requestData.userPassword.trim();

    var password = await userServiceModel.encryptPassword(userpassword);

    var userRegQuery = `INSERT INTO customer (First_name,Last_name,Email,Password) VALUES("${firstName}","${lastName}","${email}","${password}");`;

    // insert data to customer table
    db.query(userRegQuery, (err, result) => {
      if (err) {
        console.log("inserting error", err);
        reject({ status: false, mesg: "User registered unsucessfull" });
      } else {
        // authService.successWithMail(email, "electrosysg11@gmail.com", "Registered successfully to electro", "<h2>Welcome to Electro</h2>")
        resolve({ status: true, mesg: "User registered sucessfully" });
      }
    });
  });
};

/**
 * login user function
 * @param {*} requestData user enter email and password
 * @returns
 */

module.exports.loginUserFunc = (requestData) => {
  return new Promise((resolve, reject) => {
    // console.log(requestData);
    console.log("inside loginUserFunc");
    var email = requestData.userEmail.trim();

    if (email.substr(0, 5) == "admin" || email.substr(0, 5) == "ceben") {
      console.log("inside admin");
      var selectQuery = `SELECT * FROM employee WHERE Emp_id='${email}' OR Email='${email}' ;`;
    } else {
      console.log("inside user");
      var selectQuery = `SELECT * FROM customer WHERE Email='${email}';`;
    }

    db.query(selectQuery, async function (err, result) {
      if (err) {

        reject("error");
      } else {
        if (result.length == 0) {
          console.log("inside ");
          // reject({ status: false, mesg: "invalid user" });
          resolve({ status: false, mesg: "invalid email" });
        } else {
          // console.log(result[0].Password);
          // console.log(result[0].Role);
          let passwordValidationStatus =
            await userServiceModel.validatePassword(requestData.userPassword.trim(), result[0].Password);
          //console.log(passwordValidationStatus);
          if (passwordValidationStatus) {
            var token = authService.generateToken(result);
            resolve({ status: true, data: result, token: token });
          } else {
            resolve({ status: false, mesg: "invalid user password" });
          }
        }
      }
    });
  });
};



/**
 * user email validity check
 * @param {*} requestData request body data
 * @returns
 */
module.exports.checkEmailFunc = (requestData) => {
  return new Promise((resolve, reject) => {
    console.log(requestData);


    var email = requestData.userEmail.trim();

    if (email.substr(0, 5) == "admin" || email.substr(0, 5) == "ceben") {
      console.log("inside admin and ceb");
      var selectQuery = `SELECT COUNT(Email) email_count FROM employee WHERE Email='${email}' ;`;
    } else {
      console.log("inside user");
      var selectQuery = `SELECT COUNT(Email) as email_count FROM customer WHERE Email='${email}';`;
    }

    db.query(selectQuery, async function (err, result) {
      if (err) {
        console.log("inserting error", err);
        reject({ status: false, mesg: "Invalid Email" });
      } else {

        if (result[0].email_count == 1) {

          var hashemail = await authService.encrypt(email)

          // console.log("hash email :", hashemail);
          // authService.successWithMail(email, "electrosysg11@gmail.com", "Reset Your Electro Password", `<p>You requested for reset your password</p><h5>Click in this <a href="http://localhost:3000/reset-password/${hashemail}">Link</a> to reset your password</h5>`)
          resolve({ status: true, mesg: "Valid Email" });
        } else {
          resolve({ status: false, mesg: "Invalid Email" });

        }

      }
    });
  });
};


/**
 * password reset model function
 * @param {*} requestData 
 * @param {*} eid user email
 * @returns 
 */
module.exports.resetPasswordFunc = (requestData, eid) => {
  return new Promise(async (resolve, reject) => {
    console.log(requestData);


    var userPassword = requestData.userPassword.trim();
    var userMail = await authService.decrypt(eid);
    var password = await userServiceModel.encryptPassword(userPassword);

    if (userMail.substr(0, 5) == "admin" || userMail.substr(0, 5) == "ceben") {
      console.log("inside admin and ceb engineer");
      var updateQuery = `UPDATE employee SET Password ='${password}'  WHERE Email='${userMail}';`;
    } else {
      console.log("inside user");
      var updateQuery = `UPDATE customer SET Password ='${password}'  WHERE Email='${userMail}';`;

    }


    db.query(updateQuery, async function (err, result) {

      if (err) {
        console.log(err);

        reject({ status: false, mesg: "error updating password" });
      } else {
        // authService.successWithMail(userMail, "electrosysg11@gmail.com", "Password changed", `<p>You have successfuly reset your password</p>`)

        resolve({ status: true, mesg: "password updated successfully" });

      }

    });
  });
};



/**
 * new ceb engineer Registation
 * @param {*} requestData request body data
 * @returns
 */
module.exports.addNewCebEngineerFunc = (requestData) => {
  return new Promise(async (resolve, reject) => {
    console.log(requestData);

    var firstName = requestData.firstName;
    var email = requestData.email.trim();
    var lastName = requestData.lastName;
    var contact = requestData.contact.trim();
    var nic = requestData.nic;
    var address = requestData.address;

    var userpassword = requestData.password.trim();
    var role = "cebengineer";

    var today = new Date();
    var enrollmentDate = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
    var password = await userServiceModel.encryptPassword(userpassword);

    var userRegQuery = `INSERT INTO employee (First_name,Last_name,Email,Conatact_no,Password,NIC,Address,Enrollment_date,Role) VALUES("${firstName}","${lastName}","${email}","${contact}","${password}","${nic}","${address}","${enrollmentDate}","${role}");`;

    // insert data to employee table
    db.query(userRegQuery, (err, result) => {
      if (err) {
        console.log("inserting error", err);
        reject({ status: false, mesg: "new ceb engineer added unsucessfull" });
      } else {
        // authService.successWithMail(email, "electrosys84@gmail.com", "Your are appointed", "<h2>Welcome to Electro Family</h2>")
        resolve({ status: true, mesg: "new ceb engineer added sucessfully" });
      }
    });
  });
};

/**
 * remove ceb engineer model
 * @param {*} requestData ceb engineer id
 * @returns 
 */
module.exports.removeCebEngineerFunc = (requestData) => {
  return new Promise(async (resolve, reject) => {


    var deleteQuery = `DELETE FROM employee WHERE Emp_id=${requestData};`;

    // delete data to employee table
    db.query(deleteQuery, (err, result) => {
      if (err) {
        console.log("inserting error", err);
        reject({ status: false, mesg: "ceb engineer removed unsucessfull" });
      } else {
        // authService.successWithMail(email, "electrosys84@gmail.com", "Your are appointed", "<h2>Welcome to Electro Family</h2>")
        resolve({ status: true, mesg: " ceb engineer removed sucessfully" });
      }
    });
  });
};

/**
 * model from get ceb engineer details
 * @returns ceb engineer details
 */
module.exports.getCebEngineerFunc = () => {
  return new Promise(async (resolve, reject) => {


    var deleteQuery = `SELECT Emp_id,First_name,Last_name FROM employee WHERE Email LIKE 'ceben%';`;

    // get data from employee table
    db.query(deleteQuery, (err, result) => {
      if (err) {
        console.log("inserting error", err);
        reject({ status: false, mesg: "ceb engineer removed unsucessfull" });
      } else {
        resolve({ status: true, data: result });
      }
    });
  });
};