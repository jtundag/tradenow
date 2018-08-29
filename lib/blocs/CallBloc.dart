import "dart:async";

import 'package:tradenow/models/Call.dart';

class CallBloc {
    final StreamController _callHandlerStreamController = StreamController();
    final StreamController<List<Call>> _callStreamController = StreamController<List<Call>>();
    
    Sink get getCalls => _callHandlerStreamController.sink;
    Stream<List<Call>> get calls => _callStreamController.stream;

    CallBloc(){
        _callHandlerStreamController.stream.listen((query){
            _callStreamController.add([
                Call.fromJson({
                    "name": "Text",
                    "type": "Type",
                    "amount": 50.0,
                    "target": "Text",
                    "sl": "Text",
                })
            ]);
        });
    }

    void dispose(){
        _callStreamController.close();
        _callHandlerStreamController.close();
    }
}