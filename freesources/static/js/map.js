function onMapClick(e) {
        //var geocodeService = L.esri.Geocoding.geocodeService();

        //map.on('click', function(e) {
            //geocodeService.reverse().latlng(e.latlng).run(function(error, result) {
                
            //});
        //});
            
            

    
        // L.popup()
            // .setLatLng(e.latlng)
            // .setContent("You clicked the map at " + e.latlng.toString())
            // .openOn(map);
        var newMarker = new L.marker(e.latlng);
        // var popup="this is a new click event added marker";
/*
            var popup = "<h4>Event Details</h4>";
            popup += "<table class=\"table\">";
            popup += "<tr>";
            popup += "<th>Tag</th>";
            popup += "<td>"
            popup += '<input id="marker-tag" type = "text">';
            popup += "</td></tr>";
            popup += '<tr><td>';
            popup += '<button class="btn btn-success btn-block" onclick="addEvent(this, '+e.latlng.lat+','+e.latlng.lng+')">Submit Event</button></td><td></td></tr>';
            popup += "</table>";
            
            */
    
    var form = document.getElementById("form");
    var popup = L.popup().setContent(form.cloneNode(true).innerHTML);
    
    console.log("bye");
    
    var location = document.getElementById('location');
    location.value = e.latlng;
    
    newMarker.bindPopup(popup);
    map.addLayer(newMarker);
    newMarker.openPopup();
    
    // Uncomment to center map on marker
    map.panTo(e.latlng);
    
    newMarker.on("popupclose", function(e) {
        newMarker.remove();
    });
    
    
    //newMarker.focus();
        // $.ajax({
        //     url:'addEvent',
        //     type:'POST',
        //     data:{
        //         csrfmiddlewaretoken: '{{ csrf_token }}',
        //         laglng: e.latlng,
        //     }
        // })
    
        // TODO: Close other popups before opening this 
    
    // Anytime the expression type is changed, show/hide certain elements
    
     $('#exp_type').on('input', function() {
        var value = $(this).val();
        var startTimeLabel = $('label')[2];
        var startTime = document.getElementById('start_time');
        var expirationLabel = $('label')[3];
        var expiration = document.getElementById('expiration');
        if (value != 'Permanent') {
            
            console.log("not permanent");
            
            // Show start time and expiration
            startTime.setAttribute('style', 'display: inline;');
            expiration.setAttribute('style', 'display: inline;');
            
            // Show labels
            startTimeLabel.setAttribute('style', 'display: inline;');
            expirationLabel.setAttribute('style', 'display: inline;');
        } else {
            
            console.log("permanent");
            
            // Hide start time and expiration
            startTime.setAttribute('style', 'display: none;');
            expiration.setAttribute('style', 'display: none;');
            
            // Hide labels
            startTimeLabel.setAttribute('style', 'display: none;');
            expirationLabel.setAttribute('style', 'display: none;');
        }
    });
}


function feedback(event,url){    
    $('#submitFeedback').one('click','#confirmSubmitFeedback', function(e){
        window.location.href = url;
    })
    
}

