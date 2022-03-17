import 'package:flutter/material.dart';
import 'package:get_api/Model/product_model.dart';

import 'Screen/main_screen.dart';
import 'Screen/second_api.dart';
import 'Screen/third_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => APITestScreen()));
            },
            child: Text("First")),

            ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SecondApi()));
            },
            child: Text("Second")),

             ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => third_api()));
            },
            child: Text("Third")),
      ],
    );
  }
}
