import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';

// const styles = [
//     {"featureType": "landscape",
//         "stylers": [
//             {  "hue": "#FFBB00" },
//             { "saturation": 43.400000000000006},
//             { "lightness": 37.599999999999994},
//             {"gamma": 1}]
//     },
//     {"featureType": "road.highway",
//         "stylers": [
//             {"hue": "#FFC200"},
//             {"saturation": -61.8},
//             {"lightness": 45.599999999999994},
//             {"gamma": 1}]
//     },
//     {"featureType": "road.arterial",
//         "stylers": [
//             {"hue": "#FF0300"},
//             {"saturation": -100},
//             {"lightness": 51.19999999999999},
//             {"gamma": 1}]
//     },
//     {"featureType": "road.local",
//         "stylers": [
//             {"hue": "#FF0300"},
//             {"saturation": -100},
//             {"lightness": 52},
//             {"gamma": 1}]
//     },
//     {"featureType": "water",
//         "stylers": [
//             {"hue": "#0078FF"},
//             {"saturation": -13.200000000000003},
//             {"lightness": 2.4000000000000057},
//             {"gamma": 1}]
//     },
//     {"featureType": "poi",
//         "stylers": [
//             {"hue": "#00FF6A"},
//             {"saturation": -1.0989010989011234},
//             {"lightness": 11.200000000000017},
//             {"gamma": 1}]
//     }
// ]

const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  // map.addStyle({
  //   styles: styles,
  //   mapTypeId: 'map_style'
  // });
  // map.setStyle('map_style');
  const markers = JSON.parse(mapElement.dataset.markers);
  map.addMarkers(markers);

  mapZoom(markers, map)

  const button = document.getElementById('map-button')
  const list = document.getElementById('list')
  mapElement.classList.add('hidden')
  button.addEventListener('click', (event) => {
    mapElement.classList.toggle('hidden')
    mapZoom(markers, map)
    list.classList.toggle('hidden')
  })
}

function mapZoom(markers, map) {
  if (markers.length === 0) {
    map.setZoom(4);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }
}

// function initialize() {
//   var mapCanvas = document.getElementById('map');
//   var mapOptions = {
//     center: new google.maps.LatLng(44.5403, -78.5463),
//     zoom: 8,
//     mapTypeId: google.maps.MapTypeId.ROADMAP
//   }
//   var map = new google.maps.Map(mapCanvas, mapOptions)
// }
// google.maps.event.addDomListener(window, 'load', initialize);

autocomplete();


