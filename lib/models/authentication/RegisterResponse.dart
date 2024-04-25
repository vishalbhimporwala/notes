/// success : true
/// message : "User register successfully"
/// data : {"firstName":"Vishal","lastName":"Bhimporwala","userName":"VishalBhimpor","email":"vishal1@yopmai.com","_id":"662a507021c63644694b6cb1"}

class RegisterResponse {
  RegisterResponse({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  RegisterResponse.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
RegisterResponse copyWith({  bool? success,
  String? message,
  Data? data,
}) => RegisterResponse(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// firstName : "Vishal"
/// lastName : "Bhimporwala"
/// userName : "VishalBhimpor"
/// email : "vishal1@yopmai.com"
/// _id : "662a507021c63644694b6cb1"

class Data {
  Data({
      String? firstName, 
      String? lastName, 
      String? userName, 
      String? email, 
      String? id,}){
    _firstName = firstName;
    _lastName = lastName;
    _userName = userName;
    _email = email;
    _id = id;
}

  Data.fromJson(dynamic json) {
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _userName = json['userName'];
    _email = json['email'];
    _id = json['_id'];
  }
  String? _firstName;
  String? _lastName;
  String? _userName;
  String? _email;
  String? _id;
Data copyWith({  String? firstName,
  String? lastName,
  String? userName,
  String? email,
  String? id,
}) => Data(  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  userName: userName ?? _userName,
  email: email ?? _email,
  id: id ?? _id,
);
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get userName => _userName;
  String? get email => _email;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['userName'] = _userName;
    map['email'] = _email;
    map['_id'] = _id;
    return map;
  }

}