/// success : true
/// message : "Notes fetch successfully"
/// data : [{"_id":"6638aa8f595bd78372afdf15","title":"Vishal","description":"vdvdvdsbrfesd","userId":"662f29dc2ef5638b537af4fa","__v":0},{"_id":"6638aaf4595bd78372afdf17","title":"Visscvsh","description":"vdsdsv","userId":"662f29dc2ef5638b537af4fa","__v":0}]

class NoteListResponse {
  NoteListResponse({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  NoteListResponse.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _success;
  String? _message;
  List<Data>? _data;
NoteListResponse copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => NoteListResponse(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get success => _success;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// _id : "6638aa8f595bd78372afdf15"
/// title : "Vishal"
/// description : "vdvdvdsbrfesd"
/// userId : "662f29dc2ef5638b537af4fa"
/// __v : 0

class Data {
  Data({
      String? id, 
      String? title, 
      String? description, 
      String? userId, 
      num? v,}){
    _id = id;
    _title = title;
    _description = description;
    _userId = userId;
    _v = v;
}

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _title = json['title'];
    _description = json['description'];
    _userId = json['userId'];
    _v = json['__v'];
  }
  String? _id;
  String? _title;
  String? _description;
  String? _userId;
  num? _v;
Data copyWith({  String? id,
  String? title,
  String? description,
  String? userId,
  num? v,
}) => Data(  id: id ?? _id,
  title: title ?? _title,
  description: description ?? _description,
  userId: userId ?? _userId,
  v: v ?? _v,
);
  String? get id => _id;
  String? get title => _title;
  String? get description => _description;
  String? get userId => _userId;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['userId'] = _userId;
    map['__v'] = _v;
    return map;
  }

}