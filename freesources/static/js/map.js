function onMapClick(e) {
        
    geocodeService.reverse().latlng(e.latlng).run(function(error, result) {
        if(!result){
            alert("Please find a valid address!");
            // console.log("the location is unavailable");
            return;
        }
      // L.marker(result.latlng).addTo(map).bindPopup(result.address.Match_addr).openPopup();
        // Create marker at clicked location
        var newMarker = new L.marker(e.latlng);
        
        // Create popup
        var form = document.getElementById("form");
        var popup = L.popup().setContent(form.cloneNode(true).innerHTML);
            
        // Set location to clicked location
        
        // Bind and open popup upon adding the marker
        newMarker.bindPopup(popup);
        storedMarkers.push([newMarker, {}]);
        visibleMarkers.push(newMarker);
        map.addLayer(newMarker);
        newMarker.openPopup();

        // for (var i = 0; i < storedMarkers.length; i++) {
        //     console.log("Lat: " + storedMarkers[i][0].getLatLng().lat);
        // }
        
        var locations = document.getElementsByClassName('location');
        var lat = document.getElementsByClassName('lat');
        var lng = document.getElementsByClassName('lng');
        for (var i = 0; i < locations.length; ++i){
            // console.log("map.js - this is the "+i+" of the marker ["+e.latlng.lat+","+e.latlng.lng+"]");      

            locations[i].value = result.address.Match_addr;
            lat[i].value = e.latlng.lat;
            lng[i].value = e.latlng.lng;
        }


        // Uncomment to center map on marker
        // map.panTo(e.latlng);
        
        // Add event handler for popup close
        newMarker.on('popupclose', function(e) {
            storedMarkers.pop();
            visibleMarkers.pop();
            newMarker.remove();
        });
        
        newMarker.unbindPopup();

        exp_type('');



    });



}

function onMapClickMark(){
    var locations = document.getElementsByClassName('location_mark');
    var lat = document.getElementsByClassName('lat_mark');
    var lng = document.getElementsByClassName('lng_mark');
    for (var i = 0; i < storedMarkers.length; ++i){
        // console.log("map.js - additem_mark - this is the "+i+" of the marker ["+storedMarkers[i][1]['lat']+","+storedMarkers[i][1]['lng']+"]");      

        locations[i].value = "No."+idx+" : Geolocation["+storedMarkers[i][1]['lat']+","+storedMarkers[i][1]['lng']+"]";
        lat[i].value = storedMarkers[i][1]['lat'];
        lng[i].value = storedMarkers[i][1]['lng'];
    }
    exp_type('_mark');
}

function exp_type(str){
        // Anytime the expression type is changed, show/hide certain elements
     $('.exp_type'+str).on('input', function() {
        var value = $(this).val();
        var startTimeLabel = $('label')[2];
       // console.log(startTimeLabel);
        var startTime = document.getElementById('start_time'+str);
        var expirationLabel = $('label')[3];
       // console.log(expirationLabel);
        var expiration = document.getElementById('expiration'+str);
        // console.log(value)
        if (value != 'Permanent') {
            
            console.log("Showing start time and expiration");
            
            // Show start time and expiration
            // startTime.disabled = false;
            // expiration.disabled = false;

            startTime.style = 'display: inline;';
            expiration.style = 'display: inline;';
            
            // Show labels
            startTimeLabel.style = 'display: inline;';
            expirationLabel.style ='display: inline;';
        } else {
                   
            console.log("Hiding start time and expiration");
            
            // Hide start time and expiration
            // startTime.disabled = true;
            // expiration.disabled = true;

            startTime.style = 'display: none;';
            expiration.style = 'display: none;';
            
            // Hide labels
            startTimeLabel.style = 'display: none;';
            expirationLabel.style = 'display: none;';
        }
    });

}


function feedback(event,url){    
    $('#submitFeedback').one('click','#confirmSubmitFeedback', function(e){
        window.location.href = url;
    });
    
}

function additem(event){    
    $('#submitItem').one('click','#confirmSubmitItem', function(e){
        document.getElementById('submit_item').submit();
    });
    
}

function additem_mark(event){    
    $('#submitItemMark').one('click','#confirmSubmitItemMark', function(e){
        document.getElementById('submit_item_mark').submit();
    })
    
}

function confim_suggestion(event){    
    $('#suggest_tag_modal').one('click','#confirm_suggestion', function(e){
        document.getElementById('tag-form').submit();
    })
    
}

