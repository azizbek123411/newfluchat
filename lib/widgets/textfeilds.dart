import 'package:flutter/material.dart';
import 'package:newfluchat/constants/main_color.dart';

class TextFields extends StatelessWidget {
  TextEditingController controller=TextEditingController();
  String text;
  TextFields({super.key,
  required this.controller,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        hoverColor: mainColor
      ),
    );
  }
}
