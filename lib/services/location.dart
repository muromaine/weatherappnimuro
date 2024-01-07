import 'package:geolocator/geolocator.dart';

class Location{
  late double lon, lat;
  Future getLocation() async{
    try{
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      print(position);
      lon = position.longitude;
      lat = position.latitude;
    }
    catch(e){
      print(e);
    }
  }
}