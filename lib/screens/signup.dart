import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupScreen extends StatefulWidget {
  // final String title;
    // SignupScreen(this.title, {super.key})
    
  const SignupScreen({super.key});
  
  
  @override
  State<StatefulWidget> createState() {
        return MySignupScreen();

  }
}

class MySignupScreen extends State<SignupScreen> {
final username= TextEditingController();
  final password= TextEditingController();
  final phone= TextEditingController(text: "+9779841122040");
  final email= TextEditingController();
  final fullName= TextEditingController();
    final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Sign up"),),
    body: Center(child: Column(children: [
Form(
      key: _formKey,
      child:  Column(
        children: <Widget>[
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Container(  constraints: const BoxConstraints(
    minWidth: 80, // Set your desired minimum width here
  ),
  child:const Text("Phone No")),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Container(width: 200,
            // height: 40,
            child:TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone number';
                  }
                  else if(value.length!=14){
                    return 'Phone number should be in +9779xxxxxxxx';
                  }
                  return null;
                },
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
            child: TextFormField(
                validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password cannot be empty';
              }
              return null;
            },
              obscureText: true,
              controller: password,
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText:'',
                contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical:0),

              ),
            ),),)]
            ),  
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Container(  constraints: const BoxConstraints(
    minWidth: 80, // Set your desired minimum width here
  ),
  child:const Text("Username")),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Container(width: 200,
            // height: 40,
            child:TextFormField(
               validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Username cannot be empty';
                }
                return null;
              },
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
            children: [Container(  constraints: const BoxConstraints(
                minWidth: 80, // Set your desired minimum width here
              ),
              child:const Text("Full name")),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Container(width: 200,
            // height: 40,
            child:TextFormField(
              controller: fullName,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name cannot be empty';
                }
                return null;
              },
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
            children: [Container(  constraints: const BoxConstraints(
                minWidth: 80, // Set your desired minimum width here
              ),
              child:const Text("Email")),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Container(width: 200,
            // height: 40,
            child:TextFormField(
              controller: email,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter valid email';
                }
                return null;
              },
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
   if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Processing Data')),
      // );
      //  showAlertDialog(context);   
    String url1='https://d443-49-236-212-182.ngrok-free.app/users/register';
    Map data = {'phn': phone.text,'password': password.text,'username': username.text,'full_name': fullName.text,'email': email.text};

    String body = json.encode(data);
    try {

    
    var response = await http.post(
      Uri.parse(url1),
    headers: {"Content-Type": "application/json"},
    body: body,
    );

    Map<String, dynamic> data = jsonDecode(response.body);
    print('response');
    if(response.statusCode==200 || response.statusCode==201){
            ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signup successful')),
      );
      Navigator.of(context).pop();  

    }
    else {
    showAlertDialog(context,"Error",response.body.toString());
    }
}
catch(e){
  showAlertDialog(context,"Error",e.toString());
}
// try {
//     final response = await http.post(url,
//         // headers: {"Content-Type": "application/json"},

//     body:jsonEncode({
//       "phn": phone.text,
//       "password": password.text,
//       "username": username.text,
//       "full_name": fullName.text,
//       "email": email.text

//     }).toString());
//     print("request success response :");
//     String jsonsDataString = response.toString(); // Error: toString of Response is assigned to jsonDataString.
//     // String _data = jsonDecode(jsonsDataString);
//     print(jsonDecode(jsonsDataString));
//   } catch(e) {
//     print("request error");
//     print(e);
//   }
  
              // Navigator.of(context).push(
              //   MaterialPageRoute(builder: 
              //   (ctx)=>const DashboardScreen()
              //   )
              //   );
                }},
  child: const Text('Signup'),
)),
        ]))
          ],),),
    );
  }

  
}

showAlertDialog(BuildContext context, title, message) {  
  // Create button  
  Widget okButton =TextButton(  
    child: Text("OK"),  
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