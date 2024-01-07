import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weatheringapp/utilities/constants.dart';
class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  String newcity = '', newWeath='';

    getWeath() async{
    String info='';
    Uri url1 = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$newcity&appid=cc5f0621c9c4796b8f0683e23d26dadf&units=metric");
    Response resp = await get(url1);
    info= resp.body;
    if (resp.statusCode <= 299){
      return info;
    }
    else{
      return 'null';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'null');
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value){
                    newcity=value;
                  },
                  style : const TextStyle(
                    color: Colors.black,
                  ),
                    decoration: const InputDecoration(
                        filled: true,
                      fillColor: Colors.white,
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.white,
                      ),
                      hintText: "Type your desired city",
                      hintStyle: TextStyle(
                        color: Colors.grey
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none
                      )
                )
                ),
              ),
              TextButton(
                onPressed: () async {
                  newWeath = await getWeath();
                  Navigator.pop(context, newWeath);
                },
                child: const Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
