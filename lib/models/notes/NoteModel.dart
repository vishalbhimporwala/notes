/// title : "Hello"
/// description : "desc of hellp"

class NoteModel {
  NoteModel({
      String? title, 
      String? description,}){
    _title = title;
    _description = description;
}

  NoteModel.fromJson(dynamic json) {
    _title = json['title'];
    _description = json['description'];
  }
  String? _title;
  String? _description;
NoteModel copyWith({  String? title,
  String? description,
}) => NoteModel(  title: title ?? _title,
  description: description ?? _description,
);
  String? get title => _title;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['description'] = _description;
    return map;
  }

}