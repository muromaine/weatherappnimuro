import 'package:weatheringapp/services/location.dart';
import 'package:http/http.dart';

class Networking{
  late double lon, lat;
  late String data;

  getWeatherData() async{
    Location loc = Location();
    await loc.getLocation();
    lon=loc.lon;
    lat=loc.lat;
    Uri url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=cc5f0621c9c4796b8f0683e23d26dadf&units=metric");
    Response response = await get(url);
    data = response.body;
    if (response.statusCode == 200)
    {
      return data;
    }
    else
    {
      return 'Error';
    }
  }

}