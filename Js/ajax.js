var xhr = XMLHttpRequest();
xhr.open('GET', 'send-ajax-data.php');

xhr.onreadystatechange = function () {
    var DONE = 4;   // readyState of 4 means the request is done
    var OK = 200;
    if (xhr.readyState === DONE) {
	if (xhr.status === OK) {
	    console.log(xhr.responseText);
	} else {
	    console.log('Error: ' + xhr.status);
	}
    }
};

// send request to send-ajax-data.php
xhr.send(null);




/* fetch */
fetch('send-ajax-data.php')
    .then(data => console.log(data))
    .catch(error => console.log('Error: ' + error));



/* ES7 */
async function doAjax() {
    try {
	const res = await fetch('send-ajax-data.php');
	const data = await res.text();
	console.log(data);
    } catch (error) {
	console.log('Error: ' + error);
    }
}
doAjax();
