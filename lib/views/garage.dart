import 'package:meta/meta.dart';
class Garage {
  final String garageName;
  final String image;
  final double ratings;
  final String specialty;
  final String location;

  Garage(
     @required this.garageName, 
     @required this.image, 
     @required this.ratings, 
     @required this.specialty, 
     @required this.location
      );
}
