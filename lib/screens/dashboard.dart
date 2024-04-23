import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  // final String title;
    // DashboardScreen(this.title, {super.key})
  const DashboardScreen({super.key});

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
            child:const Text("23 C", style: TextStyle(fontSize: 20)),),)]
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
            child: const Text("40%", style: TextStyle(fontSize: 20)
            ),),)]
            ),
          
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
 
  }
}