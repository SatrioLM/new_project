import 'package:flutter/material.dart';

class SimpleSearchBar extends StatefulWidget {
  final void Function(String) filterFunction;
  final TextEditingController textEditingController;

  const SimpleSearchBar(
      {super.key,
      required this.filterFunction,
      required this.textEditingController});

  @override
  State<SimpleSearchBar> createState() => _SimpleSearchBarState();
}

class _SimpleSearchBarState extends State<SimpleSearchBar> {
  @override
  Widget build(BuildContext context) {
    final Function(String) f = widget.filterFunction;
    final TextEditingController t = widget.textEditingController;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) {
          f(value);
        },
        controller: t,
        decoration: const InputDecoration(
            labelText: "Search",
            hintText: "Search",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)))),
      ),
    );
  }
}
