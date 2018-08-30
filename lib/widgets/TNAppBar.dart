import 'package:flutter/material.dart';

class TNAppBar extends StatefulWidget {
    final String _title;
    
    TNAppBar(title): _title = title;

    @override
    _TNAppBarState createState() => _TNAppBarState();
}

class _TNAppBarState extends State<TNAppBar> {
    final double _barHeight = 66.0;
    
    @override
    Widget build(BuildContext context){
        return Container(
            height: _barHeight + MediaQuery.of(context).padding.top,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                        const Color(0xffF6C523),
                        const Color(0xffF7B700),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp
                )
            ),
            child: Center(
                child: Text(
                    widget._title,
                    style: Theme.of(context).textTheme.title.copyWith(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w300
                    ),
                ),
            ),
        );
    }
}