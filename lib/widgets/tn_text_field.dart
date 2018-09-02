import "package:flutter/material.dart";

class TNTextField extends StatelessWidget {
    final controller;
    final label;
    final keyboardType;

    TNTextField({ this.label, this.controller, this.keyboardType });
    
    @override
    Widget build(BuildContext context) {
        return TextFormField(
                    keyboardType: keyboardType,
                    controller: controller,
                    decoration: InputDecoration(
                        labelText: label,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff17C97B)
                            )
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(3.0))
                        )
                    ),
                    validator: (value){
                        if(value.isEmpty) return "This field is required.";
                    }
                );
    }
}