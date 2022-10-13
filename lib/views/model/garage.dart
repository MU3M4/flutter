import 'package:json_annotation/json_annotation.dart';

part 'garage.g.dart';

@JsonSerializable()
class Garage {
  late final String description;
 late final String garageName;

 late final String latitude;
 late final String longitude;
 late final String officeNumber;

  Garage(
      {required this.description,
      required this.garageName,
      required this.latitude,
      required this.longitude,
      required this.officeNumber});

  Garage.fromJson(Map<String, dynamic> json, this.description, this.garageName, this.latitude, this.longitude, this.officeNumber) {
    description = json['Description'];
    garageName = json['GarageName'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    officeNumber = json['OfficeNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Description'] = description;
    data['GarageName'] = garageName;
    data['Latitude'] = latitude;
    data['Longitude'] = longitude;
    data['OfficeNumber'] = officeNumber;
    return data;
  }
}
