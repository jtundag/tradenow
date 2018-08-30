import 'package:flutter/material.dart';
import 'package:tradenow/screens/tabs/TodaysCallTab.dart';
import 'package:tradenow/widgets/TNAppBar.dart';
import 'package:tradenow/widgets/TNTabBar.dart';

class HomeScreen extends StatefulWidget{
    @override
    _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> 
    with SingleTickerProviderStateMixin {
    
    TabController _mainTabController;
    int _currentIndex = 0;

    @override
    void initState(){
        super.initState();

        _mainTabController = TabController(
            vsync: this,
            length: 3,
            initialIndex: _currentIndex
        );
    }
    
    @override
    Widget build(BuildContext context){
        return Scaffold(
            body: Column(
                children: <Widget>[
                    TNAppBar("TradeNow"),
                    TNTabBar(
                        controller: _mainTabController
                    ),
                    TabBarView(
                        controller: _mainTabController,
                        children: <Widget>[
                            Container(
                                padding: EdgeInsets.all(10.0),
                                height: MediaQuery.of(context).size.height - 80.0,
                                child: TodaysCallTab()
                            ),
                            Container(
                                padding: EdgeInsets.all(10.0),
                                height: MediaQuery.of(context).size.height - 80.0,
                                child: Text("Past")
                            ),
                            Container(
                                padding: EdgeInsets.all(10.0),
                                height: MediaQuery.of(context).size.height - 80.0,
                                child: Text("About")
                            )
                        ],
                    )
                ]
            )
        );
    }
}