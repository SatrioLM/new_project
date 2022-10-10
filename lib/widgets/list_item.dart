import 'package:flutter/material.dart';
import 'package:new_project/detail.dart';
import 'package:new_project/models/model.dart';

class ListItem extends StatelessWidget {
  final List<Datum> items;

  const ListItem(this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index].title),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => DetailPage(
                  datum: items[index],
                ),
              )),
        );
      },
    );
  }
}
