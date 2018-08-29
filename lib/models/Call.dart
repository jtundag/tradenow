class Call {
    String _name;
    String _type;
    double _amount;
    String _target;
    String _sl;

    Call.fromJson(Map call){
        _name = call["name"];
        _type = call["type"];
        _amount = call["amount"];
        _target = call["target"];
        _sl = call["sl"];
    }

    String get name => _name;
    String get type => _type;
    double get amount => _amount;
    String get target => _target;
    String get sl => _sl;
}