// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final String cardTitle;
  final double balance;
  final int cardnumber;
  final int expirymonth;
  final int expiryyear;
  final color;

  Cards(
      {Key? key,
      required this.balance,
      required this.cardTitle,
      required this.cardnumber,
      required this.color,
      required this.expirymonth,
      required this.expiryyear})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(20),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardTitle,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Icon(
                Icons.paypal_outlined,
                size: 40,
                color: Colors.green,
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            '\$' + balance.toString(),
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardnumber.toString(),
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                expirymonth.toString() + '/' + expiryyear.toString(),
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
