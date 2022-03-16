import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'product_model.dart';

class APITestScreen extends StatefulWidget {
  const APITestScreen({Key? key}) : super(key: key);
  @override
  _APITestScreenState createState() => _APITestScreenState();
}

class _APITestScreenState extends State<APITestScreen> {
  String outputText = 'Output';
  List<Products> productList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Test'),
      ),
      body: ListView(
        children: [
      ElevatedButton(
        onPressed: functions,
        child: Text("ShowData"),
      ),
      SizedBox(
        height: 700,
        child: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(productList[index].title),
            );
          },
        ),
      )
        ],
      ),
    );
  }

  Future<void> functions() async {
    setState(() {
      outputText = 'loading...';
    });

    var response = await http
        .get(
      Uri.parse('https://fakestoreapi.com/products'),
    )
        .then((value) {
      setState(() {
        if (value.statusCode == 200) {
          // outputText = value.body;
          List<Products> pl = productsFromJson(value.body);
          for (var i = 0; i < pl.length; i++) {
            productList.add(pl[i]);
          }

          ///your task is to present these data in a good format

        } else {
          outputText = 'vul hoise ${value.statusCode}';
        }
      });
    });
  }
}
