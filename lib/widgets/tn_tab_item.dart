import "package:flutter/material.dart";

class TNTabItem extends StatefulWidget{
    final title;
    final isActive;
    final onTap;
    final icon;
    
    TNTabItem({this.title, this.isActive = false, this.onTap, this.icon});
    
    @override
    _TNTabItemState createState() => _TNTabItemState();
}

class _TNTabItemState extends State<TNTabItem>{
    @override
    Widget build(BuildContext context){
        return GestureDetector(
                    onTap: widget.onTap,
                    child: Container(
                        width: 180.0,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                                widget.icon,
                                Padding(
                                    padding: EdgeInsets.only(left: 4.0),
                                    child: Text(
                                        widget.title,
                                        style: TextStyle(
                                            color: widget.isActive ? Colors.white : Color(0xffa4a4a4)
                                        ),
                                    ),
                                )
                            ],
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        decoration: BoxDecoration(
                            color: widget.isActive ? Color(0xff17C97B) : Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(50.0)),
                            border: Border.all(
                                width: 1.0,
                                style: BorderStyle.solid,
                                color: widget.isActive ? Color(0xff17C97B) : Color(0xffa4a4a4)
                            )
                        )
                    )
                );
    }
}