import 'package:flutter/material.dart';
import 'package:tradenow/trade_now_icons.dart';

class TNTabBar extends StatefulWidget {
    final TabController controller;
    
    TNTabBar({ this.controller });
    
    @override
    _TNTabBarState createState() => _TNTabBarState();
}

class _TNTabBarState extends State<TNTabBar>{
    final BoxDecoration _defaultTabDecoration = BoxDecoration(
            color: Color(0xff222831)
        );
    final double _tabHeight = 60.0;

    BoxDecoration _isActive(index){
        return widget?.controller?.index == index ? BoxDecoration(
                            color: Color(0xffe8b81b)
                        ) : _defaultTabDecoration;
    }
    
    @override
    Widget build(BuildContext context){
        return Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: _tabHeight,
                        decoration: _isActive(0),
                        child: GestureDetector(
                            child: Icon(TradeNowIcons.chart_bar, size: 18.0),
                        ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: _tabHeight,
                        decoration: _isActive(1),
                        child: GestureDetector(
                            child: Icon(TradeNowIcons.calendar, size: 18.0),
                        ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: _tabHeight,
                        decoration: _isActive(2),
                        child: GestureDetector(
                            child: Icon(TradeNowIcons.info, size: 18.0),
                        ),
                    )
                ],
            ),
        );
    }
}