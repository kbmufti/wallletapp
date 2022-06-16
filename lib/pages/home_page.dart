// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:wallletapp/util/money_card.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List cardInfo = [
    ['Balance', 27538.73, 46899543, 08, 12],
    ['Credit', -68848.73, 8009867, 06, 09],
    ['Sent', 779938.73, 4798953, 04, 02]
  ];
  List<Color> colors = [
    Colors.deepPurple,
    Colors.greenAccent,
    Colors.blueAccent
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // my cards text & plus button
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('My',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold)),
                    Text(
                      ' Cards',
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 112, 112, 112),
                      // borderRadius: BorderRadius.circular(8),
                      shape: BoxShape.circle),
                  child: Icon(Icons.add_outlined),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),

            Container(
              height: 200,
              child: PageView.builder(
                  itemCount: cardInfo.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Cards(
                        balance: cardInfo[index][1],
                        cardTitle: cardInfo[index][0],
                        cardnumber: cardInfo[index][2],
                        color: colors[index],
                        expirymonth: cardInfo[index][3],
                        expiryyear: cardInfo[index][4],
                      ),
                    );
                  }),
            )
            // pageview -> my money cards, horizontal scroll
          ],
        ),
      ),

      // pay, send & bills buttons

      // stats and transactions
    );
  }
}
