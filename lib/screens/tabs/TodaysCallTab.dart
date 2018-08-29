import 'package:flutter/material.dart';
import 'package:tradenow/blocs/CallBloc.dart';
import 'package:tradenow/models/Call.dart';

class TodaysCallTab extends StatefulWidget{
    @override
    _TodaysCallTabState createState() => _TodaysCallTabState();
}

class _TodaysCallTabState extends State<TodaysCallTab>{
    @override
    Widget build(BuildContext context){
        CallBloc callBloc = CallBloc();
        callBloc.getCalls.add(null);
        return StreamBuilder<List<Call>>(
            stream: callBloc.calls,
            builder: (context, snapshot) {
                print(snapshot.data);
                if(snapshot.data == null) return Center(
                    child: Container(child: CircularProgressIndicator())
                );
                return ListView(
                    children: snapshot.data.map((call){
                        return Card(
                            child: Column(
                                children: <Widget>[
                                    Text(call.name),
                                    Text(call.type)
                                ],
                            )
                        );
                    }).toList()
                );
            }
        );
    }
}