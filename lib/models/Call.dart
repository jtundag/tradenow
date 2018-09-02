class Call {
    String _name;
    String _type;
    num _amount;
    String _target;
    String _sl;
    String _created_at;

    Call.fromJson(Map call){
        _name = call["name"];
        _type = call["type"];
        _amount = call["amount"];
        _target = call["target"];
        _sl = call["sl"];
        _created_at = call["created_at"];
    }

    Call.fromSnapshot(call){
        _name = call["name"];
        _type = call["type"];
        _amount = call["amount"];
        _target = call["target"];
        _sl = call["sl"];
        _created_at = call["created_at"].year.toString();
    }

    String get name => _name;
    String get type => _type;
    num get amount => _amount;
    String get target => _target;
    String get sl => _sl;
    String get created_at => _created_at;
}