import 'package:flutter/material.dart';
 
 
String url1='https://d443-49-236-212-182.ngrok-free.app';


showAlertDialog(BuildContext context, title, message) {  
  // Create button  
  Widget okButton =TextButton(  
    child: const Text("OK"),  
    onPressed: () {  
      Navigator.of(context).pop();  
    },  
  );  
  
  // Create AlertDialog  
  AlertDialog alert = AlertDialog(  
    title: Text(title),  
    content: Text(message),  
    actions: [  
      okButton,  
    ],  
  );  
  
  // show the dialog  
  showDialog(  
    context: context,  
    builder: (BuildContext context) {  
      return alert;  
    },  
  );  
}  