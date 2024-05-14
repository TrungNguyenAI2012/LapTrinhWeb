$(function () {

	// ------------------------------------------------------- //
	//  Styled Leaflet Map
	// ------------------------------------------------------ //

	var mapId = 'map',
		mapCenter = [53.14, 8.22],
		mapMarker = true;

	if ($('#' + mapId).length > 0) {

		var icon = L.icon({
			iconUrl: '../Asset/Image/marker.png',
			iconSize: [25, 37.5],
			popupAnchor: [0, -18],
			tooltipAnchor: [0, 19]
		});

		var dragging = false,
			tap = false;

		if ($(window).width() > 700) {
			dragging = true;
			tap = true;
		}

		var map = L.map(mapId, {
			center: mapCenter,
			zoom: 13,
			dragging: dragging,
			tap: tap,
			scrollWheelZoom: false
		});

		var Stamen_TonerLite = L.tileLayer('https://stamen-tiles-{s}.a.ssl.fastly.net/toner-lite/{z}/{x}/{y}{r}.{ext}', {
			attribution: 'Map tiles by <a href="http://stamen.com">Stamen Design</a>, <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a> &mdash; Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
			subdomains: 'abcd',
			minZoom: 0,
			maxZoom: 20,
			ext: 'png'
		});

		Stamen_TonerLite.addTo(map);

		map.once('focus', function () {
			map.scrollWheelZoom.enable();
		});

		if (mapMarker) {
			var marker = L.marker(mapCenter, {
				icon: icon
			}).addTo(map);

			marker.bindPopup("<div class='p-4'><h5>Thông tin địa chỉ</h5><p>Trụ sở chính của chúng tôi được đặt tại Việt Nam và tương lai sẽ đưa rộng ra toàn thế giới.</p></div>", {
				minwidth: 200,
				maxWidth: 600,
				className: 'map-custom-popup'
			})
		}
	}
});