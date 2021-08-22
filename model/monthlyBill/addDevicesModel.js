var db = require('../../database/databaseConnection');

/**
 * Add device data to main bill plan
 * @param {*} devicedata data of devices
 * @returns 
 */
module.exports.AddDeviceMailBill = (devicedata, id) => {
    return new Promise(async (resolve, reject) => {

        var bill_id = devicedata.bill_id
        var appliance = devicedata.appliance
        var quantity = devicedata.quantity
        var priority = devicedata.priority
        var using_minutes_peak_time = devicedata.using_minutes_peak_time
        var using_minutes_off_peak_time = devicedata.using_minutes_off_peak_time
        var using_minutes_day_time = devicedata.using_minutes_day_time
        var power = devicedata.power
        var total_units_fixed = devicedata.total_units_fixed
        var units_peak_time = devicedata.units_peak_time
        var units_off_peak_time = devicedata.units_off_peak_time
        var units_day_time = devicedata.units_day_time
        var total_cost_TOU = devicedata.total_cost_TOU
        var cost_peak_time = devicedata.cost_peak_time
        var cost_off_peak_time = devicedata.cost_off_peak_time
        var cost_day_time = devicedata.cost_day_time
        var Cust_id = id
        var hPeak = devicedata.hPeak
        var mPeak = devicedata.mPeak
        var hOffPeak = devicedata.hOffPeak
        var mOffPeak = devicedata.mOffPeak
        var hDay = devicedata.hDay
        var mDay = devicedata.mDay


        var addDeviceQuery = `INSERT INTO electric_device_mplan 
        (bill_id, appliance, quantity, priority, hPeak, mPeak, hOffPeak, mOffPeak, hDay, mDay, using_minutes_peak_time, using_minutes_off_peak_time, using_minutes_day_time, power, total_units_fixed, units_peak_time,
        units_off_peak_time, units_day_time, total_cost_TOU, cost_peak_time, cost_off_peak_time, cost_day_time, Cust_id) 
        VALUES("${bill_id}","${appliance}","${quantity}","${priority}","${hPeak}","${mPeak}","${hOffPeak}","${mOffPeak}","${hDay}","${mDay}","${using_minutes_peak_time}",
        "${using_minutes_off_peak_time}","${using_minutes_day_time}","${power}","${total_units_fixed}","${units_peak_time}",
        "${units_off_peak_time}","${units_day_time}","${total_cost_TOU}","${cost_peak_time}","${cost_off_peak_time}",
        "${cost_day_time}","${Cust_id}");`;



        db.query(addDeviceQuery, async function (error, result) {

            if (error) {
                console.log(error);

                reject({ status: false, mesg: "error inserting data" });
            } else {
                // console.log(result);

                resolve({ status: true, mesg: "successfully insert data" });

            }

        });
    });

}

/**
 * 
 * @returns get Bill id
 */

 module.exports.getBillIdFunc = (CustId) => {
    return new Promise(async (resolve, reject) => {


        //console.log("Inside get bill id model function query"+ CustId);

        var selectQuery = `SELECT MAX(Bill_id) As max_bill_id
        FROM ebill_monthly_plan
        Where Cust_id = ${CustId}; `;

        //console.log("Inside get bill id model function query"+ selectQuery);


        db.query(selectQuery, async function (error, result) {

            if (error) {
                console.log(error);

                reject({ status: false, mesg: "error getting data" });
            } else {
                 console.log(result[0].max_bill_id);
                resolve({ status: true, data: result[0].max_bill_id });

            }

        });
    });

}


/**
 * 
 * @returns device data
 */

module.exports.getDeviceMailBill = (billId,userId) => {
    return new Promise(async (resolve, reject) => {



        
        var selectQuery = `SELECT * From electric_device_mplan WHERE bill_id=${billId} AND Cust_id=${userId};`;
        console.log(selectQuery)

        db.query(selectQuery, async function (error, result) {

            if (error) {
                console.log(error);

                reject({ status: false, mesg: "error getting data" });
            } else {
                // console.log(result);

                resolve({ status: true, data: result });

            }

        });
    });

}