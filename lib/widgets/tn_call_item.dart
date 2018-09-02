import "package:flutter/material.dart";

class TNCallItem extends StatelessWidget{
    final call;
    
    TNCallItem({this.call});
    
    @override
    Widget build(BuildContext context){
        return Container(
            padding: EdgeInsets.all(15.0),
            height: 90.0,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                                child: Text(
                                    call.type
                                ),
                                decoration: BoxDecoration(
                                    color: call.type == "Sell" ? Color(0xffF14132) : Color(0xffFC9800),
                                    borderRadius: BorderRadius.all(Radius.circular(3.0))
                                ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Text(
                                    call.name,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontFamily: "VarelaRound"
                                    ),
                                )
                            )
                        ]
                    ),
                    SizedBox(height: 15.0),
                    Row(
                        children: <Widget>[
                            Text(
                                "Amount: ${call.amount.toString()}"
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 20.0),
                                child: Text(
                                    "Target: ${call.target}"
                                ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 20.0),
                                child: Text(
                                    "SL: ${call.sl}"
                                ),
                            )
                        ],
                    )
                ]
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color(0xff3f3f3f),
                        width: 1.0
                    )
                )
            ),
        );
    }
}