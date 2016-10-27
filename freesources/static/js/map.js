function onMapClick(e) {
        // L.popup()
            // .setLatLng(e.latlng)
            // .setContent("You clicked the map at " + e.latlng.toString())
            // .openOn(map);
        var newMarker = new L.marker(e.latlng);
        // var popup="this is a new click event added marker";

                var popup = "<h4>Event Details</h4>";
                popup += "<table class=\"table\">";
                popup += "<tr><th>Tag</th><td>";
                popup += '<input type = "text">';
                popup += "</td></tr>";
                popup += "<tr><th>Location</th><td>";
                popup += '<input type = "text">';
                popup += "</td></tr>";
                popup += "<tr><th>Description</th><td>";
                popup += '<input type = "text">';
                popup += "</td></tr>";
                popup += "<tr><th>Type</th><td>";
                popup += '<input type = "text">';
                popup += "</td></tr>";
                popup += "<tr><th>Start Time</th><td>";
                popup += '<input type = "text">';
                popup += "</td></tr>";
                popup += "<tr><th>Expiration</th><td>";
                popup += '<input type = "text">';
                popup += "</td></tr>";


                popup += '<tr><td>';
                popup += '<button class="btn btn-success btn-block" onclick="addEvent(this, '+e.latlng.lat+','+e.latlng.lng+')">Submit Event</button></td><td></td></tr>';
                popup += "</table>"

        newMarker.bindPopup(popup);
        map.addLayer(newMarker);
        // $.ajax({
        //     url:'addEvent',
        //     type:'POST',
        //     data:{
        //         csrfmiddlewaretoken: '{{ csrf_token }}',
        //         laglng: e.latlng,
        //     }
        // })
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