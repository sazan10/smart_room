import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';
import '../utils/util.dart';


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
  @override
  void initState() {
    // TODO: implement initState
    getData();
    Timer.periodic(const Duration(seconds: 10), (timer) {
   getData();
});
  //   http.get( Uri.parse('$url1/token'),
  //   headers: {
  //   //  "Content-Type": "application/x-www-form-urlencoded",
        
  //   },
  //   body: data,
  //  )
   
   
    super.initState();
  }
  getData() async{
    // SharedPreferences.setMockInitialValues({});
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

    });
    return  true; 
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
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
       
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [const Text("Temperature:", style: TextStyle(fontSize: 20),),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child:  Container(  
              // constraints: const BoxConstraints(
              //   minWidth: 80, // Set your desired minimum width here
              // ),
            child:Text("$temp C", style: const TextStyle(fontSize: 20)),),)]
            ),
                   Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [const Text("Humidity:", style: TextStyle(fontSize: 20)),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Container( 
              // constraints: const BoxConstraints(
              //   minWidth: 80, // Set your desired minimum width here
              // ),
            child: Text("$humidity%", style:const TextStyle(fontSize: 20)
            ),),)]
            ),
          
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
 
  }
}