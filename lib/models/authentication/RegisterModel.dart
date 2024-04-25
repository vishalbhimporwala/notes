/// firstName : "Vishal"
/// lastName : "Bhimporwala"
/// email : "vishal1@yopmai.com"
/// userName : "VishalBhimpor"
/// password : "V12345647"

class RegisterModel {
  RegisterModel({
      String? firstName, 
      String? lastName, 
      String? email, 
      String? userName, 
      String? password,}){
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _userName = userName;
    _password = password;
}

  RegisterModel.fromJson(dynamic json) {
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _userName = json['userName'];
    _password = json['password'];
  }
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _userName;
  String? _password;
RegisterModel copyWith({  String? firstName,
  String? lastName,
  String? email,
  String? userName,
  String? password,
}) => RegisterModel(  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  userName: userName ?? _userName,
  password: password ?? _password,
);
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get userName => _userName;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['userName'] = _userName;
    map['password'] = _password;
    return map;
  }

}