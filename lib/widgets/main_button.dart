import 'package:flutter/material.dart';
import 'package:newfluchat/constants/main_color.dart';

class MainButton extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const MainButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      padding: const EdgeInsets.only(top: 11,bottom: 11),
      color: mainColor,
      onPressed: onPressed,
      child: Center(child: Text(title,style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),),
    );
  }
}
