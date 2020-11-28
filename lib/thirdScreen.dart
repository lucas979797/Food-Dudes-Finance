import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Transaction.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

Transaction transaction1 = Transaction(43.4, Category.Entertainment);
Transaction transaction2 = Transaction(12.43, Category.Education);
Transaction transaction3 = Transaction(33.4, Category.Entertainment);
Transaction transaction4 = Transaction(23.54, Category.AutoTransport);
Transaction transaction5 = Transaction(55.4, Category.GiftsDonations);

class _ThirdScreenState extends State<ThirdScreen> {
  int savings = 69;
  @override
  List<String> advice = [
    "Try harder",
    "Stop buying food",
    "You have too many mechanical keyboards",
    "Just get a job",
    "Pull up your bootstraps",
    "Stop buying avocado toast"
  ];

  List<Transaction> transactions = [
    transaction1,
    transaction2,
    transaction3,
    transaction4,
    transaction5
  ];

  String savingsAdvice = "Ask for advice";
  String spending = "hi";

  void getSpendingValue() {
    setState(() {
      spending = getSpendingEntertainment();
    });
  }

  String getSpending(Transaction category) {
    double a = 0;
    for (int i = 0; i < transactions.length; i++){
      if (transactions[i].category == Category.Entertainment){
        a += transactions[i].amount;
      }
    }
    return a.toString();
  }





  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to the save zone'),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/money.jpg'),
              repeat: ImageRepeat.repeatY,
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child:
                    Text('You have saved £' + savings.toString() + ' pounds!'),
              ),
              RaisedButton(
                  child: Text('How much have I spent on Entertainment?'),
                  onPressed: getSpendingValue),
              Container(
                color: Colors.redAccent,
                width: 250,
                height: 250,
                child: Text(spending),
                alignment: Alignment.center,
              )
            ],
          ),
        ));
  }
}