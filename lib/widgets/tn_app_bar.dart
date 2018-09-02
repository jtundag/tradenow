import "package:flutter/material.dart";

class TNAppBar extends StatelessWidget {
    final title;
    final _barHeight = 66.0;
    
    TNAppBar({this.title});
    
    @override
    Widget build(BuildContext context){
        double topPadding = MediaQuery.of(context).padding.top;
        return Container(
            height: _barHeight + topPadding,
            width: double.infinity,
            padding: EdgeInsets.only(top: topPadding, left: 15.0, right: 15.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                    Text(
                        this.title,
                        style: Theme.of(context).textTheme.title.copyWith(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold
                        ),
                    ),
                    GestureDetector(
                        child: Text(
                            "About",
                            style: TextStyle(
                                color: Color(0xff17C97B)
                            ),
                        ),
                        onTap: (){
                            showAboutDialog(
                                context: context, 
                                applicationName: "TradeNow",
                                applicationLegalese: null,
                                applicationVersion: "1.0.0",
                                children: <Widget>[
                                    Text(
                                        "Contact Us"
                                    ),
                                    Text(
                                        "youremail@tradenow.com",
                                        style: TextStyle(
                                            fontSize: 14.0
                                        ),
                                    )
                                ]
                            );
                        },
                    )
                ],
            )
        );
    }
}