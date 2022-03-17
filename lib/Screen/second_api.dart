import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Model/product_model.dart';
import '../Model/second_model.dart';

class SecondApi extends StatefulWidget {
  const SecondApi({Key? key}) : super(key: key);
  @override
  _SecondApiState createState() => _SecondApiState();
}

class _SecondApiState extends State<SecondApi> {
  String outputText = 'Output';
  List<Welcome> productList = [];

  @override
  void initState() {
    super.initState();
    functions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Test'),
      ),
      body: Column(
        children: [
          Flexible(
            child: GridView.builder(
              // ignore: prefer_const_constructors
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2 / 3,
                crossAxisCount: 3,
              ),
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return Card(
                  shadowColor: Colors.green,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Image.network(
                            productList[index].image,
                            height: 150,
                            width: 180,
                          )),
                      Expanded(
                          flex: 2,
                          child: Text(
                            productList[index].title,
                            style: TextStyle(fontSize: 15),
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(productList[index].price.toString())),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Future<void> functions() async {
    var response = await http
        .get(
      Uri.parse('https://fakestoreapi.com/products/category/jewelery'),
    )
        .then((value) {
      setState(() {
        if (value.statusCode == 200) {
          List<Welcome> pl = welcomeFromJson(value.body);
          for (var i = 0; i < pl.length; i++) {
            productList.add(pl[i]);
          }
        } else {
          outputText = 'Error ${value.statusCode}';
        }
      });
    });
  }
}

Dtails(List<Products> productList) {
  return Text("productList[index]");
}
