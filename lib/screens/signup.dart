import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupScreen extends StatelessWidget {
  // final String title;
    // SignupScreen(this.title, {super.key})
    
  SignupScreen({super.key});
  final username= TextEditingController();
  final password= TextEditingController();
  final phone= TextEditingController();
  final email= TextEditingController();
  final fullName= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Sign up"),),
    body: Center(child: Column(children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Container(  constraints: const BoxConstraints(
    minWidth: 80, // Set your desired minimum width here
  ),
  child:const Text("Phone No")),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Container(width: 200,
            // height: 40,
            child:TextField(
              controller: phone,
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
            children: [
              Container(  constraints: const BoxConstraints(
                 minWidth: 80, // Set your desired minimum width here
                 ),
                 child:const Text("Password")),
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
            ),  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Container(  constraints: const BoxConstraints(
    minWidth: 80, // Set your desired minimum width here
  ),
  child:const Text("Username")),
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
            ),  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Container(  constraints: const BoxConstraints(
                minWidth: 80, // Set your desired minimum width here
              ),
              child:const Text("Full name")),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Container(width: 200,
            // height: 40,
            child:TextField(
              controller: fullName,
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical:0),
                hintText:'',
              ),
            ),),)]
            ),  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Container(  constraints: const BoxConstraints(
                minWidth: 80, // Set your desired minimum width here
              ),
              child:const Text("Email")),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Container(width: 200,
            // height: 40,
            child:TextField(
              controller: email,
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical:0),
                hintText:'',
              ),
            ),),)]
            ),Padding(padding:const EdgeInsets.only(top:10),child:TextButton(
              
  style: TextButton.styleFrom(
      foregroundColor: Colors.white, 
      backgroundColor: Colors.blue.withOpacity(0.8),
      padding: const EdgeInsets.symmetric(horizontal:20,vertical:0),
      ), 
      
  onPressed: ()async{

    var url = Uri.https('https://68e4-49-236-212-182.ngrok-free.app/', 'users/register');
  // "phn": "strings",
  // "password": "string",
  // "username": "string",
  // "full_name": "string",
  // "email": "string"
try {
    // await http.post(url,body:json.encode({
    //   "phn": phone.text,
    //   "password": password.text,
    //   "username": username.text,
    //   "full_name": fullName.text,
    //   "email": email.text

    // }));
  } catch(_) {
    print("request error");
  }
  
              // Navigator.of(context).push(
              //   MaterialPageRoute(builder: 
              //   (ctx)=>const DashboardScreen()
              //   )
              //   );
                },
  child: const Text('Signup'),
)),
      
          ],),),
    );
  }
}