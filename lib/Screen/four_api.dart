import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Model/four_api.dart';
import '../Model/product_model.dart';
import '../Model/second_model.dart';

class FourthApi extends StatefulWidget {
  const FourthApi({Key? key}) : super(key: key);
  @override
  _FourthApiState createState() => _FourthApiState();
}

class _FourthApiState extends State<FourthApi> {
  String outputText = 'Output';
  List<String> productList=[];  

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
          Flexible(child: ListView.builder(
            itemCount: productList.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(productList[index]);
            },
          ))
        ],
      ),
    );
  }

  Future<void> functions() async {
    var response = await http
        .get(
      Uri.parse('https://fakestoreapi.com/products/categories'),
    )
        .then((value) {
      setState(() {
        if (value.statusCode == 200) {
       productList = welcomeFromJson2(value.body);
       
        } else {
          outputText = 'Error ${value.statusCode}';
        }
      });
    });
  }
}

Dtails(List<String> productList) {
  return Text("productList[index]");
}
