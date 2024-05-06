/// success : true
/// message : "Notes added successfully"
/// data : {"title":"Hello","description":"desc of hellp","userId":"662f5d91f68a338fb8e2afc5","_id":"663879aa33509dd786cb7bd2","__v":0}

class NoteResponse {
  NoteResponse({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  NoteResponse.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
NoteResponse copyWith({  bool? success,
  String? message,
  Data? data,
}) => NoteResponse(  success: success ?? _success,
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

/// title : "Hello"
/// description : "desc of hellp"
/// userId : "662f5d91f68a338fb8e2afc5"
/// _id : "663879aa33509dd786cb7bd2"
/// __v : 0

class Data {
  Data({
      String? title, 
      String? description, 
      String? userId, 
      String? id, 
      num? v,}){
    _title = title;
    _description = description;
    _userId = userId;
    _id = id;
    _v = v;
}

  Data.fromJson(dynamic json) {
    _title = json['title'];
    _description = json['description'];
    _userId = json['userId'];
    _id = json['_id'];
    _v = json['__v'];
  }
  String? _title;
  String? _description;
  String? _userId;
  String? _id;
  num? _v;
Data copyWith({  String? title,
  String? description,
  String? userId,
  String? id,
  num? v,
}) => Data(  title: title ?? _title,
  description: description ?? _description,
  userId: userId ?? _userId,
  id: id ?? _id,
  v: v ?? _v,
);
  String? get title => _title;
  String? get description => _description;
  String? get userId => _userId;
  String? get id => _id;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['description'] = _description;
    map['userId'] = _userId;
    map['_id'] = _id;
    map['__v'] = _v;
    return map;
  }

}