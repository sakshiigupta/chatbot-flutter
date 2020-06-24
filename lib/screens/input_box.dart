import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';


class InputBox extends StatelessWidget {

  InputBox({this.hint});
  final String hint;


  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        //Do something with the user input.
      },
      decoration: kInputDecoration.copyWith(hintText: hint),
    );
  }
}
