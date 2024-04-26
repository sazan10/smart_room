import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';
import '../utils/util.dart';
import '../widgets/display_text.dart';

class DashboardScreen extends StatefulWidget {
  // final String title;
    // DashboardScreen(this.title, {super.key})
  const DashboardScreen({super.key});
   
  @override
  State<StatefulWidget> createState() {
        return DashboardStateScreen();

  }
 
}

class DashboardStateScreen extends State<DashboardScreen>{

  String _token="";
  double humidity=0;
  int temp =0;
  var time = DateFormat().format( DateTime.now());
  late Timer timer;
  List <Map> sensorData= [];

  @override
  void initState() {
    // TODO: implement initState
    getData();
    timer =Timer.periodic(const Duration(seconds: 10), (timer) {
   getData();
});
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }
  getData() async{
    // SharedPreferences.setMockInitialValues({});
    try{
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('access_token')){
      return false;
    } 
    final extractedToken = prefs.getString('access_token');
    // _token = extractedToken!;
  var response = await http.get( Uri.parse('$url1/data/1'),
    headers: {

     "Content-Type": "application/json",
      "Authorization" : "Bearer $extractedToken"        
    },
   );
     Map<String, dynamic> dataResponse = jsonDecode(response.body);
    setState(() {
      humidity=dataResponse["humidity"];
      temp = dataResponse["temp"];
      time = DateFormat().format(DateTime.parse(dataResponse["time_stamp"]));
    });
    print(dataResponse);
    return  true; 
    }
    catch(_){

    }
  }

  DashboardStateScreen(){
    sensorData=[{"key":"temp","value":"$temp C","label":"Temperature:"},
    {"key":"humidity","value":"$humidity%","label":"Humidity:"},
    {"key":"time","value":time,"label":"Time:"}
    ];
  }
   @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Dashboard"),
      ),
      body: 

        Center(
          child:SingleChildScrollView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ...sensorData.map((data) => DisplayText(data['label'], data['value'])).toList()
            
          ],
        ),
      ),) // This trailing comma makes auto-formatting nicer for build methods.
    );
 
  }
}