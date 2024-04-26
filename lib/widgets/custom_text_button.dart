import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String _title;
  final Function _buttonClickHandler;
  const CustomTextButton(this._title, this._buttonClickHandler, {super.key});

@override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
      foregroundColor: Colors.white, 
      backgroundColor: Colors.blue.withOpacity(0.8),
      padding: const EdgeInsets.symmetric(horizontal:20,vertical:0),
      ), 
      
  onPressed:()=> _buttonClickHandler(),
  child: Text(_title),
);
  }
}



