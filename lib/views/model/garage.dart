import 'package:json_annotation/json_annotation.dart';

part 'garage.g.dart';

@JsonSerializable()
class Garage {
  String? description;
  String? garageName;

  String? latitude;
  String? longitude;
  String? officeNumber;

  Garage(
      {required this.description,
      required this.garageName,
      required this.latitude,
      required this.longitude,
      required this.officeNumber});

  Garage.fromJson(Map<String, dynamic> json) {
    description = json['Description'];
    garageName = json['GarageName'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    officeNumber = json['OfficeNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Description'] = this.description;
    data['GarageName'] = this.garageName;
    data['Latitude'] = this.latitude;
    data['Longitude'] = this.longitude;
    data['OfficeNumber'] = this.officeNumber;
    return data;
  }
}
