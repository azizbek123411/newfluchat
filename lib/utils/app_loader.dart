import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showLoader(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return const Dialog(
          child: SizedBox(
            height: 100,
            width: 10,
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
          ),
        );
      });
}
