var navHeight = 100;

function setMapHeight(){
  $("#map").css("height", $( window ).height() - navHeight);
}


$(document).on("ready page:load", function(){
    console.log("sanity check!")
    $('.modal-trigger').leanModal();

    $(window).resize(function(){
      setMapHeight();
    });

    handler = Gmaps.build('Google');
    handler.buildMap({
      provider: {},
      internal: {id: 'map'}
    }, function(){
      var data_hash = window.data_hash
      markers = handler.addMarkers(data_hash);
      handler.bounds.extendWith(markers);
      handler.getMap().setZoom(13);
      handler.map.centerOn({ lat: 37.7749, lng: -122.4194 })
    });
});
