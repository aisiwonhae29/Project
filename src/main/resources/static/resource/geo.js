var Location;
var myLatitude;
var myLongitude;
if (Location == null) {
	getLocation();
	myLatitude = position.coords.latitude;
	myLongitude = position.coords.longitude;
	alert(myLatitude);
}


function getLocation() {
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(getPosition);
	} else {
		Location = "not checked";
	}
}
function getPosition(position) {
	 myLatitude=position.coords.latitude; 
	 myLongitude=position.coords.longitude;
}