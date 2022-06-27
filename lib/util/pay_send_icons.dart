// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MyIcons extends StatelessWidget {
  final String buttonText;
  final icon;
  final color;
  const MyIcons(
      {Key? key,
      required this.buttonText,
      required this.icon,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.all(10),
            // height: 90,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(255, 216, 210, 210),
                      blurRadius: 20,
                      spreadRadius: 10)
                ]),
            child: Center(
                child: Icon(
              icon,
              size: 60,
              color: color,
            ))),
        SizedBox(
          height: 10,
        ),
        Text(
          buttonText,
          style: TextStyle(fontSize: 18, color: Colors.grey[700]),
        )
      ],
    );
  }
}
