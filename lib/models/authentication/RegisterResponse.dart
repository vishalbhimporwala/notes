/// success : true
/// message : "User login successfully"
/// data : {"_id":"662f5d91f68a338fb8e2afc5","firstName":"Vishal","lastName":"Bhimporwalav","userName":"VishalBhimporv","email":"vishavl1@yopmai.com","createdAt":"2024-04-29T08:42:57.293Z","updatedAt":"2024-04-29T08:42:57.293Z"}

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

/// _id : "662f5d91f68a338fb8e2afc5"
/// firstName : "Vishal"
/// lastName : "Bhimporwalav"
/// userName : "VishalBhimporv"
/// email : "vishavl1@yopmai.com"
/// createdAt : "2024-04-29T08:42:57.293Z"
/// updatedAt : "2024-04-29T08:42:57.293Z"

class Data {
  Data({
      String? id, 
      String? firstName, 
      String? lastName, 
      String? userName, 
      String? email, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _userName = userName;
    _email = email;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _userName = json['userName'];
    _email = json['email'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _id;
  String? _firstName;
  String? _lastName;
  String? _userName;
  String? _email;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  String? id,
  String? firstName,
  String? lastName,
  String? userName,
  String? email,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  userName: userName ?? _userName,
  email: email ?? _email,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get userName => _userName;
  String? get email => _email;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['userName'] = _userName;
    map['email'] = _email;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}