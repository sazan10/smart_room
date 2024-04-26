import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meter/screens/forgot_password.dart';
import 'package:meter/screens/signup.dart';
import 'package:meter/widgets/form_field_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import './screens/dashboard.dart';
import './utils/util.dart';
import './widgets/custom_text_button.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final username= TextEditingController(text:"9862021882");
  final password= TextEditingController(text:"shrestha");
   List <Map> loginData= [];
  final _formKey = GlobalKey<FormState>();
  _MyHomePageState(){
      loginData = [{"key":"username", "label":"Username", "errorMessage":["Enter valid username"], "controller":username},
                  {"key":"password", "label":"Password", "errorMessage":["Enter valid password"], "controller":password},
                ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:Center(
        child: SingleChildScrollView(
          child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Image.asset('assets/images/meter.png',width:100),
          Form(
      key: _formKey,
      child:  Column(
        children: <Widget>[ 
          ...loginData.map((data)=>FormFieldWidget(data))
        ,])),
            Padding(padding:const EdgeInsets.only(top:10),child:
            CustomTextButton("Login", loginHandler)
            ),
             Padding(padding: const EdgeInsets.only(top:20),
            child: GestureDetector(onTap:(){
              Navigator.of(context).push(
                MaterialPageRoute(builder: 
                (ctx)=>SignupScreen()
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
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
   void loginHandler ()async{

    // var url = Uri.https('68e4-49-236-212-182.ngrok-free.app/docs', 'whatsit/create');
     if (_formKey.currentState!.validate()) {
       ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Request')),
      );
  try {
    Map data = {'username': username.text,'password': password.text};

    String body = json.encode(data);

    
    var response = await http.post(
    Uri.parse('$url1/token'),
    headers: {
     "Content-Type": "application/x-www-form-urlencoded",
    },
    encoding: Encoding.getByName('utf-8'),
    body: data,
   );

    Map<String, dynamic> dataResponse = jsonDecode(response.body);
    if(response.statusCode==200 || response.statusCode==201){
            ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful')),
      );
    final shared =await SharedPreferences.getInstance();
    shared.setString("access_token", dataResponse["access_token"]);
        Navigator.of(context).push(
                MaterialPageRoute(builder: 
                (ctx)=>const DashboardScreen()
                )
                );

    }
    else {
    showAlertDialog(context,"Error",response.body.toString());
         Navigator.of(context).push(
                MaterialPageRoute(builder: 
                (ctx)=>const DashboardScreen()
                )
                );
    }

         
  } catch(e) {
        showAlertDialog(context,"Error",e.toString());
             Navigator.of(context).push(
                MaterialPageRoute(builder: 
                (ctx)=>const DashboardScreen()
                )
                );

  }}

  }
}



