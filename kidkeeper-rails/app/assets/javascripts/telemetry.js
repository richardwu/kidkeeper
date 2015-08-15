$(function(){
	
	if ($('#google-maps').length >= 1){

		console.log(gon.telemetryId);
		var poll = function(){

			$.ajax({
				url: '/telemetries/' + gon.telemetryId + '.json',
				type: 'GET',
				dataType: 'json',

				success: function(resp){
					var gpsStr = 'http://maps.google.com/maps?q=' + resp.latitude + ',' + resp.longitude + '&z=10&output=embed';
					if ($('#google-maps').attr('src') != gpsStr)
						$('#google-maps').attr('src', gpsStr);
					$('#air-quality').text(resp.air_quality);
					$('#temp').text(resp.temp + "\n" + resp.temp_str);
					$('#humidity').text(resp.humidity);
					$('#sound').text(resp.sound);
					$('#light').text(resp.light);

				}
			});
		} 

		setInterval(poll, 100);
	}
});