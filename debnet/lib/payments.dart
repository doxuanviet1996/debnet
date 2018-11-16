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
              return ListTile(
                              title: Text('Payment ${index+1}',
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
                              subtitle: Text('Da tra - ${index+1}/${index+1}/2018'),
              );
            },
        ),
      ),
    );
  }
}