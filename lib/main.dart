import 'package:flutter/material.dart';
import 'package:new_project/detail.dart';
import 'package:new_project/repository/home_repository.dart';

import 'models/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test 091022',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController editingController = TextEditingController();
  HomeRepository homeRepository = HomeRepository();

  List<Datum> items = [];
  List<Datum> dummySearchList = [];
  late Future<List<Datum>> _future;

  Future<List<Datum>> loadJsonData() async {
    return await homeRepository.getData();
  }

  void filterByQuery(String query) {
    if (query.isNotEmpty) {
      List<Datum> dummyListData = <Datum>[];
      for (Datum item in dummySearchList) {
        if (item.title.contains(query)) {
          dummyListData.add(item);
        }
      }
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(items);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _future = loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Datum>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong :('),
              );
            } else if (snapshot.hasData) {
              if (editingController.text.isEmpty || items.isEmpty) {
                items.clear();
                items.addAll(snapshot.data!);
                dummySearchList.clear();
                dummySearchList.addAll(items);
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (value) {
                        filterByQuery(value);
                      },
                      controller: editingController,
                      decoration: const InputDecoration(
                          labelText: "Search",
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)))),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
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
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
