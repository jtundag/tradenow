import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:tradenow/widgets/tn_app_bar.dart';
import 'package:tradenow/widgets/tn_tab_item.dart';
import 'package:tradenow/widgets/tn_text_field.dart';

class TNAdminContent extends StatefulWidget {
    final scaffoldKey;
    TNAdminContent({this.scaffoldKey});
    
    @override
    _TNAdminContentState createState() => _TNAdminContentState();
}

class _TNAdminContentState extends State<TNAdminContent> {
    final _formKey = GlobalKey<FormState>();
    bool _isLoading = false;
    String _selectedType = "Sell";
    TextEditingController _stockNameController;
    TextEditingController _amountController;
    TextEditingController _targetController;
    TextEditingController _slController;

    @override
    void initState(){
        super.initState();
        _stockNameController = TextEditingController();
        _amountController = TextEditingController();
        _targetController = TextEditingController();
        _slController = TextEditingController();
    }

    void _sendCall(){
        if(!_formKey.currentState.validate() && !_isLoading) return;

        setState((){
            _isLoading = true;
        });
        
        Firestore.instance.collection("calls").document().setData({
            "amount": num.parse(_amountController.text),
            "created_at": DateTime.now(),
            "name": _stockNameController.text,
            "sl": _slController.text,
            "target": _targetController.text,
            "type": _selectedType,
        }).then((e){
            setState((){
                _amountController.clear();
                _stockNameController.clear();
                _slController.clear();
                _targetController.clear();
                _isLoading = false;
            });
            widget.scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text("Call has been successfully added!."
            )));
        });
    }
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
                key: widget.scaffoldKey,
                body: Form(
                    key: _formKey,
                    child: Column(
                        children: <Widget>[
                            TNAppBar(title: "TradeNow - Admin"),
                            Divider(height: 1.0, color: Color(0xffC5C8C9)),
                            SizedBox(height: 20.0),
                            Expanded(
                                child: ListView(
                                        padding: EdgeInsets.all(0.0),
                                        children: <Widget>[
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                    TNTabItem(
                                                        icon: Icon(Icons.attach_money, size: 14.0),
                                                        title: "Sell",
                                                        isActive: _selectedType == "Sell",
                                                        onTap: (){
                                                            setState((){
                                                                _selectedType = "Sell";
                                                            });
                                                        }
                                                    ),
                                                    TNTabItem(
                                                        icon: Icon(Icons.attach_money, size: 14.0),
                                                        title: "Buy",
                                                        isActive: _selectedType == "Buy",
                                                        onTap: (){
                                                            setState((){
                                                                _selectedType = "Buy";
                                                            });
                                                        }
                                                    )
                                                ]
                                            ),
                                            Container(
                                                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                                                child: Column(
                                                    children: <Widget>[
                                                        TNTextField(
                                                            label: "Stock Name",
                                                            controller: _stockNameController
                                                        ),
                                                        SizedBox(height: 15.0),
                                                        TNTextField(
                                                            label: "Amount",
                                                            controller: _amountController,
                                                            keyboardType: TextInputType.numberWithOptions(),
                                                        ),
                                                        SizedBox(height: 15.0),
                                                        TNTextField(
                                                            label: "Target",
                                                            controller: _targetController
                                                        ),
                                                        SizedBox(height: 15.0),
                                                        TNTextField(
                                                            label: "SL",
                                                            controller: _slController
                                                        ),
                                                        SizedBox(height: 15.0),
                                                        Container(
                                                            child: Material(
                                                                child: InkWell(
                                                                    child: Container(
                                                                        width: double.infinity,
                                                                        height: 50.0,
                                                                        child: Center(
                                                                            child: _isLoading ? SizedBox(
                                                                                child: CircularProgressIndicator(
                                                                                    strokeWidth: 1.0,
                                                                                ),
                                                                            ) : Text(
                                                                                "SEND",
                                                                                style: TextStyle(
                                                                                    fontSize: 17.0,
                                                                                    letterSpacing: 1.0,
                                                                                ),
                                                                            ),
                                                                        )
                                                                    ),
                                                                    borderRadius: BorderRadius.all(Radius.circular(3.0)),
                                                                    highlightColor: Color(0xff17C97B),
                                                                    splashColor: Colors.white,
                                                                    onTap: _sendCall
                                                                ),
                                                                color: Colors.transparent,
                                                            ),
                                                            decoration: BoxDecoration(
                                                                color: Color(0xff17C97B),
                                                                borderRadius: BorderRadius.all(Radius.circular(3.0))
                                                            )
                                                        )
                                                    ],
                                                )
                                            )
                                        ],
                                    )
                            )
                        ]
                  ),
                )
            );
    }
}