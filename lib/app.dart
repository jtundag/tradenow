import 'package:flutter/material.dart';
import 'package:tradenow/screens/HomeScreen.dart';

class TradeNowApp extends StatefulWidget {
    @override
    State<StatefulWidget> createState() => _TradeNowApp();
}

class _TradeNowApp extends State {
    @override
    Widget build(BuildContext context){
        return MaterialApp(
            home: HomeScreen()
        );
    }
}