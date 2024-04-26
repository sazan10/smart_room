import 'package:flutter/material.dart';

class DisplayText extends StatelessWidget {
  final String _label;
  final String _value;
  const DisplayText(this._label, this._value, {super.key});

@override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ Text(_label, style: const TextStyle(fontSize: 20),),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child:  Container(  
            child:Text(_value, style: const TextStyle(fontSize: 20)),),)]
            );
  }
}






