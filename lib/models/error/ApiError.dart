/// success : false
/// message : "The value you entered for 'userName' already exists. Please choose a unique value."
/// data : null
/// error : {"code":11000,"message":"The value you entered for 'userName' already exists. Please choose a unique value."}

class ApiError {
  ApiError({
      bool? success, 
      String? message, 
      dynamic data, 
      Error? error,}){
    _success = success;
    _message = message;
    _data = data;
    _error = error;
}

  ApiError.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'];
    _error = json['error'] != null ? Error.fromJson(json['error']) : null;
  }
  bool? _success;
  String? _message;
  dynamic _data;
  Error? _error;
ApiError copyWith({  bool? success,
  String? message,
  dynamic data,
  Error? error,
}) => ApiError(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
  error: error ?? _error,
);
  bool? get success => _success;
  String? get message => _message;
  dynamic get data => _data;
  Error? get error => _error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    map['data'] = _data;
    if (_error != null) {
      map['error'] = _error?.toJson();
    }
    return map;
  }

}

/// code : 11000
/// message : "The value you entered for 'userName' already exists. Please choose a unique value."

class Error {
  Error({
      num? code, 
      String? message,}){
    _code = code;
    _message = message;
}

  Error.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
  }
  num? _code;
  String? _message;
Error copyWith({  num? code,
  String? message,
}) => Error(  code: code ?? _code,
  message: message ?? _message,
);
  num? get code => _code;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['message'] = _message;
    return map;
  }

}