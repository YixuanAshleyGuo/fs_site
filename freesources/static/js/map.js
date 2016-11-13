function onMapClick(e) {
    
        //var geocodeService = L.esri.Geocoding.geocodeService();

        //map.on('click', function(e) {
            //geocodeService.reverse().latlng(e.latlng).run(function(error, result) {
                
            //});
        //});
    
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
    

    
        // L.popup()
            // .setLatLng(e.latlng)
            // .setContent("You clicked the map at " + e.latlng.toString())
            // .openOn(map);
    
    // Create marker at clicked location
    var newMarker = new L.marker(e.latlng);
    
    // Create popup
    var form = document.getElementById("form");
    var popup = L.popup().setContent(form.cloneNode(true).innerHTML);
        
    // Set location to clicked location
    
    // Bind and open popup upon adding the marker
    newMarker.bindPopup(popup);
    map.addLayer(newMarker);
    newMarker.openPopup();

    
    var locations = document.getElementsByClassName('location');
    for (var i = 0; i < locations.length; ++i)
        locations[i].value = e.latlng.toString();

    // Uncomment to center map on marker
    map.panTo(e.latlng);
    
    // Add event handler for popup close
    newMarker.on('popupclose', function(e) {
        newMarker.remove();
    });
    
    newMarker.unbindPopup();
    //newMarker.focus();
    
        // $.ajax({
        //     url:'addEvent',
        //     type:'POST',
        //     data:{
        //         csrfmiddlewaretoken: '{{ csrf_token }}',
        //         latlng: e.latlng,
        //     }
        // })
    
    // Anytime the expression type is changed, show/hide certain elements
     $('.exp_type').on('input', function() {
        var value = $(this).val();
        var startTimeLabel = $('label')[2];
        var startTime = document.getElementById('start_time');
        var expirationLabel = $('label')[3];
        var expiration = document.getElementById('expiration');
        if (value != 'Permanent') {
            
            console.log("Showing start time and expiration");
            
            // Show start time and expiration
            startTime.disabled = false;
            expiration.disabled = false;
            
            // Show labels
            startTimeLabel.style = 'display: inline;';
            expirationLabel.style ='display: inline;';
        } else {
                   
            console.log("Hiding start time and expiration");
            
            // Hide start time and expiration
            startTime.disabled = true;
            expiration.disabled = true;
            
            // Hide labels
            startTimeLabel.style = 'display: none;';
            expirationLabel.style = 'display: none;';
        }
    });
}


function feedback(event,url){    
    $('#submitFeedback').one('click','#confirmSubmitFeedback', function(e){
        window.location.href = url;
    })
    
}

// function addEvent(e,form){
//     var inner = "<h3>Please enter new event information</h3><form class = \"form-horizontal\">{% csrf_token %}{{form.as_table}}<button class=\"btn btn-primary\" onclick=\"submitEvent(this,{{ form }})\" data-toggle=\"modal\" data-target=\"#submitEvent\">Submit my event</button></form>";
//     L.popup()
//         .setLatLng(e.latlng)
//         .setContent(inner)
//         .openOn(map);
// }

// function submitEvent(event,form){
//     $('submitEvent').one('click','#confirmSubmitEvent', function(e){
//         $.ajax({
//             url: 'addEvent',
//             type: 'POST',
//             data:{
//                 csrfmiddlewaretoken: '{{ csrf_token }}',
//                 form: '{{form}}',
//             }
//         })
//     })
// }