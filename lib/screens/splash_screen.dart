import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
    @override
    _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

    @override
    void initState(){
        super.initState();
        Timer(Duration(seconds: 3), (){
            Navigator.of(context).pop();
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: SafeArea(
                child: Center(
                    child: Text(
                        "TradeNow",
                        style: TextStyle(
                            fontSize: 30.0,
                            letterSpacing: 2.0,
                            color: Color(0xff17C97B)
                        )
                    )
                ),
            ),
        );
    }
}