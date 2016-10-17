function onMapClick(e) {
        L.popup()
            .setLatLng(e.latlng)
            .setContent("You clicked the map at " + e.latlng.toString())
            .openOn(map);
    }


function feedback(event,url){    
    var choice  = confirm("Are you sure about submitting feedback?");

    if(choice){
        window.location.href = url;
    }
    
}