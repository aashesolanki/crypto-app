import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() async { 
  List currencies = await getCurrencies();
  print(currencies);

  runApp(MyApp(currencies)); 
  
  }


class MyApp extends StatelessWidget {
  final List _currencies;
  MyApp(this._currencies);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Currency',
      home: HomePage(_currencies),
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
    );
  }
}


Future<List> getCurrencies() async{
  String cryptoUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
  http.Response response = await http.get(cryptoUrl);
  return jsonDecode(response.body);
}
