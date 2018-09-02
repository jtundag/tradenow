import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:tradenow/blocs/CallBloc.dart';
import 'package:tradenow/models/Call.dart';
import 'package:tradenow/widgets/tn_call_item.dart';

class TNCallTabView extends StatefulWidget{
    final stream;

    TNCallTabView({this.stream});
    
    @override
    _TNCallTabViewState createState() => _TNCallTabViewState();
}

class _TNCallTabViewState extends State<TNCallTabView>{
    
    CallBloc _callBloc;
    
    @override
    void initState(){
        super.initState();
        _callBloc = CallBloc();
        widget.stream.listen((snapshot){
            _callBloc.callSnapshots.add(snapshot);
        });
    }

    Future<Null> _handleRefresh() async {
        await widget.stream.listen((snapshot){
            _callBloc.callSnapshots.add(snapshot);
        });
        return null;
    }
    
    @override
    Widget build(BuildContext context){
        return Container(
            child: StreamBuilder<QuerySnapshot>(
                    stream: _callBloc.snapshots,
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                        if(snapshot.connectionState == ConnectionState.waiting) return Center(
                            child: CircularProgressIndicator(
                                backgroundColor: Color(0xff17C97B)
                            )
                        );
                        if(snapshot.data.documents.isEmpty) return Center(
                            child: Text(
                                "No data.",
                                style: TextStyle(
                                    fontSize: 20.0
                                ),
                            )
                        );
                        return RefreshIndicator(
                            onRefresh: _handleRefresh,
                            child: ListView(
                                padding: EdgeInsets.all(0.0),
                                children: snapshot.data.documents.map((call) => TNCallItem(call: Call.fromSnapshot(call))).toList()
                            )
                        );
                    }
                )
        );
    }
}