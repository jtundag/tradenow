import 'package:flutter/material.dart';
import 'package:tradenow/screens/splash_screen.dart';
import 'package:tradenow/screens/trade_now_screen.dart';

class TradeNowApp extends StatefulWidget {
    @override
    State<StatefulWidget> createState() => _TradeNowApp();
}

class _TradeNowApp extends State<TradeNowApp> {
    @override
    Widget build(BuildContext context){
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: _buildTheme(),
            home: TradeNowScreen(),
            initialRoute: "/splash",
            routes: {
                "/splash": (context) => SplashScreen()
            },
        );
    }

    ThemeData _buildTheme(){
        ThemeData base = ThemeData.dark();
        return base.copyWith(
            textTheme: base.textTheme.copyWith(
                title: base.textTheme.title.copyWith(
                    color: Colors.white
                )
            ).apply(
                fontFamily: "VarelaRound"
            )
        );
    }
}