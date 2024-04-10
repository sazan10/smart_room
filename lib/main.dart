import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:meter/screens/forgot_password.dart';
import 'package:meter/screens/signup.dart';
import 'dart:convert';
import './screens/dashboard.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final username= TextEditingController();
  final password= TextEditingController();
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
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
           Image.asset('assets/images/meter.png',width:100),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [const Text("Username"),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Container(width: 200,
            // height: 40,
            child:TextField(
              controller: username,
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical:0),
                hintText:'',
              ),
            ),),)]
            ),
                   Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [const Text("Password"),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Container(width: 200,
            // height: 40,
            child: TextField(
              obscureText: true,
              controller: password,
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText:'',
                contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical:0),

              ),
            ),),)]
            ),Padding(padding:const EdgeInsets.only(top:10),child:TextButton(
              
  style: TextButton.styleFrom(
      foregroundColor: Colors.white, 
      backgroundColor: Colors.blue.withOpacity(0.8),
      padding: const EdgeInsets.symmetric(horizontal:20,vertical:0),
      ), 
      
  onPressed: ()async{

    var url = Uri.https('example.com', 'whatsit/create');
  
try {
    await http.post(url,body:json.encode({
      'title':'d',

    }));
  } catch(_) {
    print("request error");
  }
    print(username.text);
    print(password.text);
              // Navigator.of(context).push(
              //   MaterialPageRoute(builder: 
              //   (ctx)=>const DashboardScreen()
              //   )
              //   );
                },
  child: const Text('Login'),
)),
             Padding(padding: const EdgeInsets.only(top:20),
            child: GestureDetector(onTap:(){
              Navigator.of(context).push(
                MaterialPageRoute(builder: 
                (ctx)=>const SignupScreen()
                )
                );
                },
                child:const Text("Sign up")),),
            GestureDetector(onTap:(){
              Navigator.of(context).push(
                MaterialPageRoute(builder: 
                (ctx)=>const ForgotPasswordScreen()
                )
                );
                },
                child: const Text("Forgot Password"))

          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}