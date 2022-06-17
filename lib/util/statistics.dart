// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyStatistics extends StatelessWidget {
  final icon;
  final String title;
  final String subTitle;
  final Color;
  const MyStatistics(
      {Key? key,
      required this.icon,
      required this.subTitle,
      required this.title,
      required this.Color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                    padding: EdgeInsets.all(12),
                    // color: Color.fromARGB(255, 255, 255, 255),
                    child: Icon(
                      icon,
                      size: 40,
                      color: Color,
                    )),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  )
                ],
              )
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.blueGrey,
          )
        ],
      ),
    );
  }
}
