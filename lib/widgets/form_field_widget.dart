import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  final Map signupField;
  const FormFieldWidget(this.signupField, {super.key});

@override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(  constraints: const BoxConstraints(
                 minWidth: 80, // Set your desired minimum width here
                 ),
                 child:Text(signupField["label"])),
                 Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                 child: Container(width: 200,
            // height: 40,
            child: TextFormField(
                validator: (value) {
              if (value == null || value.isEmpty) {
                return signupField["errorMessage"][0];
              }
              if(signupField["key"]=="phone" && value.length!=14){
                  return signupField["errorMessage"][1];
                
              }
              
              return null;
            },
              obscureText: signupField["key"]=="password"?true:false,
              controller: signupField["controller"],
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText:'',
                contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical:0),

              ),
            ),),)]
            );
  }
}
