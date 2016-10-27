function onMapClick(e) {
        L.popup()
            .setLatLng(e.latlng)
            .setContent("You clicked the map at " + e.latlng.toString())
            .openOn(map);
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