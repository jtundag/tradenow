import 'package:flutter/material.dart';
import 'package:tradenow/screens/tabs/TodaysCallTab.dart';

class HomeScreen extends StatefulWidget{
    @override
    _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> 
    with SingleTickerProviderStateMixin {
    
    TabController _mainTabController;

    @override
    void initState(){
        super.initState();

        _mainTabController = TabController(
            vsync: this,
            length: 3
        );
    }
    
    @override
    Widget build(BuildContext context){
        return Scaffold(
            appBar: AppBar(
                title: Text("Trade Now"),
                centerTitle: true,
                bottom: TabBar(
                    controller: _mainTabController,
                    tabs: <Widget>[
                        Tab(
                            icon: Icon(Icons.calendar_today),
                        ),
                        Tab(
                            icon: Icon(Icons.history),
                        ),
                        Tab(
                            icon: Icon(Icons.info),
                        )
                    ],
                )
            ),
            body: Stack(
                children: <Widget>[
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
                    ),
                    Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        child: Container(
                            height: 80.0,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.red
                        )
                    )
                ],
            )
        );
    }
}