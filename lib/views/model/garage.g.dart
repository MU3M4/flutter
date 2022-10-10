// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'garage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Garage _$GarageFromJson(Map json) => Garage(
      garageName: json['garageName'] as String,
      officeNumber: json['officeNumber'] as String,
      description: json['description'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
    );

Map<String, dynamic> _$GarageToJson(Garage instance) => <String, dynamic>{
      'garageName': instance.garageName,
      'officeNumber': instance.officeNumber,
      'description': instance.description,
      'latitude': instance.latitude, 
      'longitude': instance.longitude,
    };
