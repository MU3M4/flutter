import 'package:flutter_progress/views/assistant/requestassistant.dart';
import 'package:geolocator/geolocator.dart';

class AssistantMethods {
  static Future<String> searchCoordinateAddress(Position position) async {
    String placeAddress = '';
    String url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=AIzaSyA8H7Fo7uxatEmyPhCrReaPOm5md9JnVbY';
    var response = await RequestAssistance.getRequest(url);
    if (response != "Failed.") {
      placeAddress = response['results'][0]['formatted_address'];
    }
    return placeAddress;
  }
}
