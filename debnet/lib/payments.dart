import 'package:flutter/material.dart';

class PaymentsHistory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _PaymentsHistoryState();
}

class _PaymentsHistoryState extends State<PaymentsHistory> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Payments history'),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Text('Payment $index');
            },
        ),
      ),
    );
  }
}