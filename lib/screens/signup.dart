import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/util.dart';
import '../widgets/form_field_widget.dart';
import '../widgets/custom_text_button.dart';
class SignupScreen extends StatefulWidget {
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
    body:  SingleChildScrollView(  child: Center(child: Column(children: [
    Form(
      key: _formKey,
    
        child:Column(
        children: <Widget>[
           ...signupData.map((element) => FormFieldWidget(element),  )     
           ,Padding(padding:const EdgeInsets.only(top:10),
            child:CustomTextButton("Signup", signupHandler)),
        ]))
          ],)),),
    );
  }

  void signupHandler () async{
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
 }}
}
