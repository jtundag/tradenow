import 'package:flutter/material.dart';
import 'package:tradenow/models/Call.dart';

class CallCard extends StatelessWidget {
    Call _call;
    
    CallCard(Call call): _call = call;
    
    @override
    Widget build(BuildContext context){
        return Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                    children: <Widget>[
                        Text(_call.name),
                        Text(_call.type)
                    ],
                ),
            );
    }
}