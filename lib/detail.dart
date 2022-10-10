import 'package:flutter/material.dart';
import 'package:new_project/models/model.dart';

class DetailPage extends StatelessWidget {
  final Datum datum;
  const DetailPage({super.key, required this.datum});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: DefaultTextStyle(
                style: const TextStyle(fontSize: 40, color: Colors.black),
                child: Text(
                  datum.title,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DefaultTextStyle(
                style: const TextStyle(fontSize: 15, color: Colors.black),
                child: Text(
                  datum.body,
                ),
              ),
            )
          ]),
    );
  }
}
