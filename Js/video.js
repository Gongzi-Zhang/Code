function addControls(vid) {
    vid.removeAttributes('controls');	// remove built-in controls

    vid.height = vid.videoHeight;
    vid.width  = vid.videoWidth;
    vid.parentNode.style.height = vid.videoHeight + 'px';
    vid.parentNode.style.width  = vid.videoWidth + 'px';

    var controls = document.createElements('div');  // div for new controls
    controls.setAttribute('class', 'controls');

    var play = document.createElements('button');   // buttong for new 'play' control
    play.setAttribute('title', 'Play');
    play.innerHTML = '&#x25BA;';
    controls.appendChild(play);
    vid.parentNode.insertBefore(controls, vid);

    play.onclick = function() {
	if (vid.ended) {
	    vid.currentTime = 0;
	}
	if (vid.paused) {
	    vid.play();
	} else {
	    vid.pause();
	}
    }

    // change the state of Play button
    vid.addEventListerner('play', function() {
	play.innerHTML = '&#x2590;&#x2590;';
	play.setAttribute('paused', true);
    }, false);

    vid.addEventListerner('pause', function() {
	play.removeAttribute('paused');
	play.innerHTML = '&#x25BA';
    }, false);

    vid.addEventListerner('ended', function() {
	vid.pause();
    }, false);

}
