// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallletapp/util/money_card.dart';
import 'package:wallletapp/util/pay_send_icons.dart';
import 'package:wallletapp/util/statistics.dart';

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
  final List statTrancTitles = [
    ['Statistics', 'See how your finances 💹'],
    ['Transcations', 'Your latest  Transcations 💱']
  ];

  List<IconData> icons = [
    Icons.bar_chart_outlined,
    Icons.currency_exchange_outlined
  ];

  List<Color> listColors = [
    Colors.red,
    Colors.blueAccent,
  ];

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color.fromARGB(255, 212, 74, 120),
        child: Icon(
          Icons.monetization_on,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.home),
                iconSize: 32,
                color: Colors.pinkAccent,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings),
                iconSize: 32,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  // my cards text & plus button
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
            // pageview -> my money cards, horizontal scroll
            SizedBox(
              height: 180,
              child: PageView.builder(
                  controller: _controller,
                  itemCount: cardInfo.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      /*padding left, only after the first card */
                      padding:
                          EdgeInsets.symmetric(horizontal: index == 0 ? 0 : 8),
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
            ),

            SizedBox(
              height: 25,
            ),
            // pageview  page indicator
            SmoothPageIndicator(
              controller: _controller,
              count: cardInfo.length,
              effect: const ExpandingDotsEffect(
                  activeDotColor: Color.fromARGB(148, 110, 66, 163)),
            ),

            SizedBox(
              height: 25,
            ),
            //  pay, send & bills buttons widget
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyIcons(
                    buttonText: 'Send',
                    icon: Icons.send_to_mobile_outlined,
                    color: Colors.greenAccent),
                MyIcons(
                    buttonText: 'Pay',
                    icon: Icons.payments,
                    color: Colors.blueAccent),
                MyIcons(
                    buttonText: 'Bills',
                    icon: Icons.list_alt_rounded,
                    color: Colors.green[700]),
              ],
            ),

            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 230,
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: index == 1 ? 0 : 10),
                    child: MyStatistics(
                        icon: icons[index],
                        subTitle: statTrancTitles[index][1],
                        title: statTrancTitles[index][0],
                        color: listColors[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // stats and transactions
    );
  }
}
