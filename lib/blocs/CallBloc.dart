import "dart:async";

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tradenow/models/Call.dart';

class CallBloc {
    final StreamController<QuerySnapshot> _callSnapshotStreamController = StreamController();
    final StreamController<QuerySnapshot> _callSnapshotsController = StreamController();

    CallBloc(){
        _callSnapshotStreamController.stream.listen((snapshot) {
            _callSnapshotsController.add(snapshot);
        });
    }

    Sink<QuerySnapshot> get callSnapshots => _callSnapshotStreamController.sink;
    Stream<QuerySnapshot> get snapshots => _callSnapshotsController.stream;

    void dispose(){
        _callSnapshotStreamController.close();
    }
}