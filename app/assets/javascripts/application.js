// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize-sprockets

//= require underscore
//= require gmaps/google
//= require_tree .

var navHeight = 100;

function setMapHeight(){
  $("#map").css("height", $( window ).height() - navHeight);
}


$(document).on("ready page:load", function(){
    console.log("sanity check!")
    $('.modal-trigger').leanModal();

    $(".dropdown-button").dropdown();

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
      handler.getMap().setZoom(14);
      handler.map.centerOn({ lat: 37.7749, lng: -122.4194 })
    });
});
