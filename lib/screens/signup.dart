import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/util.dart';

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
  List <Map> signupData= [];
  MySignupScreen(){

    signupData = [{"key":"phone", "label":"Phone No.", "errorMessage":["Please enter phone number", "Phone number should be in +9779xxxxxxxx"],"controller":phone},
    {"key":"password", "label":"Password", "errorMessage":["Password cannot be empty"], "controller":password},
    {"key":"username", "label":"Username", "errorMessage":["Username cannot be empty"], "controller":username},
    {"key":"fullname", "label":"Full Name", "errorMessage":["Full name cannot be empty"], "controller":fullName},
    {"key":"email", "label":"Email", "errorMessage":["enter valid email"], "controller":email},
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Sign up"),),
    body: Center(child: Column(children: [
Form(
      key: _formKey,
      child:  Column(
        children: <Widget>[
           ...signupData.map((element) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(  constraints: const BoxConstraints(
                 minWidth: 80, // Set your desired minimum width here
                 ),
                 child:Text(element["label"])),
                 Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                 child: Container(width: 200,
            // height: 40,
            child: TextFormField(
                validator: (value) {
              if (value == null || value.isEmpty) {
                return element["errorMessage"][0];
              }
              if(element["key"]=="phone" && value.length!=14){
                  return element["errorMessage"][1];
                
              }
              
              return null;
            },
              obscureText: element["key"]=="password"?true:false,
              controller: element["controller"],
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText:'',
                contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical:0),

              ),
            ),),)]
            ),  )
           
           ,Padding(padding:const EdgeInsets.only(top:10),child:TextButton(
              
  style: TextButton.styleFrom(
      foregroundColor: Colors.white, 
      backgroundColor: Colors.blue.withOpacity(0.8),
      padding: const EdgeInsets.symmetric(horizontal:20,vertical:0),
      ), 
      
  onPressed: ()async{
   if (_formKey.currentState!.validate()) {
    Map data = {'phn': phone.text,'password': password.text,'username': username.text,'full_name': fullName.text,'email': email.text};

    String body = json.encode(data);
    try {

    
    var response = await http.post(
      Uri.parse('$url1/users/register'),
    headers: {"Content-Type": "application/json"},
    body: body,
    );

    Map<String, dynamic> data = jsonDecode(response.body);
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