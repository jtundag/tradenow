import 'package:flutter/material.dart';
import 'package:tradenow/colors.dart';
import 'package:tradenow/screens/HomeScreen.dart';

class TradeNowApp extends StatefulWidget {
    @override
    State<StatefulWidget> createState() => _TradeNowApp();
}

class _TradeNowApp extends State {
    @override
    Widget build(BuildContext context){
        return MaterialApp(
            theme: _buildTheme(),
            home: HomeScreen()
        );
    }

    ThemeData _buildTheme(){
        ThemeData base = ThemeData.dark();
        return base.copyWith(
            primaryColor: kTradeNowPrimaryColor,
            scaffoldBackgroundColor: kTradeNowScaffoldBackgroundColor,
            indicatorColor: kTradeNowIndicatorColor,
            cardColor: kTradeNowPrimaryColor,
            textTheme: base.textTheme.copyWith(
                
            ).apply(
                fontFamily: "Ubuntu"
            )
        );
    }
}