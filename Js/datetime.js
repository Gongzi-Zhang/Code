let start = Date.now();	// milliseconds couts from 1970-01-01 UTC+0

let now = new Date();

// starting time point: 1970.1.1 (UTC +0)
let date = new Date(milliseconds); 

date = new Date(dateString);
date = new Date("2019-10-08");

date = new Date.parse("YYYY-MM-DDTHH:mm:ss.sssZ");	// return NaN for invalid format
/*  T is the delimiter
 *  Z is optional, denoting the time zone in the format +-hh:mm; a single Z means UTC+0
 */
date = new Date("2019-10-08T13:51:50.417-07:00");

date = new Date(y, m, d, h, m, s, ms);	// minimal precision is 1 ms
// year must have 4 digits
// month count starts from 0 (Jan), up to 11 (Dec)
// date: default 1
// h/m/s/ms: default 0 if absent

// in local time zone
date.getFullYear();	// 4-digit year
date.getMonth();	// 0-11
date.getDate();
date.getDay();		// 0(Sun)-6(Sat)
date.getHours();
date.getMinutes();
date.getSeconds();
date.getMilliseconds();
date.getTime();		// milliseconds passed from 1970.1.1 UTC+0
date.getTimezoneOffset();   // diff between the local timezond and UTC, in mins: UTC-1: 60; UTC+3: 180
date.setFullYear(year [, month [, date]]);	
date.setMonth(month [, date]);	
date.setDate(date);
date.setHours(hour [, min [, sec [, ms]]]);		
date.setMinutes(min [, sec [, ms]]);
date.setSeconds(sec [, ms]);
date.setMilliseconds(ms);
date.setTime(milliseconds);		

// in UTC time zone
date.getUTCFullYear();
date.getUTCMonth();
date.getUTCDate();
date.getUTCDay();
date.getUTCHours();
date.getUTCMinutes();
date.getUTCSeconds();
date.getUTCMilliseconds();
date.setUTCFullYear(year [, month [, date]]);	
date.setUTCMonth(month [, date]);	
date.setUTCDate(date);
date.setUTCHours(hour [, min [, sec [, ms]]]);		
date.setUTCMinutes(min [, sec [, ms]]);
date.setUTCSeconds(sec [, ms]);
date.setUTCMilliseconds(ms);
date.setUTCTime(milliseconds);		


// autocorrection
date = new Date(2013, 0, 32);	// 2013-Feb-1st
date = new Date(2016, 1, 28);	// 2016-Feb-28th
date.setDate(date.getDate() + 2);   // 1 Mar 2016
date.setDate(0);    // min day is 1, so this set the last day of previous month


// date to number
alert(+date);	// same as date.getTime();
